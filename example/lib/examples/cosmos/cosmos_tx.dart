// Shared transaction helpers for the Cosmos SDK examples: fee estimation,
// transaction construction and inclusion polling.

import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/base/node/v1beta1/src/query.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/tx/signing/v1beta1/src/signing.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/tx/v1beta1/models.dart';

import 'cosmos_node.dart';

/// Fee for [gasLimit] gas at the chain's minimum gas price.
Future<BigInt> feeFor(CosmosClient client, BigInt gasLimit) async {
  final config = await client.query(const ConfigRequest());
  final price = config.minimumGasPrice?.replaceAll(cosmosDenom, '') ?? '0';
  final perGas =
      BigRational.parseDecimal(price) * BigRational(BigInt.from(10).pow(6));
  return (perGas * BigRational(gasLimit)).ceil().toBigInt();
}

/// Builds [AuthInfo] with a simulated gas limit and fee.
///
/// The gas price is read from the chain's `Config` query so the example stays
/// correct if the node's `minimum-gas-prices` changes. Simulation skips
/// signature verification, so the gas limit gets a 2x buffer (unused gas is
/// refunded — only the used portion is charged).
Future<AuthInfo> estimateAuth({
  required CosmosClient client,
  required CosmosBaseAddress owner,
  required CosmosPublicKey pubKey,
  required List<CosmosProtoMessage> messages,
  SignMode signMode = SignMode.signModeDirect,
}) async {
  final account = await client.getAccount(owner);
  final base = AuthInfo(
    signerInfos: [
      SignerInfo(
        publicKey: pubKey.toAny(),
        modeInfo: ModeInfo(single: ModeInfoSingle(mode: signMode)),
        sequence: account.sequence ?? BigInt.zero,
      ),
    ],
    fee: Fee(
      amount: [const Coin(denom: cosmosDenom, amount: '0')],
      gasLimit: BigInt.from(200000),
    ),
  );

  final txBody = TxBody(messages: messages.map((e) => e.toAny()).toList());
  final simulate = await client.simulateTx(
    Tx(body: txBody, authInfo: base, signatures: [List<int>.filled(64, 0)])
        .toBuffer(),
  );
  final gasUsed = simulate.gasInfo?.gasUsed ?? BigInt.from(200000);
  final gasLimit = gasUsed * BigInt.from(2);

  final fee = await feeFor(client, gasLimit);

  return AuthInfo(
    signerInfos: base.signerInfos,
    fee: Fee(
      amount: [Coin(denom: cosmosDenom, amount: fee.toString())],
      gasLimit: gasLimit,
    ),
  );
}

/// Builds a signed [TxRaw] using direct (protobuf) sign mode.
Future<TxRaw> buildDirectTx({
  required CosmosClient client,
  required CosmosSecp256K1PrivateKey signer,
  required List<CosmosProtoMessage> messages,
  String memo = '',
}) async {
  final owner = signer.toPublicKey().toAddress(hrp: CosmosAddrConst.accHRP);
  final auth = await estimateAuth(
    client: client,
    owner: owner,
    pubKey: signer.toPublicKey(),
    messages: messages,
    signMode: SignMode.signModeDirect,
  );
  final body =
      TxBody(messages: messages.map((e) => e.toAny()).toList(), memo: memo);
  final account = await client.getAccount(owner);
  final signDoc = SignDoc(
    bodyBytes: body.toBuffer(),
    authInfoBytes: auth.toBuffer(),
    chainId: await client.chainId(),
    accountNumber: account.accountNumber ?? BigInt.zero,
  );
  return TxRaw(
    bodyBytes: body.toBuffer(),
    authInfoBytes: auth.toBuffer(),
    signatures: [signer.sign(signDoc.toBuffer())],
  );
}

/// Polls until [txHash] is included in a block (or fails).
Future<void> waitForTx(CosmosClient client, String txHash) async {
  for (var i = 0; i < 30; i++) {
    await Future<void>.delayed(const Duration(seconds: 2));
    try {
      final res = await client.getTransaction(txHash);
      final tx = res.txResponse;
      if (tx != null && tx.code != null && tx.code != 0) {
        throw StateError('tx failed: code=${tx.code} rawLog=${tx.rawLog}');
      }
      if (tx?.height != null) {
        print(field('included in block', '${tx!.height}'));
        print(field('gas used', '${tx.gasUsed}'));
        return;
      }
    } on RPCError catch (e) {
      if (!CosmosProviderUtils.itemNotFound(e.errorCode)) rethrow;
    }
  }
  throw StateError('transaction $txHash was not included in time');
}
