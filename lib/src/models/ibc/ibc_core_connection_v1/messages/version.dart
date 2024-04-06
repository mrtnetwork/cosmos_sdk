import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// Version defines the versioning scheme used to negotiate the IBC version in the connection handshake.
class IbcConnectionVersion extends CosmosMessage {
  /// unique version identifier
  final String? identifier;

  /// list of features compatible with the specified identifier
  final List<String>? features;
  IbcConnectionVersion({this.identifier, List<String>? features})
      : features = features?.mutable;
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
  String get typeUrl => IbcTypes.ibcConnectionVersion.typeUrl;

  @override
  List get values => [identifier, features];
}
