import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// DVVTriplet is struct that just has a delegator-validator-validator triplet with no other data.
/// It is intended to be used as a marshalable pointer. For example,
/// a DVVTriplet can be used to construct the key to getting a Redelegation from state.
class DVVTriplet extends CosmosMessage {
  // delegatorAddress is the bech32-encoded address of the delegator.
  final CosmosBaseAddress? delegatorAddress;

  // validatorSrcAddress is the bech32-encoded source address of the validator.
  final CosmosBaseAddress? validatorSrcAddress;

  // validatorDstAddress is the bech32-encoded destination address of the validator.
  final CosmosBaseAddress? validatorDstAddress;

  const DVVTriplet({
    this.delegatorAddress,
    this.validatorSrcAddress,
    this.validatorDstAddress,
  });
  factory DVVTriplet.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DVVTriplet(
        delegatorAddress: decode
            .getResult(1)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        validatorDstAddress: decode
            .getResult(3)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        validatorSrcAddress: decode
            .getResult(2)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'delegator_address': delegatorAddress?.address,
      'validator_src_address': validatorSrcAddress?.address,
      'validator_dst_address': validatorDstAddress?.address,
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  String get typeUrl => StakingV1beta1Types.dVVTriplet.typeUrl;

  @override
  List get values => [
        delegatorAddress?.address,
        validatorSrcAddress?.address,
        validatorDstAddress?.address
      ];
}
