import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'account_locked_duration_response.dart';

class OsmosisLockupAccountLockedDurationRequest extends CosmosMessage
    with QueryMessage<OsmosisLockupAccountLockedDurationResponse> {
  final String owner;
  final ProtobufDuration duration;
  const OsmosisLockupAccountLockedDurationRequest(
      {required this.owner, required this.duration});
  factory OsmosisLockupAccountLockedDurationRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupAccountLockedDurationRequest(
        owner: decode.getField(1),
        duration: ProtobufDuration.deserialize(decode.getField(2)));
  }
  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"owner": owner, "duration": duration.toJson()};
  }

  @override
  TypeUrl get typeUrl => OsmosisLockupTypes.accountLockedDurationRequest;

  @override
  List get values => [owner, duration];

  @override
  OsmosisLockupAccountLockedDurationResponse onResponse(List<int> bytes) {
    return OsmosisLockupAccountLockedDurationResponse.deserialize(bytes);
  }

  @override
  OsmosisLockupAccountLockedDurationResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisLockupAccountLockedDurationResponse.fromJson(json);
  }

  @override
  Map<String, String?> get queryParameters => {};
  @override
  List<String> get pathParameters => [owner];
}
