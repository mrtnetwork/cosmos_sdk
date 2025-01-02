import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// Version defines the versioning scheme used to negotiate the IBC version in the connection handshake.
class IbcConnectionVersion extends CosmosMessage {
  /// unique version identifier
  final String? identifier;

  /// list of features compatible with the specified identifier
  final List<String>? features;
  factory IbcConnectionVersion.fromRpc(Map<String, dynamic> json) {
    return IbcConnectionVersion(
        identifier: json["identifier"],
        features: (json["features"] as List?)?.cast());
  }

  IbcConnectionVersion({this.identifier, List<String>? features})
      : features = features?.immutable;
  factory IbcConnectionVersion.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcConnectionVersion(
        identifier: decode.getField(1), features: decode.getFields<String>(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "identifier": identifier,
      "features": features,
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.ibcConnectionVersion;

  @override
  List get values => [identifier, features];
}
