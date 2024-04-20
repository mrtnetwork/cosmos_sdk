import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';
import '../messages/description.dart';

/// MsgEditValidator defines a SDK message for editing an existing validator.
class MsgEditValidator extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  final Description description;
  final CosmosBaseAddress? validatorAddress;

  /// We pass a reference to the new commission rate and min self delegation as
  /// it's not mandatory to update. If not updated, the deserialized rate will be
  /// zero with no way to distinguish if an update was intended.
  /// REF: #2373
  final String? commissionRate;
  final BigInt? minSelfDelegation;

  const MsgEditValidator({
    required this.description,
    this.validatorAddress,
    this.commissionRate,
    this.minSelfDelegation,
  });
  factory MsgEditValidator.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgEditValidator(
      validatorAddress: decode
          .getResult(2)
          ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
      description: Description.deserialize(decode.getField(1)),
      commissionRate: decode.getField(3),
      minSelfDelegation: BigintUtils.tryParse(decode.getField<String?>(4)),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'description': description.toJson(),
      'validator_address': validatorAddress?.address,
      'commission_rate': commissionRate,
      'min_self_delegation': minSelfDelegation?.toString(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  String get typeUrl => StakingV1beta1Types.msgEditValidator.typeUrl;

  @override
  List get values => [
        description,
        validatorAddress?.address,
        commissionRate,
        minSelfDelegation?.toString()
      ];

  @override
  String get service => StakingV1beta1Types.editValidator.typeUrl;
  @override
  List<String?> get signers => [validatorAddress?.address];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        StakingV1beta1Types.msgEditValidatorResponse.typeUrl);
  }
}
