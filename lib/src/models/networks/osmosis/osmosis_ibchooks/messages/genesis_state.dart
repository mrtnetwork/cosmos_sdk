import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_ibchooks/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'params.dart';

class OsmosisIbchooksGenesisState extends CosmosMessage {
  final OsmosisIbchooksParams params;
  OsmosisIbchooksGenesisState(this.params);
  factory OsmosisIbchooksGenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisIbchooksGenesisState(
        OsmosisIbchooksParams.deserialize(decode.getField(1)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"params": params.toJson()};
  }

  @override
  String get typeUrl => OsmosisIbchooksTypes.genesisState.typeUrl;

  @override
  List get values => [params];
}
