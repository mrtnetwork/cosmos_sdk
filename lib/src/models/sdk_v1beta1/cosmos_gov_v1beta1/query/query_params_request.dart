import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/query/query_params_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryParamsRequest is the request type for the Query/Params RPC method.
class GovQueryParamsRequest extends CosmosMessage
    with QueryMessage<GovQueryParamsResponse> {
  /// params_type defines which parameters to query for, can be one of "voting",
  /// "tallying" or "deposit".
  final String paramsType;
  const GovQueryParamsRequest(this.paramsType);

  factory GovQueryParamsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GovQueryParamsRequest(decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"params_type": paramsType};
  }

  @override
  TypeUrl get typeUrl => GovV1beta1types.govQueryParamsRequest;

  @override
  List get values => [paramsType];

  @override
  GovQueryParamsResponse onResponse(List<int> bytes) {
    return GovQueryParamsResponse.deserialize(bytes);
  }

  @override
  GovQueryParamsResponse onJsonResponse(Map<String, dynamic> json) {
    return GovQueryParamsResponse.fromRpc(json);
  }

  @override
  List<String> get pathParameters => [paramsType];
}
