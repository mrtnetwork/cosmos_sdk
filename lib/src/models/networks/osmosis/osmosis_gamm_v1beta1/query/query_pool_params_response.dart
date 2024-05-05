import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';

class OsmosisGammQueryPoolParamsResponse extends CosmosMessage {
  final Any? params;

  OsmosisGammQueryPoolParamsResponse({this.params});
  factory OsmosisGammQueryPoolParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammQueryPoolParamsResponse(
        params:
            decode.getResult(1)?.to<Any, List<int>>((e) => Any.deserialize(e)));
  }
  factory OsmosisGammQueryPoolParamsResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisGammQueryPoolParamsResponse(
        params: json["params"] == null ? null : Any.fromRpc(json["params"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"params": params?.toJson()};
  }

  @override
  String get typeUrl => OsmosisGammV1beta1Types.queryPoolResponse.typeUrl;

  @override
  List get values => [params];
}
