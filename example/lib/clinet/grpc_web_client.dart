import 'package:cosmos_sdk/sdk/provider/cosmos/provider/provider.dart';
import 'package:grpc/grpc_web.dart';
import 'grpc_client_example.dart';

CosmosProvider cosmosClient(
    {String? rpcUrl, String? resutlUrl, String? grpcUrl, int grpcPort = 443}) {
  final channel = switch (grpcUrl) {
    String() => CosmosGrpcClient(GrpcWebClientChannel.xhr(Uri.parse(grpcUrl))),
    _ => null,
  };
  return CosmosProvider(
      CosmosExampleProvider(grpc: channel, restUrl: resutlUrl, rpcUrl: rpcUrl));
}
