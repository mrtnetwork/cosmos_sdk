import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/injective/oracle/v1beta1/src/oracle.dart"
    as injective_oracle_v1beta1_oracle;

enum AtomicMarketOrderAccessLevel implements ProtoEnumVariant {
  nobody(0, 'Nobody'),

  /// currently unsupported
  beginBlockerSmartContractsOnly(1, 'BeginBlockerSmartContractsOnly'),
  smartContractsOnly(2, 'SmartContractsOnly'),
  everyone(3, 'Everyone');

  const AtomicMarketOrderAccessLevel(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static AtomicMarketOrderAccessLevel fromValue(int? value) {
    return AtomicMarketOrderAccessLevel.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "AtomicMarketOrderAccessLevel",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static AtomicMarketOrderAccessLevel from(Object? value) {
    return AtomicMarketOrderAccessLevel.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "AtomicMarketOrderAccessLevel",
                value: value,
              ),
    );
  }
}

enum MarketStatus implements ProtoEnumVariant {
  unspecified(0, 'Unspecified'),
  active(1, 'Active'),
  paused(2, 'Paused'),
  demolished(3, 'Demolished'),
  expired(4, 'Expired');

  const MarketStatus(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static MarketStatus fromValue(int? value) {
    return MarketStatus.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () => throw ItemNotFoundException(name: "MarketStatus", value: value),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static MarketStatus from(Object? value) {
    return MarketStatus.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () => throw ItemNotFoundException(name: "MarketStatus", value: value),
    );
  }
}

enum OrderType implements ProtoEnumVariant {
  unspecified(0, 'UNSPECIFIED'),
  buy(1, 'BUY'),
  sell(2, 'SELL'),
  stopBuy(3, 'STOP_BUY'),
  stopSell(4, 'STOP_SELL'),
  takeBuy(5, 'TAKE_BUY'),
  takeSell(6, 'TAKE_SELL'),
  buyPo(7, 'BUY_PO'),
  sellPo(8, 'SELL_PO'),
  buyAtomic(9, 'BUY_ATOMIC'),
  sellAtomic(10, 'SELL_ATOMIC');

  const OrderType(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static OrderType fromValue(int? value) {
    return OrderType.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () => throw ItemNotFoundException(name: "OrderType", value: value),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static OrderType from(Object? value) {
    return OrderType.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () => throw ItemNotFoundException(name: "OrderType", value: value),
    );
  }
}

class OpenNotionalCap extends CosmosProtoMessage {
  final OpenNotionalCapUncapped? uncapped;

  final OpenNotionalCapCapped? capped;

