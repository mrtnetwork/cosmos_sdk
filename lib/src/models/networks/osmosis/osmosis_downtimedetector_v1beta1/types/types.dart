import 'package:cosmos_sdk/src/models/core/type_url/type_url.dart';

class OsmosisDowntimeDetectorV1beta1Types extends TypeUrl {
  @override
  final String typeUrl;
  @override
  final String? rpc;
  const OsmosisDowntimeDetectorV1beta1Types._(this.typeUrl, {this.rpc});
  static const OsmosisDowntimeDetectorV1beta1Types genesisDowntimeEntry =
      OsmosisDowntimeDetectorV1beta1Types._(
          "/osmosis.downtimedetector.v1beta1.GenesisDowntimeEntry");
  static const OsmosisDowntimeDetectorV1beta1Types genesisState =
      OsmosisDowntimeDetectorV1beta1Types._(
          "/osmosis.downtimedetector.v1beta1.GenesisState");

  static const OsmosisDowntimeDetectorV1beta1Types
      recoveredSinceDowntimeOfLengthRequest =
      OsmosisDowntimeDetectorV1beta1Types._(
          "/osmosis.downtimedetector.v1beta1.RecoveredSinceDowntimeOfLengthRequest");
  static const OsmosisDowntimeDetectorV1beta1Types
      recoveredSinceDowntimeOfLengthResponse =
      OsmosisDowntimeDetectorV1beta1Types._(
          "/osmosis.downtimedetector.v1beta1.RecoveredSinceDowntimeOfLengthResponse");

  /// query
  static const OsmosisDowntimeDetectorV1beta1Types
      recoveredSinceDowntimeOfLength = OsmosisDowntimeDetectorV1beta1Types._(
          "/osmosis.downtimedetector.v1beta1.Query/RecoveredSinceDowntimeOfLength",
          rpc:
              "/osmosis/downtime-detector/v1beta1/RecoveredSinceDowntimeOfLength");
}
