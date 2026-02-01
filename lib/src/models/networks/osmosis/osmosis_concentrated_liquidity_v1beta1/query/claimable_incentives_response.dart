import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisConcentratedLiquidityClaimableIncentivesResponse
    extends CosmosMessage {
  final List<Coin> claimableIncentives;
  final List<Coin> forfeitedIncentives;

  OsmosisConcentratedLiquidityClaimableIncentivesResponse({
    required List<Coin> claimableIncentives,
    required List<Coin> forfeitedIncentives,
  }) : claimableIncentives = claimableIncentives.immutable,
       forfeitedIncentives = forfeitedIncentives.immutable;
  factory OsmosisConcentratedLiquidityClaimableIncentivesResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityClaimableIncentivesResponse(
      claimableIncentives:
          decode
              .getFields<List<int>>(1)
              .map((e) => Coin.deserialize(e))
              .toList(),
      forfeitedIncentives:
          decode
              .getFields<List<int>>(2)
              .map((e) => Coin.deserialize(e))
              .toList(),
    );
  }
  factory OsmosisConcentratedLiquidityClaimableIncentivesResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisConcentratedLiquidityClaimableIncentivesResponse(
      claimableIncentives:
          (json["claimable_incentives"] as List?)
              ?.map((e) => Coin.fromJson(e))
              .toList() ??
          <Coin>[],
      forfeitedIncentives:
          (json["forfeited_incentives"] as List?)
              ?.map((e) => Coin.fromJson(e))
              .toList() ??
          <Coin>[],
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "claimable_incentives":
          claimableIncentives.map((e) => e.toJson()).toList(),
      "forfeited_incentives":
          forfeitedIncentives.map((e) => e.toJson()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.claimableIncentivesResponse;

  @override
  List get values => [claimableIncentives, forfeitedIncentives];
}
