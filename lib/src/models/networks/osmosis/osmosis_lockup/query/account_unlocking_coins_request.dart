import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'account_unlocking_coins_response.dart';

class OsmosisLockupAccountUnlockingCoinsRequest extends CosmosMessage
    with QueryMessage<OsmosisLockupAccountUnlockingCoinsResponse> {
  final String owner;
  const OsmosisLockupAccountUnlockingCoinsRequest({required this.owner});
  factory OsmosisLockupAccountUnlockingCoinsRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupAccountUnlockingCoinsRequest(owner: decode.getField(1));
  }
  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"owner": owner};
  }

  @override
  TypeUrl get typeUrl => OsmosisLockupTypes.accountUnlockingCoinsRequest;

  @override
  List get values => [owner];

  @override
  OsmosisLockupAccountUnlockingCoinsResponse onResponse(List<int> bytes) {
    return OsmosisLockupAccountUnlockingCoinsResponse.deserialize(bytes);
  }

  @override
  OsmosisLockupAccountUnlockingCoinsResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisLockupAccountUnlockingCoinsResponse.fromJson(json);
  }

  @override
  Map<String, String?> get queryParameters => {};

  @override
  List<String> get pathParameters => [owner];
}
