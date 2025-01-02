import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'params.dart';
import 'last_validator_power.dart';
import 'validator.dart';
import 'delegation.dart';
import 'unbonding_delegation.dart';
import 'redelegation.dart';

/// GenesisState defines the staking module's genesis state.
class StakingGenesisState extends CosmosMessage {
  /// params defines all the parameters of related to deposit.
  final StakingParams params;

  /// last_total_power tracks the total amounts of bonded tokens recorded during
  /// the previous end block.
  final List<int> lastTotalPower;

  /// last_validator_powers is a special index that provides a historical list
  /// of the last-block's bonded validators.
  final List<LastValidatorPower> lastValidatorPowers;

  /// validators defines the validator set at genesis.
  final List<StakingValidator> validators;

  /// delegations defines the delegations active at genesis.
  final List<Delegation> delegations;

  /// unbonding_delegations defines the unbonding delegations active at genesis.
  final List<UnbondingDelegation> unbondingDelegations;

  /// redelegations defines the redelegations active at genesis.
  final List<Redelegation> redelegations;

  /// exported defines a bool to identify whether the chain dealing with exported or initialized genesis.
  final bool? exported;

  StakingGenesisState({
    required this.params,
    required List<int> lastTotalPower,
    required List<LastValidatorPower> lastValidatorPowers,
    required List<StakingValidator> validators,
    required List<Delegation> delegations,
    required List<UnbondingDelegation> unbondingDelegations,
    required List<Redelegation> redelegations,
    required this.exported,
  })  : lastValidatorPowers = lastValidatorPowers.immutable,
        validators = validators.immutable,
        delegations = delegations.immutable,
        unbondingDelegations = unbondingDelegations.immutable,
        redelegations = redelegations.immutable,
        lastTotalPower = BytesUtils.toBytes(lastTotalPower, unmodifiable: true);
  factory StakingGenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return StakingGenesisState(
        params: StakingParams.deserialize(decode.getField(1)),
        lastTotalPower: decode.getField(2),
        lastValidatorPowers: decode
            .getFields<List<int>>(3)
            .map((e) => LastValidatorPower.deserialize(e))
            .toList(),
        validators: decode
            .getFields<List<int>>(4)
            .map((e) => StakingValidator.deserialize(e))
            .toList(),
        delegations: decode
            .getFields<List<int>>(5)
            .map((e) => Delegation.deserialize(e))
            .toList(),
        unbondingDelegations: decode
            .getFields<List<int>>(6)
            .map((e) => UnbondingDelegation.deserialize(e))
            .toList(),
        redelegations: decode
            .getFields<List<int>>(7)
            .map((e) => Redelegation.deserialize(e))
            .toList(),
        exported: decode.getField(8));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'params': params.toJson(),
      'last_total_power': BytesUtils.toHexString(lastTotalPower),
      'last_validator_powers':
          lastValidatorPowers.map((power) => power.toJson()).toList(),
      'validators': validators.map((validator) => validator.toJson()).toList(),
      'delegations':
          delegations.map((delegation) => delegation.toJson()).toList(),
      'unbonding_delegations': unbondingDelegations
          .map((delegation) => delegation.toJson())
          .toList(),
      'redelegations':
          redelegations.map((redelegation) => redelegation.toJson()).toList(),
      'exported': exported,
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8];

  @override
  TypeUrl get typeUrl => StakingV1beta1Types.stakingGenesisState;

  @override
  List get values => [
        params,
        lastTotalPower,
        lastValidatorPowers,
        validators,
        delegations,
        unbondingDelegations,
        redelegations,
        exported
      ];
}
