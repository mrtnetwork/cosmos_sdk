import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// UnbondingDelegationEntry defines an unbonding object with relevant metadata.
class UnbondingDelegationEntry extends CosmosMessage {
  /// creation_height is the height which the unbonding took place.
  final BigInt? creationHeight;

  /// completion_time is the unix time for unbonding completion.
  final ProtobufTimestamp completionTime;

  /// initial_balance defines the tokens initially scheduled to receive at completion.
  final BigInt initialBalance;

  /// balance defines the tokens to receive at completion.
  final BigInt balance;

  /// Incrementing id that uniquely identifies this entry
  final BigInt? unbondingId;

  /// Strictly positive if this entry's unbonding has been stopped by external modules
  final BigInt? unbondingOnHoldRefCount;
  factory UnbondingDelegationEntry.fromJson(Map<String, dynamic> json) {
    return UnbondingDelegationEntry(
        balance: BigintUtils.parse(json["balance"]),
        completionTime: ProtobufTimestamp.fromString(json["completion_time"]),
        creationHeight: BigintUtils.tryParse(json["creation_height"]),
        initialBalance: BigintUtils.parse(json["initial_balance"]),
        unbondingId: BigintUtils.tryParse(json["unbonding_id"]),
        unbondingOnHoldRefCount:
            BigintUtils.tryParse(json["unbonding_on_hold_ref_count"]));
  }
  const UnbondingDelegationEntry({
    required this.creationHeight,
    required this.completionTime,
    required this.initialBalance,
    required this.balance,
    required this.unbondingId,
    required this.unbondingOnHoldRefCount,
  });
  factory UnbondingDelegationEntry.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return UnbondingDelegationEntry(
        creationHeight: decode.getField(1),
        completionTime: ProtobufTimestamp.deserialize(decode.getField(2)),
        initialBalance: BigintUtils.parse(decode.getField<String>(3)),
        balance: BigintUtils.parse(decode.getField<String>(4)),
        unbondingId: decode.getField(5),
        unbondingOnHoldRefCount: decode.getField(6));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'creation_height': creationHeight,
      'completion_time': completionTime.toJson(),
      'initial_balance': initialBalance.toString(),
      'balance': balance.toString(),
      'unbonding_id': unbondingId,
      'unbonding_on_hold_ref_count': unbondingOnHoldRefCount,
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  TypeUrl get typeUrl => StakingV1beta1Types.unbondingDelegationEntry;

  @override
  List get values => [
        creationHeight,
        completionTime,
        initialBalance.toString(),
        balance.toString(),
        unbondingId,
        unbondingOnHoldRefCount
      ];
}
