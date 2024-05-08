import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_cosmwasmpool_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisCosmWasmPoolEmptyRequest extends CosmosMessage {
  OsmosisCosmWasmPoolEmptyRequest();
  factory OsmosisCosmWasmPoolEmptyRequest.deserialize(List<int> bytes) {
    return OsmosisCosmWasmPoolEmptyRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String get typeUrl => OsmosisCosmWasmPoolV1beta1Types.emptyRequest.typeUrl;

  @override
  List get values => [];
}
