import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/injective/exchange/v2/src/order.dart"
    as injective_exchange_v2_order;
import "package:cosmos_sdk/proto_messages/injective/exchange/v2/src/market.dart"
    as injective_exchange_v2_market;

enum RiskMode implements ProtoEnumVariant {
  riskModeUnspecified(0, 'RISK_MODE_UNSPECIFIED'),
  riskModeIsolated(1, 'RISK_MODE_ISOLATED'),
  riskModeCross(2, 'RISK_MODE_CROSS'),
  riskModePortfolio(3, 'RISK_MODE_PORTFOLIO');

  const RiskMode(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static RiskMode fromValue(int? value) {
    return RiskMode.values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw ItemNotFoundException(name: "RiskMode", value: value),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static RiskMode from(Object? value) {
    return RiskMode.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse: () => throw ItemNotFoundException(name: "RiskMode", value: value),
    );
  }
}

/// reserved for future use (not implemented)
enum ReservationPolicy implements ProtoEnumVariant {
  reservationPolicyUnspecified(0, 'RESERVATION_POLICY_UNSPECIFIED'),
  reservationPolicyFullHold(1, 'RESERVATION_POLICY_FULL_HOLD'),
  reservationPolicyPartialHold(2, 'RESERVATION_POLICY_PARTIAL_HOLD'),

  /// reserved for future use (not implemented)
  reservationPolicyNoHold(3, 'RESERVATION_POLICY_NO_HOLD');

  const ReservationPolicy(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static ReservationPolicy fromValue(int? value) {
    return ReservationPolicy.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "ReservationPolicy",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static ReservationPolicy from(Object? value) {
    return ReservationPolicy.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "ReservationPolicy",
                value: value,
              ),
    );
  }
}

/// EnforcedRestrictionsContract defines a contract with its pause event
/// signature
class EnforcedRestrictionsContract extends CosmosProtoMessage {
  /// EVM address of the contract
  final String? contractAddress;

  /// Pause event signature for the contract (e.g. "Pause()", or
  /// "Pause(address)"). If left empty, it will default to "Pause()".
  final String? pauseEventSignature;

