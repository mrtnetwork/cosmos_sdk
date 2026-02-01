import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_params_v1beta1/query/query_params_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_params_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryParamsRequest is request type for the Query/Params RPC method.
class ParamsQueryParamsRequest extends CosmosMessage
    with QueryMessage<ParamsQueryParamsResponse> {
  /// subspace defines the module to query the parameter for.
  final String subspace;

  /// key defines the key of the parameter in the subspace.
  final String key;
  const ParamsQueryParamsRequest({required this.subspace, required this.key});
  factory ParamsQueryParamsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ParamsQueryParamsRequest(
      subspace: decode.getField(1),
      key: decode.getField(2),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"subspace": subspace, "key": key};
  }

  @override
  TypeUrl get typeUrl => ParamsV1beta1.paramsQueryParamsRequest;

  @override
  List get values => [subspace, key];
  @override
  ParamsQueryParamsResponse onResponse(List<int> bytes) {
    return ParamsQueryParamsResponse.deserialize(bytes);
  }

  @override
  ParamsQueryParamsResponse onJsonResponse(Map<String, dynamic> json) {
    return ParamsQueryParamsResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [subspace, key];
}
