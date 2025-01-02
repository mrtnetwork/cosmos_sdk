import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_vesting_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'base_vesting_account.dart';

/// ContinuousVestingAccount implements the VestingAccount interface.
/// It continuously vests by unlocking coins linearly with respect to time.
class ContinuousVestingAccount extends CosmosMessage {
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

  @override
  Map<String, dynamic> toJson() {
    return {
      'baseVestingAccount': baseVestingAccount?.toJson(),
      'startTime': startTime?.toString(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  TypeUrl get typeUrl => VestingV1beta1Types.continuousVestingAccount;

  @override
  List get values => [baseVestingAccount, startTime];
}
