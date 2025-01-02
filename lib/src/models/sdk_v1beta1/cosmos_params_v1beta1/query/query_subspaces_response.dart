import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_params_v1beta1/messages/subspace.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_params_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// QuerySubspacesResponse defines the response types for querying for all registered subspaces and all keys for a subspace.
///
/// Since: cosmos-sdk 0.46
class ParamsQuerySubspacesResponse extends CosmosMessage {
  final List<ParamsSubspace> subspaces;
  ParamsQuerySubspacesResponse(List<ParamsSubspace> subspaces)
      : subspaces = subspaces.immutable;

  factory ParamsQuerySubspacesResponse.fromRpc(Map<String, dynamic> json) {
    return ParamsQuerySubspacesResponse((json["subspaces"] as List?)
            ?.map((e) => ParamsSubspace.fromRpc(e))
            .toList() ??
        []);
  }
  factory ParamsQuerySubspacesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ParamsQuerySubspacesResponse(decode
        .getFields<List<int>>(1)
        .map((e) => ParamsSubspace.deserialize(e))
        .toList());
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"subspaces": subspaces.map((e) => e.toJson()).toList()};
  }

  @override
  TypeUrl get typeUrl => ParamsV1beta1.paramsQuerySubspacesResponse;

  @override
  List get values => [subspaces];
}
