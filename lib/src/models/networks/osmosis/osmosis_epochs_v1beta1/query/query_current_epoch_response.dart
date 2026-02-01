import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_epochs_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OmosisEpochsQueryCurrentEpochResponse extends CosmosMessage {
  final BigInt? currentEpoch;
  const OmosisEpochsQueryCurrentEpochResponse(this.currentEpoch);
  factory OmosisEpochsQueryCurrentEpochResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OmosisEpochsQueryCurrentEpochResponse(decode.getField(1));
  }
  factory OmosisEpochsQueryCurrentEpochResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return OmosisEpochsQueryCurrentEpochResponse(
      BigintUtils.tryParse(json["current_epoch"]),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"current_epoch": currentEpoch?.toString()};
  }

  @override
  TypeUrl get typeUrl => OsmosisEpochsV1beta1Types.currentEpochResponse;

  @override
  List get values => [currentEpoch];
}
