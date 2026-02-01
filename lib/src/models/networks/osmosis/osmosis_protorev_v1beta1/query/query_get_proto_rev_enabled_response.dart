import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryGetProtoRevEnabledResponse is response type for the Query/GetProtoRevEnabled RPC method.
class OsmosisProtorevQueryGetProtoRevEnabledResponse extends CosmosMessage {
  /// [enabled] is whether the module is enabled
  final bool? enabled;
  const OsmosisProtorevQueryGetProtoRevEnabledResponse({this.enabled});
  factory OsmosisProtorevQueryGetProtoRevEnabledResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevQueryGetProtoRevEnabledResponse(
      enabled: decode.getField(1),
    );
  }
  factory OsmosisProtorevQueryGetProtoRevEnabledResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisProtorevQueryGetProtoRevEnabledResponse(
      enabled: json["enabled"],
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"enabled": enabled};
  }

  @override
  List get values => [enabled];

  @override
  TypeUrl get typeUrl =>
      OsmosisProtorevV1beta1Types.queryGetProtoRevEnabledResponse;
}
