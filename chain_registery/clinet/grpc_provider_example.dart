import 'dart:async';
import 'dart:io';
import 'package:blockchain_utils/exception/exceptions.dart';
import 'package:blockchain_utils/service/service.dart';
import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'package:grpc/grpc.dart';
import 'package:http/http.dart' as http;

CosmosProvider getClient({
  String? rpcUrl,
  String? resutlUrl,
  String? grpcUrl,
  int grpcPort = 443,
}) {
  final channel = switch (grpcUrl) {
    String() => CosmosGrpcClient(
      ClientChannel(
        grpcUrl,
        port: grpcPort,
        options: ChannelOptions(
          credentials:
              grpcPort == 443
                  ? const ChannelCredentials.secure()
                  : const ChannelCredentials.insecure(),
        ),
      ),
    ),
    _ => null,
  };
  return CosmosProvider(
    CosmosExampleProvider(grpc: channel, restUrl: resutlUrl, rpcUrl: rpcUrl),
  );
}

/// gRPC client implementation for Zcash `walletd`.
///
/// This client:
/// - Wraps a gRPC `ClientChannel`
/// - Dynamically builds gRPC methods at runtime
/// - Sends raw binary requests and receives raw binary responses
/// - Implements both unary and streaming walletd calls
class CosmosGrpcClient extends Client {
  CosmosGrpcClient(super.channel);

  /// Builds a gRPC method dynamically from request metadata.
  ///
  /// walletd exposes many endpoints; instead of generating
  /// static stubs, we serialize requests as raw bytes and
  /// route them by method name.
  static ClientMethod<CosmosGrpcRequestDetails, List<int>> buildMethod(
    CosmosGrpcRequestDetails params,
  ) {
    return ClientMethod<CosmosGrpcRequestDetails, List<int>>(
      /// Full gRPC method path (e.g. `/zcash.walletd/MethodName`)
      params.method(),

      /// Serialize request into bytes
      (value) => value.toBuffer(),

      /// walletd responses are already raw bytes
      (value) => value,
    );
  }

  /// Executes a unary (single-response) walletd request.
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

  /// Executes a streaming walletd request.
  ///
  /// Used for endpoints such as:
  /// - subtree roots
  /// - block scanning
  /// - chain state updates
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

  CosmosExampleProvider({
    this.rpcUrl,
    this.restUrl,
    this.grpc,
    this.defaultRequestTimeout = const Duration(seconds: 30),
  });

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
  Future<BaseServiceResponse> doRequest(
    BaseCosmosRequestDetails params, {
    Duration? timeout,
  }) async {
    final uri = params.encodeUrl(getUrl(params));
    final client = http.Client();
    try {
      if (params.requestMethod.isPost) {
        final response = await client
            .post(uri, headers: params.headers, body: params.encodeBody())
            .timeout(timeout ?? defaultRequestTimeout);
        return params.toResponse(
          response.bodyBytes,
          statusCode: response.statusCode,
        );
      }
      final response = await client
          .get(uri, headers: {...params.headers})
          .timeout(timeout ?? defaultRequestTimeout);
      if (ServiceProviderUtils.isSuccessStatusCode(response.statusCode)) {
        File(
          "/home/mrhaydari/dev/packages/cosmos_sdk/example/test/testing/s.json",
        ).writeAsString(response.body);
      }
      // print("uri $uri ${params.headers} ${response.statusCode} ${response.body}");
      return params.toResponse(
        response.bodyBytes,
        statusCode: response.statusCode,
      );
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
  Future<List<int>> doGrpcRequest(
    CosmosGrpcRequestDetails params, {
    Duration? timeout,
  }) async {
    try {
      return await getGrpc().doGrpcRequest(params, timeout: timeout);
    } on GrpcError catch (e) {
      throw RPCError(message: e.message ?? e.toString(), errorCode: e.code);
    }
  }

  @override
  Stream<List<int>> doGrpcRequestStream(
    CosmosGrpcRequestDetails params, {
    Duration? timeout,
  }) {
    try {
      return getGrpc().doGrpcRequestStream(params, timeout: timeout);
    } on GrpcError catch (e) {
      throw RPCError(message: e.message ?? e.toString(), errorCode: e.code);
    }
  }

  @override
  Future<Stream<List<int>>> doGrpcRequestStreamAsync(
    CosmosGrpcRequestDetails params, {
    Duration? timeout,
  }) {
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
  // final String url = "testnet.zec.rocks";
  // final int port = 443;

  // /// Create secure gRPC channel
  // final channel = ClientChannel(
  //   url,
  //   port: port,
  //   options: const ChannelOptions(credentials: ChannelCredentials.secure()),
  // );

  // /// Initialize walletd client and provider
  // final client = WalletdGrpcClient(channel);
  // final provider = ZcashWalletdProvider(client);

  // /// Request Orchard subtree roots as a stream
  // final treeState = provider.requestStream(
  //   WalletdRequestGetSubtreeRoots(
  //     GetSubtreeRootsArg.defaultConfig(ZcashProtocol.orchard),
  //   ),
  // );

  // /// Consume the stream
  // await for (final _ in treeState) {
  //   // Handle subtree root updates here
  // }
}
