import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentratedliquidity/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class OsmosisConcentratedLiquidityParams extends CosmosMessage {
  /// [authorizedTickSpacing] is an array of uint64s that represents the tick
  /// spacing values concentrated-liquidity pools can be created with. For
  /// example, an authorized_tick_spacing of [1, 10, 30] allows for pools
  /// to be created with tick spacing of 1, 10, or 30.
  final List<BigInt>? authorizedTickSpacing;
  final List<String> authorizedSpreadFactors;

  /// [balancerSharesRewardDiscount] is the rate by which incentives flowing
  /// from CL to Balancer pools will be discounted to encourage LPs to migrate.
  /// e.g. a rate of 0.05 means Balancer LPs get 5% less incentives than full
  /// range CL LPs.
  /// This field can range from (0,1]. If set to 1, it indicates that all
  /// incentives stay at cl pool.
  final String balancerSharesRewardDiscount;

  /// authorized_quote_denoms is a list of quote denoms that can be used as
  /// token1 when creating a pool. We limit the quote assets to a small set for
  /// the purposes of having convinient price increments stemming from tick to
  /// price conversion. These increments are in a human readable magnitude only
  /// for token1 as a quote. For limit orders in the future, this will be a
  /// desirable property in terms of UX as to allow users to set limit orders at
  /// prices in terms of token1 (quote asset) that are easy to reason about.
  final List<String>? authorizedQuoteDenoms;
  final List<ProtobufDuration> authorizedUptimes;

  /// is_permissionless_pool_creation_enabled is a boolean that determines if
  /// concentrated liquidity pools can be created via message. At launch,
  /// we consider allowing only governance to create pools, and then later
  /// allowing permissionless pool creation by switching this flag to true
  /// with a governance proposal.
  final bool? isPermissionlessPoolCreationEnabled;

  /// unrestricted_pool_creator_whitelist is a list of addresses that are
  /// allowed to bypass restrictions on permissionless supercharged pool
  /// creation, like pool_creation_enabled, restricted quote assets, no
  /// double creation of pools, etc.
  final List<String>? unrestrictedPoolCreatorWhitelist;
  final BigInt? hookGasLimit;
  OsmosisConcentratedLiquidityParams(
      {List<BigInt>? authorizedTickSpacing,
      required List<String> authorizedSpreadFactors,
      required this.balancerSharesRewardDiscount,
      List<String>? authorizedQuoteDenoms,
      required List<ProtobufDuration> authorizedUptimes,
      this.isPermissionlessPoolCreationEnabled,
      List<String>? unrestrictedPoolCreatorWhitelist,
      this.hookGasLimit})
      : authorizedTickSpacing = authorizedTickSpacing?.nullOnEmpy,
        authorizedSpreadFactors = authorizedSpreadFactors.mutable,
        authorizedQuoteDenoms = authorizedQuoteDenoms?.nullOnEmpy,
        authorizedUptimes = authorizedUptimes.mutable,
        unrestrictedPoolCreatorWhitelist =
            unrestrictedPoolCreatorWhitelist?.nullOnEmpy;
  factory OsmosisConcentratedLiquidityParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityParams(
        authorizedTickSpacing: decode
                .getResult<ProtocolBufferDecoderResult?>(1)
                ?.to<List<BigInt>, List<int>>(
                    (e) => e.map((e) => BigintUtils.parse(e)).toList()) ??
            <BigInt>[],
        authorizedSpreadFactors: decode.getFields<String>(2),
        balancerSharesRewardDiscount: decode.getField(3),
        authorizedQuoteDenoms: decode.getFields<String>(4),
        authorizedUptimes: decode
            .getFields(5)
            .map((e) => ProtobufDuration.deserialize(e))
            .toList(),
        isPermissionlessPoolCreationEnabled: decode.getField(6),
        unrestrictedPoolCreatorWhitelist: decode.getFields(7),
        hookGasLimit: decode.getField(8));
  }
  factory OsmosisConcentratedLiquidityParams.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityParams(
        authorizedTickSpacing: (json["authorized_tick_spacing"] as List?)
            ?.map((e) => BigintUtils.parse(e))
            .toList(),
        authorizedSpreadFactors:
            (json["authorized_spread_factors"] as List?)?.cast() ?? <String>[],
        balancerSharesRewardDiscount: json["balancer_shares_reward_discount"],
        authorizedQuoteDenoms:
            (json["authorized_quote_denoms"] as List?)?.cast() ?? <String>[],
        authorizedUptimes: (json["authorized_uptimes"] as List?)
                ?.map((e) => ProtobufDuration.fromString(e))
                .toList() ??
            <ProtobufDuration>[],
        hookGasLimit: BigintUtils.tryParse(json["hook_gas_limit"]),
        isPermissionlessPoolCreationEnabled:
            json["is_permissionless_pool_creation_enabled"],
        unrestrictedPoolCreatorWhitelist:
            (json["unrestricted_pool_creator_whitelist"] as List?)?.cast() ??
                <String>[]);
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8];

  @override
  Map<String, dynamic> toJson() {
    return {
      "authorized_tick_spacing":
          authorizedTickSpacing?.map((e) => e.toString()).toList(),
      "authorized_spread_factors": authorizedSpreadFactors,
      "balancer_shares_reward_discount": balancerSharesRewardDiscount,
      "authorized_quote_denoms": authorizedQuoteDenoms,
      "authorized_uptimes": authorizedUptimes.map((e) => e.toJson()).toList(),
      "is_permissionless_pool_creation_enabled":
          isPermissionlessPoolCreationEnabled,
      "unrestricted_pool_creator_whitelist": unrestrictedPoolCreatorWhitelist,
      "hook_gas_limit": hookGasLimit?.toString()
    };
  }

  @override
  String get typeUrl => OsmosisConcentratedLiquidityTypes.params.typeUrl;

  @override
  List get values => [
        authorizedTickSpacing,
        authorizedSpreadFactors,
        balancerSharesRewardDiscount,
        authorizedQuoteDenoms,
        authorizedUptimes,
        isPermissionlessPoolCreationEnabled,
        unrestrictedPoolCreatorWhitelist,
        hookGasLimit
      ];
}
