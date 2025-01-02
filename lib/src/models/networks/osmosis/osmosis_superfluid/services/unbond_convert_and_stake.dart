import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/cosmos_base_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'super_fluid_undelegate_and_unbond_lock_response.dart';

class OsmosisSuperfluidMsgUnbondConvertAndStake extends CosmosMessage
    with
        ServiceMessage<
            OsmosisSuperfluidMsgSuperfluidUndelegateAndUnbondLockResponse> {
  /// lock ID to convert and stake.
  /// lock id with 0 should be provided if converting liquid gamm shares to stake
  final BigInt? lockId;
  final String? sender;

  /// validator address to delegate to.
  /// If provided empty string, we use the validators returned from
  /// valset-preference module.
  final String? valAddr;

  /// min_amt_to_stake indicates the minimum amount to stake after conversion
  final BigInt minAmtToStake;

  /// shares_to_convert indicates shares wanted to stake.
  /// Note that this field is only used for liquid(unlocked) gamm shares.
  /// For all other cases, this field would be disregarded.
  final Coin sharesToConvert;

  OsmosisSuperfluidMsgUnbondConvertAndStake(
      {this.lockId,
      this.sender,
      this.valAddr,
      required this.minAmtToStake,
      required this.sharesToConvert});
  factory OsmosisSuperfluidMsgUnbondConvertAndStake.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidMsgUnbondConvertAndStake(
        lockId: decode.getField(1),
        sender: decode.getField(2),
        valAddr: decode.getField(3),
        minAmtToStake: BigInt.parse(decode.getField(4)),
        sharesToConvert: Coin.deserialize(decode.getField(5)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "lock_id": lockId?.toString(),
      "sender": sender,
      "val_addr": valAddr,
      "min_amt_to_stake": minAmtToStake.toString(),
      "shares_to_convert": sharesToConvert.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisSuperfluidTypes.msgUnbondConvertAndStake;

  @override
  List get values =>
      [lockId, sender, valAddr, minAmtToStake.toString(), sharesToConvert];

  @override
  TypeUrl get service => OsmosisSuperfluidTypes.unbondConvertAndStake;

  @override
  List<String?> get signers => [sender];
  @override
  OsmosisSuperfluidMsgSuperfluidUndelegateAndUnbondLockResponse onResponse(
      List<int> bytes) {
    return OsmosisSuperfluidMsgSuperfluidUndelegateAndUnbondLockResponse
        .deserialize(bytes);
  }
}
