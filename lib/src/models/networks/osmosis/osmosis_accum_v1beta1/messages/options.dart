import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_accum_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisAccumOptions extends CosmosMessage {
  OsmosisAccumOptions();
  factory OsmosisAccumOptions.deserialize(List<int> bytes) {
    return OsmosisAccumOptions();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String get typeUrl => OsmosisAccumV1beta1Types.options.typeUrl;

  @override
  List get values => [];
}
