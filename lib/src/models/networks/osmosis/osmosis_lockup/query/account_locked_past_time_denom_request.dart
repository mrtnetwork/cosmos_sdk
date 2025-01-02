import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'account_locked_past_time_denom_reesponse.dart';

class OsmosisLockupAccountLockedPastTimeDenomRequest extends CosmosMessage
    with QueryMessage<OsmosisLockupAccountLockedPastTimeDenomResponse> {
  final String owner;
  final ProtobufTimestamp timestamp;
  final String? denom;
  const OsmosisLockupAccountLockedPastTimeDenomRequest(
      {required this.owner, required this.timestamp, this.denom});
  factory OsmosisLockupAccountLockedPastTimeDenomRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupAccountLockedPastTimeDenomRequest(
        owner: decode.getField(1),
        timestamp: ProtobufTimestamp.deserialize(decode.getField(2)),
        denom: decode.getField(3));
  }
  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {"owner": owner, "timestamp": timestamp.toJson(), "denom": denom};
  }

  @override
  TypeUrl get typeUrl => OsmosisLockupTypes.accountLockedPastTimeDenomRequest;

  @override
  List get values => [owner, timestamp, denom];

  @override
  OsmosisLockupAccountLockedPastTimeDenomResponse onResponse(List<int> bytes) {
    return OsmosisLockupAccountLockedPastTimeDenomResponse.deserialize(bytes);
  }

  @override
  OsmosisLockupAccountLockedPastTimeDenomResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisLockupAccountLockedPastTimeDenomResponse.fromRpc(json);
  }

  @override
  Map<String, String?> get queryParameters =>
      {"denom": denom, "timestamp": timestamp.toString()};

  @override
  List<String> get pathParameters => [owner];
}
