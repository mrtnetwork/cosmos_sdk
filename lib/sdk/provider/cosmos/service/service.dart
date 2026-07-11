import 'package:blockchain_utils/service/models/params.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/core/core.dart';

typedef CosmosServiceResponse = BaseServiceResponse;

/// A mixin defining the service provider contract for interacting with the tendermint RPC.
mixin CosmosServiceProvider
    implements
        IServiceProvider<BaseCosmosRequestDetails, CosmosGrpcRequestDetails> {
  @override
  Future<CosmosServiceResponse> doRequest(
    BaseCosmosRequestDetails params, {
    Duration? timeout,
  });

  @override
  Future<BaseServiceSubscribtionResponse> doSubscribtionRequest({
    required BaseCosmosRequestDetails params,
    required BaseServiceSubscribtionRequest<
      dynamic,
      dynamic,
      BaseSubscribtionEvent<dynamic>,
      BaseCosmosRequestDetails
    >
    request,
    Duration? timeout,
  }) {
    throw UnsupportedError(
      "Subscribtion requests are not supported by this service.",
    );
  }
}
