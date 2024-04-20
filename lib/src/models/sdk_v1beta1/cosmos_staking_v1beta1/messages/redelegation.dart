import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';
import 'redelegation_entry.dart';

/// Redelegation contains the list of a particular delegator's redelegating bonds from a
/// particular source validator to a particular destination validator.
class Redelegation extends CosmosMessage {
  /// delegator_address is the bech32-encoded address of the delegator.
  final CosmosBaseAddress? delegatorAddress;

  /// validator_src_address is the validator redelegation source operator address.
  final CosmosBaseAddress? validatorSrcAddress;

  /// validator_dst_address is the validator redelegation destination operator address.
  final CosmosBaseAddress? validatorDstAddress;

  /// entries are the redelegation entries.
  final List<RedelegationEntry> entries;

  Redelegation({
    this.delegatorAddress,
    this.validatorSrcAddress,
    this.validatorDstAddress,
    required List<RedelegationEntry> entries,
  }) : entries = List<RedelegationEntry>.unmodifiable(entries);

  factory Redelegation.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Redelegation(
        delegatorAddress: decode
            .getResult(1)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        validatorDstAddress: decode
            .getResult(3)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        validatorSrcAddress: decode
            .getResult(2)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        entries: decode
            .getFields<List<int>>(4)
            .map((e) => RedelegationEntry.deserialize(e))
            .toList());
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'delegator_address': delegatorAddress,
      'validator_src_address': validatorSrcAddress,
      'validator_dst_address': validatorDstAddress,
      'entries': entries.map((entry) => entry.toJson()).toList(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  String get typeUrl => StakingV1beta1Types.redelegation.typeUrl;

  @override
  List get values => [
        delegatorAddress?.address,
        validatorSrcAddress?.address,
        validatorDstAddress?.address,
        entries
      ];
}
