import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_params_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// Subspace defines a parameter subspace name and all the keys that exist for the subspace.
/// Since: cosmos-sdk 0.46
class ParamsSubspace extends CosmosMessage {
  final String? subspace;
  final List<String>? keys;
  factory ParamsSubspace.fromJson(Map<String, dynamic> json) {
    return ParamsSubspace(
      keys: (json["keys"] as List?)?.cast(),
      subspace: json["subspace"],
    );
  }
  ParamsSubspace({this.subspace, List<String>? keys}) : keys = keys?.immutable;
  factory ParamsSubspace.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ParamsSubspace(
      subspace: decode.getField(1),
      keys: decode.getFields<String>(2),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"subspace": subspace, "keys": keys};
  }

  @override
  TypeUrl get typeUrl => ParamsV1beta1.paramsSubspace;

  @override
  List get values => [subspace, keys];
}
