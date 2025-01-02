import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisLockupMsgExtendLockupResponse extends CosmosMessage {
  final bool? success;
  OsmosisLockupMsgExtendLockupResponse({this.success});
  factory OsmosisLockupMsgExtendLockupResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupMsgExtendLockupResponse(success: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  TypeUrl get typeUrl => OsmosisLockupTypes.msgExtendLockupResponse;

  @override
  List get values => [success];

  @override
  Map<String, dynamic> toJson() {
    return {"success": success};
  }
}
