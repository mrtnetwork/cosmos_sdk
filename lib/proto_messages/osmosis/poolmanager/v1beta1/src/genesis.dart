import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

/// Params holds parameters for the poolmanager module
class Params extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> poolCreationFee;

  /// taker_fee_params is the container of taker fee parameters.
  final TakerFeeParams? takerFeeParams;

  /// authorized_quote_denoms is a list of quote denoms that can be used as
  /// token1 when creating a concentrated pool. We limit the quote assets to a
  /// small set for the purposes of having convenient price increments stemming
  /// from tick to price conversion. These increments are in a human readable
  /// magnitude only for token1 as a quote. For limit orders in the future, this
  /// will be a desirable property in terms of UX as to allow users to set limit
  /// orders at prices in terms of token1 (quote asset) that are easy to reason
  /// about.
  /// DEPRECATED: Quote asset whitelisting requirement removed as per Proposal
  /// 819. Any asset can now be used as a quote asset in concentrated liquidity
  /// pools.
  final List<String> authorizedQuoteDenoms;

  const Params({
    this.poolCreationFee = const [],
    this.takerFeeParams,
    this.authorizedQuoteDenoms = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    poolCreationFee,
    takerFeeParams,
    authorizedQuoteDenoms,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'pool_creation_fee': poolCreationFee.map((e) => e.toJson()).toList(),
      'taker_fee_params': takerFeeParams?.toJson(),
      'authorized_quote_denoms': authorizedQuoteDenoms.map((e) => e).toList(),
    };
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      poolCreationFee:
          (json.valueEnsureAsList<dynamic>(
                'pool_creation_fee',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.Coin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
                ),
              )
              .toList(),
      takerFeeParams: json.valueTo<TakerFeeParams?, Map<String, dynamic>>(
        key: 'taker_fee_params',
        parse: (v) => TakerFeeParams.fromJson(v),
        acceptCamelCase: true,
      ),
      authorizedQuoteDenoms:
          (json.valueEnsureAsList<dynamic>(
            'authorized_quote_denoms',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      poolCreationFee:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      takerFeeParams: decode.messageTo<TakerFeeParams?>(
        2,
        (b) => TakerFeeParams.deserialize(b),
      ),
      authorizedQuoteDenoms: decode.getListOrEmpty<String>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisPoolmanagerV1beta1Params;
}

/// TakerFeeParams consolidates the taker fee parameters for the poolmanager.
class TakerFeeParams extends CosmosProtoMessage {
  /// default_taker_fee is the fee used when creating a new pool that doesn't
  /// fall under a custom pool taker fee or stableswap taker fee category.
  final String? defaultTakerFee;

  /// osmo_taker_fee_distribution defines the distribution of taker fees
  /// generated in OSMO. As of this writing, it has two categories:
  /// - staking_rewards: the percent of the taker fee that gets distributed to
  /// stakers.
  /// - community_pool: the percent of the taker fee that gets sent to the
  /// community pool.
  final TakerFeeDistributionPercentage? osmoTakerFeeDistribution;

  /// non_osmo_taker_fee_distribution defines the distribution of taker fees
  /// generated in non-OSMO. As of this writing, it has two categories:
  /// - staking_rewards: the percent of the taker fee that gets swapped to OSMO
  /// and then distributed to stakers.
  /// - community_pool: the percent of the taker fee that gets sent to the
  /// community pool. Note: If the non-OSMO asset is an authorized_quote_denom,
  /// that denom is sent directly to the community pool. Otherwise, it is
  /// swapped to the community_pool_denom_to_swap_non_whitelisted_assets_to and
  /// then sent to the community pool as that denom.
  final TakerFeeDistributionPercentage? nonOsmoTakerFeeDistribution;

  /// admin_addresses is a list of addresses that are allowed to set and remove
  /// custom taker fees for denom pairs. Governance also has the ability to set
  /// and remove custom taker fees for denom pairs, but with the normal
  /// governance delay.
  final List<String> adminAddresses;

  /// community_pool_denom_to_swap_non_whitelisted_assets_to is the denom that
  /// non-whitelisted taker fees will be swapped to before being sent to
  /// the community pool.
  final String? communityPoolDenomToSwapNonWhitelistedAssetsTo;

  /// reduced_fee_whitelist is a list of addresses that are
  /// allowed to pay a reduce taker fee when performing a swap
  /// (i.e. swap without paying the taker fee).
  /// It is intended to be used for integrators who meet qualifying factors
  /// that are approved by governance.
  /// Initially, the taker fee is allowed to be bypassed completely. However
  /// In the future, we will charge a reduced taker fee instead of no fee at all.
  final List<String> reducedFeeWhitelist;

  /// community_pool_denom_whitelist is a list of denoms that should be sent
  /// directly to the community pool instead of being swapped to the
  /// `community_pool_denom_to_swap_non_whitelisted_assets_to`.
  final List<String> communityPoolDenomWhitelist;

  /// daily_staking_rewards_smoothing_factor is the number of days over which
  /// staking rewards from taker fees are smoothed. A value of 1 means no
  /// smoothing. Staking rewards are accumulated in a buffer and distributed as
  /// (buffer_balance / daily_staking_rewards_smoothing_factor) per day epoch.
  final BigInt? dailyStakingRewardsSmoothingFactor;

  const TakerFeeParams({
    this.defaultTakerFee,
    this.osmoTakerFeeDistribution,
    this.nonOsmoTakerFeeDistribution,
    this.adminAddresses = const [],
    this.communityPoolDenomToSwapNonWhitelistedAssetsTo,
    this.reducedFeeWhitelist = const [],
    this.communityPoolDenomWhitelist = const [],
    this.dailyStakingRewardsSmoothingFactor,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 7,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
        ProtoFieldConfig.uint64(8, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    defaultTakerFee,
    osmoTakerFeeDistribution,
    nonOsmoTakerFeeDistribution,
    adminAddresses,
    communityPoolDenomToSwapNonWhitelistedAssetsTo,
    reducedFeeWhitelist,
    communityPoolDenomWhitelist,
    dailyStakingRewardsSmoothingFactor,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'default_taker_fee': defaultTakerFee,
      'osmo_taker_fee_distribution': osmoTakerFeeDistribution?.toJson(),
      'non_osmo_taker_fee_distribution': nonOsmoTakerFeeDistribution?.toJson(),
      'admin_addresses': adminAddresses.map((e) => e).toList(),
      'community_pool_denom_to_swap_non_whitelisted_assets_to':
          communityPoolDenomToSwapNonWhitelistedAssetsTo,
      'reduced_fee_whitelist': reducedFeeWhitelist.map((e) => e).toList(),
      'community_pool_denom_whitelist':
          communityPoolDenomWhitelist.map((e) => e).toList(),
      'daily_staking_rewards_smoothing_factor':
          dailyStakingRewardsSmoothingFactor?.toString(),
    };
  }

  factory TakerFeeParams.fromJson(Map<String, dynamic> json) {
    return TakerFeeParams(
      defaultTakerFee: json.valueAsString<String?>(
        'default_taker_fee',
        acceptCamelCase: true,
      ),
      osmoTakerFeeDistribution: json
          .valueTo<TakerFeeDistributionPercentage?, Map<String, dynamic>>(
            key: 'osmo_taker_fee_distribution',
            parse: (v) => TakerFeeDistributionPercentage.fromJson(v),
            acceptCamelCase: true,
          ),
      nonOsmoTakerFeeDistribution: json
          .valueTo<TakerFeeDistributionPercentage?, Map<String, dynamic>>(
            key: 'non_osmo_taker_fee_distribution',
            parse: (v) => TakerFeeDistributionPercentage.fromJson(v),
            acceptCamelCase: true,
          ),
      adminAddresses:
          (json.valueEnsureAsList<dynamic>(
            'admin_addresses',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      communityPoolDenomToSwapNonWhitelistedAssetsTo: json
          .valueAsString<String?>(
            'community_pool_denom_to_swap_non_whitelisted_assets_to',
            acceptCamelCase: true,
          ),
      reducedFeeWhitelist:
          (json.valueEnsureAsList<dynamic>(
            'reduced_fee_whitelist',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      communityPoolDenomWhitelist:
          (json.valueEnsureAsList<dynamic>(
            'community_pool_denom_whitelist',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      dailyStakingRewardsSmoothingFactor: json.valueAsBigInt<BigInt?>(
        'daily_staking_rewards_smoothing_factor',
        acceptCamelCase: true,
      ),
    );
  }

  factory TakerFeeParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TakerFeeParams(
      defaultTakerFee: decode.getString<String?>(1),
      osmoTakerFeeDistribution: decode
          .messageTo<TakerFeeDistributionPercentage?>(
            2,
            (b) => TakerFeeDistributionPercentage.deserialize(b),
          ),
      nonOsmoTakerFeeDistribution: decode
          .messageTo<TakerFeeDistributionPercentage?>(
            3,
            (b) => TakerFeeDistributionPercentage.deserialize(b),
          ),
      adminAddresses: decode.getListOrEmpty<String>(4),
      communityPoolDenomToSwapNonWhitelistedAssetsTo: decode.getString<String?>(
        5,
      ),
      reducedFeeWhitelist: decode.getListOrEmpty<String>(6),
      communityPoolDenomWhitelist: decode.getListOrEmpty<String>(7),
      dailyStakingRewardsSmoothingFactor: decode.getBigInt<BigInt?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisPoolmanagerV1beta1TakerFeeParams;
}

/// TakerFeeDistributionPercentage defines what percent of the taker fee category
/// gets distributed to the available categories.
class TakerFeeDistributionPercentage extends CosmosProtoMessage {
  final String? stakingRewards;

  final String? communityPool;

  final String? burn;

  const TakerFeeDistributionPercentage({
    this.stakingRewards,
    this.communityPool,
    this.burn,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [stakingRewards, communityPool, burn];

  @override
  Map<String, dynamic> toJson() {
    return {
      'staking_rewards': stakingRewards,
      'community_pool': communityPool,
      'burn': burn,
    };
  }

  factory TakerFeeDistributionPercentage.fromJson(Map<String, dynamic> json) {
    return TakerFeeDistributionPercentage(
      stakingRewards: json.valueAsString<String?>(
        'staking_rewards',
        acceptCamelCase: true,
      ),
      communityPool: json.valueAsString<String?>(
        'community_pool',
        acceptCamelCase: true,
      ),
      burn: json.valueAsString<String?>('burn', acceptCamelCase: true),
    );
  }

  factory TakerFeeDistributionPercentage.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TakerFeeDistributionPercentage(
      stakingRewards: decode.getString<String?>(1),
      communityPool: decode.getString<String?>(2),
      burn: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1TakerFeeDistributionPercentage;
}

class TakerFeesTracker extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> takerFeesToStakers;

  final List<cosmos_base_v1beta1_coin.Coin> takerFeesToCommunityPool;

  final BigInt? heightAccountingStartsFrom;

  final List<cosmos_base_v1beta1_coin.Coin> takerFeesToBurn;

  const TakerFeesTracker({
    this.takerFeesToStakers = const [],
    this.takerFeesToCommunityPool = const [],
    this.heightAccountingStartsFrom,
    this.takerFeesToBurn = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.int64(3, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    takerFeesToStakers,
    takerFeesToCommunityPool,
    heightAccountingStartsFrom,
    takerFeesToBurn,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'taker_fees_to_stakers':
          takerFeesToStakers.map((e) => e.toJson()).toList(),
      'taker_fees_to_community_pool':
          takerFeesToCommunityPool.map((e) => e.toJson()).toList(),
      'height_accounting_starts_from': heightAccountingStartsFrom?.toString(),
      'taker_fees_to_burn': takerFeesToBurn.map((e) => e.toJson()).toList(),
    };
  }

  factory TakerFeesTracker.fromJson(Map<String, dynamic> json) {
    return TakerFeesTracker(
      takerFeesToStakers:
          (json.valueEnsureAsList<dynamic>(
                'taker_fees_to_stakers',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.Coin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
                ),
              )
              .toList(),
      takerFeesToCommunityPool:
          (json.valueEnsureAsList<dynamic>(
                'taker_fees_to_community_pool',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.Coin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
                ),
              )
              .toList(),
      heightAccountingStartsFrom: json.valueAsBigInt<BigInt?>(
        'height_accounting_starts_from',
        acceptCamelCase: true,
      ),
      takerFeesToBurn:
          (json.valueEnsureAsList<dynamic>(
                'taker_fees_to_burn',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.Coin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory TakerFeesTracker.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TakerFeesTracker(
      takerFeesToStakers:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      takerFeesToCommunityPool:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      heightAccountingStartsFrom: decode.getBigInt<BigInt?>(3),
      takerFeesToBurn:
          decode
              .getListOfBytes(4)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisPoolmanagerV1beta1TakerFeesTracker;
}
