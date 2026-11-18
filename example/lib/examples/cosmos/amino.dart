/// Legacy Amino JSON transfer against a local single-node Cosmos SDK chain.
library;

import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/bank/v1beta1/models.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/tx/signing/v1beta1/src/signing.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/tx/v1beta1/models.dart';

import 'cosmos_node.dart';
import 'cosmos_tx.dart';

Future<void> main() async {
  print('Cosmos SDK — Amino JSON transfer (local simapp chain)');
  print(field('rpc', cosmosRpcUrl));

  final client = cosmosClient();
  final chainId = await client.chainId();
  print(field('chain id', chainId));

  final owner = cosmosAccount(0);
  final ownerAddr = owner.toPublicKey().toAddress(hrp: CosmosAddrConst.accHRP);
  final destination = cosmosAddress(4);
  print(field('owner', ownerAddr.address));
  print(field('destination', destination.address));

  final before = await client.getBalance(destination, cosmosDenom);
  print(field('dest before', '${formatAmount(before)} $cosmosDenom'));

  final message = MsgSend(
    fromAddress: ownerAddr.address,
    toAddress: destination.address,
    amount: [Coin(denom: cosmosDenom, amount: oneUnit.toString())],
  );

  final account = await client.getAccount(ownerAddr);
  final auth = await estimateAuth(
    client: client,
    owner: ownerAddr,
    pubKey: owner.toPublicKey(),
    messages: [message],
    signMode: SignMode.signModeLegacyAminoJson,
  );

  // The Amino JSON signable payload (sorted JSON), not the protobuf SignDoc.
  final aminoTx = AminoTx(
    chainId: await client.chainId(),
    accountNumber: account.accountNumber ?? BigInt.zero,
    sequence: account.sequence ?? BigInt.zero,
    fee: AminoFee(
      amount: auth.fee!.amount,
      gas: auth.fee!.gasLimit,
      payer: auth.fee!.payer,
      granter: auth.fee!.granter,
    ),
    messages: [message],
    config: CosmosDefaultBech32Configs.cosmosHub,
    memo: 'cosmos_sdk amino example',
  );
  print(field('amino payload', '${aminoTx.toBuffer().length} bytes'));

  final body = TxBody(
    messages: [message.toAny()],
    memo: 'cosmos_sdk amino example',
  );
  final tx = TxRaw(
    bodyBytes: body.toBuffer(),
    authInfoBytes: auth.toBuffer(),
    signatures: [owner.sign(aminoTx.toBuffer())],
  );

  final txHash = await client.broadcastTransaction(tx.toBuffer());
  print(field('submitted', txHash));
  await waitForTx(client, txHash);

  final after = await client.getBalance(destination, cosmosDenom);
  print(field('dest after', '${formatAmount(after)} $cosmosDenom'));
  print(field('received', '${formatAmount(after - before)} $cosmosDenom'));
}
