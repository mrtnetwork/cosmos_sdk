import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/messages/params.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisPoolManagerParamsResponse extends CosmosMessage {
  final OsmosisPoolManagerParams params;
  const OsmosisPoolManagerParamsResponse(this.params);
  factory OsmosisPoolManagerParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerParamsResponse(
        OsmosisPoolManagerParams.deserialize(decode.getField(1)));
  }
  factory OsmosisPoolManagerParamsResponse.fromJson(Map<String, dynamic> json) {
    return OsmosisPoolManagerParamsResponse(
        OsmosisPoolManagerParams.fromJson(json["params"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"params": params.toJson()};
  }

  @override
  TypeUrl get typeUrl => OsmosisPoolManagerV1beta1Types.paramsResponse;

  @override
  List get values => [params];
}
