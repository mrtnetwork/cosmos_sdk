import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';

class OsmosisGammQueryPoolResponse extends CosmosMessage {
  final Any? pool;

  OsmosisGammQueryPoolResponse({this.pool});
  factory OsmosisGammQueryPoolResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammQueryPoolResponse(
        pool:
            decode.getResult(1)?.to<Any, List<int>>((e) => Any.deserialize(e)));
  }
  factory OsmosisGammQueryPoolResponse.fromRpc(Map<String, dynamic> json) {
    return OsmosisGammQueryPoolResponse(
        pool: json["pool"] == null ? null : Any.fromRpc(json["pool"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"pool": pool?.toJson()};
  }

  @override
  String get typeUrl => OsmosisGammV1beta1Types.queryPoolResponse.typeUrl;

  @override
  List get values => [pool];
}
