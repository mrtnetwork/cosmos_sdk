import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// DepositValidatorRewardsPool defines the request structure to provide additional rewards to delegators from a specific validator.
///
/// Since: cosmos-sdk 0.50
class DistributionMsgDepositValidatorRewardsPool
    extends DistributionV1Beta1Service<EmptyServiceRequestResponse> {
  final CosmosBaseAddress? depositor;
  final CosmosBaseAddress? validatorAddress;
  final List<Coin> amount;
  DistributionMsgDepositValidatorRewardsPool(
      {this.depositor, this.validatorAddress, required List<Coin> amount})
      : amount = amount.immutable;
  factory DistributionMsgDepositValidatorRewardsPool.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionMsgDepositValidatorRewardsPool(
        depositor: decode
            .getResult(1)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        validatorAddress: decode
            .getResult(2)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        amount: decode
            .getFields<List<int>>(3)
            .map((e) => Coin.deserialize(e))
            .toList());
  }
  factory DistributionMsgDepositValidatorRewardsPool.fromJson(
      Map<String, dynamic> json) {
    return DistributionMsgDepositValidatorRewardsPool(
      depositor: json.asAddress("depositor"),
      validatorAddress: json.asAddress("validator_address"),
      amount:
          json.asListOfMap("amount")?.map((e) => Coin.fromJson(e)).toList() ??
              [],
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "depositor": depositor?.address,
      "validator_address": validatorAddress?.address,
      "amount": amount.map((e) => e.toJson()).toList()
    };
  }

  @override
  TypeUrl get typeUrl =>
      DistributionV1beta1Types.distributionMsgDepositValidatorRewardsPool;

  @override
  List get values => [depositor?.address, validatorAddress?.address, amount];
  @override
  List<String?> get signers => [depositor?.address];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(DistributionV1beta1Types
        .distributionMsgDepositValidatorRewardsPoolResponse);
  }
}
