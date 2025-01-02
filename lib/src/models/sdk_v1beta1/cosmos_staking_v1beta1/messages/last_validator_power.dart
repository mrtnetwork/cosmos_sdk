import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// LastValidatorPower required for validator set update logic.
class LastValidatorPower extends CosmosMessage {
  /// address is the address of the validator.
  final CosmosBaseAddress? address;

  /// power defines the power of the validator.
  final int? power;

  const LastValidatorPower({
    required this.address,
    required this.power,
  });

  factory LastValidatorPower.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return LastValidatorPower(
      address: decode
          .getResult(1)
          ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
      power: decode.getField(2),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'address': address?.address,
      'power': power,
    };
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  TypeUrl get typeUrl => StakingV1beta1Types.lastValidatorPower;

  @override
  List get values => [address?.address, power];
}
