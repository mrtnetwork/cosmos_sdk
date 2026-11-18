import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/sdk/provider/thornode/core/core.dart';

typedef ThorNodeServiceResponse = BaseServiceResponse;

/// A mixin defining the service provider contract for interacting with the thornode network.
mixin ThorNodeServiceProvider
    implements
        IServiceProvider<ThorNodeRequestDetails, BaseGRPCServiceRequestParams> {
  @override
  Future<ThorNodeServiceResponse> doRequest(
    ThorNodeRequestDetails params, {
    Duration? timeout,
  });

  @override
  Future<BaseServiceSubscribtionResponse> doSubscribtionRequest({
    required ThorNodeRequestDetails params,
    required BaseServiceSubscribtionRequest<
      dynamic,
      dynamic,
      BaseSubscribtionEvent<dynamic>,
      ThorNodeRequestDetails
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
