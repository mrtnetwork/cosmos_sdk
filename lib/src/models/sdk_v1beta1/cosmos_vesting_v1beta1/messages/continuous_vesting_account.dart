import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/core/account/account.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/cosmos_auth_v1beta1.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_vesting_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'base_vesting_account.dart';

/// ContinuousVestingAccount implements the VestingAccount interface.
/// It continuously vests by unlocking coins linearly with respect to time.
class ContinuousVestingAccount extends CosmosBaseAccount {
  /// The base vesting account.
  final BaseVestingAccount? baseVestingAccount;

  /// Vesting start time in unix timestamp (in seconds).
  final BigInt? startTime;

  /// Constructs a new instance of [ContinuousVestingAccount].
  const ContinuousVestingAccount({
    this.baseVestingAccount,
    this.startTime,
  });

  factory ContinuousVestingAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ContinuousVestingAccount(
        baseVestingAccount: decode
            .getResult(1)
            ?.to<BaseVestingAccount, List<int>>(
                (e) => BaseVestingAccount.deserialize(e)),
        startTime: decode.getField(2));
  }
  factory ContinuousVestingAccount.fromJson(Map<String, dynamic> json) {
    return ContinuousVestingAccount(
        baseVestingAccount:
            json.valueTo<BaseVestingAccount, Map<String, dynamic>>(
                key: "base_vesting_account",
                parse: (e) => BaseVestingAccount.fromJson(e)),
        startTime: json.valueAsBigInt("start_time"));
  }
  @override
  Map<String, dynamic> toJson() {
    return {
      'base_vesting_account': baseVestingAccount?.toJson(),
      'start_time': startTime?.toString(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  TypeUrl get typeUrl => VestingV1beta1Types.continuousVestingAccount;

  @override
  List get values => [baseVestingAccount, startTime];

  @override
  BaseAccount get baseAccount {
    final baseAccount = baseVestingAccount?.baseAccount;
    if (baseAccount == null) {
      throw DartCosmosSdkPluginException("Missing base account");
    }
    return baseAccount;
  }
}
