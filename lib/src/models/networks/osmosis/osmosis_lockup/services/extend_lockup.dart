import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'begin_unlocking_all_response.dart';

/// MsgExtendLockup extends the existing lockup's duration. The new duration is longer than the original.
class OsmosisLockupMsgExtendLockup
    extends OsmosisLockup<OsmosisLockupMsgBeginUnlockingAllResponse> {
  final String? owner;
  final BigInt? id;

  /// duration to be set. fails if lower than the current duration, or is
  /// unlocking
  final ProtobufDuration duration;
  OsmosisLockupMsgExtendLockup({this.owner, this.id, required this.duration});
  factory OsmosisLockupMsgExtendLockup.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupMsgExtendLockup(
      owner: decode.getField(1),
      id: decode.getField(2),
      duration: ProtobufDuration.deserialize(decode.getField(3)),
    );
  }
  factory OsmosisLockupMsgExtendLockup.fromJson(Map<String, dynamic> json) {
    return OsmosisLockupMsgExtendLockup(
      owner: json.as("owner"),
      id: json.asBigInt("id"),
      duration: ProtobufDuration.fromString(json.as("duration")),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  OsmosisLockupMsgBeginUnlockingAllResponse onResponse(List<int> bytes) {
    return OsmosisLockupMsgBeginUnlockingAllResponse.deserialize(bytes);
  }

  @override
  List<String?> get signers => [owner];

  @override
  Map<String, dynamic> toJson() {
    return {"owner": owner, "id": id, "duration": duration.toJson()};
  }

  @override
  TypeUrl get typeUrl => OsmosisLockupTypes.msgExtendLockup;

  @override
  List get values => [owner, id, duration];
}
