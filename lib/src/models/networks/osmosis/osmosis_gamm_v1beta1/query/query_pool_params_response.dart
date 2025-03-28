import 'package:cosmos_sdk/src/models/global_messages/unknown_message.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';

class OsmosisGammQueryPoolParamsResponse extends CosmosMessage {
  final AnyMessage? params;

  OsmosisGammQueryPoolParamsResponse({this.params});
  factory OsmosisGammQueryPoolParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammQueryPoolParamsResponse(
        params: decode
            .getResult(1)
            ?.to<AnyMessage, List<int>>((e) => AnyMessage.deserialize(e)));
  }
  factory OsmosisGammQueryPoolParamsResponse.fromJson(
      Map<String, dynamic> json) {
    return OsmosisGammQueryPoolParamsResponse(
        params: json["params"] == null
            ? null
            : AnyMessage.fromJson(json["params"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"params": params?.toJson()};
  }

  @override
  TypeUrl get typeUrl => OsmosisGammV1beta1Types.queryPoolResponse;

  @override
  List get values => [params];
}
