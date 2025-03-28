import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/messages/info_by_pool_type.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryGetProtoRevInfoByPoolTypeResponse is response type for the Query/GetProtoRevInfoByPoolType RPC method.
class OsmosisProtorevQueryGetProtoRevInfoByPoolTypeResponse
    extends CosmosMessage {
  /// [infoByPoolType] contains all information pertaining to how different
  /// pool types are handled by the module.
  final OsmosisProtorevInfoByPoolType infoByPoolType;
  const OsmosisProtorevQueryGetProtoRevInfoByPoolTypeResponse(
      this.infoByPoolType);
  factory OsmosisProtorevQueryGetProtoRevInfoByPoolTypeResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevQueryGetProtoRevInfoByPoolTypeResponse(
        OsmosisProtorevInfoByPoolType.deserialize(decode.getField(1)));
  }
  factory OsmosisProtorevQueryGetProtoRevInfoByPoolTypeResponse.fromJson(
      Map<String, dynamic> json) {
    return OsmosisProtorevQueryGetProtoRevInfoByPoolTypeResponse(
        OsmosisProtorevInfoByPoolType.fromJson(json["info_by_pool_type"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"info_by_pool_type": infoByPoolType.toJson()};
  }

  @override
  List get values => [infoByPoolType];

  @override
  TypeUrl get typeUrl =>
      OsmosisProtorevV1beta1Types.queryGetProtoRevInfoByPoolTypeResponse;
}
