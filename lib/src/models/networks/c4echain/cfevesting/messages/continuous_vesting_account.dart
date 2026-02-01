import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/core/account/account.dart';
import 'package:cosmos_sdk/src/models/networks/c4echain/cfevesting/cfevesting.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/cosmos_auth_v1beta1.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_vesting_v1beta1/cosmos_vesting_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class C4eChiainContinuousVestingAccount extends CosmosBaseAccount {
  final BaseVestingAccount? baseVestingAccount;
  final BigInt? startTime;
  final List<C4eChiainContinuousVestingPeriod>? vestingPeriods;
  const C4eChiainContinuousVestingAccount({
    this.baseVestingAccount,
    this.startTime,
    this.vestingPeriods,
  });

  factory C4eChiainContinuousVestingAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return C4eChiainContinuousVestingAccount(
      baseVestingAccount: decode
          .getResult(1)
          ?.to<BaseVestingAccount, List<int>>(
            (e) => BaseVestingAccount.deserialize(e),
          ),
      startTime: decode.getField(2),
      vestingPeriods:
          decode
              .getFields<List<int>>(3)
              .map((e) => C4eChiainContinuousVestingPeriod.deserialize(e))
              .toList(),
    );
  }
  factory C4eChiainContinuousVestingAccount.fromJson(
    Map<String, dynamic> json,
  ) {
    return C4eChiainContinuousVestingAccount(
      baseVestingAccount: json
          .valueTo<BaseVestingAccount, Map<String, dynamic>>(
            key: "base_vesting_account",
            parse: (e) => BaseVestingAccount.fromJson(e),
          ),
      startTime: json.valueAsBigInt("start_time"),
      vestingPeriods:
          json
              .valueAsList<List<Map<String, dynamic>>?>("key")
              ?.map((e) => C4eChiainContinuousVestingPeriod.fromJson(e))
              .toList(),
    );
  }
  @override
  Map<String, dynamic> toJson() {
    return {
      'base_vesting_account': baseVestingAccount?.toJson(),
      'start_time': startTime?.toString(),
      'vesting_periods': vestingPeriods?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  TypeUrl get typeUrl => CFEvestingTypes.continuousVestingPeriod;

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
