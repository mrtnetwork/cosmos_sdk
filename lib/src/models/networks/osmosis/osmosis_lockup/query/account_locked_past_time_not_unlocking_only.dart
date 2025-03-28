import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'account_locked_past_time_not_unlocking_only_fesponse.dart';

class OsmosisLockupAccountLockedPastTimeNotUnlockingOnlyRequest
    extends CosmosMessage
    with
        QueryMessage<
            OsmosisLockupAccountLockedPastTimeNotUnlockingOnlyResponse> {
  final String owner;
  final ProtobufTimestamp timestamp;
  const OsmosisLockupAccountLockedPastTimeNotUnlockingOnlyRequest(
      {required this.owner, required this.timestamp});
  factory OsmosisLockupAccountLockedPastTimeNotUnlockingOnlyRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupAccountLockedPastTimeNotUnlockingOnlyRequest(
        owner: decode.getField(1),
        timestamp: ProtobufTimestamp.deserialize(decode.getField(2)));
  }
  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "owner": owner,
      "timestamp": timestamp.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisLockupTypes.accountLockedPastTimeNotUnlockingOnlyRequest;

  @override
  List get values => [owner, timestamp];

  @override
  OsmosisLockupAccountLockedPastTimeNotUnlockingOnlyResponse onResponse(
      List<int> bytes) {
    return OsmosisLockupAccountLockedPastTimeNotUnlockingOnlyResponse
        .deserialize(bytes);
  }

  @override
  OsmosisLockupAccountLockedPastTimeNotUnlockingOnlyResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisLockupAccountLockedPastTimeNotUnlockingOnlyResponse.fromJson(
        json);
  }

  @override
  Map<String, String?> get queryParameters =>
      {"timestamp": timestamp.toString()};
  @override
  List<String> get pathParameters => [owner];
}
