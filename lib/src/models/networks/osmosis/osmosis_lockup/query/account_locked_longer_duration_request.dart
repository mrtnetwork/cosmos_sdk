import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'account_locked_longer_duration_response.dart';

class OsmosisLockupAccountLockedLongerDurationRequest extends CosmosMessage
    with
        QueryMessage<OsmosisLockupAccountLockedLongerDurationResponse>,
        RPCMessage<OsmosisLockupAccountLockedLongerDurationResponse> {
  final String? owner;
  final ProtobufDuration duration;
  const OsmosisLockupAccountLockedLongerDurationRequest(
      {this.owner, required this.duration});
  factory OsmosisLockupAccountLockedLongerDurationRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupAccountLockedLongerDurationRequest(
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
  String get typeUrl =>
      OsmosisLockupTypes.accountLockedLongerDurationRequest.typeUrl;

  @override
  List get values => [owner, duration];

  @override
  OsmosisLockupAccountLockedLongerDurationResponse onResponse(List<int> bytes) {
    return OsmosisLockupAccountLockedLongerDurationResponse.deserialize(bytes);
  }

  @override
  String get queryPath =>
      OsmosisLockupTypes.accountLockedLongerDuration.typeUrl;

  @override
  OsmosisLockupAccountLockedLongerDurationResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisLockupAccountLockedLongerDurationResponse.fromRpc(json);
  }

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get rpcPath => OsmosisLockupTypes.accountLockedLongerDuration
      .rpcUrl(pathParameters: [owner]);
}
