import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';
import 'package:blockchain_utils/helper/helper.dart';

import 'unbonding_delegation_entry.dart';

/// UnbondingDelegation stores all of a single delegator's unbonding bonds for a single validator in an time-ordered list.
class UnbondingDelegation extends CosmosMessage {
  /// delegator_address is the encoded address of the delegator.
  final CosmosBaseAddress? delegatorAddress;

  /// validator_address is the encoded address of the validator.
  final CosmosBaseAddress? validatorAddress;

  /// entries are the unbonding delegation entries.
  final List<UnbondingDelegationEntry> entries;
  factory UnbondingDelegation.fromJson(Map<String, dynamic> json) {
    return UnbondingDelegation(
      delegatorAddress:
          json["delegator_address"] == null
              ? null
              : CosmosBaseAddress(json["delegator_address"]),
      entries:
          (json["entries"] as List?)
              ?.map((e) => UnbondingDelegationEntry.fromJson(e))
              .toList() ??
          [],
      validatorAddress:
          json["validator_address"] == null
              ? null
              : CosmosBaseAddress(json["validator_address"]),
    );
  }

  UnbondingDelegation({
    required this.delegatorAddress,
    required this.validatorAddress,
    required List<UnbondingDelegationEntry> entries,
  }) : entries = entries.immutable;
  factory UnbondingDelegation.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return UnbondingDelegation(
      delegatorAddress: decode
          .getResult(1)
          ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
      validatorAddress: decode
          .getResult(1)
          ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
      entries:
          decode
              .getFields<List<int>>(3)
              .map((e) => UnbondingDelegationEntry.deserialize(e))
              .toList(),
    );
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
  TypeUrl get typeUrl => StakingV1beta1Types.unbondingDelegation;

  @override
  List get values => [delegatorAddress?.address, validatorAddress, entries];
}
