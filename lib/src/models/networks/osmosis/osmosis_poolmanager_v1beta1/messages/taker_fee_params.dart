import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

import 'taker_fee_distribution_percentage.dart';

/// TakerFeeParams consolidates the taker fee parameters for the poolmanager.
class OsmosisPoolManagerTakerFeeParams extends CosmosMessage {
  /// [defaultTakerFee] is the fee used when creating a new pool that doesn't
  /// fall under a custom pool taker fee or stableswap taker fee category.
  final String defaultTakerFee;

  /// [osmoTakerFeeDistribution] defines the distribution of taker fees
  /// generated in OSMO. As of this writing, it has two catagories:
  /// - staking_rewards: the percent of the taker fee that gets distributed to
  /// stakers.
  /// - community_pool: the percent of the taker fee that gets sent to the
  /// community pool.
  final OsmosisPoolManagerTakerFeeDistributionPercentage
      osmoTakerFeeDistribution;

  /// [nonOsmoTakerFeeDistribution] defines the distribution of taker fees
  /// generated in non-OSMO. As of this writing, it has two categories:
  /// - staking_rewards: the percent of the taker fee that gets swapped to OSMO
  /// and then distirbuted to stakers.
  /// - community_pool: the percent of the taker fee that gets sent to the
  /// community pool. Note: If the non-OSMO asset is an authorized_quote_denom,
  /// that denom is sent directly to the community pool. Otherwise, it is
  /// swapped to the community_pool_denom_to_swap_non_whitelisted_assets_to and
  /// then sent to the community pool as that denom.
  final OsmosisPoolManagerTakerFeeDistributionPercentage
      nonOsmoTakerFeeDistribution;

  /// [adminAddresses] is a list of addresses that are allowed to set and remove
  /// custom taker fees for denom pairs. Governance also has the ability to set
  /// and remove custom taker fees for denom pairs, but with the normal
  /// governance delay.
  final List<String>? adminAddresses;

  /// [communityPoolDenomToSwapNonWhitelistedAssetsTo] is the denom that
  /// non-whitelisted taker fees will be swapped to before being sent to
  /// the community pool.
  final String? communityPoolDenomToSwapNonWhitelistedAssetsTo;

  /// [reducedFeeWhitelist] is a list of addresses that are
  /// allowed to pay a reduce taker fee when performing a swap
  /// (i.e. swap without paying the taker fee).
  /// It is intended to be used for integrators who meet qualifying factors
  /// that are approved by governance.
  /// Initially, the taker fee is allowed to be bypassed completely. However
  /// In the future, we will charge a reduced taker fee instead of no fee at all.
  final List<String>? reducedFeeWhitelist;

  OsmosisPoolManagerTakerFeeParams(
      {required this.defaultTakerFee,
      required this.osmoTakerFeeDistribution,
      required this.nonOsmoTakerFeeDistribution,
      List<String>? adminAddresses,
      this.communityPoolDenomToSwapNonWhitelistedAssetsTo,
      List<String>? reducedFeeWhitelist})
      : adminAddresses = adminAddresses?.emptyAsNull?.immutable,
        reducedFeeWhitelist = reducedFeeWhitelist?.emptyAsNull?.immutable;
  factory OsmosisPoolManagerTakerFeeParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerTakerFeeParams(
        defaultTakerFee: decode.getField(1),
        osmoTakerFeeDistribution:
            OsmosisPoolManagerTakerFeeDistributionPercentage.deserialize(
                decode.getField(2)),
        nonOsmoTakerFeeDistribution:
            OsmosisPoolManagerTakerFeeDistributionPercentage.deserialize(
                decode.getField(3)),
        adminAddresses: decode.getFields<String>(4),
        communityPoolDenomToSwapNonWhitelistedAssetsTo: decode.getField(5),
        reducedFeeWhitelist: decode.getFields<String>(6));
  }
  factory OsmosisPoolManagerTakerFeeParams.fromJson(Map<String, dynamic> json) {
    return OsmosisPoolManagerTakerFeeParams(
        defaultTakerFee: json["default_taker_fee"],
        osmoTakerFeeDistribution:
            OsmosisPoolManagerTakerFeeDistributionPercentage.fromJson(
                json["osmo_taker_fee_distribution"]),
        nonOsmoTakerFeeDistribution:
            OsmosisPoolManagerTakerFeeDistributionPercentage.fromJson(
                json["non_osmo_taker_fee_distribution"]),
        adminAddresses: (json["admin_addresses"] as List?)?.cast(),
        communityPoolDenomToSwapNonWhitelistedAssetsTo:
            json["community_pool_denom_to_swap_non_whitelisted_assets_to"],
        reducedFeeWhitelist: (json["reduced_fee_whitelist"] as List?)?.cast());
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  Map<String, dynamic> toJson() {
    return {
      "default_taker_fee": defaultTakerFee,
      "osmo_taker_fee_distribution": osmoTakerFeeDistribution.toJson(),
      "non_osmo_taker_fee_distribution": nonOsmoTakerFeeDistribution.toJson(),
      "admin_addresses": adminAddresses,
      "community_pool_denom_to_swap_non_whitelisted_assets_to":
          communityPoolDenomToSwapNonWhitelistedAssetsTo,
      "reduced_fee_whitelist": reducedFeeWhitelist
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisPoolManagerV1beta1Types.takerFeeParams;

  @override
  List get values => [
        defaultTakerFee,
        osmoTakerFeeDistribution,
        nonOsmoTakerFeeDistribution,
        adminAddresses,
        communityPoolDenomToSwapNonWhitelistedAssetsTo,
        reducedFeeWhitelist
      ];
}
