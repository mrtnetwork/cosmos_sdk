import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/global_messages/unknown_message.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';
import 'description.dart';
import 'commission.dart';
import 'bond_status.dart';

/// Validator defines a validator, together with the total amount of the Validator's
/// bond shares and their exchange rate to coins. Slashing results in a decrease in
/// the exchange rate, allowing correct calculation of future undelegations without
/// iterating over delegators. When coins are delegated to this validator,
/// the validator is credited with a delegation whose number of bond shares
/// is based on the amount of coins delegated divided by the current exchange rate.
///  Voting power can be calculated as total bonded shares multiplied by exchange rate.
class StakingValidator extends CosmosMessage {
  /// operator_address defines the address of the validator's operator; bech encoded in JSON.
  final CosmosBaseAddress? operatorAddress;

  /// consensus_pubkey is the consensus public key of the validator, as a Protobuf Any.
  final AnyMessage? consensusPubkey;

  /// jailed defined whether the validator has been jailed from bonded status or not.
  final bool? jailed;

  /// status is the validator status (bonded/unbonding/unbonded).
  final BondStatus? status;

  /// tokens define the delegated tokens (incl. self-delegation).
  final BigInt tokens;

  /// delegator_shares defines total shares issued to a validator's delegators.
  final String delegatorShares;

  /// description defines the description terms for the validator.
  final Description description;

  /// unbonding_height defines, if unbonding, the height at which this validator has begun unbonding.
  final BigInt? unbondingHeight;

  /// unbonding_time defines, if unbonding, the min time for the validator to complete unbonding.
  final ProtobufTimestamp unbondingTime;

  /// commission defines the commission parameters.
  final Commission commission;

  /// min_self_delegation is the validator's self declared minimum self delegation.
  ///
  /// Since: cosmos-sdk 0.46
  final BigInt minSelfDelegation;

  /// strictly positive if this validator's unbonding has been stopped by external modules
  final BigInt? unbondingOnHoldRefCount;

  /// list of unbonding ids, each uniquely identifying an unbonding of this validator
  final List<BigInt>? unbondingIds;
  factory StakingValidator.fromRpc(Map<String, dynamic> json) {
    return StakingValidator(
        commission: Commission.fromRpc(json["commission"]),
        delegatorShares: json["delegator_shares"],
        description: Description.fromRpc(json["description"]),
        minSelfDelegation: BigintUtils.parse(json["min_self_delegation"]),
        tokens: BigintUtils.parse(json["tokens"]),
        unbondingTime: ProtobufTimestamp.fromString(json[""]),
        consensusPubkey: json["consensus_pubkey"] == null
            ? null
            : AnyMessage.fromRpc(json["consensus_pubkey"]),
        jailed: json["jailed"],
        operatorAddress: json["operator_address"] == null
            ? null
            : CosmosBaseAddress("operator_address"),
        status:
            json["status"] == null ? null : BondStatus.fromName(json["status"]),
        unbondingHeight: BigintUtils.tryParse(json["unbonding_height"]),
        unbondingIds: (json["unbonding_ids"] as List?)
            ?.map((e) => BigintUtils.parse(e))
            .toList(),
        unbondingOnHoldRefCount:
            BigintUtils.tryParse(json["unbonding_on_hold_ref_count"]));
  }

  StakingValidator({
    this.operatorAddress,
    this.consensusPubkey,
    this.jailed,
    this.status,
    required this.tokens,
    required this.delegatorShares,
    required this.description,
    this.unbondingHeight,
    required this.unbondingTime,
    required this.commission,
    required this.minSelfDelegation,
    this.unbondingOnHoldRefCount,
    List<BigInt>? unbondingIds,
  }) : unbondingIds = unbondingIds?.immutable;

  factory StakingValidator.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return StakingValidator(
        operatorAddress: decode
            .getResult(1)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        consensusPubkey: decode
            .getResult(2)
            ?.to<AnyMessage, List<int>>((e) => AnyMessage.deserialize(e)),
        jailed: decode.getField(3),
        status: decode
            .getResult(4)
            ?.to<BondStatus, int>((e) => BondStatus.fromValue(e)),
        tokens: BigintUtils.parse(decode.getField<String>(5)),
        delegatorShares: decode.getField(6),
        description: Description.deserialize(decode.getField(7)),
        unbondingHeight: decode.getField(8),
        unbondingTime: ProtobufTimestamp.deserialize(decode.getField(9)),
        commission: Commission.deserialize(decode.getField(10)),
        minSelfDelegation: BigintUtils.parse(decode.getField<String>(11)),
        unbondingOnHoldRefCount: decode.getField(12),
        unbondingIds: decode
                .getResult<ProtocolBufferDecoderResult?>(13)
                ?.to<List<BigInt>, List<int>>(
                    (e) => e.map((e) => BigintUtils.parse(e)).toList()) ??
            <BigInt>[]);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'operator_address': operatorAddress?.address,
      'consensus_pubkey': consensusPubkey?.toJson(),
      'jailed': jailed,
      'status': status.toString().split('.').last,
      'tokens': tokens,
      'delegator_shares': delegatorShares,
      'description': description.toJson(),
      'unbonding_height': unbondingHeight?.toString(),
      'unbonding_time': unbondingTime.toJson(),
      'commission': commission.toJson(),
      'min_self_delegation': minSelfDelegation.toString(),
      'unbonding_on_hold_ref_count': unbondingOnHoldRefCount?.toString(),
      'unbonding_ids': unbondingIds?.map((e) => e.toString()).toList(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];

  @override
  TypeUrl get typeUrl => StakingV1beta1Types.validator;

  @override
  List get values => [
        operatorAddress?.address,
        consensusPubkey,
        jailed,
        status?.value,
        tokens.toString(),
        delegatorShares,
        description,
        unbondingHeight?.toString(),
        unbondingTime,
        commission,
        minSelfDelegation.toString(),
        unbondingOnHoldRefCount,
        unbondingIds
      ];
}
