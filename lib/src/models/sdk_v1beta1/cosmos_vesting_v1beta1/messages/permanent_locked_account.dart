import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_vesting_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'base_vesting_account.dart';

/// PermanentLockedAccount implements the VestingAccount interface. It does not ever release coins, locking them indefinitely.
/// Coins in this account can still be used for delegating and for governance votes even while locked.
///
// Since: cosmos-sdk 0.43
class PermanentLockedAccount extends CosmosMessage {
  /// The base vesting account.
  final BaseVestingAccount? baseVestingAccount;

  /// Constructs a new instance of [PermanentLockedAccount].
  const PermanentLockedAccount({
    this.baseVestingAccount,
  });
  factory PermanentLockedAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return PermanentLockedAccount(
        baseVestingAccount: decode
            .getResult(1)
            ?.to<BaseVestingAccount, List<int>>(
                (e) => BaseVestingAccount.deserialize(e)));
  }

  /// Converts this instance of [PermanentLockedAccount] to a JSON object.
  @override
  Map<String, dynamic> toJson() {
    return {
      'base_vesting_account': baseVestingAccount?.toJson(),
    };
  }

  @override
  List<int> get fieldIds => [1];

  @override
  String get typeUrl => VestingV1beta1Types.permanentLockedAccount.typeUrl;

  @override
  List get values => [baseVestingAccount];
}
