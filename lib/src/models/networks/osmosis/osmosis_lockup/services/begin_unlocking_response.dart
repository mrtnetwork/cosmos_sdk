import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisLockupMsgBeginUnlockingResponse extends CosmosMessage {
  final bool? success;
  OsmosisLockupMsgBeginUnlockingResponse({this.success});
  factory OsmosisLockupMsgBeginUnlockingResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupMsgBeginUnlockingResponse(success: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  String get typeUrl => OsmosisLockupTypes.msgBeginUnlockingResponse.typeUrl;

  @override
  List get values => [success];

  @override
  Map<String, dynamic> toJson() {
    return {"success": success};
  }
}
