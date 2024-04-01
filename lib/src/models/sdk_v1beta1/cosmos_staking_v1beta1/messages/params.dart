import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// Params defines the parameters for the x/staking module.
class StakingParams extends CosmosMessage {
  /// unbonding_time is the time duration of unbonding.
  final ProtobufDuration unbondingTime;

  /// max_validators is the maximum number of validators.
  final int? maxValidators;

  /// max_entries is the max entries for either unbonding delegation or redelegation (per pair/trio).
  final int? maxEntries;

  /// historical_entries is the number of historical entries to persist.
  final int? historicalEntries;

  /// bond_denom defines the bondable coin denomination.
  final String? bondDenom;

  /// min_commission_rate is the chain-wide minimum commission rate that a validator can charge their delegators
  final String minCommissionRate;

  /// key_rotation_fee is fee to be spent when rotating validator's key
  /// (either consensus pubkey or operator key)
  final Coin keyRotationFee;

  const StakingParams({
    required this.unbondingTime,
    this.maxValidators,
    this.maxEntries,
    this.historicalEntries,
    this.bondDenom,
    required this.minCommissionRate,
    required this.keyRotationFee,
  });
  factory StakingParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return StakingParams(
        unbondingTime: ProtobufDuration.deserialize(decode.getField(1)),
        maxValidators: decode.getField(2),
        maxEntries: decode.getField(3),
        historicalEntries: decode.getField(4),
        bondDenom: decode.getField(5),
        minCommissionRate: decode.getField(6),
        keyRotationFee: Coin.deserialize(decode.getField(7)));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'unbonding_time': unbondingTime.toJson(),
      'max_validators': maxValidators,
      'max_entries': maxEntries,
      'historical_entries': historicalEntries,
      'bond_denom': bondDenom,
      'min_commission_rate': minCommissionRate,
      'key_rotation_fee': keyRotationFee.toJson(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7];

  @override
  String get typeUrl => StakingV1beta1Types.stakingParams.typeUrl;

  @override
  List get values => [
        unbondingTime,
        maxValidators,
        maxEntries,
        historicalEntries,
        bondDenom,
        minCommissionRate,
        keyRotationFee
      ];
}
