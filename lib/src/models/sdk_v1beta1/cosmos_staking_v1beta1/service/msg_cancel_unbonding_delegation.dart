import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgCancelUnbondingDelegation defines the SDK message for performing a cancel unbonding delegation for delegator
/// Since: cosmos-sdk 0.46
class MsgCancelUnbondingDelegation
    extends StakingV1Beta1Service<EmptyServiceRequestResponse> {
  final CosmosBaseAddress? delegatorAddress;
  final CosmosBaseAddress? validatorAddress;
  final Coin amount;
  final BigInt? creationHeight;

  const MsgCancelUnbondingDelegation({
    this.delegatorAddress,
    this.validatorAddress,
    required this.amount,
    this.creationHeight,
  });
  factory MsgCancelUnbondingDelegation.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgCancelUnbondingDelegation(
        delegatorAddress: decode
            .getResult(1)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        validatorAddress: decode
            .getResult(2)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        amount: Coin.deserialize(decode.getField(3)),
        creationHeight: decode.getField(4));
  }
  factory MsgCancelUnbondingDelegation.fromJson(Map<String, dynamic> json) {
    return MsgCancelUnbondingDelegation(
        delegatorAddress: json.asAddress("delegator_address"),
        validatorAddress: json.asAddress("validator_address"),
        amount: Coin.fromJson(json.asMap("amount")),
        creationHeight: json.asBigInt("creation_height"));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'delegator_address': delegatorAddress,
      'validator_address': validatorAddress,
      'amount': amount.toJson(),
      'creation_height': creationHeight,
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  TypeUrl get typeUrl => StakingV1beta1Types.msgCancelUnbondingDelegation;

  @override
  List get values => [
        delegatorAddress?.address,
        validatorAddress?.address,
        amount,
        creationHeight
      ];

  @override
  List<String?> get signers => [delegatorAddress?.address];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        StakingV1beta1Types.msgCancelUnbondingDelegationResponse);
  }
}
