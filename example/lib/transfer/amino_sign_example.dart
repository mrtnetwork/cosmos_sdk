// ignore_for_file: unused_local_variable
import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'package:example/clinet/grpc_client_example.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart';
import 'direct_sign_example.dart';

void main() async {
  final provider = getClient(
      rpcUrl: "http://localhost:26657",
      resutlUrl: "http://localhost:1317",
      grpcUrl: "localhost",
      grpcPort: 9090);
  final client = ExampleComsoClient(
      provider: provider, supportedApis: CosmosProviderApi.cosmosApis);
  final signer = account();
  final sigerAddr = signer.toPublicKey().toAddress(hrp: CosmosAddrConst.accHRP);
  final destination = destinationAccount();
  final tx = await createTx(
      from: sigerAddr,
      signer: signer,
      coin: const Coin(denom: "stake", amount: "5000000"),
      destination: destination.address,
      client: client);
  final txId = await client.broadcastTransaction(tx.toBuffer());
}
