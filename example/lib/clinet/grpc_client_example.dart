import 'dart:async';
import 'dart:io';
import 'package:blockchain_utils/exception/exceptions.dart';
import 'package:blockchain_utils/service/service.dart';
import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/auth/v1beta1/src/query.dart';
import 'package:http/http.dart' as http;
import 'package:grpc/grpc.dart';
import 'client.dart'
    if (dart.library.io) 'grpc_native_client.dart'
    if (dart.library.js_interop) 'grpc_web_client.dart';

CosmosProvider getClient(
    {String? rpcUrl, String? resutlUrl, String? grpcUrl, int grpcPort = 443}) {
  return cosmosClient(
      grpcPort: grpcPort,
      grpcUrl: grpcUrl,
      resutlUrl: resutlUrl,
      rpcUrl: rpcUrl);
}

class CosmosGrpcClient extends Client {
  CosmosGrpcClient(super.channel);

  static ClientMethod<CosmosGrpcRequestDetails, List<int>> buildMethod(
    CosmosGrpcRequestDetails params,
  ) {
    return ClientMethod<CosmosGrpcRequestDetails, List<int>>(
      params.method(),
      (value) => value.toBuffer(),
      (value) => value,
    );
  }

  Future<List<int>> doGrpcRequest(
    CosmosGrpcRequestDetails params, {
    Duration? timeout,
  }) async {
    final method = buildMethod(params);

    final request = $createUnaryCall(
      method,
      params,
      options: CallOptions(timeout: timeout),
    );

    return await request;
  }

  Stream<List<int>> doGrpcRequestStream(
    CosmosGrpcRequestDetails params, {
    Duration? timeout,
  }) {
    final method = buildMethod(params);

    return $createStreamingCall(method, () async* {
      /// walletd streaming APIs expect an initial request message
      yield params;
    }(), options: CallOptions(timeout: timeout));
  }

  Future<Stream<List<int>>> doGrpcRequestStreamAsync(
    CosmosGrpcRequestDetails params, {
    Duration? timeout,
  }) async {
    return doGrpcRequestStream(params);
  }
}

class CosmosExampleProvider with CosmosServiceProvider {
  final CosmosGrpcClient? grpc;
  final String? rpcUrl;
  final String? restUrl;

  CosmosExampleProvider(
      {this.rpcUrl,
      this.restUrl,
      this.grpc,
      this.defaultRequestTimeout = const Duration(seconds: 30)});

  // final http.Client client;
  final Duration defaultRequestTimeout;

  String getUrl(BaseCosmosRequestDetails params) {
    switch (params.api) {
      case CosmosProviderApi.tendermint:
        final url = rpcUrl;
        if (url == null) throw Exception("Missing rpc url");
        return url;
      case CosmosProviderApi.rest:
        final url = restUrl;
        if (url == null) throw Exception("Missing rest url");
        return url;
      default:
        throw Exception("Unexpected request api. ${params.api.name}");
    }
  }

  @override
  Future<BaseServiceResponse> doRequest(BaseCosmosRequestDetails params,
      {Duration? timeout}) async {
    final uri = params.encodeUrl(getUrl(params));
    final client = http.Client();
    try {
      if (params.requestMethod.isPost) {
        final response = await client
            .post(uri, headers: params.headers, body: params.encodeBody())
            .timeout(timeout ?? defaultRequestTimeout);
        return params.toResponse(response.bodyBytes,
            statusCode: response.statusCode);
      }
      final response = await client.get(uri, headers: {
        ...params.headers
      }).timeout(timeout ?? defaultRequestTimeout);
      if (ServiceProviderUtils.isSuccessStatusCode(response.statusCode)) {
        File("/home/mrhaydari/dev/packages/cosmos_sdk/example/test/testing/s.json")
            .writeAsString(response.body);
      }
      // print("uri $uri ${params.headers} ${response.statusCode} ${response.body}");
      return params.toResponse(response.bodyBytes,
          statusCode: response.statusCode);
    } finally {
      client.close();
    }
  }

  CosmosGrpcClient getGrpc() {
    final grpc = this.grpc;
    if (grpc == null) {
      throw Exception("Missing grpc client.");
    }
    return grpc;
  }

  @override
  Future<List<int>> doGrpcRequest(CosmosGrpcRequestDetails params,
      {Duration? timeout}) async {
    try {
      return await getGrpc().doGrpcRequest(params, timeout: timeout);
    } on GrpcError catch (e) {
      throw RPCError(message: e.message ?? e.toString(), errorCode: e.code);
    }
  }

  @override
  Stream<List<int>> doGrpcRequestStream(CosmosGrpcRequestDetails params,
      {Duration? timeout}) {
    try {
      return getGrpc().doGrpcRequestStream(params, timeout: timeout);
    } on GrpcError catch (e) {
      throw RPCError(message: e.message ?? e.toString(), errorCode: e.code);
    }
  }

  @override
  Future<Stream<List<int>>> doGrpcRequestStreamAsync(
      CosmosGrpcRequestDetails params,
      {Duration? timeout}) {
    try {
      return getGrpc().doGrpcRequestStreamAsync(params, timeout: timeout);
    } on GrpcError catch (e) {
      throw RPCError(message: e.message ?? e.toString(), errorCode: e.code);
    }
  }
}

/// Example usage:
/// Connect to walletd and stream Orchard subtree roots.
FutureOr<void> main() async {
  final provider = getClient(
      rpcUrl: "http://localhost:26657",
      resutlUrl: "http://localhost:1317",
      grpcUrl: "localhost",
      grpcPort: 9090);
  final client = ExampleComsoClient(
      provider: provider, supportedApis: CosmosProviderApi.cosmosApis);
  await client.query(const QueryAccountsRequest(), api: CosmosProviderApi.grpc);
  await client.query(const QueryAccountsRequest(), api: CosmosProviderApi.rest);
  await client.query(const QueryAccountsRequest(),
      api: CosmosProviderApi.tendermint);
}

class ExampleComsoClient with CosmosQuickServiceApi {
  @override
  final CosmosProvider provider;
  @override
  final List<CosmosProviderApi> supportedApis;
  ExampleComsoClient({required this.provider, required this.supportedApis});
}
