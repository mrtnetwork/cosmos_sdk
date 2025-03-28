import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_downtimedetector_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisDowntimeDetectorRecoveredSinceDowntimeOfLengthResponse
    extends CosmosMessage {
  final bool? succesfullyRecovered;
  OsmosisDowntimeDetectorRecoveredSinceDowntimeOfLengthResponse(
      {this.succesfullyRecovered});
  factory OsmosisDowntimeDetectorRecoveredSinceDowntimeOfLengthResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisDowntimeDetectorRecoveredSinceDowntimeOfLengthResponse(
        succesfullyRecovered: decode.getField(1));
  }
  factory OsmosisDowntimeDetectorRecoveredSinceDowntimeOfLengthResponse.fromJson(
      Map<String, dynamic> json) {
    return OsmosisDowntimeDetectorRecoveredSinceDowntimeOfLengthResponse(
        succesfullyRecovered: json["succesfully_recovered"]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"succesfully_recovered": succesfullyRecovered};
  }

  @override
  TypeUrl get typeUrl => OsmosisDowntimeDetectorV1beta1Types
      .recoveredSinceDowntimeOfLengthResponse;

  @override
  List get values => [succesfullyRecovered];
}
