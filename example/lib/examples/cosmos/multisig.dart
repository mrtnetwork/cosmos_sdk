/// 2-of-3 multisig against a local single-node Cosmos SDK chain.
///
/// A multisig address is derived from three signers (BIP44 accounts). Any two
/// of them sign the same `SignDoc`, and the `AuthInfo` carries a
/// `LegacyAminoPubKey` plus a `CompactBitArray` that records which signers
/// signed. Run the chain first (see README.md):
///   ./start.sh
/// then:
///   dart run lib/examples/cosmos/multisig.dart
library;

import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/bank/v1beta1/models.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/auth/v1beta1/src/auth.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/crypto/multisig/src/keys.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/crypto/multisig/v1beta1/models.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/tx/signing/v1beta1/src/signing.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/tx/v1beta1/models.dart';

import 'cosmos_node.dart';
import 'cosmos_tx.dart';

Future<void> main() async {
  print('Cosmos SDK — 2-of-3 multisig (local simapp chain)');

  final client = cosmosClient();
  final chainId = await client.chainId();
  print(field('chain id', chainId));

  const threshold = 2;
  final signers = [cosmosAccount(0), cosmosAccount(1), cosmosAccount(2)];
  final pubKeys = signers.map((e) => e.toPublicKey()).toList();
  final multisig = CosmosMultisigAddress.address(
    threshold: threshold,
    pubKeys: pubKeys,
    hrp: CosmosAddrConst.accHRP,
  );
  final recipient = cosmosAddress(4);

  print(field('signers', ''));
  for (var i = 0; i < pubKeys.length; i++) {
    final addr = pubKeys[i].toAddress(hrp: CosmosAddrConst.accHRP);
    print('    $i ${addr.address}');
  }
  print(field('multisig', multisig.address));
  print(field('recipient', recipient.address));

  // Fund the multisig from account 3 so it can pay fees and the transfer.
  final funder = cosmosAccount(3);
  final fundAmount = oneUnit * BigInt.from(1000);
  final fundTx = await buildDirectTx(
    client: client,
    signer: funder,
    messages: [
      MsgSend(
        fromAddress: cosmosAddress(3).address,
        toAddress: multisig.address,
        amount: [Coin(denom: cosmosDenom, amount: fundAmount.toString())],
      ),
    ],
  );
  await waitForTx(client, await client.broadcastTransaction(fundTx.toBuffer()));
  final multisigBalance = await client.getBalance(multisig, cosmosDenom);
  print(field(
      'multisig balance', '${formatAmount(multisigBalance)} $cosmosDenom'));

  // The inner message the multisig will send.
  final message = MsgSend(
    fromAddress: multisig.address,
    toAddress: recipient.address,
    amount: [Coin(denom: cosmosDenom, amount: oneUnit.toString())],
  );
  final account = await client.getAccount(multisig);
  final body = TxBody(messages: [message.toAny()], memo: 'cosmos_sdk multisig');

  // Signers 0 and 1 sign the same SignDoc.
  final auth = await _multisigAuth(
    client: client,
    pubKeys: pubKeys,
    threshold: threshold,
    account: account,
  );
  final signDoc = SignDoc(
    bodyBytes: body.toBuffer(),
    authInfoBytes: auth.toBuffer(),
    chainId: chainId,
    accountNumber: account.accountNumber ?? BigInt.zero,
  );
  final signersWhoSigned = [0, 1];
  final signatures = [
    for (final i in signersWhoSigned) signers[i].sign(signDoc.toBuffer()),
  ];
  // A multisig signer contributes a single signatures entry: a protobuf
  // MultiSignature that carries the per-member signatures.
  final multiSignature = MultiSignature(signatures: signatures);
  final tx = TxRaw(
    bodyBytes: body.toBuffer(),
    authInfoBytes: auth.toBuffer(),
    signatures: [multiSignature.toBuffer()],
  );

  final before = await client.getBalance(recipient, cosmosDenom);
  final txHash = await client.broadcastTransaction(tx.toBuffer());
  print(field('submitted', txHash));
  await waitForTx(client, txHash);

  final after = await client.getBalance(recipient, cosmosDenom);
  print(field('dest after', '${formatAmount(after)} $cosmosDenom'));
  print(field('received', '${formatAmount(after - before)} $cosmosDenom'));
}

/// Builds the `AuthInfo` for a multisig signer.
///
/// The public key is a `LegacyAminoPubKey` (threshold + member pubkeys), and
/// the mode is a `Multi` whose `CompactBitArray` has a bit set for each signer
/// who signed (bits 0 and 1 here) and whose `modeInfos` list has one entry per
/// signature.
Future<AuthInfo> _multisigAuth({
  required CosmosClient client,
  required List<CosmosPublicKey> pubKeys,
  required int threshold,
  required BaseAccount account,
}) async {
  const signersWhoSigned = [0, 1];
  final gasLimit = BigInt.from(300000);
  final fee = await feeFor(client, gasLimit);
  final multisigKey = LegacyAminoPubKey(
    threshold: threshold,
    publicKeys: pubKeys.map((e) => e.toAny()).toList(),
  );
  // Bit i set == signer i signed. Cosmos' CompactBitArray is MSB-first, so
  // signers 0 and 1 are the two most-significant bits of the first byte:
  // 0b11000000 = 0xC0.
  final bitarray =
      CompactBitArray.fromIndices(pubKeys.length, signersWhoSigned);
  return AuthInfo(
    signerInfos: [
      SignerInfo(
        publicKey: multisigKey.toAny(),
        modeInfo: ModeInfo(
          multi: ModeInfoMulti(
            bitarray: bitarray,
            modeInfos: [
              for (final _ in signersWhoSigned)
                const ModeInfo(
                  single: ModeInfoSingle(mode: SignMode.signModeDirect),
                ),
            ],
          ),
        ),
        sequence: account.sequence ?? BigInt.zero,
      ),
    ],
    fee: Fee(
      amount: [Coin(denom: cosmosDenom, amount: fee.toString())],
      gasLimit: gasLimit,
    ),
  );
}
