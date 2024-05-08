import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_cosmwasmpool_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisCosmWasmPoolEmptyStruct extends CosmosMessage {
  OsmosisCosmWasmPoolEmptyStruct();
  factory OsmosisCosmWasmPoolEmptyStruct.deserialize(List<int> bytes) {
    return OsmosisCosmWasmPoolEmptyStruct();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String get typeUrl => OsmosisCosmWasmPoolV1beta1Types.emptyStruct.typeUrl;

  @override
  List get values => [];
}
