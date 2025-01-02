import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/messages/base_account.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_vesting_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// BaseVestingAccount implements the VestingAccount interface.
/// It contains all the necessary fields needed for any vesting account implementation.
class BaseVestingAccount extends CosmosMessage {
  /// The base account.
  final BaseAccount? baseAccount;

  /// Original vesting coins.
  final List<Coin> originalVesting;

  /// Delegated free coins.
  final List<Coin> delegatedFree;

  /// Delegated vesting coins.
  final List<Coin> delegatedVesting;

  /// Vesting end time in unix timestamp (in seconds).
  final BigInt? endTime;

  /// Constructs a new instance of [BaseVestingAccount].
  BaseVestingAccount({
    this.baseAccount,
    required List<Coin> originalVesting,
    required List<Coin> delegatedFree,
    required List<Coin> delegatedVesting,
    this.endTime,
  })  : originalVesting = originalVesting.immutable,
        delegatedFree = delegatedFree.immutable,
        delegatedVesting = delegatedVesting.immutable;
  factory BaseVestingAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return BaseVestingAccount(
        baseAccount: decode
            .getResult(1)
            ?.to<BaseAccount, List<int>>((e) => BaseAccount.deserialize(e)),
        originalVesting:
            decode.getFields(2).map((e) => Coin.deserialize(e)).toList(),
        delegatedFree:
            decode.getFields(3).map((e) => Coin.deserialize(e)).toList(),
        delegatedVesting:
            decode.getFields(4).map((e) => Coin.deserialize(e)).toList(),
        endTime: decode.getField(5));
  }

  /// Converts this instance of [BaseVestingAccount] to a JSON object.
  @override
  Map<String, dynamic> toJson() {
    return {
      'baseAccount': baseAccount?.toJson(),
      'originalVesting': originalVesting.map((e) => e.toJson()).toList(),
      'delegatedFree': delegatedFree.map((e) => e.toJson()).toList(),
      'delegatedVesting': delegatedVesting.map((e) => e.toJson()).toList(),
      'endTime': endTime?.toString(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  TypeUrl get typeUrl => VestingV1beta1Types.baseVestingAccount;

  @override
  List get values =>
      [baseAccount, originalVesting, delegatedFree, delegatedVesting, endTime];
}
