import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'begin_unlocking_all_response.dart';

class OsmosisLockupMsgBeginUnlockingAll
    extends OsmosisLockup<OsmosisLockupMsgBeginUnlockingAllResponse> {
  final String? owner;
  OsmosisLockupMsgBeginUnlockingAll({this.owner});
  factory OsmosisLockupMsgBeginUnlockingAll.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupMsgBeginUnlockingAll(owner: decode.getField(1));
  }
  factory OsmosisLockupMsgBeginUnlockingAll.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisLockupMsgBeginUnlockingAll(owner: json.as("owner"));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  OsmosisLockupMsgBeginUnlockingAllResponse onResponse(List<int> bytes) {
    return OsmosisLockupMsgBeginUnlockingAllResponse.deserialize(bytes);
  }

  @override
  List<String?> get signers => [owner];

  @override
  Map<String, dynamic> toJson() {
    return {"owner": owner};
  }

  @override
  TypeUrl get typeUrl => OsmosisLockupTypes.msgBeginUnlockingAll;

  @override
  List get values => [owner];
}
