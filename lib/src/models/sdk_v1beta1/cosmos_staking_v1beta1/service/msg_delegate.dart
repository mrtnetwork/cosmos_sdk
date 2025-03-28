import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgDelegate defines a SDK message for performing a delegation of coins from a delegator to a validator.
class MsgDelegate extends StakingV1Beta1Service<EmptyServiceRequestResponse>
    with AminoMessage<EmptyServiceRequestResponse> {
  final CosmosBaseAddress? delegatorAddress;
  final CosmosBaseAddress? validatorAddress;
  final Coin amount;

  const MsgDelegate(
      {this.delegatorAddress, this.validatorAddress, required this.amount});
  factory MsgDelegate.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgDelegate(
        delegatorAddress: decode
            .getResult(1)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        validatorAddress: decode
            .getResult(2)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        amount: Coin.deserialize(decode.getField(3)));
  }
  factory MsgDelegate.fromJson(Map<String, dynamic> json) {
    return MsgDelegate(
        delegatorAddress: json.asAddress("delegator_address"),
        validatorAddress: json.asAddress("validator_address"),
        amount: Coin.fromJson(json.asMap("amount")));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'delegator_address': delegatorAddress?.address,
      'validator_address': validatorAddress?.address,
      'amount': amount.toJson(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  TypeUrl get typeUrl => StakingV1beta1Types.msgDelegate;

  @override
  List get values =>
      [delegatorAddress?.address, validatorAddress?.address, amount];

  @override
  List<String?> get signers => [delegatorAddress?.address];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(StakingV1beta1Types.msgDelegateResponse);
  }
}
