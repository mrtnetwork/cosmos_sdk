import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Params defines the parameters for the module
class OsmosisProtorevParams extends CosmosMessage {
  /// The weight of a stableswap pool
  final bool? enabled;
  // The admin account (settings manager) of the protorev module.
  final String? admin;

  OsmosisProtorevParams({this.enabled, this.admin});

  factory OsmosisProtorevParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevParams(
        enabled: decode.getField(1), admin: decode.getField(2));
  }
  factory OsmosisProtorevParams.fromRpc(Map<String, dynamic> json) {
    return OsmosisProtorevParams(
        admin: json["admin"], enabled: json["enabled"]);
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"enabled": enabled, "admin": admin};
  }

  @override
  TypeUrl get typeUrl => OsmosisProtorevV1beta1Types.params;

  @override
  List get values => [enabled, admin];
}
