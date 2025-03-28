import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';

class OsmosisGammQueryPoolTypeResponse extends CosmosMessage {
  final String? poolType;

  OsmosisGammQueryPoolTypeResponse({this.poolType});
  factory OsmosisGammQueryPoolTypeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammQueryPoolTypeResponse(poolType: decode.getField(1));
  }
  factory OsmosisGammQueryPoolTypeResponse.fromJson(Map<String, dynamic> json) {
    return OsmosisGammQueryPoolTypeResponse(poolType: json["pool_type"]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"pool_type": poolType};
  }

  @override
  TypeUrl get typeUrl => OsmosisGammV1beta1Types.queryPoolTypeResponse;

  @override
  List get values => [poolType];
}
