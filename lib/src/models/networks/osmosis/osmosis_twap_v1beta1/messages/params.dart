import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_twap_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Params holds parameters for the twap module.
class OsmosisTwapParams extends CosmosMessage {
  final String? pruneEpochIdentifier;
  final ProtobufDuration recordHistoryKeepPeriod;

  OsmosisTwapParams(
      {this.pruneEpochIdentifier, required this.recordHistoryKeepPeriod});
  factory OsmosisTwapParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisTwapParams(
        pruneEpochIdentifier: decode.getField(1),
        recordHistoryKeepPeriod:
            ProtobufDuration.deserialize(decode.getField(2)));
  }
  factory OsmosisTwapParams.fromRpc(Map<String, dynamic> json) {
    return OsmosisTwapParams(
        recordHistoryKeepPeriod:
            ProtobufDuration.fromString(json["record_history_keep_period"]),
        pruneEpochIdentifier: json["prune_epoch_identifier"]);
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "prune_epoch_identifier": pruneEpochIdentifier,
      "record_history_keep_period": recordHistoryKeepPeriod.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisTwapV1beta1Types.params;

  @override
  List get values => [pruneEpochIdentifier, recordHistoryKeepPeriod];
}
