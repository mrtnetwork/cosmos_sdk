import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'account_locked_past_time_response.dart';

class OsmosisLockupAccountLockedPastTimeRequest extends CosmosMessage
    with QueryMessage<OsmosisLockupAccountLockedPastTimeResponse> {
  final String owner;
  final ProtobufTimestamp timestamp;
  const OsmosisLockupAccountLockedPastTimeRequest(
      {required this.owner, required this.timestamp});
  factory OsmosisLockupAccountLockedPastTimeRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupAccountLockedPastTimeRequest(
        owner: decode.getField(1),
        timestamp: ProtobufTimestamp.deserialize(decode.getField(2)));
  }
  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"owner": owner, "timestamp": timestamp.toJson()};
  }

  @override
  TypeUrl get typeUrl => OsmosisLockupTypes.accountLockedPastTimeRequest;

  @override
  List get values => [owner, timestamp];

  @override
  OsmosisLockupAccountLockedPastTimeResponse onResponse(List<int> bytes) {
    return OsmosisLockupAccountLockedPastTimeResponse.deserialize(bytes);
  }

  @override
  OsmosisLockupAccountLockedPastTimeResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisLockupAccountLockedPastTimeResponse.fromJson(json);
  }

  @override
  Map<String, String?> get queryParameters =>
      {"timestamp": timestamp.toString()};

  @override
  List<String> get pathParameters => [owner];
}
