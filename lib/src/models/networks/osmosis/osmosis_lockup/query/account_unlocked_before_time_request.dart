import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'account_unlocked_before_time_response.dart';

class OsmosisLockupAccountUnlockedBeforeTimeRequest extends CosmosMessage
    with QueryMessage<OsmosisLockupAccountUnlockedBeforeTimeResponse> {
  final String owner;
  final ProtobufTimestamp timestamp;
  const OsmosisLockupAccountUnlockedBeforeTimeRequest(
      {required this.owner, required this.timestamp});
  factory OsmosisLockupAccountUnlockedBeforeTimeRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupAccountUnlockedBeforeTimeRequest(
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
  TypeUrl get typeUrl => OsmosisLockupTypes.accountUnlockedBeforeTimeRequest;

  @override
  List get values => [owner, timestamp];

  @override
  OsmosisLockupAccountUnlockedBeforeTimeResponse onResponse(List<int> bytes) {
    return OsmosisLockupAccountUnlockedBeforeTimeResponse.deserialize(bytes);
  }

  @override
  OsmosisLockupAccountUnlockedBeforeTimeResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisLockupAccountUnlockedBeforeTimeResponse.fromRpc(json);
  }

  @override
  Map<String, String?> get queryParameters =>
      {"timestamp": timestamp.toString()};
  @override
  List<String> get pathParameters => [owner];
}
