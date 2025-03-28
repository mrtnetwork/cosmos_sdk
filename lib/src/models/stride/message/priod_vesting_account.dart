import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:cosmos_sdk/src/models/core/account/account.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/sdk_v1beta1.dart';
import 'package:cosmos_sdk/src/models/stride/message/base_vesting_account.dart';
import 'package:cosmos_sdk/src/models/stride/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'period.dart';

class StridePeriodicVestingAccount extends CosmosBaseAccount {
  final StrideBaseVestingAccount baseVestingAccount;
  @override
  BaseAccount get baseAccount => baseVestingAccount.baseAccount;
  final List<StridePeriod> vestingPeriods;

  StridePeriodicVestingAccount({
    required this.baseVestingAccount,
    required List<StridePeriod> vestingPeriods,
  }) : vestingPeriods = vestingPeriods.immutable;
  factory StridePeriodicVestingAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return StridePeriodicVestingAccount(
      baseVestingAccount:
          StrideBaseVestingAccount.deserialize(decode.getField(1)),
      vestingPeriods:
          decode.getFields<List<int>>(3).map(StridePeriod.deserialize).toList(),
    );
  }
  factory StridePeriodicVestingAccount.fromJson(Map<String, dynamic> json) {
    return StridePeriodicVestingAccount(
      baseVestingAccount:
          StrideBaseVestingAccount.fromJson(json["base_vesting_account"]),
      vestingPeriods: json
          .asListOfMap("vesting_periods", throwOnNull: true)!
          .map(StridePeriod.fromJson)
          .toList(),
    );
  }

  @override
  List<int> get fieldIds => [1, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "base_vesting_account": baseVestingAccount.toJson(),
      "vesting_periods": vestingPeriods.map((e) => e.toJson()).toList()
    };
  }

  @override
  TypeUrl get typeUrl => StrideTypes.stridePeriodicVestingAccount;

  @override
  List get values => [baseAccount, vestingPeriods];
}