  const OpenNotionalCap({this.uncapped, this.capped});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "injective.exchange.v1beta1.OpenNotionalCap",
        ),
      ],
      fields: [
        ProtoFieldConfig.message(
          1,
          options: [
            ProtoOptionString(
              name: "amino.oneof_name",
              value: "injective.exchange.v1beta1.OpenNotionalCapUncapped",
            ),
          ],
        ),
        ProtoFieldConfig.message(
          2,
          options: [
            ProtoOptionString(
              name: "amino.oneof_name",
              value: "injective.exchange.v1beta1.OpenNotionalCapCapped",
            ),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [uncapped, capped];

  @override
  Map<String, dynamic> toJson() {
    return {'uncapped': uncapped?.toJson(), 'capped': capped?.toJson()};
  }

  factory OpenNotionalCap.fromJson(Map<String, dynamic> json) {
    return OpenNotionalCap(
      uncapped: json.valueTo<OpenNotionalCapUncapped?, Map<String, dynamic>>(
        key: 'uncapped',
        parse: (v) => OpenNotionalCapUncapped.fromJson(v),
        acceptCamelCase: true,
      ),
      capped: json.valueTo<OpenNotionalCapCapped?, Map<String, dynamic>>(
        key: 'capped',
        parse: (v) => OpenNotionalCapCapped.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory OpenNotionalCap.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return OpenNotionalCap(
      uncapped: decode.messageTo<OpenNotionalCapUncapped?>(
        1,
        (b) => OpenNotionalCapUncapped.deserialize(b),
      ),
      capped: decode.messageTo<OpenNotionalCapCapped?>(
        2,
        (b) => OpenNotionalCapCapped.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1OpenNotionalCap;
}

class OpenNotionalCapUncapped extends CosmosProtoMessage {
  const OpenNotionalCapUncapped();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "injective.exchange.v1beta1.OpenNotionalCapUncapped",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory OpenNotionalCapUncapped.fromJson(Map<String, dynamic> json) {
    return OpenNotionalCapUncapped();
  }

  factory OpenNotionalCapUncapped.deserialize(List<int> bytes) {
    return OpenNotionalCapUncapped();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1OpenNotionalCapUncapped;
}

class OpenNotionalCapCapped extends CosmosProtoMessage {
  final String? value;

  const OpenNotionalCapCapped({this.value});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "injective.exchange.v1beta1.OpenNotionalCapCapped",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [value];

  @override
  Map<String, dynamic> toJson() {
    return {'value': value};
  }

  factory OpenNotionalCapCapped.fromJson(Map<String, dynamic> json) {
    return OpenNotionalCapCapped(
      value: json.valueAsString<String?>('value', acceptCamelCase: true),
    );
  }

  factory OpenNotionalCapCapped.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return OpenNotionalCapCapped(value: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1OpenNotionalCapCapped;
}

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
  final AtomicMarketOrderAccessLevel? atomicMarketOrderAccessLevel;

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
      atomicMarketOrderAccessLevel: json
          .valueTo<AtomicMarketOrderAccessLevel?, Object?>(
            key: 'atomic_market_order_access_level',
            parse: (v) => AtomicMarketOrderAccessLevel.from(v),
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
          .getEnum<AtomicMarketOrderAccessLevel?>(
            19,
            AtomicMarketOrderAccessLevel.values,
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
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1Params;
}

class MarketFeeMultiplier extends CosmosProtoMessage {
  final String? marketId;

  final String? feeMultiplier;

  const MarketFeeMultiplier({this.marketId, this.feeMultiplier});

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
  List<Object?> get protoValues => [marketId, feeMultiplier];

  @override
  Map<String, dynamic> toJson() {
    return {'market_id': marketId, 'fee_multiplier': feeMultiplier};
  }

  factory MarketFeeMultiplier.fromJson(Map<String, dynamic> json) {
    return MarketFeeMultiplier(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      feeMultiplier: json.valueAsString<String?>(
        'fee_multiplier',
        acceptCamelCase: true,
      ),
    );
  }

  factory MarketFeeMultiplier.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MarketFeeMultiplier(
      marketId: decode.getString<String?>(1),
      feeMultiplier: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1MarketFeeMultiplier;
}

/// An object describing a derivative market in the Injective Futures Protocol.
class DerivativeMarket extends CosmosProtoMessage {
  /// Ticker for the derivative contract.
  final String? ticker;

  /// Oracle base currency
  final String? oracleBase;

  /// Oracle quote currency
  final String? oracleQuote;

  /// Oracle type
  final injective_oracle_v1beta1_oracle.OracleType? oracleType;

  /// Scale factor for oracle prices.
  final int? oracleScaleFactor;

  /// Address of the quote currency denomination for the derivative contract
  final String? quoteDenom;

  /// Unique market ID.
  final String? marketId;

  /// initial_margin_ratio defines the initial margin ratio of a derivative
  /// market
  final String? initialMarginRatio;

  /// maintenance_margin_ratio defines the maintenance margin ratio of a
  /// derivative market
  final String? maintenanceMarginRatio;

  /// maker_fee_rate defines the maker fee rate of a derivative market
  final String? makerFeeRate;

  /// taker_fee_rate defines the taker fee rate of a derivative market
  final String? takerFeeRate;

  /// relayer_fee_share_rate defines the percentage of the transaction fee shared
  /// with the relayer in a derivative market
  final String? relayerFeeShareRate;

  /// true if the market is a perpetual market. false if the market is an expiry
  /// futures market
  final bool? isPerpetual;

  /// Status of the market
  final MarketStatus? status;

  /// min_price_tick_size defines the minimum tick size that the price and margin
  /// required for orders in the market (in chain format)
  final String? minPriceTickSize;

  /// min_quantity_tick_size defines the minimum tick size of the quantity
  /// required for orders in the market (in chain format)
  final String? minQuantityTickSize;

  /// min_notional defines the minimum notional (in quote asset) required for
  /// orders in the market (in chain format)
  final String? minNotional;

  /// current market admin
  final String? admin;

  /// level of admin permissions
  final int? adminPermissions;

  /// quote token decimals
  final int? quoteDecimals;

  /// reduce_margin_ratio defines the ratio of the margin that is reduced
  final String? reduceMarginRatio;

  /// open_notional_cap defines the maximum open notional for the market
  final OpenNotionalCap? openNotionalCap;

  const DerivativeMarket({
    this.ticker,
    this.oracleBase,
    this.oracleQuote,
    this.oracleType,
    this.oracleScaleFactor,
    this.quoteDenom,
    this.marketId,
    this.initialMarginRatio,
    this.maintenanceMarginRatio,
    this.makerFeeRate,
    this.takerFeeRate,
    this.relayerFeeShareRate,
    this.isPerpetual,
    this.status,
    this.minPriceTickSize,
    this.minQuantityTickSize,
    this.minNotional,
    this.admin,
    this.adminPermissions,
    this.quoteDecimals,
    this.reduceMarginRatio,
    this.openNotionalCap,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.enumType(4),
        ProtoFieldConfig.uint32(5),
        ProtoFieldConfig.string(6),
        ProtoFieldConfig.string(7),
        ProtoFieldConfig.string(8, options: const []),
        ProtoFieldConfig.string(9, options: const []),
        ProtoFieldConfig.string(10, options: const []),
        ProtoFieldConfig.string(11, options: const []),
        ProtoFieldConfig.string(12, options: const []),
        ProtoFieldConfig.bool(13),
        ProtoFieldConfig.enumType(14),
        ProtoFieldConfig.string(15, options: const []),
        ProtoFieldConfig.string(16, options: const []),
        ProtoFieldConfig.string(17, options: const []),
        ProtoFieldConfig.string(18),
        ProtoFieldConfig.uint32(19),
        ProtoFieldConfig.uint32(20),
        ProtoFieldConfig.string(21, options: const []),
        ProtoFieldConfig.message(22, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    ticker,
    oracleBase,
    oracleQuote,
    oracleType,
    oracleScaleFactor,
    quoteDenom,
    marketId,
    initialMarginRatio,
    maintenanceMarginRatio,
    makerFeeRate,
    takerFeeRate,
    relayerFeeShareRate,
    isPerpetual,
    status,
    minPriceTickSize,
    minQuantityTickSize,
    minNotional,
    admin,
    adminPermissions,
    quoteDecimals,
    reduceMarginRatio,
    openNotionalCap,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'ticker': ticker,
      'oracle_base': oracleBase,
      'oracle_quote': oracleQuote,
      'oracle_type': oracleType?.protoName,
      'oracle_scale_factor': oracleScaleFactor,
      'quote_denom': quoteDenom,
      'market_id': marketId,
      'initial_margin_ratio': initialMarginRatio,
      'maintenance_margin_ratio': maintenanceMarginRatio,
      'maker_fee_rate': makerFeeRate,
      'taker_fee_rate': takerFeeRate,
      'relayer_fee_share_rate': relayerFeeShareRate,
      'isPerpetual': isPerpetual,
      'status': status?.protoName,
      'min_price_tick_size': minPriceTickSize,
      'min_quantity_tick_size': minQuantityTickSize,
      'min_notional': minNotional,
      'admin': admin,
      'admin_permissions': adminPermissions,
      'quote_decimals': quoteDecimals,
      'reduce_margin_ratio': reduceMarginRatio,
      'open_notional_cap': openNotionalCap?.toJson(),
    };
  }

  factory DerivativeMarket.fromJson(Map<String, dynamic> json) {
    return DerivativeMarket(
      ticker: json.valueAsString<String?>('ticker', acceptCamelCase: true),
      oracleBase: json.valueAsString<String?>(
        'oracle_base',
        acceptCamelCase: true,
      ),
      oracleQuote: json.valueAsString<String?>(
        'oracle_quote',
        acceptCamelCase: true,
      ),
      oracleType: json
          .valueTo<injective_oracle_v1beta1_oracle.OracleType?, Object?>(
            key: 'oracle_type',
            parse: (v) => injective_oracle_v1beta1_oracle.OracleType.from(v),
          ),
      oracleScaleFactor: json.valueAsInt<int?>(
        'oracle_scale_factor',
        acceptCamelCase: true,
      ),
      quoteDenom: json.valueAsString<String?>(
        'quote_denom',
        acceptCamelCase: true,
      ),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      initialMarginRatio: json.valueAsString<String?>(
        'initial_margin_ratio',
        acceptCamelCase: true,
      ),
      maintenanceMarginRatio: json.valueAsString<String?>(
        'maintenance_margin_ratio',
        acceptCamelCase: true,
      ),
      makerFeeRate: json.valueAsString<String?>(
        'maker_fee_rate',
        acceptCamelCase: true,
      ),
      takerFeeRate: json.valueAsString<String?>(
        'taker_fee_rate',
        acceptCamelCase: true,
      ),
      relayerFeeShareRate: json.valueAsString<String?>(
        'relayer_fee_share_rate',
        acceptCamelCase: true,
      ),
      isPerpetual: json.valueAsBool<bool?>(
        'isPerpetual',
        acceptCamelCase: true,
      ),
      status: json.valueTo<MarketStatus?, Object?>(
        key: 'status',
        parse: (v) => MarketStatus.from(v),
      ),
      minPriceTickSize: json.valueAsString<String?>(
        'min_price_tick_size',
        acceptCamelCase: true,
      ),
      minQuantityTickSize: json.valueAsString<String?>(
        'min_quantity_tick_size',
        acceptCamelCase: true,
      ),
      minNotional: json.valueAsString<String?>(
        'min_notional',
        acceptCamelCase: true,
      ),
      admin: json.valueAsString<String?>('admin', acceptCamelCase: true),
      adminPermissions: json.valueAsInt<int?>(
        'admin_permissions',
        acceptCamelCase: true,
      ),
      quoteDecimals: json.valueAsInt<int?>(
        'quote_decimals',
        acceptCamelCase: true,
      ),
      reduceMarginRatio: json.valueAsString<String?>(
        'reduce_margin_ratio',
        acceptCamelCase: true,
      ),
      openNotionalCap: json.valueTo<OpenNotionalCap?, Map<String, dynamic>>(
        key: 'open_notional_cap',
        parse: (v) => OpenNotionalCap.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory DerivativeMarket.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DerivativeMarket(
      ticker: decode.getString<String?>(1),
      oracleBase: decode.getString<String?>(2),
      oracleQuote: decode.getString<String?>(3),
      oracleType: decode.getEnum<injective_oracle_v1beta1_oracle.OracleType?>(
        4,
        injective_oracle_v1beta1_oracle.OracleType.values,
      ),
      oracleScaleFactor: decode.getInt<int?>(5),
      quoteDenom: decode.getString<String?>(6),
      marketId: decode.getString<String?>(7),
      initialMarginRatio: decode.getString<String?>(8),
      maintenanceMarginRatio: decode.getString<String?>(9),
      makerFeeRate: decode.getString<String?>(10),
      takerFeeRate: decode.getString<String?>(11),
      relayerFeeShareRate: decode.getString<String?>(12),
      isPerpetual: decode.getBool<bool?>(13),
      status: decode.getEnum<MarketStatus?>(14, MarketStatus.values),
      minPriceTickSize: decode.getString<String?>(15),
      minQuantityTickSize: decode.getString<String?>(16),
      minNotional: decode.getString<String?>(17),
      admin: decode.getString<String?>(18),
      adminPermissions: decode.getInt<int?>(19),
      quoteDecimals: decode.getInt<int?>(20),
      reduceMarginRatio: decode.getString<String?>(21),
      openNotionalCap: decode.messageTo<OpenNotionalCap?>(
        22,
        (b) => OpenNotionalCap.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1DerivativeMarket;
}

/// An object describing a binary options market in Injective Protocol.
class BinaryOptionsMarket extends CosmosProtoMessage {
  /// Ticker for the derivative contract.
  final String? ticker;

  /// Oracle symbol
  final String? oracleSymbol;

  /// Oracle Provider
  final String? oracleProvider;

  /// Oracle type
  final injective_oracle_v1beta1_oracle.OracleType? oracleType;

  /// Scale factor for oracle prices.
  final int? oracleScaleFactor;

  /// expiration timestamp
  final BigInt? expirationTimestamp;

  /// expiration timestamp
  final BigInt? settlementTimestamp;

  /// admin of the market
  final String? admin;

  /// Address of the quote currency denomination for the binary options contract
  final String? quoteDenom;

  /// Unique market ID.
  final String? marketId;

  /// maker_fee_rate defines the maker fee rate of a binary options market
  final String? makerFeeRate;

  /// taker_fee_rate defines the taker fee rate of a derivative market
  final String? takerFeeRate;

  /// relayer_fee_share_rate defines the percentage of the transaction fee shared
  /// with the relayer in a derivative market
  final String? relayerFeeShareRate;

  /// Status of the market
  final MarketStatus? status;

  /// min_price_tick_size defines the minimum tick size that the price and margin
  /// required for orders in the market
  final String? minPriceTickSize;

  /// min_quantity_tick_size defines the minimum tick size of the quantity
  /// required for orders in the market
  final String? minQuantityTickSize;

  final String? settlementPrice;

  /// min_notional defines the minimum notional (in quote asset) required for
  /// orders in the market
  final String? minNotional;

  /// level of admin permissions
  final int? adminPermissions;

  /// quote token decimals
  final int? quoteDecimals;

  const BinaryOptionsMarket({
    this.ticker,
    this.oracleSymbol,
    this.oracleProvider,
    this.oracleType,
    this.oracleScaleFactor,
    this.expirationTimestamp,
    this.settlementTimestamp,
    this.admin,
    this.quoteDenom,
    this.marketId,
    this.makerFeeRate,
    this.takerFeeRate,
    this.relayerFeeShareRate,
    this.status,
    this.minPriceTickSize,
    this.minQuantityTickSize,
    this.settlementPrice,
    this.minNotional,
    this.adminPermissions,
    this.quoteDecimals,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.enumType(4),
        ProtoFieldConfig.uint32(5),
        ProtoFieldConfig.int64(6),
        ProtoFieldConfig.int64(7),
        ProtoFieldConfig.string(8),
        ProtoFieldConfig.string(9),
        ProtoFieldConfig.string(10),
        ProtoFieldConfig.string(11, options: const []),
        ProtoFieldConfig.string(12, options: const []),
        ProtoFieldConfig.string(13, options: const []),
        ProtoFieldConfig.enumType(14),
        ProtoFieldConfig.string(15, options: const []),
        ProtoFieldConfig.string(16, options: const []),
        ProtoFieldConfig.string(17, options: const []),
        ProtoFieldConfig.string(18, options: const []),
        ProtoFieldConfig.uint32(19),
        ProtoFieldConfig.uint32(20),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    ticker,
    oracleSymbol,
    oracleProvider,
    oracleType,
    oracleScaleFactor,
    expirationTimestamp,
    settlementTimestamp,
    admin,
    quoteDenom,
    marketId,
    makerFeeRate,
    takerFeeRate,
    relayerFeeShareRate,
    status,
    minPriceTickSize,
    minQuantityTickSize,
    settlementPrice,
    minNotional,
    adminPermissions,
    quoteDecimals,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'ticker': ticker,
      'oracle_symbol': oracleSymbol,
      'oracle_provider': oracleProvider,
      'oracle_type': oracleType?.protoName,
      'oracle_scale_factor': oracleScaleFactor,
      'expiration_timestamp': expirationTimestamp?.toString(),
      'settlement_timestamp': settlementTimestamp?.toString(),
      'admin': admin,
      'quote_denom': quoteDenom,
      'market_id': marketId,
      'maker_fee_rate': makerFeeRate,
      'taker_fee_rate': takerFeeRate,
      'relayer_fee_share_rate': relayerFeeShareRate,
      'status': status?.protoName,
      'min_price_tick_size': minPriceTickSize,
      'min_quantity_tick_size': minQuantityTickSize,
      'settlement_price': settlementPrice,
      'min_notional': minNotional,
      'admin_permissions': adminPermissions,
      'quote_decimals': quoteDecimals,
    };
  }

  factory BinaryOptionsMarket.fromJson(Map<String, dynamic> json) {
    return BinaryOptionsMarket(
      ticker: json.valueAsString<String?>('ticker', acceptCamelCase: true),
      oracleSymbol: json.valueAsString<String?>(
        'oracle_symbol',
        acceptCamelCase: true,
      ),
      oracleProvider: json.valueAsString<String?>(
        'oracle_provider',
        acceptCamelCase: true,
      ),
      oracleType: json
          .valueTo<injective_oracle_v1beta1_oracle.OracleType?, Object?>(
            key: 'oracle_type',
            parse: (v) => injective_oracle_v1beta1_oracle.OracleType.from(v),
          ),
      oracleScaleFactor: json.valueAsInt<int?>(
        'oracle_scale_factor',
        acceptCamelCase: true,
      ),
      expirationTimestamp: json.valueAsBigInt<BigInt?>(
        'expiration_timestamp',
        acceptCamelCase: true,
      ),
      settlementTimestamp: json.valueAsBigInt<BigInt?>(
        'settlement_timestamp',
        acceptCamelCase: true,
      ),
      admin: json.valueAsString<String?>('admin', acceptCamelCase: true),
      quoteDenom: json.valueAsString<String?>(
        'quote_denom',
        acceptCamelCase: true,
      ),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      makerFeeRate: json.valueAsString<String?>(
        'maker_fee_rate',
        acceptCamelCase: true,
      ),
      takerFeeRate: json.valueAsString<String?>(
        'taker_fee_rate',
        acceptCamelCase: true,
      ),
      relayerFeeShareRate: json.valueAsString<String?>(
        'relayer_fee_share_rate',
        acceptCamelCase: true,
      ),
      status: json.valueTo<MarketStatus?, Object?>(
        key: 'status',
        parse: (v) => MarketStatus.from(v),
      ),
      minPriceTickSize: json.valueAsString<String?>(
        'min_price_tick_size',
        acceptCamelCase: true,
      ),
      minQuantityTickSize: json.valueAsString<String?>(
        'min_quantity_tick_size',
        acceptCamelCase: true,
      ),
      settlementPrice: json.valueAsString<String?>(
        'settlement_price',
        acceptCamelCase: true,
      ),
      minNotional: json.valueAsString<String?>(
        'min_notional',
        acceptCamelCase: true,
      ),
      adminPermissions: json.valueAsInt<int?>(
        'admin_permissions',
        acceptCamelCase: true,
      ),
      quoteDecimals: json.valueAsInt<int?>(
        'quote_decimals',
        acceptCamelCase: true,
      ),
    );
  }

  factory BinaryOptionsMarket.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BinaryOptionsMarket(
      ticker: decode.getString<String?>(1),
      oracleSymbol: decode.getString<String?>(2),
      oracleProvider: decode.getString<String?>(3),
      oracleType: decode.getEnum<injective_oracle_v1beta1_oracle.OracleType?>(
        4,
        injective_oracle_v1beta1_oracle.OracleType.values,
      ),
      oracleScaleFactor: decode.getInt<int?>(5),
      expirationTimestamp: decode.getBigInt<BigInt?>(6),
      settlementTimestamp: decode.getBigInt<BigInt?>(7),
      admin: decode.getString<String?>(8),
      quoteDenom: decode.getString<String?>(9),
      marketId: decode.getString<String?>(10),
      makerFeeRate: decode.getString<String?>(11),
      takerFeeRate: decode.getString<String?>(12),
      relayerFeeShareRate: decode.getString<String?>(13),
      status: decode.getEnum<MarketStatus?>(14, MarketStatus.values),
      minPriceTickSize: decode.getString<String?>(15),
      minQuantityTickSize: decode.getString<String?>(16),
      settlementPrice: decode.getString<String?>(17),
      minNotional: decode.getString<String?>(18),
      adminPermissions: decode.getInt<int?>(19),
      quoteDecimals: decode.getInt<int?>(20),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1BinaryOptionsMarket;
}

class ExpiryFuturesMarketInfo extends CosmosProtoMessage {
  /// market ID.
  final String? marketId;

  /// expiration_timestamp defines the expiration time for a time expiry futures
  /// market.
  final BigInt? expirationTimestamp;

  /// expiration_twap_start_timestamp defines the start time of the TWAP
  /// calculation window
  final BigInt? twapStartTimestamp;

  /// expiration_twap_start_price_cumulative defines the cumulative price for the
  /// start of the TWAP window (in chain format)
  final String? expirationTwapStartPriceCumulative;

  /// settlement_price defines the settlement price for a time expiry futures
  /// market (in chain format)
  final String? settlementPrice;

  const ExpiryFuturesMarketInfo({
    this.marketId,
    this.expirationTimestamp,
    this.twapStartTimestamp,
    this.expirationTwapStartPriceCumulative,
    this.settlementPrice,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.int64(2),
        ProtoFieldConfig.int64(3),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    marketId,
    expirationTimestamp,
    twapStartTimestamp,
    expirationTwapStartPriceCumulative,
    settlementPrice,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'market_id': marketId,
      'expiration_timestamp': expirationTimestamp?.toString(),
      'twap_start_timestamp': twapStartTimestamp?.toString(),
      'expiration_twap_start_price_cumulative':
          expirationTwapStartPriceCumulative,
      'settlement_price': settlementPrice,
    };
  }

  factory ExpiryFuturesMarketInfo.fromJson(Map<String, dynamic> json) {
    return ExpiryFuturesMarketInfo(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      expirationTimestamp: json.valueAsBigInt<BigInt?>(
        'expiration_timestamp',
        acceptCamelCase: true,
      ),
      twapStartTimestamp: json.valueAsBigInt<BigInt?>(
        'twap_start_timestamp',
        acceptCamelCase: true,
      ),
      expirationTwapStartPriceCumulative: json.valueAsString<String?>(
        'expiration_twap_start_price_cumulative',
        acceptCamelCase: true,
      ),
      settlementPrice: json.valueAsString<String?>(
        'settlement_price',
        acceptCamelCase: true,
      ),
    );
  }

  factory ExpiryFuturesMarketInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ExpiryFuturesMarketInfo(
      marketId: decode.getString<String?>(1),
      expirationTimestamp: decode.getBigInt<BigInt?>(2),
      twapStartTimestamp: decode.getBigInt<BigInt?>(3),
      expirationTwapStartPriceCumulative: decode.getString<String?>(4),
      settlementPrice: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1ExpiryFuturesMarketInfo;
}

class PerpetualMarketInfo extends CosmosProtoMessage {
  /// market ID.
  final String? marketId;

  /// hourly_funding_rate_cap defines the maximum absolute value of the hourly
  /// funding rate
  final String? hourlyFundingRateCap;

  /// hourly_interest_rate defines the hourly interest rate
  final String? hourlyInterestRate;

  /// next_funding_timestamp defines the next funding timestamp in seconds of a
  /// perpetual market
  final BigInt? nextFundingTimestamp;

  /// funding_interval defines the next funding interval in seconds of a
  /// perpetual market.
  final BigInt? fundingInterval;

  const PerpetualMarketInfo({
    this.marketId,
    this.hourlyFundingRateCap,
    this.hourlyInterestRate,
    this.nextFundingTimestamp,
    this.fundingInterval,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.int64(4),
        ProtoFieldConfig.int64(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    marketId,
    hourlyFundingRateCap,
    hourlyInterestRate,
    nextFundingTimestamp,
    fundingInterval,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'market_id': marketId,
      'hourly_funding_rate_cap': hourlyFundingRateCap,
      'hourly_interest_rate': hourlyInterestRate,
      'next_funding_timestamp': nextFundingTimestamp?.toString(),
      'funding_interval': fundingInterval?.toString(),
    };
  }

  factory PerpetualMarketInfo.fromJson(Map<String, dynamic> json) {
    return PerpetualMarketInfo(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      hourlyFundingRateCap: json.valueAsString<String?>(
        'hourly_funding_rate_cap',
        acceptCamelCase: true,
      ),
      hourlyInterestRate: json.valueAsString<String?>(
        'hourly_interest_rate',
        acceptCamelCase: true,
      ),
      nextFundingTimestamp: json.valueAsBigInt<BigInt?>(
        'next_funding_timestamp',
        acceptCamelCase: true,
      ),
      fundingInterval: json.valueAsBigInt<BigInt?>(
        'funding_interval',
        acceptCamelCase: true,
      ),
    );
  }

  factory PerpetualMarketInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PerpetualMarketInfo(
      marketId: decode.getString<String?>(1),
      hourlyFundingRateCap: decode.getString<String?>(2),
      hourlyInterestRate: decode.getString<String?>(3),
      nextFundingTimestamp: decode.getBigInt<BigInt?>(4),
      fundingInterval: decode.getBigInt<BigInt?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1PerpetualMarketInfo;
}

class PerpetualMarketFunding extends CosmosProtoMessage {
  /// cumulative_funding defines the cumulative funding of a perpetual market.
  final String? cumulativeFunding;

  /// cumulative_price defines the running time-integral of the perp premium
  /// ((VWAP - mark_price) / mark_price) i.e., sum(premium * seconds)
  /// used to compute the interval’s average premium for funding
  final String? cumulativePrice;

  /// the last timestamp in seconds
  final BigInt? lastTimestamp;

  const PerpetualMarketFunding({
    this.cumulativeFunding,
    this.cumulativePrice,
    this.lastTimestamp,
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
        ProtoFieldConfig.int64(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    cumulativeFunding,
    cumulativePrice,
    lastTimestamp,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'cumulative_funding': cumulativeFunding,
      'cumulative_price': cumulativePrice,
      'last_timestamp': lastTimestamp?.toString(),
    };
  }

  factory PerpetualMarketFunding.fromJson(Map<String, dynamic> json) {
    return PerpetualMarketFunding(
      cumulativeFunding: json.valueAsString<String?>(
        'cumulative_funding',
        acceptCamelCase: true,
      ),
      cumulativePrice: json.valueAsString<String?>(
        'cumulative_price',
        acceptCamelCase: true,
      ),
      lastTimestamp: json.valueAsBigInt<BigInt?>(
        'last_timestamp',
        acceptCamelCase: true,
      ),
    );
  }

  factory PerpetualMarketFunding.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PerpetualMarketFunding(
      cumulativeFunding: decode.getString<String?>(1),
      cumulativePrice: decode.getString<String?>(2),
      lastTimestamp: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1PerpetualMarketFunding;
}

class DerivativeMarketSettlementInfo extends CosmosProtoMessage {
  /// market ID.
  final String? marketId;

  /// settlement_price defines the settlement price
  final String? settlementPrice;

  const DerivativeMarketSettlementInfo({this.marketId, this.settlementPrice});

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
  List<Object?> get protoValues => [marketId, settlementPrice];

  @override
  Map<String, dynamic> toJson() {
    return {'market_id': marketId, 'settlement_price': settlementPrice};
  }

  factory DerivativeMarketSettlementInfo.fromJson(Map<String, dynamic> json) {
    return DerivativeMarketSettlementInfo(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      settlementPrice: json.valueAsString<String?>(
        'settlement_price',
        acceptCamelCase: true,
      ),
    );
  }

  factory DerivativeMarketSettlementInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DerivativeMarketSettlementInfo(
      marketId: decode.getString<String?>(1),
      settlementPrice: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1DerivativeMarketSettlementInfo;
}

class MidPriceAndTOB extends CosmosProtoMessage {
  /// mid price of the market (in chain format)
  final String? midPrice;

  /// best buy price of the market (in chain format)
  final String? bestBuyPrice;

  /// best sell price of the market (in chain format)
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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1MidPriceAndTOB;
}

/// An object describing trade pair of two assets.
class SpotMarket extends CosmosProtoMessage {
  /// A name of the pair in format AAA/BBB, where AAA is base asset, BBB is quote
  /// asset.
  final String? ticker;

  /// Coin denom used for the base asset
  final String? baseDenom;

  /// Coin used for the quote asset
  final String? quoteDenom;

  /// maker_fee_rate defines the fee percentage makers pay when trading
  final String? makerFeeRate;

  /// taker_fee_rate defines the fee percentage takers pay when trading
  final String? takerFeeRate;

  /// relayer_fee_share_rate defines the percentage of the transaction fee shared
  /// with the relayer in a derivative market
  final String? relayerFeeShareRate;

  /// Unique market ID.
  final String? marketId;

  /// Status of the market
  final MarketStatus? status;

  /// min_price_tick_size defines the minimum tick size that the price required
  /// for orders in the market (in chain format)
  final String? minPriceTickSize;

  /// min_quantity_tick_size defines the minimum tick size of the quantity
  /// required for orders in the market (in chain format)
  final String? minQuantityTickSize;

  /// min_notional defines the minimum notional (in quote asset) required for
  /// orders in the market (in chain format)
  final String? minNotional;

  /// current market admin
  final String? admin;

  /// level of admin permissions
  final int? adminPermissions;

  /// base token decimals
  final int? baseDecimals;

  /// quote token decimals
  final int? quoteDecimals;

  const SpotMarket({
    this.ticker,
    this.baseDenom,
    this.quoteDenom,
    this.makerFeeRate,
    this.takerFeeRate,
    this.relayerFeeShareRate,
    this.marketId,
    this.status,
    this.minPriceTickSize,
    this.minQuantityTickSize,
    this.minNotional,
    this.admin,
    this.adminPermissions,
    this.baseDecimals,
    this.quoteDecimals,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(7),
        ProtoFieldConfig.enumType(8),
        ProtoFieldConfig.string(9, options: const []),
        ProtoFieldConfig.string(10, options: const []),
        ProtoFieldConfig.string(11, options: const []),
        ProtoFieldConfig.string(12),
        ProtoFieldConfig.uint32(13),
        ProtoFieldConfig.uint32(14),
        ProtoFieldConfig.uint32(15),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    ticker,
    baseDenom,
    quoteDenom,
    makerFeeRate,
    takerFeeRate,
    relayerFeeShareRate,
    marketId,
    status,
    minPriceTickSize,
    minQuantityTickSize,
    minNotional,
    admin,
    adminPermissions,
    baseDecimals,
    quoteDecimals,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'ticker': ticker,
      'base_denom': baseDenom,
      'quote_denom': quoteDenom,
      'maker_fee_rate': makerFeeRate,
      'taker_fee_rate': takerFeeRate,
      'relayer_fee_share_rate': relayerFeeShareRate,
      'market_id': marketId,
      'status': status?.protoName,
      'min_price_tick_size': minPriceTickSize,
      'min_quantity_tick_size': minQuantityTickSize,
      'min_notional': minNotional,
      'admin': admin,
      'admin_permissions': adminPermissions,
      'base_decimals': baseDecimals,
      'quote_decimals': quoteDecimals,
    };
  }

  factory SpotMarket.fromJson(Map<String, dynamic> json) {
    return SpotMarket(
      ticker: json.valueAsString<String?>('ticker', acceptCamelCase: true),
      baseDenom: json.valueAsString<String?>(
        'base_denom',
        acceptCamelCase: true,
      ),
      quoteDenom: json.valueAsString<String?>(
        'quote_denom',
        acceptCamelCase: true,
      ),
      makerFeeRate: json.valueAsString<String?>(
        'maker_fee_rate',
        acceptCamelCase: true,
      ),
      takerFeeRate: json.valueAsString<String?>(
        'taker_fee_rate',
        acceptCamelCase: true,
      ),
      relayerFeeShareRate: json.valueAsString<String?>(
        'relayer_fee_share_rate',
        acceptCamelCase: true,
      ),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      status: json.valueTo<MarketStatus?, Object?>(
        key: 'status',
        parse: (v) => MarketStatus.from(v),
      ),
      minPriceTickSize: json.valueAsString<String?>(
        'min_price_tick_size',
        acceptCamelCase: true,
      ),
      minQuantityTickSize: json.valueAsString<String?>(
        'min_quantity_tick_size',
        acceptCamelCase: true,
      ),
      minNotional: json.valueAsString<String?>(
        'min_notional',
        acceptCamelCase: true,
      ),
      admin: json.valueAsString<String?>('admin', acceptCamelCase: true),
      adminPermissions: json.valueAsInt<int?>(
        'admin_permissions',
        acceptCamelCase: true,
      ),
      baseDecimals: json.valueAsInt<int?>(
        'base_decimals',
        acceptCamelCase: true,
      ),
      quoteDecimals: json.valueAsInt<int?>(
        'quote_decimals',
        acceptCamelCase: true,
      ),
    );
  }

  factory SpotMarket.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SpotMarket(
      ticker: decode.getString<String?>(1),
      baseDenom: decode.getString<String?>(2),
      quoteDenom: decode.getString<String?>(3),
      makerFeeRate: decode.getString<String?>(4),
      takerFeeRate: decode.getString<String?>(5),
      relayerFeeShareRate: decode.getString<String?>(6),
      marketId: decode.getString<String?>(7),
      status: decode.getEnum<MarketStatus?>(8, MarketStatus.values),
      minPriceTickSize: decode.getString<String?>(9),
      minQuantityTickSize: decode.getString<String?>(10),
      minNotional: decode.getString<String?>(11),
      admin: decode.getString<String?>(12),
      adminPermissions: decode.getInt<int?>(13),
      baseDecimals: decode.getInt<int?>(14),
      quoteDecimals: decode.getInt<int?>(15),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1SpotMarket;
}

/// A subaccount's deposit for a given base currency
class Deposit extends CosmosProtoMessage {
  final String? availableBalance;

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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1Deposit;
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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1SubaccountTradeNonce;
}

class OrderInfo extends CosmosProtoMessage {
  /// bytes32 subaccount ID that created the order
  final String? subaccountId;

  /// address fee_recipient address that will receive fees for the order
  final String? feeRecipient;

  /// price of the order
  final String? price;

  /// quantity of the order
  final String? quantity;

  final String? cid;

  const OrderInfo({
    this.subaccountId,
    this.feeRecipient,
    this.price,
    this.quantity,
    this.cid,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    subaccountId,
    feeRecipient,
    price,
    quantity,
    cid,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'subaccount_id': subaccountId,
      'fee_recipient': feeRecipient,
      'price': price,
      'quantity': quantity,
      'cid': cid,
    };
  }

  factory OrderInfo.fromJson(Map<String, dynamic> json) {
    return OrderInfo(
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      feeRecipient: json.valueAsString<String?>(
        'fee_recipient',
        acceptCamelCase: true,
      ),
      price: json.valueAsString<String?>('price', acceptCamelCase: true),
      quantity: json.valueAsString<String?>('quantity', acceptCamelCase: true),
      cid: json.valueAsString<String?>('cid', acceptCamelCase: true),
    );
  }

  factory OrderInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return OrderInfo(
      subaccountId: decode.getString<String?>(1),
      feeRecipient: decode.getString<String?>(2),
      price: decode.getString<String?>(3),
      quantity: decode.getString<String?>(4),
      cid: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1OrderInfo;
}

class SpotOrder extends CosmosProtoMessage {
  /// market_id represents the unique ID of the market
  final String? marketId;

  /// order_info contains the information of the order
  final OrderInfo? orderInfo;

  /// order types
  final OrderType? orderType;

  /// trigger_price is the trigger price used by stop/take orders
  final String? triggerPrice;

  const SpotOrder({
    this.marketId,
    this.orderInfo,
    this.orderType,
    this.triggerPrice,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.enumType(3),
        ProtoFieldConfig.string(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    marketId,
    orderInfo,
    orderType,
    triggerPrice,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'market_id': marketId,
      'order_info': orderInfo?.toJson(),
      'order_type': orderType?.protoName,
      'trigger_price': triggerPrice,
    };
  }

  factory SpotOrder.fromJson(Map<String, dynamic> json) {
    return SpotOrder(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      orderInfo: json.valueTo<OrderInfo?, Map<String, dynamic>>(
        key: 'order_info',
        parse: (v) => OrderInfo.fromJson(v),
        acceptCamelCase: true,
      ),
      orderType: json.valueTo<OrderType?, Object?>(
        key: 'order_type',
        parse: (v) => OrderType.from(v),
      ),
      triggerPrice: json.valueAsString<String?>(
        'trigger_price',
        acceptCamelCase: true,
      ),
    );
  }

  factory SpotOrder.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SpotOrder(
      marketId: decode.getString<String?>(1),
      orderInfo: decode.messageTo<OrderInfo?>(
        2,
        (b) => OrderInfo.deserialize(b),
      ),
      orderType: decode.getEnum<OrderType?>(3, OrderType.values),
      triggerPrice: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1SpotOrder;
}

/// A valid Spot limit order with Metadata.
class SpotLimitOrder extends CosmosProtoMessage {
  /// order_info contains the information of the order
  final OrderInfo? orderInfo;

  /// order types
  final OrderType? orderType;

  /// the amount of the quantity remaining fillable
  final String? fillable;

  /// trigger_price is the trigger price used by stop/take orders
  final String? triggerPrice;

  final List<int>? orderHash;

  const SpotLimitOrder({
    this.orderInfo,
    this.orderType,
    this.fillable,
    this.triggerPrice,
    this.orderHash,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.enumType(2),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.bytes(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    orderInfo,
    orderType,
    fillable,
    triggerPrice,
    orderHash,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'order_info': orderInfo?.toJson(),
      'order_type': orderType?.protoName,
      'fillable': fillable,
      'trigger_price': triggerPrice,
      'order_hash': switch (orderHash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory SpotLimitOrder.fromJson(Map<String, dynamic> json) {
    return SpotLimitOrder(
      orderInfo: json.valueTo<OrderInfo?, Map<String, dynamic>>(
        key: 'order_info',
        parse: (v) => OrderInfo.fromJson(v),
        acceptCamelCase: true,
      ),
      orderType: json.valueTo<OrderType?, Object?>(
        key: 'order_type',
        parse: (v) => OrderType.from(v),
      ),
      fillable: json.valueAsString<String?>('fillable', acceptCamelCase: true),
      triggerPrice: json.valueAsString<String?>(
        'trigger_price',
        acceptCamelCase: true,
      ),
      orderHash: json.valueAsBytes<List<int>?>(
        'order_hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory SpotLimitOrder.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SpotLimitOrder(
      orderInfo: decode.messageTo<OrderInfo?>(
        1,
        (b) => OrderInfo.deserialize(b),
      ),
      orderType: decode.getEnum<OrderType?>(2, OrderType.values),
      fillable: decode.getString<String?>(3),
      triggerPrice: decode.getString<String?>(4),
      orderHash: decode.getBytes<List<int>?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1SpotLimitOrder;
}

class DerivativeOrder extends CosmosProtoMessage {
  /// market_id represents the unique ID of the market
  final String? marketId;

  /// order_info contains the information of the order
  final OrderInfo? orderInfo;

  /// order types
  final OrderType? orderType;

  /// margin is the margin used by the limit order
  final String? margin;

  /// trigger_price is the trigger price used by stop/take orders
  final String? triggerPrice;

  const DerivativeOrder({
    this.marketId,
    this.orderInfo,
    this.orderType,
    this.margin,
    this.triggerPrice,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.enumType(3),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    marketId,
    orderInfo,
    orderType,
    margin,
    triggerPrice,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'market_id': marketId,
      'order_info': orderInfo?.toJson(),
      'order_type': orderType?.protoName,
      'margin': margin,
      'trigger_price': triggerPrice,
    };
  }

  factory DerivativeOrder.fromJson(Map<String, dynamic> json) {
    return DerivativeOrder(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      orderInfo: json.valueTo<OrderInfo?, Map<String, dynamic>>(
        key: 'order_info',
        parse: (v) => OrderInfo.fromJson(v),
        acceptCamelCase: true,
      ),
      orderType: json.valueTo<OrderType?, Object?>(
        key: 'order_type',
        parse: (v) => OrderType.from(v),
      ),
      margin: json.valueAsString<String?>('margin', acceptCamelCase: true),
      triggerPrice: json.valueAsString<String?>(
        'trigger_price',
        acceptCamelCase: true,
      ),
    );
  }

  factory DerivativeOrder.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DerivativeOrder(
      marketId: decode.getString<String?>(1),
      orderInfo: decode.messageTo<OrderInfo?>(
        2,
        (b) => OrderInfo.deserialize(b),
      ),
      orderType: decode.getEnum<OrderType?>(3, OrderType.values),
      margin: decode.getString<String?>(4),
      triggerPrice: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1DerivativeOrder;
}

class SubaccountOrderbookMetadata extends CosmosProtoMessage {
  /// The number of vanilla limit orders
  final int? vanillaLimitOrderCount;

  /// The number of reduce-only limit orders
  final int? reduceOnlyLimitOrderCount;

  /// The aggregate quantity of the subaccount's reduce-only limit orders (in
  /// chain format)
  final String? aggregateReduceOnlyQuantity;

  /// The aggregate quantity of the subaccount's vanilla limit orders (in chain
  /// format)
  final String? aggregateVanillaQuantity;

  /// The number of vanilla conditional orders
  final int? vanillaConditionalOrderCount;

  /// The number of reduce-only conditional orders
  final int? reduceOnlyConditionalOrderCount;

  const SubaccountOrderbookMetadata({
    this.vanillaLimitOrderCount,
    this.reduceOnlyLimitOrderCount,
    this.aggregateReduceOnlyQuantity,
    this.aggregateVanillaQuantity,
    this.vanillaConditionalOrderCount,
    this.reduceOnlyConditionalOrderCount,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint32(1),
        ProtoFieldConfig.uint32(2),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.uint32(5),
        ProtoFieldConfig.uint32(6),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    vanillaLimitOrderCount,
    reduceOnlyLimitOrderCount,
    aggregateReduceOnlyQuantity,
    aggregateVanillaQuantity,
    vanillaConditionalOrderCount,
    reduceOnlyConditionalOrderCount,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'vanilla_limit_order_count': vanillaLimitOrderCount,
      'reduce_only_limit_order_count': reduceOnlyLimitOrderCount,
      'aggregate_reduce_only_quantity': aggregateReduceOnlyQuantity,
      'aggregate_vanilla_quantity': aggregateVanillaQuantity,
      'vanilla_conditional_order_count': vanillaConditionalOrderCount,
      'reduce_only_conditional_order_count': reduceOnlyConditionalOrderCount,
    };
  }

  factory SubaccountOrderbookMetadata.fromJson(Map<String, dynamic> json) {
    return SubaccountOrderbookMetadata(
      vanillaLimitOrderCount: json.valueAsInt<int?>(
        'vanilla_limit_order_count',
        acceptCamelCase: true,
      ),
      reduceOnlyLimitOrderCount: json.valueAsInt<int?>(
        'reduce_only_limit_order_count',
        acceptCamelCase: true,
      ),
      aggregateReduceOnlyQuantity: json.valueAsString<String?>(
        'aggregate_reduce_only_quantity',
        acceptCamelCase: true,
      ),
      aggregateVanillaQuantity: json.valueAsString<String?>(
        'aggregate_vanilla_quantity',
        acceptCamelCase: true,
      ),
      vanillaConditionalOrderCount: json.valueAsInt<int?>(
        'vanilla_conditional_order_count',
        acceptCamelCase: true,
      ),
      reduceOnlyConditionalOrderCount: json.valueAsInt<int?>(
        'reduce_only_conditional_order_count',
        acceptCamelCase: true,
      ),
    );
  }

  factory SubaccountOrderbookMetadata.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SubaccountOrderbookMetadata(
      vanillaLimitOrderCount: decode.getInt<int?>(1),
      reduceOnlyLimitOrderCount: decode.getInt<int?>(2),
      aggregateReduceOnlyQuantity: decode.getString<String?>(3),
      aggregateVanillaQuantity: decode.getString<String?>(4),
      vanillaConditionalOrderCount: decode.getInt<int?>(5),
      reduceOnlyConditionalOrderCount: decode.getInt<int?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1SubaccountOrderbookMetadata;
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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1SubaccountOrder;
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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1SubaccountOrderData;
}

/// A valid Derivative limit order with Metadata.
class DerivativeLimitOrder extends CosmosProtoMessage {
  /// order_info contains the information of the order
  final OrderInfo? orderInfo;

  /// order types
  final OrderType? orderType;

  /// margin is the margin used by the limit order
  final String? margin;

  /// the amount of the quantity remaining fillable
  final String? fillable;

  /// trigger_price is the trigger price used by stop/take orders
  final String? triggerPrice;

  final List<int>? orderHash;

  const DerivativeLimitOrder({
    this.orderInfo,
    this.orderType,
    this.margin,
    this.fillable,
    this.triggerPrice,
    this.orderHash,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.enumType(2),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.bytes(6),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    orderInfo,
    orderType,
    margin,
    fillable,
    triggerPrice,
    orderHash,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'order_info': orderInfo?.toJson(),
      'order_type': orderType?.protoName,
      'margin': margin,
      'fillable': fillable,
      'trigger_price': triggerPrice,
      'order_hash': switch (orderHash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory DerivativeLimitOrder.fromJson(Map<String, dynamic> json) {
    return DerivativeLimitOrder(
      orderInfo: json.valueTo<OrderInfo?, Map<String, dynamic>>(
        key: 'order_info',
        parse: (v) => OrderInfo.fromJson(v),
        acceptCamelCase: true,
      ),
      orderType: json.valueTo<OrderType?, Object?>(
        key: 'order_type',
        parse: (v) => OrderType.from(v),
      ),
      margin: json.valueAsString<String?>('margin', acceptCamelCase: true),
      fillable: json.valueAsString<String?>('fillable', acceptCamelCase: true),
      triggerPrice: json.valueAsString<String?>(
        'trigger_price',
        acceptCamelCase: true,
      ),
      orderHash: json.valueAsBytes<List<int>?>(
        'order_hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory DerivativeLimitOrder.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DerivativeLimitOrder(
      orderInfo: decode.messageTo<OrderInfo?>(
        1,
        (b) => OrderInfo.deserialize(b),
      ),
      orderType: decode.getEnum<OrderType?>(2, OrderType.values),
      margin: decode.getString<String?>(3),
      fillable: decode.getString<String?>(4),
      triggerPrice: decode.getString<String?>(5),
      orderHash: decode.getBytes<List<int>?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1DerivativeLimitOrder;
}

/// A valid Derivative market order with Metadata.
class DerivativeMarketOrder extends CosmosProtoMessage {
  /// order_info contains the information of the order
  final OrderInfo? orderInfo;

  /// order types
  final OrderType? orderType;

  final String? margin;

  final String? marginHold;

  /// trigger_price is the trigger price used by stop/take orders
  final String? triggerPrice;

  final List<int>? orderHash;

  const DerivativeMarketOrder({
    this.orderInfo,
    this.orderType,
    this.margin,
    this.marginHold,
    this.triggerPrice,
    this.orderHash,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.enumType(2),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.bytes(6),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    orderInfo,
    orderType,
    margin,
    marginHold,
    triggerPrice,
    orderHash,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'order_info': orderInfo?.toJson(),
      'order_type': orderType?.protoName,
      'margin': margin,
      'margin_hold': marginHold,
      'trigger_price': triggerPrice,
      'order_hash': switch (orderHash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory DerivativeMarketOrder.fromJson(Map<String, dynamic> json) {
    return DerivativeMarketOrder(
      orderInfo: json.valueTo<OrderInfo?, Map<String, dynamic>>(
        key: 'order_info',
        parse: (v) => OrderInfo.fromJson(v),
        acceptCamelCase: true,
      ),
      orderType: json.valueTo<OrderType?, Object?>(
        key: 'order_type',
        parse: (v) => OrderType.from(v),
      ),
      margin: json.valueAsString<String?>('margin', acceptCamelCase: true),
      marginHold: json.valueAsString<String?>(
        'margin_hold',
        acceptCamelCase: true,
      ),
      triggerPrice: json.valueAsString<String?>(
        'trigger_price',
        acceptCamelCase: true,
      ),
      orderHash: json.valueAsBytes<List<int>?>(
        'order_hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory DerivativeMarketOrder.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DerivativeMarketOrder(
      orderInfo: decode.messageTo<OrderInfo?>(
        1,
        (b) => OrderInfo.deserialize(b),
      ),
      orderType: decode.getEnum<OrderType?>(2, OrderType.values),
      margin: decode.getString<String?>(3),
      marginHold: decode.getString<String?>(4),
      triggerPrice: decode.getString<String?>(5),
      orderHash: decode.getBytes<List<int>?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1DerivativeMarketOrder;
}

class Position extends CosmosProtoMessage {
  /// True if the position is long. False if the position is short.
  final bool? isLong;

  /// The quantity of the position (in chain format)
  final String? quantity;

  /// The entry price of the position (in chain format)
  final String? entryPrice;

  /// The margin of the position (in chain format)
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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1Position;
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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1PositionDelta;
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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1PointsMultiplier;
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
          .injectiveExchangeV1beta1TradingRewardCampaignBoostInfo;
}

class CampaignRewardPool extends CosmosProtoMessage {
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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1CampaignRewardPool;
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
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1TradingRewardCampaignInfo;
}

class FeeDiscountTierInfo extends CosmosProtoMessage {
  /// the maker discount rate
  final String? makerDiscountRate;

  /// the taker discount rate
  final String? takerDiscountRate;

  /// the staked amount required to qualify for the discount (in chain format)
  final String? stakedAmount;

  /// the volume required to qualify for the discount (in chain format)
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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1FeeDiscountTierInfo;
}

class FeeDiscountSchedule extends CosmosProtoMessage {
  final BigInt? bucketCount;

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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1FeeDiscountSchedule;
}

class FeeDiscountTierTTL extends CosmosProtoMessage {
  final BigInt? tier;

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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1FeeDiscountTierTTL;
}

class VolumeRecord extends CosmosProtoMessage {
  final String? makerVolume;

  final String? takerVolume;

  const VolumeRecord({this.makerVolume, this.takerVolume});

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
  List<Object?> get protoValues => [makerVolume, takerVolume];

  @override
  Map<String, dynamic> toJson() {
    return {'maker_volume': makerVolume, 'taker_volume': takerVolume};
  }

  factory VolumeRecord.fromJson(Map<String, dynamic> json) {
    return VolumeRecord(
      makerVolume: json.valueAsString<String?>(
        'maker_volume',
        acceptCamelCase: true,
      ),
      takerVolume: json.valueAsString<String?>(
        'taker_volume',
        acceptCamelCase: true,
      ),
    );
  }

  factory VolumeRecord.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return VolumeRecord(
      makerVolume: decode.getString<String?>(1),
      takerVolume: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1VolumeRecord;
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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1TradeRecords;
}

class TradeRecord extends CosmosProtoMessage {
  /// the timestamp of the trade
  final BigInt? timestamp;

  /// the price of the trade (in chain format)
  final String? price;

  /// the quantity of the trade (in chain format)
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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1TradeRecord;
}

class Level extends CosmosProtoMessage {
  /// price (in chain format)
  final String? p;

  /// quantity (in chain format)
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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1Level;
}

class AggregateSubaccountVolumeRecord extends CosmosProtoMessage {
  /// the subaccount ID
  final String? subaccountId;

  /// the subaccount volumes for each market
  final List<MarketVolume> marketVolumes;

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
                (e) => JsonParser.valueTo<MarketVolume, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => MarketVolume.fromJson(v),
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
              .map((b) => MarketVolume.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1AggregateSubaccountVolumeRecord;
}

class AggregateAccountVolumeRecord extends CosmosProtoMessage {
  final String? account;

  final List<MarketVolume> marketVolumes;

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
                (e) => JsonParser.valueTo<MarketVolume, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => MarketVolume.fromJson(v),
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
              .map((b) => MarketVolume.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1AggregateAccountVolumeRecord;
}

class MarketVolume extends CosmosProtoMessage {
  final String? marketId;

  final VolumeRecord? volume;

  const MarketVolume({this.marketId, this.volume});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [marketId, volume];

  @override
  Map<String, dynamic> toJson() {
    return {'market_id': marketId, 'volume': volume?.toJson()};
  }

  factory MarketVolume.fromJson(Map<String, dynamic> json) {
    return MarketVolume(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      volume: json.valueTo<VolumeRecord?, Map<String, dynamic>>(
        key: 'volume',
        parse: (v) => VolumeRecord.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MarketVolume.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MarketVolume(
      marketId: decode.getString<String?>(1),
      volume: decode.messageTo<VolumeRecord?>(
        2,
        (b) => VolumeRecord.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1MarketVolume;
}

class DenomDecimals extends CosmosProtoMessage {
  final String? denom;

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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1DenomDecimals;
}

class GrantAuthorization extends CosmosProtoMessage {
  final String? grantee;

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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1GrantAuthorization;
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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1ActiveGrant;
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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1EffectiveGrant;
}

class DenomMinNotional extends CosmosProtoMessage {
  /// the denom of the token
  final String? denom;

  /// the minimum notional value for the token (in chain format)
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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1DenomMinNotional;
}
