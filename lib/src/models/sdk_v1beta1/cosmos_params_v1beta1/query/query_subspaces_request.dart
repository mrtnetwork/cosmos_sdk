import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_params_v1beta1/query/query_subspaces_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_params_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QuerySubspacesRequest defines a request type for querying for all registered subspaces and all keys for a subspace.
///
/// Since: cosmos-sdk 0.46
class ParamsQuerySubspacesRequest extends CosmosMessage
    with QueryMessage<ParamsQuerySubspacesResponse> {
  ///  This message has no fields.
  const ParamsQuerySubspacesRequest();
  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => ParamsV1beta1.paramsQuerySubspacesRequest;

  @override
  List get values => [];

  @override
  ParamsQuerySubspacesResponse onResponse(List<int> bytes) {
    return ParamsQuerySubspacesResponse.deserialize(bytes);
  }

  @override
  ParamsQuerySubspacesResponse onJsonResponse(Map<String, dynamic> json) {
    return ParamsQuerySubspacesResponse.fromRpc(json);
  }
}
