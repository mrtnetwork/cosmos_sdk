import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

import 'unbonding_delegation_entry.dart';

/// UnbondingDelegation stores all of a single delegator's unbonding bonds for a single validator in an time-ordered list.
class UnbondingDelegation extends CosmosMessage {
  /// delegator_address is the encoded address of the delegator.
  final BaseAddress? delegatorAddress;

  /// validator_address is the encoded address of the validator.
  final BaseAddress? validatorAddress;

  /// entries are the unbonding delegation entries.
  final List<UnbondingDelegationEntry> entries;

  UnbondingDelegation({
    required this.delegatorAddress,
    required this.validatorAddress,
    required List<UnbondingDelegationEntry> entries,
  }) : entries = entries.mutable;
  factory UnbondingDelegation.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return UnbondingDelegation(
        delegatorAddress:
            decode.getResult(1)?.to<BaseAddress, String>((e) => BaseAddress(e)),
        validatorAddress:
            decode.getResult(1)?.to<BaseAddress, String>((e) => BaseAddress(e)),
        entries: decode
            .getFields<List<int>>(3)
            .map((e) => UnbondingDelegationEntry.deserialize(e))
            .toList());
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'delegator_address': delegatorAddress?.address,
      'validator_address': validatorAddress,
      'entries': entries.map((entry) => entry.toJson()).toList(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  String get typeUrl => StakingV1beta1Types.unbondingDelegation.typeUrl;

  @override
  List get values => [delegatorAddress?.address, validatorAddress, entries];
}
