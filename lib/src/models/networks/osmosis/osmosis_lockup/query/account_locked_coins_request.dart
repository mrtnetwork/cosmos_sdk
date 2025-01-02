import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'account_locked_coins_response.dart';

class OsmosisLockupAccountLockedCoinsRequest extends CosmosMessage
    with QueryMessage<OsmosisLockupAccountLockedCoinsResponse> {
  final String owner;
  const OsmosisLockupAccountLockedCoinsRequest({required this.owner});
  factory OsmosisLockupAccountLockedCoinsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupAccountLockedCoinsRequest(owner: decode.getField(1));
  }
  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"owner": owner};
  }

  @override
  TypeUrl get typeUrl => OsmosisLockupTypes.accountLockedCoinsRequest;

  @override
  List get values => [owner];

  @override
  OsmosisLockupAccountLockedCoinsResponse onResponse(List<int> bytes) {
    return OsmosisLockupAccountLockedCoinsResponse.deserialize(bytes);
  }

  @override
  OsmosisLockupAccountLockedCoinsResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisLockupAccountLockedCoinsResponse.fromRpc(json);
  }

  @override
  Map<String, String?> get queryParameters => {};

  @override
  List<String> get pathParameters => [owner];
}