  const EnforcedRestrictionsContract({
    this.contractAddress,
    this.pauseEventSignature,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [contractAddress, pauseEventSignature];

  @override
  Map<String, dynamic> toJson() {
    return {
      'contract_address': contractAddress,
      'pause_event_signature': pauseEventSignature,
    };
  }

  factory EnforcedRestrictionsContract.fromJson(Map<String, dynamic> json) {
    return EnforcedRestrictionsContract(
      contractAddress: json.valueAsString<String?>(
        'contract_address',
        acceptCamelCase: true,
      ),
      pauseEventSignature: json.valueAsString<String?>(
        'pause_event_signature',
        acceptCamelCase: true,
      ),
    );
  }

  factory EnforcedRestrictionsContract.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return EnforcedRestrictionsContract(
      contractAddress: decode.getString<String?>(1),
      pauseEventSignature: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2EnforcedRestrictionsContract;
}

/// reserved for future use (not implemented)
class Params extends CosmosProtoMessage {
  /// spot_market_instant_listing_fee defines the expedited fee in INJ required
  /// to create a spot market by bypassing governance
  final cosmos_base_v1beta1_coin.Coin? spotMarketInstantListingFee;

  /// derivative_market_instant_listing_fee defines the expedited fee in INJ
  /// required to create a derivative market by bypassing governance
  final cosmos_base_v1beta1_coin.Coin? derivativeMarketInstantListingFee;

  /// default_spot_maker_fee defines the default exchange trade fee for makers on
  /// a spot market
  final String? defaultSpotMakerFeeRate;

  /// default_spot_taker_fee_rate defines the default exchange trade fee rate for
  /// takers on a new spot market
  final String? defaultSpotTakerFeeRate;

  /// default_derivative_maker_fee defines the default exchange trade fee for
  /// makers on a new derivative market
  final String? defaultDerivativeMakerFeeRate;

  /// default_derivative_taker_fee defines the default exchange trade fee for
  /// takers on a new derivative market
  final String? defaultDerivativeTakerFeeRate;

  /// default_initial_margin_ratio defines the default initial margin ratio on a
  /// new derivative market
  final String? defaultInitialMarginRatio;

  /// default_maintenance_margin_ratio defines the default maintenance margin
  /// ratio on a new derivative market
  final String? defaultMaintenanceMarginRatio;

  /// default_funding_interval defines the default funding interval on a
  /// derivative market
  final BigInt? defaultFundingInterval;

  /// funding_multiple defines the timestamp multiple that the funding timestamp
  /// should be a multiple of
  final BigInt? fundingMultiple;

  /// relayer_fee_share_rate defines the trade fee share percentage that goes to
  /// relayers
  final String? relayerFeeShareRate;

  /// default_hourly_funding_rate_cap defines the default maximum absolute value
  /// of the hourly funding rate
  final String? defaultHourlyFundingRateCap;

  /// hourly_interest_rate defines the hourly interest rate
  final String? defaultHourlyInterestRate;

  /// max_derivative_order_side_count defines the maximum number of derivative
  /// active orders a subaccount can have for a given orderbook side
  final int? maxDerivativeOrderSideCount;

  /// inj_reward_staked_requirement_threshold defines the threshold on INJ
  /// rewards after which one also needs staked INJ to receive more
  final String? injRewardStakedRequirementThreshold;

  /// the trading_rewards_vesting_duration defines the vesting times for trading
  /// rewards
  final BigInt? tradingRewardsVestingDuration;

  /// liquidator_reward_share_rate defines the ratio of the split of the surplus
  /// collateral that goes to the liquidator
  final String? liquidatorRewardShareRate;

  /// binary_options_market_instant_listing_fee defines the expedited fee in INJ
  /// required to create a derivative market by bypassing governance
  final cosmos_base_v1beta1_coin.Coin? binaryOptionsMarketInstantListingFee;

  /// atomic_market_order_access_level defines the required access permissions
  /// for executing atomic market orders
  final injective_exchange_v2_order.AtomicMarketOrderAccessLevel?
  atomicMarketOrderAccessLevel;

  /// spot_atomic_market_order_fee_multiplier defines the default multiplier for
  /// executing atomic market orders in spot markets
  final String? spotAtomicMarketOrderFeeMultiplier;

  /// derivative_atomic_market_order_fee_multiplier defines the default
  /// multiplier for executing atomic market orders in derivative markets
  final String? derivativeAtomicMarketOrderFeeMultiplier;

  /// binary_options_atomic_market_order_fee_multiplier defines the default
  /// multiplier for executing atomic market orders in binary markets
  final String? binaryOptionsAtomicMarketOrderFeeMultiplier;

  /// minimal_protocol_fee_rate defines the minimal protocol fee rate
  final String? minimalProtocolFeeRate;

  /// is_instant_derivative_market_launch_enabled defines whether instant
  /// derivative market launch is enabled
  final bool? isInstantDerivativeMarketLaunchEnabled;

  final BigInt? postOnlyModeHeightThreshold;

  /// Maximum time in seconds since the last mark price update to allow a
  /// decrease in margin
  final BigInt? marginDecreasePriceTimestampThresholdSeconds;

  /// List of addresses that are allowed to perform exchange admin operations
  final List<String> exchangeAdmins;

  /// inj_auction_max_cap defines the maximum cap for INJ sent to auction.
  /// Deprecated: the cap is now driven by the auction module's InjBasketMaxCap;
  /// this field is ignored.
  final String? injAuctionMaxCap;

  /// fixed_gas_enabled indicates if msg server will consume fixed gas amount for
  /// certain msg types
  final bool? fixedGasEnabled;

  /// emit_legacy_version_events indicates if events of legacy version types
  /// should be emitted in parallel to the new version events
  final bool? emitLegacyVersionEvents;

  /// default_reduce_margin_ratio defines the default reduce margin ratio on a
  /// new derivative market
  final String? defaultReduceMarginRatio;

  /// This was the field human_readable_upgrade_block_height
  /// post_only_mode_blocks_amount defines the amount of blocks the post only
  /// mode will be enabled after a chain upgrade
  final BigInt? postOnlyModeBlocksAmount;

  /// min_post_only_mode_downtime_duration defines the minimum downtime duration
  /// that must pass before the post only mode is automatically enabled. The
  /// accepted values are the Downtime enum values from the downtime_duration
  /// module
  final String? minPostOnlyModeDowntimeDuration;

  /// post_only_mode_blocks_amount defines the amount of blocks the post only
  /// mode will be enabled after the downtime-detector module detects a chain
  /// downtime
  final BigInt? postOnlyModeBlocksAmountAfterDowntime;

  /// DEPRECATED, left for upgrade purposes
  /// Contracts that exchange will be listening to pause markets denominated in
  /// respective erc20: denoms, with their pause event signatures
  final List<EnforcedRestrictionsContract>
  deprecatedEnforcedRestrictionsContracts;

  /// white_knight_liquidators defines addresses that can liquidate positions
  /// with a dedicated white-knight reward share in positive payout liquidations
  final List<String> whiteKnightLiquidators;

  /// white_knight_liquidator_reward_share_rate defines the ratio of the split of
  /// the surplus collateral that goes to a white knight liquidator
  final String? whiteKnightLiquidatorRewardShareRate;

  /// cross_margin_params groups all cross-margin related parameters.
  final CrossMarginParams? crossMarginParams;

  const Params({
    this.spotMarketInstantListingFee,
    this.derivativeMarketInstantListingFee,
    this.defaultSpotMakerFeeRate,
    this.defaultSpotTakerFeeRate,
    this.defaultDerivativeMakerFeeRate,
    this.defaultDerivativeTakerFeeRate,
    this.defaultInitialMarginRatio,
    this.defaultMaintenanceMarginRatio,
    this.defaultFundingInterval,
    this.fundingMultiple,
    this.relayerFeeShareRate,
    this.defaultHourlyFundingRateCap,
    this.defaultHourlyInterestRate,
    this.maxDerivativeOrderSideCount,
    this.injRewardStakedRequirementThreshold,
    this.tradingRewardsVestingDuration,
    this.liquidatorRewardShareRate,
    this.binaryOptionsMarketInstantListingFee,
    this.atomicMarketOrderAccessLevel,
    this.spotAtomicMarketOrderFeeMultiplier,
    this.derivativeAtomicMarketOrderFeeMultiplier,
    this.binaryOptionsAtomicMarketOrderFeeMultiplier,
    this.minimalProtocolFeeRate,
    this.isInstantDerivativeMarketLaunchEnabled,
    this.postOnlyModeHeightThreshold,
    this.marginDecreasePriceTimestampThresholdSeconds,
    this.exchangeAdmins = const [],
    this.injAuctionMaxCap,
    this.fixedGasEnabled,
    this.emitLegacyVersionEvents,
    this.defaultReduceMarginRatio,
    this.postOnlyModeBlocksAmount,
    this.minPostOnlyModeDowntimeDuration,
    this.postOnlyModeBlocksAmountAfterDowntime,
    this.deprecatedEnforcedRestrictionsContracts = const [],
    this.whiteKnightLiquidators = const [],
    this.whiteKnightLiquidatorRewardShareRate,
    this.crossMarginParams,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "exchange/Params"),
      ],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(7, options: const []),
        ProtoFieldConfig.string(8, options: const []),
        ProtoFieldConfig.int64(9),
        ProtoFieldConfig.int64(10),
        ProtoFieldConfig.string(11, options: const []),
        ProtoFieldConfig.string(12, options: const []),
        ProtoFieldConfig.string(13, options: const []),
        ProtoFieldConfig.uint32(14),
        ProtoFieldConfig.string(15, options: const []),
        ProtoFieldConfig.int64(16),
        ProtoFieldConfig.string(17, options: const []),
        ProtoFieldConfig.message(18, options: const []),
        ProtoFieldConfig.enumType(19),
        ProtoFieldConfig.string(20, options: const []),
        ProtoFieldConfig.string(21, options: const []),
        ProtoFieldConfig.string(22, options: const []),
        ProtoFieldConfig.string(23, options: const []),
        ProtoFieldConfig.bool(24),
        ProtoFieldConfig.int64(25),
        ProtoFieldConfig.int64(26),
        ProtoFieldConfig.repeated(
          fieldNumber: 27,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.string(
          28,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.bool(29),
        ProtoFieldConfig.bool(30),
        ProtoFieldConfig.string(31, options: const []),
        ProtoFieldConfig.uint64(33),
        ProtoFieldConfig.string(34),
        ProtoFieldConfig.uint64(35),
        ProtoFieldConfig.repeated(
          fieldNumber: 36,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 37,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.string(38, options: const []),
        ProtoFieldConfig.message(39, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    spotMarketInstantListingFee,
    derivativeMarketInstantListingFee,
    defaultSpotMakerFeeRate,
    defaultSpotTakerFeeRate,
    defaultDerivativeMakerFeeRate,
    defaultDerivativeTakerFeeRate,
    defaultInitialMarginRatio,
    defaultMaintenanceMarginRatio,
    defaultFundingInterval,
    fundingMultiple,
    relayerFeeShareRate,
    defaultHourlyFundingRateCap,
    defaultHourlyInterestRate,
    maxDerivativeOrderSideCount,
    injRewardStakedRequirementThreshold,
    tradingRewardsVestingDuration,
    liquidatorRewardShareRate,
    binaryOptionsMarketInstantListingFee,
    atomicMarketOrderAccessLevel,
    spotAtomicMarketOrderFeeMultiplier,
    derivativeAtomicMarketOrderFeeMultiplier,
    binaryOptionsAtomicMarketOrderFeeMultiplier,
    minimalProtocolFeeRate,
    isInstantDerivativeMarketLaunchEnabled,
    postOnlyModeHeightThreshold,
    marginDecreasePriceTimestampThresholdSeconds,
    exchangeAdmins,
    injAuctionMaxCap,
    fixedGasEnabled,
    emitLegacyVersionEvents,
    defaultReduceMarginRatio,
    postOnlyModeBlocksAmount,
    minPostOnlyModeDowntimeDuration,
    postOnlyModeBlocksAmountAfterDowntime,
    deprecatedEnforcedRestrictionsContracts,
    whiteKnightLiquidators,
    whiteKnightLiquidatorRewardShareRate,
    crossMarginParams,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'spot_market_instant_listing_fee': spotMarketInstantListingFee?.toJson(),
      'derivative_market_instant_listing_fee':
          derivativeMarketInstantListingFee?.toJson(),
      'default_spot_maker_fee_rate': defaultSpotMakerFeeRate,
      'default_spot_taker_fee_rate': defaultSpotTakerFeeRate,
      'default_derivative_maker_fee_rate': defaultDerivativeMakerFeeRate,
      'default_derivative_taker_fee_rate': defaultDerivativeTakerFeeRate,
      'default_initial_margin_ratio': defaultInitialMarginRatio,
      'default_maintenance_margin_ratio': defaultMaintenanceMarginRatio,
      'default_funding_interval': defaultFundingInterval?.toString(),
      'funding_multiple': fundingMultiple?.toString(),
      'relayer_fee_share_rate': relayerFeeShareRate,
      'default_hourly_funding_rate_cap': defaultHourlyFundingRateCap,
      'default_hourly_interest_rate': defaultHourlyInterestRate,
      'max_derivative_order_side_count': maxDerivativeOrderSideCount,
      'inj_reward_staked_requirement_threshold':
          injRewardStakedRequirementThreshold,
      'trading_rewards_vesting_duration':
          tradingRewardsVestingDuration?.toString(),
      'liquidator_reward_share_rate': liquidatorRewardShareRate,
      'binary_options_market_instant_listing_fee':
          binaryOptionsMarketInstantListingFee?.toJson(),
      'atomic_market_order_access_level':
          atomicMarketOrderAccessLevel?.protoName,
      'spot_atomic_market_order_fee_multiplier':
          spotAtomicMarketOrderFeeMultiplier,
      'derivative_atomic_market_order_fee_multiplier':
          derivativeAtomicMarketOrderFeeMultiplier,
      'binary_options_atomic_market_order_fee_multiplier':
          binaryOptionsAtomicMarketOrderFeeMultiplier,
      'minimal_protocol_fee_rate': minimalProtocolFeeRate,
      'is_instant_derivative_market_launch_enabled':
          isInstantDerivativeMarketLaunchEnabled,
      'post_only_mode_height_threshold':
          postOnlyModeHeightThreshold?.toString(),
      'margin_decrease_price_timestamp_threshold_seconds':
          marginDecreasePriceTimestampThresholdSeconds?.toString(),
      'exchange_admins': exchangeAdmins.map((e) => e).toList(),
      'inj_auction_max_cap': injAuctionMaxCap,
      'fixed_gas_enabled': fixedGasEnabled,
      'emit_legacy_version_events': emitLegacyVersionEvents,
      'default_reduce_margin_ratio': defaultReduceMarginRatio,
      'post_only_mode_blocks_amount': postOnlyModeBlocksAmount?.toString(),
      'min_post_only_mode_downtime_duration': minPostOnlyModeDowntimeDuration,
      'post_only_mode_blocks_amount_after_downtime':
          postOnlyModeBlocksAmountAfterDowntime?.toString(),
      'deprecated_enforced_restrictions_contracts':
          deprecatedEnforcedRestrictionsContracts
              .map((e) => e.toJson())
              .toList(),
      'white_knight_liquidators': whiteKnightLiquidators.map((e) => e).toList(),
      'white_knight_liquidator_reward_share_rate':
          whiteKnightLiquidatorRewardShareRate,
      'cross_margin_params': crossMarginParams?.toJson(),
    };
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      spotMarketInstantListingFee: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'spot_market_instant_listing_fee',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
      derivativeMarketInstantListingFee: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'derivative_market_instant_listing_fee',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
      defaultSpotMakerFeeRate: json.valueAsString<String?>(
        'default_spot_maker_fee_rate',
        acceptCamelCase: true,
      ),
      defaultSpotTakerFeeRate: json.valueAsString<String?>(
        'default_spot_taker_fee_rate',
        acceptCamelCase: true,
      ),
      defaultDerivativeMakerFeeRate: json.valueAsString<String?>(
        'default_derivative_maker_fee_rate',
        acceptCamelCase: true,
      ),
      defaultDerivativeTakerFeeRate: json.valueAsString<String?>(
        'default_derivative_taker_fee_rate',
        acceptCamelCase: true,
      ),
      defaultInitialMarginRatio: json.valueAsString<String?>(
        'default_initial_margin_ratio',
        acceptCamelCase: true,
      ),
      defaultMaintenanceMarginRatio: json.valueAsString<String?>(
        'default_maintenance_margin_ratio',
        acceptCamelCase: true,
      ),
      defaultFundingInterval: json.valueAsBigInt<BigInt?>(
        'default_funding_interval',
        acceptCamelCase: true,
      ),
      fundingMultiple: json.valueAsBigInt<BigInt?>(
        'funding_multiple',
        acceptCamelCase: true,
      ),
      relayerFeeShareRate: json.valueAsString<String?>(
        'relayer_fee_share_rate',
        acceptCamelCase: true,
      ),
      defaultHourlyFundingRateCap: json.valueAsString<String?>(
        'default_hourly_funding_rate_cap',
        acceptCamelCase: true,
      ),
      defaultHourlyInterestRate: json.valueAsString<String?>(
        'default_hourly_interest_rate',
        acceptCamelCase: true,
      ),
      maxDerivativeOrderSideCount: json.valueAsInt<int?>(
        'max_derivative_order_side_count',
        acceptCamelCase: true,
      ),
      injRewardStakedRequirementThreshold: json.valueAsString<String?>(
        'inj_reward_staked_requirement_threshold',
        acceptCamelCase: true,
      ),
      tradingRewardsVestingDuration: json.valueAsBigInt<BigInt?>(
        'trading_rewards_vesting_duration',
        acceptCamelCase: true,
      ),
      liquidatorRewardShareRate: json.valueAsString<String?>(
        'liquidator_reward_share_rate',
        acceptCamelCase: true,
      ),
      binaryOptionsMarketInstantListingFee: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'binary_options_market_instant_listing_fee',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
      atomicMarketOrderAccessLevel: json.valueTo<
        injective_exchange_v2_order.AtomicMarketOrderAccessLevel?,
        Object?
      >(
        key: 'atomic_market_order_access_level',
        parse:
            (v) => injective_exchange_v2_order
                .AtomicMarketOrderAccessLevel.from(v),
      ),
      spotAtomicMarketOrderFeeMultiplier: json.valueAsString<String?>(
        'spot_atomic_market_order_fee_multiplier',
        acceptCamelCase: true,
      ),
      derivativeAtomicMarketOrderFeeMultiplier: json.valueAsString<String?>(
        'derivative_atomic_market_order_fee_multiplier',
        acceptCamelCase: true,
      ),
      binaryOptionsAtomicMarketOrderFeeMultiplier: json.valueAsString<String?>(
        'binary_options_atomic_market_order_fee_multiplier',
        acceptCamelCase: true,
      ),
      minimalProtocolFeeRate: json.valueAsString<String?>(
        'minimal_protocol_fee_rate',
        acceptCamelCase: true,
      ),
      isInstantDerivativeMarketLaunchEnabled: json.valueAsBool<bool?>(
        'is_instant_derivative_market_launch_enabled',
        acceptCamelCase: true,
      ),
      postOnlyModeHeightThreshold: json.valueAsBigInt<BigInt?>(
        'post_only_mode_height_threshold',
        acceptCamelCase: true,
      ),
      marginDecreasePriceTimestampThresholdSeconds: json.valueAsBigInt<BigInt?>(
        'margin_decrease_price_timestamp_threshold_seconds',
        acceptCamelCase: true,
      ),
      exchangeAdmins:
          (json.valueEnsureAsList<dynamic>(
            'exchange_admins',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      injAuctionMaxCap: json.valueAsString<String?>(
        'inj_auction_max_cap',
        acceptCamelCase: true,
      ),
      fixedGasEnabled: json.valueAsBool<bool?>(
        'fixed_gas_enabled',
        acceptCamelCase: true,
      ),
      emitLegacyVersionEvents: json.valueAsBool<bool?>(
        'emit_legacy_version_events',
        acceptCamelCase: true,
      ),
      defaultReduceMarginRatio: json.valueAsString<String?>(
        'default_reduce_margin_ratio',
        acceptCamelCase: true,
      ),
      postOnlyModeBlocksAmount: json.valueAsBigInt<BigInt?>(
        'post_only_mode_blocks_amount',
        acceptCamelCase: true,
      ),
      minPostOnlyModeDowntimeDuration: json.valueAsString<String?>(
        'min_post_only_mode_downtime_duration',
        acceptCamelCase: true,
      ),
      postOnlyModeBlocksAmountAfterDowntime: json.valueAsBigInt<BigInt?>(
        'post_only_mode_blocks_amount_after_downtime',
        acceptCamelCase: true,
      ),
      deprecatedEnforcedRestrictionsContracts:
          (json.valueEnsureAsList<dynamic>(
                'deprecated_enforced_restrictions_contracts',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  EnforcedRestrictionsContract,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => EnforcedRestrictionsContract.fromJson(v),
                ),
              )
              .toList(),
      whiteKnightLiquidators:
          (json.valueEnsureAsList<dynamic>(
            'white_knight_liquidators',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      whiteKnightLiquidatorRewardShareRate: json.valueAsString<String?>(
        'white_knight_liquidator_reward_share_rate',
        acceptCamelCase: true,
      ),
      crossMarginParams: json.valueTo<CrossMarginParams?, Map<String, dynamic>>(
        key: 'cross_margin_params',
        parse: (v) => CrossMarginParams.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      spotMarketInstantListingFee: decode
          .messageTo<cosmos_base_v1beta1_coin.Coin?>(
            1,
            (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
          ),
      derivativeMarketInstantListingFee: decode
          .messageTo<cosmos_base_v1beta1_coin.Coin?>(
            2,
            (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
          ),
      defaultSpotMakerFeeRate: decode.getString<String?>(3),
      defaultSpotTakerFeeRate: decode.getString<String?>(4),
      defaultDerivativeMakerFeeRate: decode.getString<String?>(5),
      defaultDerivativeTakerFeeRate: decode.getString<String?>(6),
      defaultInitialMarginRatio: decode.getString<String?>(7),
      defaultMaintenanceMarginRatio: decode.getString<String?>(8),
      defaultFundingInterval: decode.getBigInt<BigInt?>(9),
      fundingMultiple: decode.getBigInt<BigInt?>(10),
      relayerFeeShareRate: decode.getString<String?>(11),
      defaultHourlyFundingRateCap: decode.getString<String?>(12),
      defaultHourlyInterestRate: decode.getString<String?>(13),
      maxDerivativeOrderSideCount: decode.getInt<int?>(14),
      injRewardStakedRequirementThreshold: decode.getString<String?>(15),
      tradingRewardsVestingDuration: decode.getBigInt<BigInt?>(16),
      liquidatorRewardShareRate: decode.getString<String?>(17),
      binaryOptionsMarketInstantListingFee: decode
          .messageTo<cosmos_base_v1beta1_coin.Coin?>(
            18,
            (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
          ),
      atomicMarketOrderAccessLevel: decode
          .getEnum<injective_exchange_v2_order.AtomicMarketOrderAccessLevel?>(
            19,
            injective_exchange_v2_order.AtomicMarketOrderAccessLevel.values,
          ),
      spotAtomicMarketOrderFeeMultiplier: decode.getString<String?>(20),
      derivativeAtomicMarketOrderFeeMultiplier: decode.getString<String?>(21),
      binaryOptionsAtomicMarketOrderFeeMultiplier: decode.getString<String?>(
        22,
      ),
      minimalProtocolFeeRate: decode.getString<String?>(23),
      isInstantDerivativeMarketLaunchEnabled: decode.getBool<bool?>(24),
      postOnlyModeHeightThreshold: decode.getBigInt<BigInt?>(25),
      marginDecreasePriceTimestampThresholdSeconds: decode.getBigInt<BigInt?>(
        26,
      ),
      exchangeAdmins: decode.getListOrEmpty<String>(27),
      injAuctionMaxCap: decode.getString<String?>(28),
      fixedGasEnabled: decode.getBool<bool?>(29),
      emitLegacyVersionEvents: decode.getBool<bool?>(30),
      defaultReduceMarginRatio: decode.getString<String?>(31),
      postOnlyModeBlocksAmount: decode.getBigInt<BigInt?>(33),
      minPostOnlyModeDowntimeDuration: decode.getString<String?>(34),
      postOnlyModeBlocksAmountAfterDowntime: decode.getBigInt<BigInt?>(35),
      deprecatedEnforcedRestrictionsContracts:
          decode
              .getListOfBytes(36)
              .map((b) => EnforcedRestrictionsContract.deserialize(b))
              .toList(),
      whiteKnightLiquidators: decode.getListOrEmpty<String>(37),
      whiteKnightLiquidatorRewardShareRate: decode.getString<String?>(38),
      crossMarginParams: decode.messageTo<CrossMarginParams?>(
        39,
        (b) => CrossMarginParams.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2Params;
}

class CrossMarginParams extends CosmosProtoMessage {
  /// positive_upnl_haircut_rate defines the haircut applied to
  /// positive unrealized PnL for cross-margin admission checks.
  final String? positiveUpnlHaircutRate;

  /// fees_buffer defines a fixed notional buffer (quote-denom
  /// units) subtracted from cross-margin equity calculations.
  final String? feesBuffer;

  /// enabled_quote_denoms defines the quote denoms that are
  /// eligible for cross-margin pools.
  final List<String> enabledQuoteDenoms;

  /// perpetual_enabled defines whether perpetual derivative markets
  /// are eligible for cross margin.
  final bool? perpetualEnabled;

  /// expiry_enabled defines whether expiry futures derivative
  /// markets are eligible for cross margin.
  final bool? expiryEnabled;

  /// max_active_derivative_markets_per_pool defines the maximum
  /// number of active derivative markets (positions or orders) a cross-margin
  /// subaccount may have within a single quote-denom pool.
  final int? maxActiveDerivativeMarketsPerPool;

  /// emergency_paused defines whether cross margin is in emergency
  /// pause mode. When true:
  /// - All cross-margin orders (including reduce-only) are blocked
  /// - Profile switching involving cross mode is blocked
  /// - Liquidations are still allowed
  /// - Withdrawals are allowed up to isolated-margin maintenance level
  final bool? emergencyPaused;

  const CrossMarginParams({
    this.positiveUpnlHaircutRate,
    this.feesBuffer,
    this.enabledQuoteDenoms = const [],
    this.perpetualEnabled,
    this.expiryEnabled,
    this.maxActiveDerivativeMarketsPerPool,
    this.emergencyPaused,
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
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.bool(4),
        ProtoFieldConfig.bool(5),
        ProtoFieldConfig.uint32(6),
        ProtoFieldConfig.bool(7),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    positiveUpnlHaircutRate,
    feesBuffer,
    enabledQuoteDenoms,
    perpetualEnabled,
    expiryEnabled,
    maxActiveDerivativeMarketsPerPool,
    emergencyPaused,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'positive_upnl_haircut_rate': positiveUpnlHaircutRate,
      'fees_buffer': feesBuffer,
      'enabled_quote_denoms': enabledQuoteDenoms.map((e) => e).toList(),
      'perpetual_enabled': perpetualEnabled,
      'expiry_enabled': expiryEnabled,
      'max_active_derivative_markets_per_pool':
          maxActiveDerivativeMarketsPerPool,
      'emergency_paused': emergencyPaused,
    };
  }

  factory CrossMarginParams.fromJson(Map<String, dynamic> json) {
    return CrossMarginParams(
      positiveUpnlHaircutRate: json.valueAsString<String?>(
        'positive_upnl_haircut_rate',
        acceptCamelCase: true,
      ),
      feesBuffer: json.valueAsString<String?>(
        'fees_buffer',
        acceptCamelCase: true,
      ),
      enabledQuoteDenoms:
          (json.valueEnsureAsList<dynamic>(
            'enabled_quote_denoms',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      perpetualEnabled: json.valueAsBool<bool?>(
        'perpetual_enabled',
        acceptCamelCase: true,
      ),
      expiryEnabled: json.valueAsBool<bool?>(
        'expiry_enabled',
        acceptCamelCase: true,
      ),
      maxActiveDerivativeMarketsPerPool: json.valueAsInt<int?>(
        'max_active_derivative_markets_per_pool',
        acceptCamelCase: true,
      ),
      emergencyPaused: json.valueAsBool<bool?>(
        'emergency_paused',
        acceptCamelCase: true,
      ),
    );
  }

  factory CrossMarginParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return CrossMarginParams(
      positiveUpnlHaircutRate: decode.getString<String?>(1),
      feesBuffer: decode.getString<String?>(2),
      enabledQuoteDenoms: decode.getListOrEmpty<String>(3),
      perpetualEnabled: decode.getBool<bool?>(4),
      expiryEnabled: decode.getBool<bool?>(5),
      maxActiveDerivativeMarketsPerPool: decode.getInt<int?>(6),
      emergencyPaused: decode.getBool<bool?>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2CrossMarginParams;
}

class MidPriceAndTOB extends CosmosProtoMessage {
  /// mid price of the market (in human readable format)
  final String? midPrice;

  /// best buy price of the market (in human readable format)
  final String? bestBuyPrice;

  /// best sell price of the market (in human readable format)
  final String? bestSellPrice;

  const MidPriceAndTOB({this.midPrice, this.bestBuyPrice, this.bestSellPrice});

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
  List<Object?> get protoValues => [midPrice, bestBuyPrice, bestSellPrice];

  @override
  Map<String, dynamic> toJson() {
    return {
      'mid_price': midPrice,
      'best_buy_price': bestBuyPrice,
      'best_sell_price': bestSellPrice,
    };
  }

  factory MidPriceAndTOB.fromJson(Map<String, dynamic> json) {
    return MidPriceAndTOB(
      midPrice: json.valueAsString<String?>('mid_price', acceptCamelCase: true),
      bestBuyPrice: json.valueAsString<String?>(
        'best_buy_price',
        acceptCamelCase: true,
      ),
      bestSellPrice: json.valueAsString<String?>(
        'best_sell_price',
        acceptCamelCase: true,
      ),
    );
  }

  factory MidPriceAndTOB.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MidPriceAndTOB(
      midPrice: decode.getString<String?>(1),
      bestBuyPrice: decode.getString<String?>(2),
      bestSellPrice: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MidPriceAndTOB;
}

/// A subaccount's deposit for a given base currency
class Deposit extends CosmosProtoMessage {
  /// the available balance (in chain format)
  final String? availableBalance;

  /// the total balance (in chain format)
  final String? totalBalance;

  const Deposit({this.availableBalance, this.totalBalance});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [availableBalance, totalBalance];

  @override
  Map<String, dynamic> toJson() {
    return {
      'available_balance': availableBalance,
      'total_balance': totalBalance,
    };
  }

  factory Deposit.fromJson(Map<String, dynamic> json) {
    return Deposit(
      availableBalance: json.valueAsString<String?>(
        'available_balance',
        acceptCamelCase: true,
      ),
      totalBalance: json.valueAsString<String?>(
        'total_balance',
        acceptCamelCase: true,
      ),
    );
  }

  factory Deposit.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Deposit(
      availableBalance: decode.getString<String?>(1),
      totalBalance: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2Deposit;
}

class SubaccountTradeNonce extends CosmosProtoMessage {
  final int? nonce;

  const SubaccountTradeNonce({this.nonce});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint32(1)],
    );
  }

  @override
  List<Object?> get protoValues => [nonce];

  @override
  Map<String, dynamic> toJson() {
    return {'nonce': nonce};
  }

  factory SubaccountTradeNonce.fromJson(Map<String, dynamic> json) {
    return SubaccountTradeNonce(
      nonce: json.valueAsInt<int?>('nonce', acceptCamelCase: true),
    );
  }

  factory SubaccountTradeNonce.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SubaccountTradeNonce(nonce: decode.getInt<int?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2SubaccountTradeNonce;
}

class SubaccountOrder extends CosmosProtoMessage {
  /// price of the order
  final String? price;

  /// the amount of the quantity remaining fillable
  final String? quantity;

  final bool? isReduceOnly;

  final String? cid;

  const SubaccountOrder({
    this.price,
    this.quantity,
    this.isReduceOnly,
    this.cid,
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
        ProtoFieldConfig.bool(3),
        ProtoFieldConfig.string(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [price, quantity, isReduceOnly, cid];

  @override
  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'quantity': quantity,
      'isReduceOnly': isReduceOnly,
      'cid': cid,
    };
  }

  factory SubaccountOrder.fromJson(Map<String, dynamic> json) {
    return SubaccountOrder(
      price: json.valueAsString<String?>('price', acceptCamelCase: true),
      quantity: json.valueAsString<String?>('quantity', acceptCamelCase: true),
      isReduceOnly: json.valueAsBool<bool?>(
        'isReduceOnly',
        acceptCamelCase: true,
      ),
      cid: json.valueAsString<String?>('cid', acceptCamelCase: true),
    );
  }

  factory SubaccountOrder.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SubaccountOrder(
      price: decode.getString<String?>(1),
      quantity: decode.getString<String?>(2),
      isReduceOnly: decode.getBool<bool?>(3),
      cid: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2SubaccountOrder;
}

class SubaccountOrderData extends CosmosProtoMessage {
  final SubaccountOrder? order;

  final List<int>? orderHash;

  const SubaccountOrderData({this.order, this.orderHash});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1), ProtoFieldConfig.bytes(2)],
    );
  }

  @override
  List<Object?> get protoValues => [order, orderHash];

  @override
  Map<String, dynamic> toJson() {
    return {
      'order': order?.toJson(),
      'order_hash': switch (orderHash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory SubaccountOrderData.fromJson(Map<String, dynamic> json) {
    return SubaccountOrderData(
      order: json.valueTo<SubaccountOrder?, Map<String, dynamic>>(
        key: 'order',
        parse: (v) => SubaccountOrder.fromJson(v),
        acceptCamelCase: true,
      ),
      orderHash: json.valueAsBytes<List<int>?>(
        'order_hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory SubaccountOrderData.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SubaccountOrderData(
      order: decode.messageTo<SubaccountOrder?>(
        1,
        (b) => SubaccountOrder.deserialize(b),
      ),
      orderHash: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2SubaccountOrderData;
}

class Position extends CosmosProtoMessage {
  /// True if the position is long. False if the position is short.
  final bool? isLong;

  /// The quantity of the position (in human readable format)
  final String? quantity;

  /// The entry price of the position (in human readable format)
  final String? entryPrice;

  /// The margin of the position (in human readable format)
  final String? margin;

  /// The cumulative funding
  final String? cumulativeFundingEntry;

  const Position({
    this.isLong,
    this.quantity,
    this.entryPrice,
    this.margin,
    this.cumulativeFundingEntry,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bool(1),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    isLong,
    quantity,
    entryPrice,
    margin,
    cumulativeFundingEntry,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'isLong': isLong,
      'quantity': quantity,
      'entry_price': entryPrice,
      'margin': margin,
      'cumulative_funding_entry': cumulativeFundingEntry,
    };
  }

  factory Position.fromJson(Map<String, dynamic> json) {
    return Position(
      isLong: json.valueAsBool<bool?>('isLong', acceptCamelCase: true),
      quantity: json.valueAsString<String?>('quantity', acceptCamelCase: true),
      entryPrice: json.valueAsString<String?>(
        'entry_price',
        acceptCamelCase: true,
      ),
      margin: json.valueAsString<String?>('margin', acceptCamelCase: true),
      cumulativeFundingEntry: json.valueAsString<String?>(
        'cumulative_funding_entry',
        acceptCamelCase: true,
      ),
    );
  }

  factory Position.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Position(
      isLong: decode.getBool<bool?>(1),
      quantity: decode.getString<String?>(2),
      entryPrice: decode.getString<String?>(3),
      margin: decode.getString<String?>(4),
      cumulativeFundingEntry: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2Position;
}

class Balance extends CosmosProtoMessage {
  /// the subaccount ID
  final String? subaccountId;

  /// the denom of the balance
  final String? denom;

  /// the token deposits details
  final Deposit? deposits;

  const Balance({this.subaccountId, this.denom, this.deposits});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.message(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [subaccountId, denom, deposits];

  @override
  Map<String, dynamic> toJson() {
    return {
      'subaccount_id': subaccountId,
      'denom': denom,
      'deposits': deposits?.toJson(),
    };
  }

  factory Balance.fromJson(Map<String, dynamic> json) {
    return Balance(
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      deposits: json.valueTo<Deposit?, Map<String, dynamic>>(
        key: 'deposits',
        parse: (v) => Deposit.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory Balance.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Balance(
      subaccountId: decode.getString<String?>(1),
      denom: decode.getString<String?>(2),
      deposits: decode.messageTo<Deposit?>(3, (b) => Deposit.deserialize(b)),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2Balance;
}

class DerivativePosition extends CosmosProtoMessage {
  /// the subaccount ID
  final String? subaccountId;

  /// the market ID
  final String? marketId;

  /// the position details
  final Position? position;

  const DerivativePosition({this.subaccountId, this.marketId, this.position});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.message(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [subaccountId, marketId, position];

  @override
  Map<String, dynamic> toJson() {
    return {
      'subaccount_id': subaccountId,
      'market_id': marketId,
      'position': position?.toJson(),
    };
  }

  factory DerivativePosition.fromJson(Map<String, dynamic> json) {
    return DerivativePosition(
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      position: json.valueTo<Position?, Map<String, dynamic>>(
        key: 'position',
        parse: (v) => Position.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory DerivativePosition.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DerivativePosition(
      subaccountId: decode.getString<String?>(1),
      marketId: decode.getString<String?>(2),
      position: decode.messageTo<Position?>(3, (b) => Position.deserialize(b)),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2DerivativePosition;
}

class PositionDelta extends CosmosProtoMessage {
  final bool? isLong;

  final String? executionQuantity;

  final String? executionMargin;

  final String? executionPrice;

  const PositionDelta({
    this.isLong,
    this.executionQuantity,
    this.executionMargin,
    this.executionPrice,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bool(1),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    isLong,
    executionQuantity,
    executionMargin,
    executionPrice,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'is_long': isLong,
      'execution_quantity': executionQuantity,
      'execution_margin': executionMargin,
      'execution_price': executionPrice,
    };
  }

  factory PositionDelta.fromJson(Map<String, dynamic> json) {
    return PositionDelta(
      isLong: json.valueAsBool<bool?>('is_long', acceptCamelCase: true),
      executionQuantity: json.valueAsString<String?>(
        'execution_quantity',
        acceptCamelCase: true,
      ),
      executionMargin: json.valueAsString<String?>(
        'execution_margin',
        acceptCamelCase: true,
      ),
      executionPrice: json.valueAsString<String?>(
        'execution_price',
        acceptCamelCase: true,
      ),
    );
  }

  factory PositionDelta.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PositionDelta(
      isLong: decode.getBool<bool?>(1),
      executionQuantity: decode.getString<String?>(2),
      executionMargin: decode.getString<String?>(3),
      executionPrice: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2PositionDelta;
}

class PointsMultiplier extends CosmosProtoMessage {
  final String? makerPointsMultiplier;

  final String? takerPointsMultiplier;

  const PointsMultiplier({
    this.makerPointsMultiplier,
    this.takerPointsMultiplier,
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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    makerPointsMultiplier,
    takerPointsMultiplier,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'maker_points_multiplier': makerPointsMultiplier,
      'taker_points_multiplier': takerPointsMultiplier,
    };
  }

  factory PointsMultiplier.fromJson(Map<String, dynamic> json) {
    return PointsMultiplier(
      makerPointsMultiplier: json.valueAsString<String?>(
        'maker_points_multiplier',
        acceptCamelCase: true,
      ),
      takerPointsMultiplier: json.valueAsString<String?>(
        'taker_points_multiplier',
        acceptCamelCase: true,
      ),
    );
  }

  factory PointsMultiplier.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PointsMultiplier(
      makerPointsMultiplier: decode.getString<String?>(1),
      takerPointsMultiplier: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2PointsMultiplier;
}

class TradingRewardCampaignBoostInfo extends CosmosProtoMessage {
  final List<String> boostedSpotMarketIds;

  final List<PointsMultiplier> spotMarketMultipliers;

  final List<String> boostedDerivativeMarketIds;

  final List<PointsMultiplier> derivativeMarketMultipliers;

  const TradingRewardCampaignBoostInfo({
    this.boostedSpotMarketIds = const [],
    this.spotMarketMultipliers = const [],
    this.boostedDerivativeMarketIds = const [],
    this.derivativeMarketMultipliers = const [],
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
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
        ),
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
    boostedSpotMarketIds,
    spotMarketMultipliers,
    boostedDerivativeMarketIds,
    derivativeMarketMultipliers,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'boosted_spot_market_ids': boostedSpotMarketIds.map((e) => e).toList(),
      'spot_market_multipliers':
          spotMarketMultipliers.map((e) => e.toJson()).toList(),
      'boosted_derivative_market_ids':
          boostedDerivativeMarketIds.map((e) => e).toList(),
      'derivative_market_multipliers':
          derivativeMarketMultipliers.map((e) => e.toJson()).toList(),
    };
  }

  factory TradingRewardCampaignBoostInfo.fromJson(Map<String, dynamic> json) {
    return TradingRewardCampaignBoostInfo(
      boostedSpotMarketIds:
          (json.valueEnsureAsList<dynamic>(
            'boosted_spot_market_ids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      spotMarketMultipliers:
          (json.valueEnsureAsList<dynamic>(
                'spot_market_multipliers',
                acceptCamelCase: true,
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<PointsMultiplier, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => PointsMultiplier.fromJson(v),
                    ),
              )
              .toList(),
      boostedDerivativeMarketIds:
          (json.valueEnsureAsList<dynamic>(
            'boosted_derivative_market_ids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      derivativeMarketMultipliers:
          (json.valueEnsureAsList<dynamic>(
                'derivative_market_multipliers',
                acceptCamelCase: true,
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<PointsMultiplier, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => PointsMultiplier.fromJson(v),
                    ),
              )
              .toList(),
    );
  }

  factory TradingRewardCampaignBoostInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TradingRewardCampaignBoostInfo(
      boostedSpotMarketIds: decode.getListOrEmpty<String>(1),
      spotMarketMultipliers:
          decode
              .getListOfBytes(2)
              .map((b) => PointsMultiplier.deserialize(b))
              .toList(),
      boostedDerivativeMarketIds: decode.getListOrEmpty<String>(3),
      derivativeMarketMultipliers:
          decode
              .getListOfBytes(4)
              .map((b) => PointsMultiplier.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2TradingRewardCampaignBoostInfo;
}

class CampaignRewardPool extends CosmosProtoMessage {
  /// the campaign start timestamp in seconds
  final BigInt? startTimestamp;

  /// max_campaign_rewards are the maximum reward amounts to be disbursed at the
  /// end of the campaign
  final List<cosmos_base_v1beta1_coin.Coin> maxCampaignRewards;

  const CampaignRewardPool({
    this.startTimestamp,
    this.maxCampaignRewards = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.int64(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [startTimestamp, maxCampaignRewards];

  @override
  Map<String, dynamic> toJson() {
    return {
      'start_timestamp': startTimestamp?.toString(),
      'max_campaign_rewards':
          maxCampaignRewards.map((e) => e.toJson()).toList(),
    };
  }

  factory CampaignRewardPool.fromJson(Map<String, dynamic> json) {
    return CampaignRewardPool(
      startTimestamp: json.valueAsBigInt<BigInt?>(
        'start_timestamp',
        acceptCamelCase: true,
      ),
      maxCampaignRewards:
          (json.valueEnsureAsList<dynamic>(
                'max_campaign_rewards',
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

  factory CampaignRewardPool.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return CampaignRewardPool(
      startTimestamp: decode.getBigInt<BigInt?>(1),
      maxCampaignRewards:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2CampaignRewardPool;
}

class TradingRewardCampaignInfo extends CosmosProtoMessage {
  /// number of seconds of the duration of each campaign
  final BigInt? campaignDurationSeconds;

  /// the trading fee quote denoms which will be counted for the rewards
  final List<String> quoteDenoms;

  /// the optional boost info for markets
  final TradingRewardCampaignBoostInfo? tradingRewardBoostInfo;

  /// the marketIDs which are disqualified from being rewarded
  final List<String> disqualifiedMarketIds;

  const TradingRewardCampaignInfo({
    this.campaignDurationSeconds,
    this.quoteDenoms = const [],
    this.tradingRewardBoostInfo,
    this.disqualifiedMarketIds = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.int64(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.message(3),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    campaignDurationSeconds,
    quoteDenoms,
    tradingRewardBoostInfo,
    disqualifiedMarketIds,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'campaign_duration_seconds': campaignDurationSeconds?.toString(),
      'quote_denoms': quoteDenoms.map((e) => e).toList(),
      'trading_reward_boost_info': tradingRewardBoostInfo?.toJson(),
      'disqualified_market_ids': disqualifiedMarketIds.map((e) => e).toList(),
    };
  }

  factory TradingRewardCampaignInfo.fromJson(Map<String, dynamic> json) {
    return TradingRewardCampaignInfo(
      campaignDurationSeconds: json.valueAsBigInt<BigInt?>(
        'campaign_duration_seconds',
        acceptCamelCase: true,
      ),
      quoteDenoms:
          (json.valueEnsureAsList<dynamic>(
            'quote_denoms',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      tradingRewardBoostInfo: json
          .valueTo<TradingRewardCampaignBoostInfo?, Map<String, dynamic>>(
            key: 'trading_reward_boost_info',
            parse: (v) => TradingRewardCampaignBoostInfo.fromJson(v),
            acceptCamelCase: true,
          ),
      disqualifiedMarketIds:
          (json.valueEnsureAsList<dynamic>(
            'disqualified_market_ids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory TradingRewardCampaignInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TradingRewardCampaignInfo(
      campaignDurationSeconds: decode.getBigInt<BigInt?>(1),
      quoteDenoms: decode.getListOrEmpty<String>(2),
      tradingRewardBoostInfo: decode.messageTo<TradingRewardCampaignBoostInfo?>(
        3,
        (b) => TradingRewardCampaignBoostInfo.deserialize(b),
      ),
      disqualifiedMarketIds: decode.getListOrEmpty<String>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2TradingRewardCampaignInfo;
}

class FeeDiscountTierInfo extends CosmosProtoMessage {
  /// the maker discount rate
  final String? makerDiscountRate;

  /// the taker discount rate
  final String? takerDiscountRate;

  /// the staked amount required to qualify for the discount (in chain format)
  final String? stakedAmount;

  /// the volume required to qualify for the discount (in human readable format)
  final String? volume;

  const FeeDiscountTierInfo({
    this.makerDiscountRate,
    this.takerDiscountRate,
    this.stakedAmount,
    this.volume,
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
        ProtoFieldConfig.string(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    makerDiscountRate,
    takerDiscountRate,
    stakedAmount,
    volume,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'maker_discount_rate': makerDiscountRate,
      'taker_discount_rate': takerDiscountRate,
      'staked_amount': stakedAmount,
      'volume': volume,
    };
  }

  factory FeeDiscountTierInfo.fromJson(Map<String, dynamic> json) {
    return FeeDiscountTierInfo(
      makerDiscountRate: json.valueAsString<String?>(
        'maker_discount_rate',
        acceptCamelCase: true,
      ),
      takerDiscountRate: json.valueAsString<String?>(
        'taker_discount_rate',
        acceptCamelCase: true,
      ),
      stakedAmount: json.valueAsString<String?>(
        'staked_amount',
        acceptCamelCase: true,
      ),
      volume: json.valueAsString<String?>('volume', acceptCamelCase: true),
    );
  }

  factory FeeDiscountTierInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return FeeDiscountTierInfo(
      makerDiscountRate: decode.getString<String?>(1),
      takerDiscountRate: decode.getString<String?>(2),
      stakedAmount: decode.getString<String?>(3),
      volume: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2FeeDiscountTierInfo;
}

class FeeDiscountSchedule extends CosmosProtoMessage {
  /// the bucket number
  final BigInt? bucketCount;

  /// the bucket duration in seconds
  final BigInt? bucketDuration;

  /// the trading fee quote denoms which will be counted for the fee paid
  /// contribution
  final List<String> quoteDenoms;

  /// the fee discount tiers
  final List<FeeDiscountTierInfo> tierInfos;

  /// the marketIDs which are disqualified from contributing to the fee paid
  /// amount
  final List<String> disqualifiedMarketIds;

  const FeeDiscountSchedule({
    this.bucketCount,
    this.bucketDuration,
    this.quoteDenoms = const [],
    this.tierInfos = const [],
    this.disqualifiedMarketIds = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.int64(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    bucketCount,
    bucketDuration,
    quoteDenoms,
    tierInfos,
    disqualifiedMarketIds,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'bucket_count': bucketCount?.toString(),
      'bucket_duration': bucketDuration?.toString(),
      'quote_denoms': quoteDenoms.map((e) => e).toList(),
      'tier_infos': tierInfos.map((e) => e.toJson()).toList(),
      'disqualified_market_ids': disqualifiedMarketIds.map((e) => e).toList(),
    };
  }

  factory FeeDiscountSchedule.fromJson(Map<String, dynamic> json) {
    return FeeDiscountSchedule(
      bucketCount: json.valueAsBigInt<BigInt?>(
        'bucket_count',
        acceptCamelCase: true,
      ),
      bucketDuration: json.valueAsBigInt<BigInt?>(
        'bucket_duration',
        acceptCamelCase: true,
      ),
      quoteDenoms:
          (json.valueEnsureAsList<dynamic>(
            'quote_denoms',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      tierInfos:
          (json.valueEnsureAsList<dynamic>('tier_infos', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  FeeDiscountTierInfo,
                  Map<String, dynamic>
                >(value: e, parse: (v) => FeeDiscountTierInfo.fromJson(v)),
              )
              .toList(),
      disqualifiedMarketIds:
          (json.valueEnsureAsList<dynamic>(
            'disqualified_market_ids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory FeeDiscountSchedule.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return FeeDiscountSchedule(
      bucketCount: decode.getBigInt<BigInt?>(1),
      bucketDuration: decode.getBigInt<BigInt?>(2),
      quoteDenoms: decode.getListOrEmpty<String>(3),
      tierInfos:
          decode
              .getListOfBytes(4)
              .map((b) => FeeDiscountTierInfo.deserialize(b))
              .toList(),
      disqualifiedMarketIds: decode.getListOrEmpty<String>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2FeeDiscountSchedule;
}

class FeeDiscountTierTTL extends CosmosProtoMessage {
  /// the tier number
  final BigInt? tier;

  /// the TTL timestamp in seconds
  final BigInt? ttlTimestamp;

  const FeeDiscountTierTTL({this.tier, this.ttlTimestamp});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint64(1), ProtoFieldConfig.int64(2)],
    );
  }

  @override
  List<Object?> get protoValues => [tier, ttlTimestamp];

  @override
  Map<String, dynamic> toJson() {
    return {
      'tier': tier?.toString(),
      'ttl_timestamp': ttlTimestamp?.toString(),
    };
  }

  factory FeeDiscountTierTTL.fromJson(Map<String, dynamic> json) {
    return FeeDiscountTierTTL(
      tier: json.valueAsBigInt<BigInt?>('tier', acceptCamelCase: true),
      ttlTimestamp: json.valueAsBigInt<BigInt?>(
        'ttl_timestamp',
        acceptCamelCase: true,
      ),
    );
  }

  factory FeeDiscountTierTTL.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return FeeDiscountTierTTL(
      tier: decode.getBigInt<BigInt?>(1),
      ttlTimestamp: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2FeeDiscountTierTTL;
}

class TradeRecords extends CosmosProtoMessage {
  final String? marketId;

  final List<TradeRecord> latestTradeRecords;

  const TradeRecords({this.marketId, this.latestTradeRecords = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [marketId, latestTradeRecords];

  @override
  Map<String, dynamic> toJson() {
    return {
      'market_id': marketId,
      'latest_trade_records':
          latestTradeRecords.map((e) => e.toJson()).toList(),
    };
  }

  factory TradeRecords.fromJson(Map<String, dynamic> json) {
    return TradeRecords(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      latestTradeRecords:
          (json.valueEnsureAsList<dynamic>(
                'latest_trade_records',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<TradeRecord, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => TradeRecord.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory TradeRecords.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TradeRecords(
      marketId: decode.getString<String?>(1),
      latestTradeRecords:
          decode
              .getListOfBytes(2)
              .map((b) => TradeRecord.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2TradeRecords;
}

class TradeRecord extends CosmosProtoMessage {
  /// the timestamp of the trade
  final BigInt? timestamp;

  /// the price of the trade (in human readable format)
  final String? price;

  /// the quantity of the trade (in human readable format)
  final String? quantity;

  const TradeRecord({this.timestamp, this.price, this.quantity});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.int64(1),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [timestamp, price, quantity];

  @override
  Map<String, dynamic> toJson() {
    return {
      'timestamp': timestamp?.toString(),
      'price': price,
      'quantity': quantity,
    };
  }

  factory TradeRecord.fromJson(Map<String, dynamic> json) {
    return TradeRecord(
      timestamp: json.valueAsBigInt<BigInt?>(
        'timestamp',
        acceptCamelCase: true,
      ),
      price: json.valueAsString<String?>('price', acceptCamelCase: true),
      quantity: json.valueAsString<String?>('quantity', acceptCamelCase: true),
    );
  }

  factory TradeRecord.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TradeRecord(
      timestamp: decode.getBigInt<BigInt?>(1),
      price: decode.getString<String?>(2),
      quantity: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2TradeRecord;
}

class Level extends CosmosProtoMessage {
  /// price (in human readable format)
  final String? p;

  /// quantity (in human readable format)
  final String? q;

  const Level({this.p, this.q});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [p, q];

  @override
  Map<String, dynamic> toJson() {
    return {'p': p, 'q': q};
  }

  factory Level.fromJson(Map<String, dynamic> json) {
    return Level(
      p: json.valueAsString<String?>('p', acceptCamelCase: true),
      q: json.valueAsString<String?>('q', acceptCamelCase: true),
    );
  }

  factory Level.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Level(
      p: decode.getString<String?>(1),
      q: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2Level;
}

class AggregateSubaccountVolumeRecord extends CosmosProtoMessage {
  /// the subaccount ID
  final String? subaccountId;

  /// the subaccount volumes for each market
  final List<injective_exchange_v2_market.MarketVolume> marketVolumes;

  const AggregateSubaccountVolumeRecord({
    this.subaccountId,
    this.marketVolumes = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [subaccountId, marketVolumes];

  @override
  Map<String, dynamic> toJson() {
    return {
      'subaccount_id': subaccountId,
      'market_volumes': marketVolumes.map((e) => e.toJson()).toList(),
    };
  }

  factory AggregateSubaccountVolumeRecord.fromJson(Map<String, dynamic> json) {
    return AggregateSubaccountVolumeRecord(
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      marketVolumes:
          (json.valueEnsureAsList<dynamic>(
                'market_volumes',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_market.MarketVolume,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) =>
                          injective_exchange_v2_market.MarketVolume.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory AggregateSubaccountVolumeRecord.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AggregateSubaccountVolumeRecord(
      subaccountId: decode.getString<String?>(1),
      marketVolumes:
          decode
              .getListOfBytes(2)
              .map(
                (b) => injective_exchange_v2_market.MarketVolume.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2AggregateSubaccountVolumeRecord;
}

class AggregateAccountVolumeRecord extends CosmosProtoMessage {
  /// account the volume belongs to
  final String? account;

  /// the aggregate volumes for each market
  final List<injective_exchange_v2_market.MarketVolume> marketVolumes;

  const AggregateAccountVolumeRecord({
    this.account,
    this.marketVolumes = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [account, marketVolumes];

  @override
  Map<String, dynamic> toJson() {
    return {
      'account': account,
      'market_volumes': marketVolumes.map((e) => e.toJson()).toList(),
    };
  }

  factory AggregateAccountVolumeRecord.fromJson(Map<String, dynamic> json) {
    return AggregateAccountVolumeRecord(
      account: json.valueAsString<String?>('account', acceptCamelCase: true),
      marketVolumes:
          (json.valueEnsureAsList<dynamic>(
                'market_volumes',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_market.MarketVolume,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) =>
                          injective_exchange_v2_market.MarketVolume.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory AggregateAccountVolumeRecord.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AggregateAccountVolumeRecord(
      account: decode.getString<String?>(1),
      marketVolumes:
          decode
              .getListOfBytes(2)
              .map(
                (b) => injective_exchange_v2_market.MarketVolume.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2AggregateAccountVolumeRecord;
}

class DenomDecimals extends CosmosProtoMessage {
  /// the denom of the token
  final String? denom;

  /// the decimals of the token
  final BigInt? decimals;

  const DenomDecimals({this.denom, this.decimals});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.uint64(2)],
    );
  }

  @override
  List<Object?> get protoValues => [denom, decimals];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom, 'decimals': decimals?.toString()};
  }

  factory DenomDecimals.fromJson(Map<String, dynamic> json) {
    return DenomDecimals(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      decimals: json.valueAsBigInt<BigInt?>('decimals', acceptCamelCase: true),
    );
  }

  factory DenomDecimals.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DenomDecimals(
      denom: decode.getString<String?>(1),
      decimals: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2DenomDecimals;
}

class GrantAuthorization extends CosmosProtoMessage {
  /// the grantee address
  final String? grantee;

  /// the amount of stake granted (INJ in chain format)
  final String? amount;

  const GrantAuthorization({this.grantee, this.amount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [grantee, amount];

  @override
  Map<String, dynamic> toJson() {
    return {'grantee': grantee, 'amount': amount};
  }

  factory GrantAuthorization.fromJson(Map<String, dynamic> json) {
    return GrantAuthorization(
      grantee: json.valueAsString<String?>('grantee', acceptCamelCase: true),
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
    );
  }

  factory GrantAuthorization.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GrantAuthorization(
      grantee: decode.getString<String?>(1),
      amount: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2GrantAuthorization;
}

class ActiveGrant extends CosmosProtoMessage {
  final String? granter;

  final String? amount;

  const ActiveGrant({this.granter, this.amount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [granter, amount];

  @override
  Map<String, dynamic> toJson() {
    return {'granter': granter, 'amount': amount};
  }

  factory ActiveGrant.fromJson(Map<String, dynamic> json) {
    return ActiveGrant(
      granter: json.valueAsString<String?>('granter', acceptCamelCase: true),
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
    );
  }

  factory ActiveGrant.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ActiveGrant(
      granter: decode.getString<String?>(1),
      amount: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2ActiveGrant;
}

class EffectiveGrant extends CosmosProtoMessage {
  final String? granter;

  final String? netGrantedStake;

  final bool? isValid;

  const EffectiveGrant({this.granter, this.netGrantedStake, this.isValid});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.bool(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [granter, netGrantedStake, isValid];

  @override
  Map<String, dynamic> toJson() {
    return {
      'granter': granter,
      'net_granted_stake': netGrantedStake,
      'is_valid': isValid,
    };
  }

  factory EffectiveGrant.fromJson(Map<String, dynamic> json) {
    return EffectiveGrant(
      granter: json.valueAsString<String?>('granter', acceptCamelCase: true),
      netGrantedStake: json.valueAsString<String?>(
        'net_granted_stake',
        acceptCamelCase: true,
      ),
      isValid: json.valueAsBool<bool?>('is_valid', acceptCamelCase: true),
    );
  }

  factory EffectiveGrant.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return EffectiveGrant(
      granter: decode.getString<String?>(1),
      netGrantedStake: decode.getString<String?>(2),
      isValid: decode.getBool<bool?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2EffectiveGrant;
}

class DenomMinNotional extends CosmosProtoMessage {
  /// the denom of the token
  final String? denom;

  /// the minimum notional value for the token (in human readable format)
  final String? minNotional;

  const DenomMinNotional({this.denom, this.minNotional});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [denom, minNotional];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom, 'min_notional': minNotional};
  }

  factory DenomMinNotional.fromJson(Map<String, dynamic> json) {
    return DenomMinNotional(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      minNotional: json.valueAsString<String?>(
        'min_notional',
        acceptCamelCase: true,
      ),
    );
  }

  factory DenomMinNotional.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DenomMinNotional(
      denom: decode.getString<String?>(1),
      minNotional: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2DenomMinNotional;
}

class SubaccountRiskProfile extends CosmosProtoMessage {
  final RiskMode? mode;

  final ReservationPolicy? reservationPolicy;

  /// credit_line_id is reserved for future use and currently must be empty.
  final String? creditLineId;

  const SubaccountRiskProfile({
    this.mode,
    this.reservationPolicy,
    this.creditLineId,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.enumType(1),
        ProtoFieldConfig.enumType(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [mode, reservationPolicy, creditLineId];

  @override
  Map<String, dynamic> toJson() {
    return {
      'mode': mode?.protoName,
      'reservation_policy': reservationPolicy?.protoName,
      'credit_line_id': creditLineId,
    };
  }

  factory SubaccountRiskProfile.fromJson(Map<String, dynamic> json) {
    return SubaccountRiskProfile(
      mode: json.valueTo<RiskMode?, Object?>(
        key: 'mode',
        parse: (v) => RiskMode.from(v),
      ),
      reservationPolicy: json.valueTo<ReservationPolicy?, Object?>(
        key: 'reservation_policy',
        parse: (v) => ReservationPolicy.from(v),
      ),
      creditLineId: json.valueAsString<String?>(
        'credit_line_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory SubaccountRiskProfile.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SubaccountRiskProfile(
      mode: decode.getEnum<RiskMode?>(1, RiskMode.values),
      reservationPolicy: decode.getEnum<ReservationPolicy?>(
        2,
        ReservationPolicy.values,
      ),
      creditLineId: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2SubaccountRiskProfile;
}
