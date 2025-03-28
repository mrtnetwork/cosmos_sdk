import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'locked_denom_response.dart';

class OsmosisLockupLockedDenomRequest extends CosmosMessage
    with QueryMessage<OsmosisLockupLockedDenomResponse> {
  final String? denom;
  final ProtobufDuration duration;
  const OsmosisLockupLockedDenomRequest({this.denom, required this.duration});
  factory OsmosisLockupLockedDenomRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupLockedDenomRequest(
        denom: decode.getField(1),
        duration: ProtobufDuration.deserialize(decode.getField(2)));
  }
  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"denom": denom, "duration": duration.toJson()};
  }

  @override
  TypeUrl get typeUrl => OsmosisLockupTypes.lockedDenomRequest;

  @override
  List get values => [denom, duration];

  @override
  OsmosisLockupLockedDenomResponse onResponse(List<int> bytes) {
    return OsmosisLockupLockedDenomResponse.deserialize(bytes);
  }

  @override
  OsmosisLockupLockedDenomResponse onJsonResponse(Map<String, dynamic> json) {
    return OsmosisLockupLockedDenomResponse.fromJson(json);
  }

  @override
  Map<String, String?> get queryParameters => {"denom": denom};
}
