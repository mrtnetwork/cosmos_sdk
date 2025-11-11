import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/core/account/account.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/cosmos_auth_v1beta1.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_vesting_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'base_vesting_account.dart';

/// DelayedVestingAccount implements the VestingAccount interface. It vests all coins after a specific time,
/// but non prior. In other words, it keeps them locked until a specified time.
class DelayedVestingAccount extends CosmosBaseAccount {
  /// The base vesting account.
  final BaseVestingAccount? baseVestingAccount;

  /// Constructs a new instance of [DelayedVestingAccount].
  const DelayedVestingAccount({
    this.baseVestingAccount,
  });

  factory DelayedVestingAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DelayedVestingAccount(
        baseVestingAccount: decode
            .getResult(1)
            ?.to<BaseVestingAccount, List<int>>(
                (e) => BaseVestingAccount.deserialize(e)));
  }
  factory DelayedVestingAccount.fromJson(Map<String, dynamic> json) {
    return DelayedVestingAccount(
        baseVestingAccount:
            json.valueTo<BaseVestingAccount, Map<String, dynamic>>(
                key: "base_vesting_account",
                parse: (e) => BaseVestingAccount.fromJson(e)));
  }

  @override
  Map<String, dynamic> toJson() {
    return {'base_vesting_account': baseVestingAccount?.toJson()};
  }

  @override
  List<int> get fieldIds => [1];

  @override
  TypeUrl get typeUrl => VestingV1beta1Types.delayedVestingAccount;

  @override
  List get values => [baseVestingAccount];

  @override
  BaseAccount get baseAccount {
    final baseAccount = baseVestingAccount?.baseAccount;
    if (baseAccount == null) {
      throw DartCosmosSdkPluginException("Missing base account");
    }
    return baseAccount;
  }
}
