import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_downtimedetector_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'down_time.dart';

class OsmosisDowntimeDetectorGenesisDowntimeEntry extends CosmosMessage {
  final OsmosisDowntimeDetectorDowntime? duration;
  final ProtobufTimestamp lastDowntime;
  const OsmosisDowntimeDetectorGenesisDowntimeEntry({
    this.duration,
    required this.lastDowntime,
  });
  factory OsmosisDowntimeDetectorGenesisDowntimeEntry.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisDowntimeDetectorGenesisDowntimeEntry(
      lastDowntime: ProtobufTimestamp.fromString(decode.getField(2)),
      duration: decode
          .getResult(1)
          ?.to<OsmosisDowntimeDetectorDowntime, int>(
            (e) => OsmosisDowntimeDetectorDowntime.fromValue(e),
          ),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"duration": duration?.name, "last_downtime": lastDowntime.toJson()};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisDowntimeDetectorV1beta1Types.genesisDowntimeEntry;

  @override
  List get values => [duration, lastDowntime];
}
