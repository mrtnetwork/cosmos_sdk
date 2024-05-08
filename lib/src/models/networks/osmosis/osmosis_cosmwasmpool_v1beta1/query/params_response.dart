import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_cosmwasmpool_v1beta1/messages/params.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_cosmwasmpool_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisCosmWasmPoolParamsResponse extends CosmosMessage {
  final OsmosisCosmWasmPoolParams params;

  OsmosisCosmWasmPoolParamsResponse(this.params);
  factory OsmosisCosmWasmPoolParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisCosmWasmPoolParamsResponse(
        OsmosisCosmWasmPoolParams.deserialize(decode.getField(1)));
  }
  factory OsmosisCosmWasmPoolParamsResponse.fromRpc(Map<String, dynamic> json) {
    return OsmosisCosmWasmPoolParamsResponse(
        OsmosisCosmWasmPoolParams.fromRpc(json["params"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"params": params.toJson()};
  }

  @override
  String get typeUrl => OsmosisCosmWasmPoolV1beta1Types.paramsResponse.typeUrl;

  @override
  List get values => [params];
}
