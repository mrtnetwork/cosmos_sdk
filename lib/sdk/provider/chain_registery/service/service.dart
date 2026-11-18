import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/sdk/provider/chain_registery/core/core.dart';

typedef ChainRegistryResponse = BaseServiceResponse;

/// A mixin defining the service provider contract for interacting with the chain registry API.
mixin ChainRegistryServiceProvider
    implements
        IServiceProvider<
          ChainRegistryRequestRequestDetails,
          BaseGRPCServiceRequestParams
        > {
  @override
  Future<ChainRegistryResponse> doRequest(
    ChainRegistryRequestRequestDetails params, {
    Duration? timeout,
  });

  @override
  Future<BaseServiceSubscribtionResponse> doSubscribtionRequest({
    required ChainRegistryRequestRequestDetails params,
    required BaseServiceSubscribtionRequest<
      dynamic,
      dynamic,
      BaseSubscribtionEvent<dynamic>,
      ChainRegistryRequestRequestDetails
    >
    request,
    Duration? timeout,
  }) {
    throw BuError(
      DefaultErrorType.unsupported,
      "Subscription requests are not supported by this service.",
    );
  }

  @override
  Future<List<int>> doGrpcRequest(
    BaseGRPCServiceRequestParams params, {
    Duration? timeout,
  }) {
    throw BuError(
      DefaultErrorType.unsupported,
      "gRPC requests are not supported by this service.",
    );
  }

  @override
  Stream<List<int>> doGrpcRequestStream(
    BaseGRPCServiceRequestParams params, {
    Duration? timeout,
  }) {
    throw BuError(
      DefaultErrorType.unsupported,
      "gRPC requests are not supported by this service.",
    );
  }

  @override
  Future<Stream<List<int>>> doGrpcRequestStreamAsync(
    BaseGRPCServiceRequestParams params, {
    Duration? timeout,
  }) {
    throw BuError(
      DefaultErrorType.unsupported,
      "gRPC requests are not supported by this service.",
    );
  }
}
