import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'msg_withdraw_delegator_reward_response.dart';

/// MsgWithdrawDelegatorReward represents delegation withdrawal to a delegator from a single validator.
class DistributionMsgWithdrawDelegatorReward
    extends
        DistributionV1Beta1Service<
          DistributionMsgWithdrawDelegatorRewardResponse
        >
    with AminoMessage<DistributionMsgWithdrawDelegatorRewardResponse> {
  final CosmosBaseAddress? delegatorAddress;
  final CosmosBaseAddress? validatorAddress;
  const DistributionMsgWithdrawDelegatorReward({
    this.delegatorAddress,
    this.validatorAddress,
  });
  factory DistributionMsgWithdrawDelegatorReward.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionMsgWithdrawDelegatorReward(
      delegatorAddress: decode
          .getResult(1)
          ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
      validatorAddress: decode
          .getResult(2)
          ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
    );
  }
  factory DistributionMsgWithdrawDelegatorReward.fromJson(
    Map<String, dynamic> json,
  ) {
    return DistributionMsgWithdrawDelegatorReward(
      delegatorAddress: json.asAddress("delegator_address"),
      validatorAddress: json.asAddress("validator_address"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "delegator_address": delegatorAddress?.address,
      "validator_address": validatorAddress?.address,
    };
  }

  @override
  TypeUrl get typeUrl =>
      DistributionV1beta1Types.distributionMsgWithdrawDelegatorReward;

  @override
  List get values => [delegatorAddress?.address, validatorAddress?.address];

  @override
  List<String?> get signers => [delegatorAddress?.address];

  @override
  DistributionMsgWithdrawDelegatorRewardResponse onResponse(List<int> bytes) {
    return DistributionMsgWithdrawDelegatorRewardResponse.deserialize(bytes);
  }
}
