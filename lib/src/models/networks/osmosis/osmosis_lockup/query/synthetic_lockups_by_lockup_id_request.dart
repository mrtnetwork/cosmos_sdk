import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'locked_response.dart';

class OsmosisLockupSyntheticLockupsByLockupIDRequest extends CosmosMessage
    with QueryMessage<OsmosisLockupLockedResponse> {
  final BigInt lockId;
  const OsmosisLockupSyntheticLockupsByLockupIDRequest({required this.lockId});
  factory OsmosisLockupSyntheticLockupsByLockupIDRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupSyntheticLockupsByLockupIDRequest(
        lockId: decode.getField(1));
  }
  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"lock_id": lockId.toString()};
  }

  @override
  TypeUrl get typeUrl => OsmosisLockupTypes.syntheticLockupsByLockupIDRequest;

  @override
  List get values => [lockId];

  @override
  OsmosisLockupLockedResponse onResponse(List<int> bytes) {
    return OsmosisLockupLockedResponse.deserialize(bytes);
  }

  @override
  OsmosisLockupLockedResponse onJsonResponse(Map<String, dynamic> json) {
    return OsmosisLockupLockedResponse.fromRpc(json);
  }

  @override
  Map<String, String?> get queryParameters => {};

  @override
  List<String> get pathParameters => [lockId.toString()];
}
