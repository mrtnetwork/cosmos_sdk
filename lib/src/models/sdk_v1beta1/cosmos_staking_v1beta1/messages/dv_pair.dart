import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// DVPair is struct that just has a delegator-validator pair with no other data.
/// It is intended to be used as a marshalable pointer. For example, a DVPair can be
/// used to construct the key to getting an UnbondingDelegation from state.
class DVPair extends CosmosMessage {
  // delegatorAddress is the bech32-encoded address of the delegator.
  final BaseAddress? delegatorAddress;

  // validatorAddress is the bech32-encoded address of the validator.
  final BaseAddress? validatorAddress;

  const DVPair({
    this.delegatorAddress,
    this.validatorAddress,
  });
  factory DVPair.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DVPair(
      delegatorAddress:
          decode.getResult(1)?.to<BaseAddress, String>((e) => BaseAddress(e)),
      validatorAddress:
          decode.getResult(2)?.to<BaseAddress, String>((e) => BaseAddress(e)),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'delegator_address': delegatorAddress?.address,
      'validator_address': validatorAddress?.address,
    };
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  String get typeUrl => StakingV1beta1Types.dVPair.typeUrl;

  @override
  List get values => [delegatorAddress?.address, validatorAddress?.address];
}
