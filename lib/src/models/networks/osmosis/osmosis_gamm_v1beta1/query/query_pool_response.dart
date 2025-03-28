import 'package:cosmos_sdk/src/models/global_messages/unknown_message.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';

class OsmosisGammQueryPoolResponse extends CosmosMessage {
  final AnyMessage? pool;

  OsmosisGammQueryPoolResponse({this.pool});
  factory OsmosisGammQueryPoolResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammQueryPoolResponse(
        pool: decode
            .getResult(1)
            ?.to<AnyMessage, List<int>>((e) => AnyMessage.deserialize(e)));
  }
  factory OsmosisGammQueryPoolResponse.fromJson(Map<String, dynamic> json) {
    return OsmosisGammQueryPoolResponse(
        pool: json["pool"] == null ? null : AnyMessage.fromJson(json["pool"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"pool": pool?.toJson()};
  }

  @override
  TypeUrl get typeUrl => OsmosisGammV1beta1Types.queryPoolResponse;

  @override
  List get values => [pool];
}
