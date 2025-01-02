import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class OsmosisDowntimeDetectorV1beta1Types extends TypeUrl {
  const OsmosisDowntimeDetectorV1beta1Types._(super.typeUrl,
      {super.query, super.rpc});
  static const OsmosisDowntimeDetectorV1beta1Types genesisDowntimeEntry =
      OsmosisDowntimeDetectorV1beta1Types._(
          "/osmosis.downtimedetector.v1beta1.GenesisDowntimeEntry");
  static const OsmosisDowntimeDetectorV1beta1Types genesisState =
      OsmosisDowntimeDetectorV1beta1Types._(
          "/osmosis.downtimedetector.v1beta1.GenesisState");

  static const OsmosisDowntimeDetectorV1beta1Types
      recoveredSinceDowntimeOfLengthRequest =
      OsmosisDowntimeDetectorV1beta1Types._(
          "/osmosis.downtimedetector.v1beta1.RecoveredSinceDowntimeOfLengthRequest",
          query:
              "/osmosis.downtimedetector.v1beta1.Query/RecoveredSinceDowntimeOfLength",
          rpc:
              "/osmosis/downtime-detector/v1beta1/RecoveredSinceDowntimeOfLength");
  static const OsmosisDowntimeDetectorV1beta1Types
      recoveredSinceDowntimeOfLengthResponse =
      OsmosisDowntimeDetectorV1beta1Types._(
          "/osmosis.downtimedetector.v1beta1.RecoveredSinceDowntimeOfLengthResponse");
}
