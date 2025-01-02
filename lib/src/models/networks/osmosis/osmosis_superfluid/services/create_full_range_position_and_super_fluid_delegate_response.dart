import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisSuperfluidMsgCreateFullRangePositionAndSuperfluidDelegateResponse
    extends CosmosMessage {
  final BigInt? lockId;
  final BigInt? positionId;

  OsmosisSuperfluidMsgCreateFullRangePositionAndSuperfluidDelegateResponse(
      {this.lockId, this.positionId});
  factory OsmosisSuperfluidMsgCreateFullRangePositionAndSuperfluidDelegateResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidMsgCreateFullRangePositionAndSuperfluidDelegateResponse(
        lockId: decode.getField(1), positionId: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"lockID": lockId?.toString(), "positionID": positionId?.toString()};
  }

  @override
  TypeUrl get typeUrl => OsmosisSuperfluidTypes
      .msgCreateFullRangePositionAndSuperfluidDelegateResponse;

  @override
  List get values => [lockId, positionId];
}
