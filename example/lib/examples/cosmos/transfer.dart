/// Native token transfer against a local single-node Cosmos SDK chain.
///
/// Run the chain first (see README.md):
///   ./start.sh
/// then:
///   dart run lib/examples/cosmos/transfer.dart
library;

import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/bank/v1beta1/models.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/tx/v1beta1/models.dart';

import 'cosmos_node.dart';
import 'cosmos_tx.dart';

Future<void> main() async {
  print('Cosmos SDK — native transfer (local simapp chain)');
  print(field('rpc', cosmosRpcUrl));
  print(field('rest', cosmosRestUrl));

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

  final tx = await buildDirectTx(
    client: client,
    signer: owner,
    messages: [message],
    memo: 'cosmos_sdk example',
  );
  final txHash = await client.broadcastTransaction(tx.toBuffer());
  final auth = AuthInfo.deserialize(tx.authInfoBytes ?? const []);
  print(field('submitted', txHash));
  print(
    field(
      'fee',
      '${formatAmount(BigInt.parse(auth.fee!.amount.first.amount!))} $cosmosDenom',
    ),
  );
  print(field('gas limit', '${auth.fee!.gasLimit}'));

  await waitForTx(client, txHash);

  final after = await client.getBalance(destination, cosmosDenom);
  print(field('dest after', '${formatAmount(after)} $cosmosDenom'));
  print(field('received', '${formatAmount(after - before)} $cosmosDenom'));
}
