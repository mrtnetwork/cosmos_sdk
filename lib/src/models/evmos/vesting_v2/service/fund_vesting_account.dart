import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/models/evmos/vesting_v1/vesting_v1.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/models/evmos/core/service.dart';

// MsgFundVestingAccount defines a message that enables funding an existing clawback
// vesting account.
class EvmosVestingV2MsgFundVestingAccount
    extends EvmosService<EmptyServiceRequestResponse> with AminoMessage {
  /// funderAddress specifies the account that funds the vesting account
  final String? funderAddress;

  /// vestingAddress specifies the account that receives the funds
  final String? vestingAddress;

  /// startTime defines the time at which the vesting period begins
  final ProtobufTimestamp? startTime;

  /// lockupPeriods defines the unlocking schedule relative to the start_time
  final List<EvmosVestingV1Period>? lockupPeriods;

  /// vestingPeriods defines the vesting schedule relative to the start_time
  final List<EvmosVestingV1Period>? vestingPeriods;

  const EvmosVestingV2MsgFundVestingAccount(
      {this.funderAddress,
      this.vestingAddress,
      this.startTime,
      this.lockupPeriods,
      this.vestingPeriods});

  factory EvmosVestingV2MsgFundVestingAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosVestingV2MsgFundVestingAccount(
        funderAddress: decode.getField(1),
        vestingAddress: decode.getField(2),
        startTime: decode
            .getResult(3)
            ?.to<ProtobufTimestamp, List<int>>(ProtobufTimestamp.deserialize),
        lockupPeriods: decode
            .getFields<List<int>>(4)
            .map(EvmosVestingV1Period.deserialize)
            .toList(),
        vestingPeriods: decode
            .getFields<List<int>>(5)
            .map(EvmosVestingV1Period.deserialize)
            .toList());
  }
  factory EvmosVestingV2MsgFundVestingAccount.fromJson(
      Map<String, dynamic> json) {
    return EvmosVestingV2MsgFundVestingAccount(
        funderAddress: json.as("funder_address"),
        vestingAddress: json.as("vesting_address"),
        startTime: json.maybeAs(
            key: "start_time", onValue: ProtobufTimestamp.fromString),
        lockupPeriods: json
            .asListOfMap("lockup_periods")
            ?.map(EvmosVestingV1Period.fromJson)
            .toList(),
        vestingPeriods: json
            .asListOfMap("vesting_periods")
            ?.map(EvmosVestingV1Period.fromJson)
            .toList());
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "funder_address": funderAddress,
      "vesting_address": vestingAddress,
      "start_time": startTime?.toString(),
      "lockup_periods": lockupPeriods?.map((e) => e.toJson()).toList(),
      "vesting_periods": vestingPeriods?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.msgFundVestingAccount;

  @override
  List get values =>
      [funderAddress, vestingAddress, startTime, lockupPeriods, vestingPeriods];
  @override
  List<String?> get signers => [funderAddress];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        EvmosErc20V1Types.msgFundVestingAccountResponse);
  }
}
