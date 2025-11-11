import 'package:blockchain_utils/helper/helper.dart';
import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'package:cosmos_sdk/src/models/core/account/account.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_vesting_v1beta1/types/types.dart';

/// PeriodicVestingAccount implements the VestingAccount interface.
/// It periodically vests by unlocking coins during each specified period.
class PeriodicVestingAccount extends CosmosBaseAccount {
  final BaseVestingAccount? baseVestingAccount;
  final BigInt? startTime;
  final List<Period> vestingPeriods;

  /// Constructs a new instance of [PeriodicVestingAccount].
  PeriodicVestingAccount({
    this.baseVestingAccount,
    this.startTime,
    required List<Period> vestingPeriods,
  }) : vestingPeriods = vestingPeriods.immutable;

  factory PeriodicVestingAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return PeriodicVestingAccount(
        baseVestingAccount: decode
            .getResult(1)
            ?.to<BaseVestingAccount, List<int>>(
                (e) => BaseVestingAccount.deserialize(e)),
        startTime: decode.getField(2),
        vestingPeriods: decode
            .getFields<List<int>>(3)
            .map((e) => Period.deserialize(e))
            .toList());
  }
  factory PeriodicVestingAccount.fromJson(Map<String, dynamic> json) {
    return PeriodicVestingAccount(
        baseVestingAccount:
            json.valueTo<BaseVestingAccount, Map<String, dynamic>>(
                key: "base_vesting_account",
                parse: (e) => BaseVestingAccount.fromJson(e)),
        startTime: json.valueAsBigInt("start_time"),
        vestingPeriods: json
            .valueEnsureAsList("vesting_periods")
            .map((e) => Period.fromJson(e))
            .toList());
  }

  /// Converts this instance of [PeriodicVestingAccount] to a JSON object.
  @override
  Map<String, dynamic> toJson() {
    return {
      'base_vesting_account': baseVestingAccount?.toJson(),
      'start_time': startTime?.toString(),
      'vesting_periods':
          vestingPeriods.map((period) => period.toJson()).toList(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  TypeUrl get typeUrl => VestingV1beta1Types.periodicVestingAccount;

  @override
  List get values => [baseVestingAccount, startTime, vestingPeriods];

  @override
  BaseAccount get baseAccount {
    final baseAccount = baseVestingAccount?.baseAccount;
    if (baseAccount == null) {
      throw DartCosmosSdkPluginException("Missing base account");
    }
    return baseAccount;
  }
}
