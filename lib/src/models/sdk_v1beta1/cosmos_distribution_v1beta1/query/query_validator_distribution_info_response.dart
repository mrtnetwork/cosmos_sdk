import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/dec_coin.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// QueryValidatorDistributionInfoResponse is the response type for the Query/ValidatorDistributionInfo RPC method.
class DistributionQueryValidatorDistributionInfoResponse extends CosmosMessage {
  /// operator_address defines the validator operator address.
  final CosmosBaseAddress? operatorAddress;

  /// self_bond_rewards defines the self delegations rewards
  final List<DecCoin> selfBondRewards;

  /// commission defines the commission the validator received.
  final List<DecCoin> commission;
  factory DistributionQueryValidatorDistributionInfoResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return DistributionQueryValidatorDistributionInfoResponse(
      commission:
          (json["commission"] as List?)
              ?.map((e) => DecCoin.fromJson(e))
              .toList() ??
          [],
      selfBondRewards:
          (json["self_bond_rewards"] as List?)
              ?.map((e) => DecCoin.fromJson(e))
              .toList() ??
          [],
      operatorAddress:
          json["operator_address"] == null
              ? null
              : CosmosBaseAddress(json["operator_address"]),
    );
  }
  DistributionQueryValidatorDistributionInfoResponse({
    this.operatorAddress,
    required List<DecCoin> selfBondRewards,
    required List<DecCoin> commission,
  }) : selfBondRewards = selfBondRewards.immutable,
       commission = commission.immutable;
  factory DistributionQueryValidatorDistributionInfoResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionQueryValidatorDistributionInfoResponse(
      operatorAddress: decode
          .getResult(1)
          ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
      selfBondRewards:
          decode
              .getFields<List<int>>(2)
              .map((e) => DecCoin.deserialize(e))
              .toList(),
      commission:
          decode
              .getFields<List<int>>(3)
              .map((e) => DecCoin.deserialize(e))
              .toList(),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "operator_address": operatorAddress?.address,
      "self_bond_rewards": selfBondRewards.map((e) => e.toJson()).toList(),
      "commission": commission.map((e) => e.toJson()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl =>
      DistributionV1beta1Types
          .distributionQueryValidatorDistributionInfoResponse;

  @override
  List get values => [operatorAddress?.address, selfBondRewards, commission];
}
