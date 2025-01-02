import 'package:cosmos_sdk/src/models/ethermint/fee_market_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_params_response.dart';

/// QueryParamsRequest defines the request type for querying x/evm parameters.
class FeeMarketV1QueryParamsRequest extends CosmosMessage
    with QueryMessage<FeeMarketV1QueryParamsResponse> {
  const FeeMarketV1QueryParamsRequest();
  factory FeeMarketV1QueryParamsRequest.deserialize(List<int> bytes) {
    return FeeMarketV1QueryParamsRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => FeeMarketTypes.paramsRequest;

  @override
  List get values => [];

  @override
  FeeMarketV1QueryParamsResponse onResponse(List<int> bytes) {
    return FeeMarketV1QueryParamsResponse.deserialize(bytes);
  }

  @override
  FeeMarketV1QueryParamsResponse onJsonResponse(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  @override
  Map<String, String?> get queryParameters => {};
}
