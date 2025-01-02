import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// RedelegationEntry defines a redelegation object with relevant metadata.
class RedelegationEntry extends CosmosMessage {
  /// creation_height  defines the height which the redelegation took place.
  final int? creationHeight;

  /// completion_time defines the unix time for redelegation completion.
  final ProtobufTimestamp completionTime;

  /// initial_balance defines the initial balance when redelegation started.
  final BigInt initialBalance;

  /// shares_dst is the amount of destination-validator shares created by redelegation.
  final String sharesDst;

  /// Incrementing id that uniquely identifies this entry
  final BigInt? unbondingId;

  /// Strictly positive if this entry's unbonding has been stopped by external modules
  final BigInt? unbondingOnHoldRefCount;
  factory RedelegationEntry.fromRpc(Map<String, dynamic> json) {
    return RedelegationEntry(
        completionTime: ProtobufTimestamp.fromString(json["completion_time"]),
        initialBalance: BigintUtils.parse(json["initial_balance"]),
        sharesDst: json["shares_dst"],
        creationHeight: IntUtils.tryParse(json["creation_height"]),
        unbondingId: BigintUtils.tryParse(json["unbonding_id"]),
        unbondingOnHoldRefCount:
            BigintUtils.tryParse("unbonding_on_hold_ref_count"));
  }
  const RedelegationEntry({
    this.creationHeight,
    required this.completionTime,
    required this.initialBalance,
    required this.sharesDst,
    this.unbondingId,
    this.unbondingOnHoldRefCount,
  });
  factory RedelegationEntry.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return RedelegationEntry(
        creationHeight: decode.getField(1),
        completionTime: ProtobufTimestamp.deserialize(decode.getField(2)),
        initialBalance: BigintUtils.parse(decode.getField<String>(3)),
        sharesDst: decode.getField(4),
        unbondingId: decode.getField(5),
        unbondingOnHoldRefCount: decode.getField(6));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'creation_height': creationHeight,
      'completion_time': completionTime.toJson(),
      'initial_balance': initialBalance.toString(),
      'shares_dst': sharesDst,
      'unbonding_id': unbondingId,
      'unbonding_on_hold_ref_count': unbondingOnHoldRefCount,
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  TypeUrl get typeUrl => StakingV1beta1Types.redelegationEntry;

  @override
  List get values => [
        creationHeight,
        completionTime,
        initialBalance.toString(),
        sharesDst,
        unbondingId,
        unbondingOnHoldRefCount
      ];
}
