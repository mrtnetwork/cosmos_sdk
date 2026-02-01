import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_downtimedetector_v1beta1/messages/down_time.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_downtimedetector_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'recovered_since_downtime_of_length_response.dart';

class OsmosisDowntimeDetectorRecoveredSinceDowntimeOfLengthRequest
    extends CosmosMessage
    with
        QueryMessage<
          OsmosisDowntimeDetectorRecoveredSinceDowntimeOfLengthResponse
        > {
  final OsmosisDowntimeDetectorDowntime? downtime;
  final ProtobufDuration recovery;
  const OsmosisDowntimeDetectorRecoveredSinceDowntimeOfLengthRequest({
    this.downtime,
    required this.recovery,
  });
  factory OsmosisDowntimeDetectorRecoveredSinceDowntimeOfLengthRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisDowntimeDetectorRecoveredSinceDowntimeOfLengthRequest(
      recovery: ProtobufDuration.fromString(decode.getField(2)),
      downtime: decode
          .getResult(1)
          ?.to<OsmosisDowntimeDetectorDowntime, int>(
            (e) => OsmosisDowntimeDetectorDowntime.fromValue(e),
          ),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  OsmosisDowntimeDetectorRecoveredSinceDowntimeOfLengthResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return OsmosisDowntimeDetectorRecoveredSinceDowntimeOfLengthResponse.fromJson(
      json,
    );
  }

  @override
  OsmosisDowntimeDetectorRecoveredSinceDowntimeOfLengthResponse onResponse(
    List<int> bytes,
  ) {
    return OsmosisDowntimeDetectorRecoveredSinceDowntimeOfLengthResponse.deserialize(
      bytes,
    );
  }

  @override
  Map<String, String?> get queryParameters => {};

  @override
  Map<String, dynamic> toJson() {
    return {"downtime": downtime?.name, "recovery": recovery.toJson()};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisDowntimeDetectorV1beta1Types.recoveredSinceDowntimeOfLengthRequest;

  @override
  List get values => [downtime?.value, recovery];
}
