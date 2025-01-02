import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisLockupMsgLockTokensResponse extends CosmosMessage {
  final BigInt? id;
  OsmosisLockupMsgLockTokensResponse({this.id});
  factory OsmosisLockupMsgLockTokensResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupMsgLockTokensResponse(id: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"id": id};
  }

  @override
  TypeUrl get typeUrl => OsmosisLockupTypes.msgLockTokensResponse;

  @override
  List get values => [id];
}
