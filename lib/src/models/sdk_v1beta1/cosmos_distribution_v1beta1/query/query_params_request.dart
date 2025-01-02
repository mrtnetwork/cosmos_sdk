import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/query/query_params_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryParamsRequest is the request type for the Query/Params RPC method..
class DistributionQueryParamsRequest extends CosmosMessage
    with QueryMessage<DistributionQueryParamsResponse> {
  ///  This message has no fields.
  const DistributionQueryParamsRequest();
  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl =>
      DistributionV1beta1Types.distributionQueryParamsRequest;

  @override
  List get values => [];

  @override
  DistributionQueryParamsResponse onResponse(List<int> bytes) {
    return DistributionQueryParamsResponse.deserialize(bytes);
  }

  @override
  DistributionQueryParamsResponse onJsonResponse(Map<String, dynamic> json) {
    return DistributionQueryParamsResponse.fromRpc(json);
  }
}
