import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisSuperfluidMsgSuperfluidUndelegateAndUnbondLockResponse
    extends CosmosMessage {
  final BigInt totalAmtStaked;

  OsmosisSuperfluidMsgSuperfluidUndelegateAndUnbondLockResponse(
      this.totalAmtStaked);
  factory OsmosisSuperfluidMsgSuperfluidUndelegateAndUnbondLockResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidMsgSuperfluidUndelegateAndUnbondLockResponse(
        BigInt.parse(decode.getField(1)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"total_amt_staked": totalAmtStaked.toString()};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisSuperfluidTypes.msgUnbondConvertAndStakeResponse;

  @override
  List get values => [totalAmtStaked.toString()];
}
