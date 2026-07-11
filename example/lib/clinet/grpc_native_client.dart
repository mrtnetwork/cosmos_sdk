import 'package:cosmos_sdk/sdk/provider/cosmos/provider/provider.dart';
import 'package:grpc/grpc.dart';
import 'grpc_client_example.dart';

CosmosProvider cosmosClient(
    {String? rpcUrl, String? resutlUrl, String? grpcUrl, int grpcPort = 443}) {
  final channel = switch (grpcUrl) {
    String() => CosmosGrpcClient(ClientChannel(
        grpcUrl,
        port: grpcPort,
        options: ChannelOptions(
          credentials: grpcPort == 443
              ? const ChannelCredentials.secure()
              : const ChannelCredentials.insecure(),
        ),
      )),
    _ => null,
  };
  return CosmosProvider(
      CosmosExampleProvider(grpc: channel, restUrl: resutlUrl, rpcUrl: rpcUrl));
}
