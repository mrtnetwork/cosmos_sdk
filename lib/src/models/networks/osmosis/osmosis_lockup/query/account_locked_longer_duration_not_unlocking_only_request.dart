import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'account_locked_longer_duration_not_unlocking_only_response.dart';

class OsmosisLockupAccountLockedLongerDurationNotUnlockingOnlyRequest
    extends CosmosMessage
    with
        QueryMessage<
          OsmosisLockupAccountLockedLongerDurationNotUnlockingOnlyResponse
        > {
  final String owner;
  final ProtobufDuration duration;
  const OsmosisLockupAccountLockedLongerDurationNotUnlockingOnlyRequest({
    required this.owner,
    required this.duration,
  });
  factory OsmosisLockupAccountLockedLongerDurationNotUnlockingOnlyRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupAccountLockedLongerDurationNotUnlockingOnlyRequest(
      owner: decode.getField(1),
      duration: ProtobufDuration.deserialize(decode.getField(2)),
    );
  }
  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"owner": owner, "duration": duration.toJson()};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisLockupTypes.accountLockedLongerDurationNotUnlockingOnlyRequest;

  @override
  List get values => [owner, duration];

  @override
  OsmosisLockupAccountLockedLongerDurationNotUnlockingOnlyResponse onResponse(
    List<int> bytes,
  ) {
    return OsmosisLockupAccountLockedLongerDurationNotUnlockingOnlyResponse.deserialize(
      bytes,
    );
  }

  @override
  OsmosisLockupAccountLockedLongerDurationNotUnlockingOnlyResponse
  onJsonResponse(Map<String, dynamic> json) {
    return OsmosisLockupAccountLockedLongerDurationNotUnlockingOnlyResponse.fromJson(
      json,
    );
  }

  @override
  Map<String, String?> get queryParameters => {};

  @override
  List<String> get pathParameters => [owner];
}
