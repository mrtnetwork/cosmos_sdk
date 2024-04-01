import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_vesting_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'base_vesting_account.dart';

/// DelayedVestingAccount implements the VestingAccount interface. It vests all coins after a specific time,
/// but non prior. In other words, it keeps them locked until a specified time.
class DelayedVestingAccount extends CosmosMessage {
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

  @override
  Map<String, dynamic> toJson() {
    return {'baseVestingAccount': baseVestingAccount?.toJson()};
  }

  @override
  List<int> get fieldIds => [1];

  @override
  String get typeUrl => VestingV1beta1Types.delayedVestingAccount.typeUrl;

  @override
  List get values => [baseVestingAccount];
}
