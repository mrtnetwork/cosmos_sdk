import 'package:cosmos_sdk/src/models/networks/osmosis/omosis_epochs_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

import 'epoch_info.dart';

/// GenesisState defines the epochs module's genesis state.
class OmosisEpochsGenesisState extends CosmosMessage {
  final List<OmosisEpochsEpochInfo> epochs;
  OmosisEpochsGenesisState(List<OmosisEpochsEpochInfo> epochs)
      : epochs = epochs.mutable;
  factory OmosisEpochsGenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OmosisEpochsGenesisState(decode
        .getFields<List<int>>(1)
        .map((e) => OmosisEpochsEpochInfo.deserialize(e))
        .toList());
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"epochs": epochs.map((e) => e.toJson()).toList()};
  }

  @override
  List get values => [epochs];

  @override
  @override
  String get typeUrl => OsmosisEpochsV1beta1Types.genesisState.typeUrl;
}
