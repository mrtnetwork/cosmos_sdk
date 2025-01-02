import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'account_unlockable_coins_response.dart';

class OsmosisLockupAccountUnlockableCoinsRequest extends CosmosMessage
    with QueryMessage<OsmosisLockupAccountUnlockableCoinsResponse> {
  final String owner;
  const OsmosisLockupAccountUnlockableCoinsRequest({required this.owner});
  factory OsmosisLockupAccountUnlockableCoinsRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupAccountUnlockableCoinsRequest(
        owner: decode.getField(1));
  }
  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"owner": owner};
  }

  @override
  TypeUrl get typeUrl => OsmosisLockupTypes.accountUnlockableCoinsRequest;

  @override
  List get values => [owner];

  @override
  OsmosisLockupAccountUnlockableCoinsResponse onResponse(List<int> bytes) {
    return OsmosisLockupAccountUnlockableCoinsResponse.deserialize(bytes);
  }

  @override
  OsmosisLockupAccountUnlockableCoinsResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisLockupAccountUnlockableCoinsResponse.fromRpc(json);
  }

  @override
  Map<String, String?> get queryParameters => {};

  @override
  List<String> get pathParameters => [owner];
}
