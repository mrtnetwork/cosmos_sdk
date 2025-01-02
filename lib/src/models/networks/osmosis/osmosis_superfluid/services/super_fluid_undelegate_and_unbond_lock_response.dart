import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisSuperfluidMsgSuperfluidUndelegateAndUnbondLockResponse
    extends CosmosMessage {
  /// lock id of the new lock created for the remaining amount.
  /// returns the original lockid if the unlocked amount is equal to the
  /// original lock's amount.
  final BigInt? lockId;

  OsmosisSuperfluidMsgSuperfluidUndelegateAndUnbondLockResponse({this.lockId});
  factory OsmosisSuperfluidMsgSuperfluidUndelegateAndUnbondLockResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidMsgSuperfluidUndelegateAndUnbondLockResponse(
        lockId: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"lock_id": lockId?.toString()};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisSuperfluidTypes.msgSuperfluidUndelegateAndUnbondLockResponse;

  @override
  List get values => [lockId];
}
