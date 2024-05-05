import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'account_locked_longer_duration_denom_response.dart';

class OsmosisLockupAccountLockedLongerDurationDenomRequest extends CosmosMessage
    with
        QueryMessage<OsmosisLockupAccountLockedLongerDurationDenomResponse>,
        RPCMessage<OsmosisLockupAccountLockedLongerDurationDenomResponse> {
  final String? owner;
  final ProtobufDuration duration;
  final String? denom;
  const OsmosisLockupAccountLockedLongerDurationDenomRequest(
      {this.owner, required this.duration, this.denom});
  factory OsmosisLockupAccountLockedLongerDurationDenomRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupAccountLockedLongerDurationDenomRequest(
        owner: decode.getField(1),
        duration: ProtobufDuration.deserialize(decode.getField(2)),
        denom: decode.getField(3));
  }
  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {"owner": owner, "duration": duration.toJson(), "denom": denom};
  }

  @override
  String get typeUrl =>
      OsmosisLockupTypes.accountLockedLongerDurationDenomRequest.typeUrl;

  @override
  List get values => [owner, duration, denom];

  @override
  OsmosisLockupAccountLockedLongerDurationDenomResponse onResponse(
      List<int> bytes) {
    return OsmosisLockupAccountLockedLongerDurationDenomResponse.deserialize(
        bytes);
  }

  @override
  String get queryPath =>
      OsmosisLockupTypes.accountLockedLongerDurationDenom.typeUrl;

  @override
  OsmosisLockupAccountLockedLongerDurationDenomResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisLockupAccountLockedLongerDurationDenomResponse.fromRpc(json);
  }

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get rpcPath => OsmosisLockupTypes.accountLockedLongerDurationDenom
      .rpcUrl(pathParameters: [owner]);
}
