import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_epochs_v1beta1/messages/epoch_info.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_epochs_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OmosisEpochsQueryEpochsInfoResponse extends CosmosMessage {
  final List<OmosisEpochsEpochInfo> epochs;
  const OmosisEpochsQueryEpochsInfoResponse(this.epochs);
  factory OmosisEpochsQueryEpochsInfoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OmosisEpochsQueryEpochsInfoResponse(decode
        .getFields<List<int>>(1)
        .map((e) => OmosisEpochsEpochInfo.deserialize(e))
        .toList());
  }
  factory OmosisEpochsQueryEpochsInfoResponse.fromRpc(
      Map<String, dynamic> json) {
    return OmosisEpochsQueryEpochsInfoResponse((json["epochs"] as List)
        .map((e) => OmosisEpochsEpochInfo.fromRpc(e))
        .toList());
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"epochs": epochs.map((e) => e.toJson()).toList()};
  }

  @override
  TypeUrl get typeUrl => OsmosisEpochsV1beta1Types.epochsInfoResponse;

  @override
  List get values => [epochs];
}
