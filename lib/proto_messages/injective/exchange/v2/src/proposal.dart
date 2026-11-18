import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/exchange/v2/src/market.dart"
    as injective_exchange_v2_market;
import "package:cosmos_sdk/proto_messages/injective/oracle/v1beta1/src/oracle.dart"
    as injective_oracle_v1beta1_oracle;
import "package:cosmos_sdk/proto_messages/injective/exchange/v2/src/exchange.dart"
    as injective_exchange_v2_exchange;
import "package:cosmos_sdk/proto_messages/cosmos/distribution/v1beta1/src/distribution.dart"
    as cosmos_distribution_v1beta1_distribution;

enum DisableMinimalProtocolFeeUpdate implements ProtoEnumVariant {
  noUpdate(0, 'NoUpdate'),
  false_(1, 'False'),
  true_(2, 'True');

  const DisableMinimalProtocolFeeUpdate(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static DisableMinimalProtocolFeeUpdate fromValue(int? value) {
    value ??= 0;
    return DisableMinimalProtocolFeeUpdate.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching DisableMinimalProtocolFeeUpdate found for the given value. $value",
                details: {
                  "name": "DisableMinimalProtocolFeeUpdate",
                  "value": value?.toString(),
                },
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static DisableMinimalProtocolFeeUpdate from(Object? value) {
    value ??= 0;
    return DisableMinimalProtocolFeeUpdate.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching DisableMinimalProtocolFeeUpdate found for the given value. $value",
                details: {
                  "name": "DisableMinimalProtocolFeeUpdate",
                  "value": value?.toString(),
                },
              ),
    );
  }
}

/// CrossMarginEligibility is a tri-state enum used in
/// DerivativeMarketParamUpdateProposal to control per-market cross-margin
/// eligibility. UNSPECIFIED means "no update" (the market's current value is
/// preserved), following the same pattern as DisableMinimalProtocolFeeUpdate.
enum CrossMarginEligibility implements ProtoEnumVariant {
  cmEligibilityUnspecified(0, 'CM_ELIGIBILITY_UNSPECIFIED'),

  /// no update — preserves existing value
  cmEligibilityEligible(1, 'CM_ELIGIBILITY_ELIGIBLE'),

  /// market can participate in cross-margin pools
  cmEligibilityIneligible(2, 'CM_ELIGIBILITY_INELIGIBLE');

  const CrossMarginEligibility(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static CrossMarginEligibility fromValue(int? value) {
    value ??= 0;
    return CrossMarginEligibility.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching CrossMarginEligibility found for the given value. $value",
                details: {
                  "name": "CrossMarginEligibility",
                  "value": value?.toString(),
                },
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static CrossMarginEligibility from(Object? value) {
    value ??= 0;
    return CrossMarginEligibility.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching CrossMarginEligibility found for the given value. $value",
                details: {
                  "name": "CrossMarginEligibility",
                  "value": value?.toString(),
                },
              ),
    );
  }
}

enum ExchangeType implements ProtoEnumVariant {
  exchangeUnspecified(0, 'EXCHANGE_UNSPECIFIED'),
  spot(1, 'SPOT'),
  derivatives(2, 'DERIVATIVES');

  const ExchangeType(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static ExchangeType fromValue(int? value) {
    value ??= 0;
    return ExchangeType.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching ExchangeType found for the given value. $value",
                details: {"name": "ExchangeType", "value": value?.toString()},
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static ExchangeType from(Object? value) {
    value ??= 0;
    return ExchangeType.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching ExchangeType found for the given value. $value",
                details: {"name": "ExchangeType", "value": value?.toString()},
              ),
    );
  }
}

/// market is excluded from cross-margin pools
class SpotMarketParamUpdateProposal extends CosmosProtoMessage {
  final String? title;

  final String? description;

  final String? marketId;

  /// maker_fee_rate defines the trade fee rate for makers on the spot market
  final String? makerFeeRate;

  /// taker_fee_rate defines the trade fee rate for takers on the spot market
  final String? takerFeeRate;

  /// relayer_fee_share_rate defines the relayer fee share rate for the spot
  /// market
  final String? relayerFeeShareRate;

  /// min_price_tick_size defines the minimum tick size of the order's price and
  /// margin
  final String? minPriceTickSize;

  /// min_quantity_tick_size defines the minimum tick size of the order's
  /// quantity
  final String? minQuantityTickSize;

  final injective_exchange_v2_market.MarketStatus? status;

  final String? ticker;

  /// min_notional defines the minimum notional (in quote asset) required for
  /// orders in the market
  final String? minNotional;

  final AdminInfo? adminInfo;

  /// base token decimals
  final int? baseDecimals;

  /// quote token decimals
  final int? quoteDecimals;

  /// has_disabled_minimal_protocol_fee defines whether the minimal protocol fee
  /// is disabled for the market
  final DisableMinimalProtocolFeeUpdate? hasDisabledMinimalProtocolFee;

  const SpotMarketParamUpdateProposal({
    this.title,
    this.description,
    this.marketId,
    this.makerFeeRate,
    this.takerFeeRate,
    this.relayerFeeShareRate,
    this.minPriceTickSize,
    this.minQuantityTickSize,
    this.status,
    this.ticker,
    this.minNotional,
    this.adminInfo,
    this.baseDecimals,
    this.quoteDecimals,
    this.hasDisabledMinimalProtocolFee,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/SpotMarketParamUpdateProposal",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(7, options: const []),
        ProtoFieldConfig.string(8, options: const []),
        ProtoFieldConfig.enumType(9),
        ProtoFieldConfig.string(10, options: const []),
        ProtoFieldConfig.string(11, options: const []),
        ProtoFieldConfig.message(12),
        ProtoFieldConfig.uint32(13),
        ProtoFieldConfig.uint32(14),
        ProtoFieldConfig.enumType(15, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    title,
    description,
    marketId,
    makerFeeRate,
    takerFeeRate,
    relayerFeeShareRate,
    minPriceTickSize,
    minQuantityTickSize,
    status,
    ticker,
    minNotional,
    adminInfo,
    baseDecimals,
    quoteDecimals,
    hasDisabledMinimalProtocolFee,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'title': title,
      'description': description,
      'market_id': marketId,
      'maker_fee_rate': makerFeeRate,
      'taker_fee_rate': takerFeeRate,
      'relayer_fee_share_rate': relayerFeeShareRate,
      'min_price_tick_size': minPriceTickSize,
      'min_quantity_tick_size': minQuantityTickSize,
      'status': config.encodeEnum(status),
      'ticker': ticker,
      'min_notional': minNotional,
      'admin_info': config.encodeMessage(adminInfo),
      'base_decimals': baseDecimals,
      'quote_decimals': quoteDecimals,
      'has_disabled_minimal_protocol_fee': config.encodeEnum(
        hasDisabledMinimalProtocolFee,
      ),
    };
  }

  factory SpotMarketParamUpdateProposal.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return SpotMarketParamUpdateProposal(
      title: json.valueAsString<String?>(
        'title',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      description: json.valueAsString<String?>(
        'description',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      makerFeeRate: json.valueAsString<String?>(
        'maker_fee_rate',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      takerFeeRate: json.valueAsString<String?>(
        'taker_fee_rate',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      relayerFeeShareRate: json.valueAsString<String?>(
        'relayer_fee_share_rate',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      minPriceTickSize: json.valueAsString<String?>(
        'min_price_tick_size',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      minQuantityTickSize: json.valueAsString<String?>(
        'min_quantity_tick_size',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      status: json.valueTo<injective_exchange_v2_market.MarketStatus?, Object?>(
        key: 'status',
        parse: (v) => injective_exchange_v2_market.MarketStatus.from(v),
      ),
      ticker: json.valueAsString<String?>(
        'ticker',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      minNotional: json.valueAsString<String?>(
        'min_notional',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      adminInfo: json.valueTo<AdminInfo?, Object>(
        key: 'admin_info',
        parse: (v) => AdminInfo.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      baseDecimals: json.valueAsInt<int?>(
        'base_decimals',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      quoteDecimals: json.valueAsInt<int?>(
        'quote_decimals',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      hasDisabledMinimalProtocolFee: json
          .valueTo<DisableMinimalProtocolFeeUpdate?, Object?>(
            key: 'has_disabled_minimal_protocol_fee',
            parse: (v) => DisableMinimalProtocolFeeUpdate.from(v),
          ),
    );
  }

  factory SpotMarketParamUpdateProposal.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SpotMarketParamUpdateProposal(
      title: decode.getString<String?>(1),
      description: decode.getString<String?>(2),
      marketId: decode.getString<String?>(3),
      makerFeeRate: decode.getString<String?>(4),
      takerFeeRate: decode.getString<String?>(5),
      relayerFeeShareRate: decode.getString<String?>(6),
      minPriceTickSize: decode.getString<String?>(7),
      minQuantityTickSize: decode.getString<String?>(8),
      status: decode.getEnum<injective_exchange_v2_market.MarketStatus?>(
        9,
        injective_exchange_v2_market.MarketStatus.values,
      ),
      ticker: decode.getString<String?>(10),
      minNotional: decode.getString<String?>(11),
      adminInfo: decode.messageTo<AdminInfo?>(
        12,
        (b) => AdminInfo.deserialize(b),
      ),
      baseDecimals: decode.getInt<int?>(13),
      quoteDecimals: decode.getInt<int?>(14),
      hasDisabledMinimalProtocolFee: decode
          .getEnum<DisableMinimalProtocolFeeUpdate?>(
            15,
            DisableMinimalProtocolFeeUpdate.values,
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2SpotMarketParamUpdateProposal;
}

class ExchangeEnableProposal extends CosmosProtoMessage {
  final String? title;

  final String? description;

  final ExchangeType? exchangeType;

  const ExchangeEnableProposal({
    this.title,
    this.description,
    this.exchangeType,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/ExchangeEnableProposal",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.enumType(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [title, description, exchangeType];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'title': title,
      'description': description,
      'exchangeType': config.encodeEnum(exchangeType),
    };
  }

  factory ExchangeEnableProposal.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ExchangeEnableProposal(
      title: json.valueAsString<String?>(
        'title',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      description: json.valueAsString<String?>(
        'description',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      exchangeType: json.valueTo<ExchangeType?, Object?>(
        key: 'exchangeType',
        parse: (v) => ExchangeType.from(v),
      ),
    );
  }

  factory ExchangeEnableProposal.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ExchangeEnableProposal(
      title: decode.getString<String?>(1),
      description: decode.getString<String?>(2),
      exchangeType: decode.getEnum<ExchangeType?>(3, ExchangeType.values),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2ExchangeEnableProposal;
}

class BatchExchangeModificationProposal extends CosmosProtoMessage {
  final String? title;

  final String? description;

  final List<SpotMarketParamUpdateProposal> spotMarketParamUpdateProposals;

  final List<DerivativeMarketParamUpdateProposal>
  derivativeMarketParamUpdateProposals;

  final List<SpotMarketLaunchProposal> spotMarketLaunchProposals;

  final List<PerpetualMarketLaunchProposal> perpetualMarketLaunchProposals;

  final List<ExpiryFuturesMarketLaunchProposal>
  expiryFuturesMarketLaunchProposals;

  final TradingRewardCampaignUpdateProposal?
  tradingRewardCampaignUpdateProposal;

  final List<BinaryOptionsMarketLaunchProposal>
  binaryOptionsMarketLaunchProposals;

  final List<BinaryOptionsMarketParamUpdateProposal>
  binaryOptionsParamUpdateProposals;

  final UpdateAuctionExchangeTransferDenomDecimalsProposal?
  auctionExchangeTransferDenomDecimalsUpdateProposal;

  final FeeDiscountProposal? feeDiscountProposal;

  final List<MarketForcedSettlementProposal> marketForcedSettlementProposals;

  final DenomMinNotionalProposal? denomMinNotionalProposal;

  const BatchExchangeModificationProposal({
    this.title,
    this.description,
    this.spotMarketParamUpdateProposals = const [],
    this.derivativeMarketParamUpdateProposals = const [],
    this.spotMarketLaunchProposals = const [],
    this.perpetualMarketLaunchProposals = const [],
    this.expiryFuturesMarketLaunchProposals = const [],
    this.tradingRewardCampaignUpdateProposal,
    this.binaryOptionsMarketLaunchProposals = const [],
    this.binaryOptionsParamUpdateProposals = const [],
    this.auctionExchangeTransferDenomDecimalsUpdateProposal,
    this.feeDiscountProposal,
    this.marketForcedSettlementProposals = const [],
    this.denomMinNotionalProposal,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/BatchExchangeModificationProposal",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 7,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.message(8),
        ProtoFieldConfig.repeated(
          fieldNumber: 9,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 10,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.message(11),
        ProtoFieldConfig.message(12),
        ProtoFieldConfig.repeated(
          fieldNumber: 13,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.message(14),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    title,
    description,
    spotMarketParamUpdateProposals,
    derivativeMarketParamUpdateProposals,
    spotMarketLaunchProposals,
    perpetualMarketLaunchProposals,
    expiryFuturesMarketLaunchProposals,
    tradingRewardCampaignUpdateProposal,
    binaryOptionsMarketLaunchProposals,
    binaryOptionsParamUpdateProposals,
    auctionExchangeTransferDenomDecimalsUpdateProposal,
    feeDiscountProposal,
    marketForcedSettlementProposals,
    denomMinNotionalProposal,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'title': title,
      'description': description,
      'spot_market_param_update_proposals':
          spotMarketParamUpdateProposals
              .map((e) => config.encodeMessage(e))
              .toList(),
      'derivative_market_param_update_proposals':
          derivativeMarketParamUpdateProposals
              .map((e) => config.encodeMessage(e))
              .toList(),
      'spot_market_launch_proposals':
          spotMarketLaunchProposals
              .map((e) => config.encodeMessage(e))
              .toList(),
      'perpetual_market_launch_proposals':
          perpetualMarketLaunchProposals
              .map((e) => config.encodeMessage(e))
              .toList(),
      'expiry_futures_market_launch_proposals':
          expiryFuturesMarketLaunchProposals
              .map((e) => config.encodeMessage(e))
              .toList(),
      'trading_reward_campaign_update_proposal': config.encodeMessage(
        tradingRewardCampaignUpdateProposal,
      ),
      'binary_options_market_launch_proposals':
          binaryOptionsMarketLaunchProposals
              .map((e) => config.encodeMessage(e))
              .toList(),
      'binary_options_param_update_proposals':
          binaryOptionsParamUpdateProposals
              .map((e) => config.encodeMessage(e))
              .toList(),
      'auction_exchange_transfer_denom_decimals_update_proposal': config
          .encodeMessage(auctionExchangeTransferDenomDecimalsUpdateProposal),
      'fee_discount_proposal': config.encodeMessage(feeDiscountProposal),
      'market_forced_settlement_proposals':
          marketForcedSettlementProposals
              .map((e) => config.encodeMessage(e))
              .toList(),
      'denom_min_notional_proposal': config.encodeMessage(
        denomMinNotionalProposal,
      ),
    };
  }

  factory BatchExchangeModificationProposal.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return BatchExchangeModificationProposal(
      title: json.valueAsString<String?>(
        'title',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      description: json.valueAsString<String?>(
        'description',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      spotMarketParamUpdateProposals:
          (json.valueEnsureAsList<dynamic>(
                'spot_market_param_update_proposals',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<SpotMarketParamUpdateProposal, Object>(
                      value: e,
                      parse:
                          (v) => SpotMarketParamUpdateProposal.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
      derivativeMarketParamUpdateProposals:
          (json.valueEnsureAsList<dynamic>(
                'derivative_market_param_update_proposals',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  DerivativeMarketParamUpdateProposal,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => DerivativeMarketParamUpdateProposal.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      spotMarketLaunchProposals:
          (json.valueEnsureAsList<dynamic>(
                'spot_market_launch_proposals',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<SpotMarketLaunchProposal, Object>(
                  value: e,
                  parse:
                      (v) => SpotMarketLaunchProposal.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      perpetualMarketLaunchProposals:
          (json.valueEnsureAsList<dynamic>(
                'perpetual_market_launch_proposals',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<PerpetualMarketLaunchProposal, Object>(
                      value: e,
                      parse:
                          (v) => PerpetualMarketLaunchProposal.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
      expiryFuturesMarketLaunchProposals:
          (json.valueEnsureAsList<dynamic>(
                'expiry_futures_market_launch_proposals',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  ExpiryFuturesMarketLaunchProposal,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => ExpiryFuturesMarketLaunchProposal.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      tradingRewardCampaignUpdateProposal: json
          .valueTo<TradingRewardCampaignUpdateProposal?, Object>(
            key: 'trading_reward_campaign_update_proposal',
            parse:
                (v) => TradingRewardCampaignUpdateProposal.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      binaryOptionsMarketLaunchProposals:
          (json.valueEnsureAsList<dynamic>(
                'binary_options_market_launch_proposals',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  BinaryOptionsMarketLaunchProposal,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => BinaryOptionsMarketLaunchProposal.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      binaryOptionsParamUpdateProposals:
          (json.valueEnsureAsList<dynamic>(
                'binary_options_param_update_proposals',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  BinaryOptionsMarketParamUpdateProposal,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => BinaryOptionsMarketParamUpdateProposal.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      auctionExchangeTransferDenomDecimalsUpdateProposal: json
          .valueTo<UpdateAuctionExchangeTransferDenomDecimalsProposal?, Object>(
            key: 'auction_exchange_transfer_denom_decimals_update_proposal',
            parse:
                (v) =>
                    UpdateAuctionExchangeTransferDenomDecimalsProposal.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      feeDiscountProposal: json.valueTo<FeeDiscountProposal?, Object>(
        key: 'fee_discount_proposal',
        parse:
            (v) => FeeDiscountProposal.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      marketForcedSettlementProposals:
          (json.valueEnsureAsList<dynamic>(
                'market_forced_settlement_proposals',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<MarketForcedSettlementProposal, Object>(
                      value: e,
                      parse:
                          (v) => MarketForcedSettlementProposal.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
      denomMinNotionalProposal: json.valueTo<DenomMinNotionalProposal?, Object>(
        key: 'denom_min_notional_proposal',
        parse:
            (v) => DenomMinNotionalProposal.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory BatchExchangeModificationProposal.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BatchExchangeModificationProposal(
      title: decode.getString<String?>(1),
      description: decode.getString<String?>(2),
      spotMarketParamUpdateProposals:
          decode
              .getListOfBytes(3)
              .map((b) => SpotMarketParamUpdateProposal.deserialize(b))
              .toList(),
      derivativeMarketParamUpdateProposals:
          decode
              .getListOfBytes(4)
              .map((b) => DerivativeMarketParamUpdateProposal.deserialize(b))
              .toList(),
      spotMarketLaunchProposals:
          decode
              .getListOfBytes(5)
              .map((b) => SpotMarketLaunchProposal.deserialize(b))
              .toList(),
      perpetualMarketLaunchProposals:
          decode
              .getListOfBytes(6)
              .map((b) => PerpetualMarketLaunchProposal.deserialize(b))
              .toList(),
      expiryFuturesMarketLaunchProposals:
          decode
              .getListOfBytes(7)
              .map((b) => ExpiryFuturesMarketLaunchProposal.deserialize(b))
              .toList(),
      tradingRewardCampaignUpdateProposal: decode
          .messageTo<TradingRewardCampaignUpdateProposal?>(
            8,
            (b) => TradingRewardCampaignUpdateProposal.deserialize(b),
          ),
      binaryOptionsMarketLaunchProposals:
          decode
              .getListOfBytes(9)
              .map((b) => BinaryOptionsMarketLaunchProposal.deserialize(b))
              .toList(),
      binaryOptionsParamUpdateProposals:
          decode
              .getListOfBytes(10)
              .map((b) => BinaryOptionsMarketParamUpdateProposal.deserialize(b))
              .toList(),
      auctionExchangeTransferDenomDecimalsUpdateProposal: decode
          .messageTo<UpdateAuctionExchangeTransferDenomDecimalsProposal?>(
            11,
            (b) =>
                UpdateAuctionExchangeTransferDenomDecimalsProposal.deserialize(
                  b,
                ),
          ),
      feeDiscountProposal: decode.messageTo<FeeDiscountProposal?>(
        12,
        (b) => FeeDiscountProposal.deserialize(b),
      ),
      marketForcedSettlementProposals:
          decode
              .getListOfBytes(13)
              .map((b) => MarketForcedSettlementProposal.deserialize(b))
              .toList(),
      denomMinNotionalProposal: decode.messageTo<DenomMinNotionalProposal?>(
        14,
        (b) => DenomMinNotionalProposal.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2BatchExchangeModificationProposal;
}

/// SpotMarketLaunchProposal defines a SDK message for proposing a new spot
/// market through governance
class SpotMarketLaunchProposal extends CosmosProtoMessage {
  final String? title;

  final String? description;

  /// Ticker for the spot market.
  final String? ticker;

  /// type of coin to use as the base currency
  final String? baseDenom;

  /// type of coin to use as the quote currency
  final String? quoteDenom;

  /// min_price_tick_size defines the minimum tick size of the order's price
  final String? minPriceTickSize;

  /// min_quantity_tick_size defines the minimum tick size of the order's
  /// quantity
  final String? minQuantityTickSize;

  /// maker_fee_rate defines the fee percentage makers pay when trading
  final String? makerFeeRate;

  /// taker_fee_rate defines the fee percentage takers pay when trading
  final String? takerFeeRate;

  /// min_notional defines the minimum notional for orders in the market
  final String? minNotional;

  final AdminInfo? adminInfo;

  /// base token decimals
  final int? baseDecimals;

  /// quote token decimals
  final int? quoteDecimals;

  const SpotMarketLaunchProposal({
    this.title,
    this.description,
    this.ticker,
    this.baseDenom,
    this.quoteDenom,
    this.minPriceTickSize,
    this.minQuantityTickSize,
    this.makerFeeRate,
    this.takerFeeRate,
    this.minNotional,
    this.adminInfo,
    this.baseDecimals,
    this.quoteDecimals,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/SpotMarketLaunchProposal",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(7, options: const []),
        ProtoFieldConfig.string(8, options: const []),
        ProtoFieldConfig.string(9, options: const []),
        ProtoFieldConfig.string(10, options: const []),
        ProtoFieldConfig.message(11),
        ProtoFieldConfig.uint32(14),
        ProtoFieldConfig.uint32(15),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    title,
    description,
    ticker,
    baseDenom,
    quoteDenom,
    minPriceTickSize,
    minQuantityTickSize,
    makerFeeRate,
    takerFeeRate,
    minNotional,
    adminInfo,
    baseDecimals,
    quoteDecimals,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'title': title,
      'description': description,
      'ticker': ticker,
      'base_denom': baseDenom,
      'quote_denom': quoteDenom,
      'min_price_tick_size': minPriceTickSize,
      'min_quantity_tick_size': minQuantityTickSize,
      'maker_fee_rate': makerFeeRate,
      'taker_fee_rate': takerFeeRate,
      'min_notional': minNotional,
      'admin_info': config.encodeMessage(adminInfo),
      'base_decimals': baseDecimals,
      'quote_decimals': quoteDecimals,
    };
  }

  factory SpotMarketLaunchProposal.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return SpotMarketLaunchProposal(
      title: json.valueAsString<String?>(
        'title',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      description: json.valueAsString<String?>(
        'description',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      ticker: json.valueAsString<String?>(
        'ticker',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      baseDenom: json.valueAsString<String?>(
        'base_denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      quoteDenom: json.valueAsString<String?>(
        'quote_denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      minPriceTickSize: json.valueAsString<String?>(
        'min_price_tick_size',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      minQuantityTickSize: json.valueAsString<String?>(
        'min_quantity_tick_size',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      makerFeeRate: json.valueAsString<String?>(
        'maker_fee_rate',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      takerFeeRate: json.valueAsString<String?>(
        'taker_fee_rate',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      minNotional: json.valueAsString<String?>(
        'min_notional',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      adminInfo: json.valueTo<AdminInfo?, Object>(
        key: 'admin_info',
        parse: (v) => AdminInfo.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      baseDecimals: json.valueAsInt<int?>(
        'base_decimals',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      quoteDecimals: json.valueAsInt<int?>(
        'quote_decimals',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory SpotMarketLaunchProposal.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SpotMarketLaunchProposal(
      title: decode.getString<String?>(1),
      description: decode.getString<String?>(2),
      ticker: decode.getString<String?>(3),
      baseDenom: decode.getString<String?>(4),
      quoteDenom: decode.getString<String?>(5),
      minPriceTickSize: decode.getString<String?>(6),
      minQuantityTickSize: decode.getString<String?>(7),
      makerFeeRate: decode.getString<String?>(8),
      takerFeeRate: decode.getString<String?>(9),
      minNotional: decode.getString<String?>(10),
      adminInfo: decode.messageTo<AdminInfo?>(
        11,
        (b) => AdminInfo.deserialize(b),
      ),
      baseDecimals: decode.getInt<int?>(14),
      quoteDecimals: decode.getInt<int?>(15),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2SpotMarketLaunchProposal;
}

/// PerpetualMarketLaunchProposal defines a SDK message for proposing a new
/// perpetual futures market through governance
class PerpetualMarketLaunchProposal extends CosmosProtoMessage {
  final String? title;

  final String? description;

  /// Ticker for the derivative market.
  final String? ticker;

  /// type of coin to use as the base currency
  final String? quoteDenom;

  /// Oracle base currency
  final String? oracleBase;

  /// Oracle quote currency
  final String? oracleQuote;

  /// Scale factor for oracle prices.
  final int? oracleScaleFactor;

  /// Oracle type
  final injective_oracle_v1beta1_oracle.OracleType? oracleType;

  /// initial_margin_ratio defines the initial margin ratio for the derivative
  /// market
  final String? initialMarginRatio;

  /// maintenance_margin_ratio defines the maintenance margin ratio for the
  /// derivative market
  final String? maintenanceMarginRatio;

  /// maker_fee_rate defines the exchange trade fee for makers for the derivative
  /// market
  final String? makerFeeRate;

  /// taker_fee_rate defines the exchange trade fee for takers for the derivative
  /// market
  final String? takerFeeRate;

  /// min_price_tick_size defines the minimum tick size of the order's price and
  /// margin
  final String? minPriceTickSize;

  /// min_quantity_tick_size defines the minimum tick size of the order's
  /// quantity
  final String? minQuantityTickSize;

  /// min_notional defines the minimum notional (in quote asset) required for
  /// orders in the market
  final String? minNotional;

  final AdminInfo? adminInfo;

  /// reduce_margin_ratio defines the ratio of the margin that is reduced
  final String? reduceMarginRatio;

  /// open_notional_cap defines the maximum open notional for the market
  final injective_exchange_v2_market.OpenNotionalCap? openNotionalCap;

  /// cross_margin_eligible marks the market as eligible for cross-margin
  final bool? crossMarginEligible;

  const PerpetualMarketLaunchProposal({
    this.title,
    this.description,
    this.ticker,
    this.quoteDenom,
    this.oracleBase,
    this.oracleQuote,
    this.oracleScaleFactor,
    this.oracleType,
    this.initialMarginRatio,
    this.maintenanceMarginRatio,
    this.makerFeeRate,
    this.takerFeeRate,
    this.minPriceTickSize,
    this.minQuantityTickSize,
    this.minNotional,
    this.adminInfo,
    this.reduceMarginRatio,
    this.openNotionalCap,
    this.crossMarginEligible,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/PerpetualMarketLaunchProposal",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.string(6),
        ProtoFieldConfig.uint32(7),
        ProtoFieldConfig.enumType(8),
        ProtoFieldConfig.string(9, options: const []),
        ProtoFieldConfig.string(10, options: const []),
        ProtoFieldConfig.string(11, options: const []),
        ProtoFieldConfig.string(12, options: const []),
        ProtoFieldConfig.string(13, options: const []),
        ProtoFieldConfig.string(14, options: const []),
        ProtoFieldConfig.string(15, options: const []),
        ProtoFieldConfig.message(16),
        ProtoFieldConfig.string(17, options: const []),
        ProtoFieldConfig.message(18, options: const []),
        ProtoFieldConfig.bool(19),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    title,
    description,
    ticker,
    quoteDenom,
    oracleBase,
    oracleQuote,
    oracleScaleFactor,
    oracleType,
    initialMarginRatio,
    maintenanceMarginRatio,
    makerFeeRate,
    takerFeeRate,
    minPriceTickSize,
    minQuantityTickSize,
    minNotional,
    adminInfo,
    reduceMarginRatio,
    openNotionalCap,
    crossMarginEligible,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'title': title,
      'description': description,
      'ticker': ticker,
      'quote_denom': quoteDenom,
      'oracle_base': oracleBase,
      'oracle_quote': oracleQuote,
      'oracle_scale_factor': oracleScaleFactor,
      'oracle_type': config.encodeEnum(oracleType),
      'initial_margin_ratio': initialMarginRatio,
      'maintenance_margin_ratio': maintenanceMarginRatio,
      'maker_fee_rate': makerFeeRate,
      'taker_fee_rate': takerFeeRate,
      'min_price_tick_size': minPriceTickSize,
      'min_quantity_tick_size': minQuantityTickSize,
      'min_notional': minNotional,
      'admin_info': config.encodeMessage(adminInfo),
      'reduce_margin_ratio': reduceMarginRatio,
      'open_notional_cap': config.encodeMessage(openNotionalCap),
      'cross_margin_eligible': crossMarginEligible,
    };
  }

  factory PerpetualMarketLaunchProposal.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return PerpetualMarketLaunchProposal(
      title: json.valueAsString<String?>(
        'title',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      description: json.valueAsString<String?>(
        'description',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      ticker: json.valueAsString<String?>(
        'ticker',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      quoteDenom: json.valueAsString<String?>(
        'quote_denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      oracleBase: json.valueAsString<String?>(
        'oracle_base',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      oracleQuote: json.valueAsString<String?>(
        'oracle_quote',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      oracleScaleFactor: json.valueAsInt<int?>(
        'oracle_scale_factor',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      oracleType: json
          .valueTo<injective_oracle_v1beta1_oracle.OracleType?, Object?>(
            key: 'oracle_type',
            parse: (v) => injective_oracle_v1beta1_oracle.OracleType.from(v),
          ),
      initialMarginRatio: json.valueAsString<String?>(
        'initial_margin_ratio',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      maintenanceMarginRatio: json.valueAsString<String?>(
        'maintenance_margin_ratio',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      makerFeeRate: json.valueAsString<String?>(
        'maker_fee_rate',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      takerFeeRate: json.valueAsString<String?>(
        'taker_fee_rate',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      minPriceTickSize: json.valueAsString<String?>(
        'min_price_tick_size',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      minQuantityTickSize: json.valueAsString<String?>(
        'min_quantity_tick_size',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      minNotional: json.valueAsString<String?>(
        'min_notional',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      adminInfo: json.valueTo<AdminInfo?, Object>(
        key: 'admin_info',
        parse: (v) => AdminInfo.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      reduceMarginRatio: json.valueAsString<String?>(
        'reduce_margin_ratio',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      openNotionalCap: json
          .valueTo<injective_exchange_v2_market.OpenNotionalCap?, Object>(
            key: 'open_notional_cap',
            parse:
                (v) => injective_exchange_v2_market.OpenNotionalCap.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      crossMarginEligible: json.valueAsBool<bool?>(
        'cross_margin_eligible',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory PerpetualMarketLaunchProposal.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PerpetualMarketLaunchProposal(
      title: decode.getString<String?>(1),
      description: decode.getString<String?>(2),
      ticker: decode.getString<String?>(3),
      quoteDenom: decode.getString<String?>(4),
      oracleBase: decode.getString<String?>(5),
      oracleQuote: decode.getString<String?>(6),
      oracleScaleFactor: decode.getInt<int?>(7),
      oracleType: decode.getEnum<injective_oracle_v1beta1_oracle.OracleType?>(
        8,
        injective_oracle_v1beta1_oracle.OracleType.values,
      ),
      initialMarginRatio: decode.getString<String?>(9),
      maintenanceMarginRatio: decode.getString<String?>(10),
      makerFeeRate: decode.getString<String?>(11),
      takerFeeRate: decode.getString<String?>(12),
      minPriceTickSize: decode.getString<String?>(13),
      minQuantityTickSize: decode.getString<String?>(14),
      minNotional: decode.getString<String?>(15),
      adminInfo: decode.messageTo<AdminInfo?>(
        16,
        (b) => AdminInfo.deserialize(b),
      ),
      reduceMarginRatio: decode.getString<String?>(17),
      openNotionalCap: decode
          .messageTo<injective_exchange_v2_market.OpenNotionalCap?>(
            18,
            (b) => injective_exchange_v2_market.OpenNotionalCap.deserialize(b),
          ),
      crossMarginEligible: decode.getBool<bool?>(19),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2PerpetualMarketLaunchProposal;
}

class BinaryOptionsMarketLaunchProposal extends CosmosProtoMessage {
  final String? title;

  final String? description;

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

  /// maker_fee_rate defines the maker fee rate of a binary options market
  final String? makerFeeRate;

  /// taker_fee_rate defines the taker fee rate of a derivative market
  final String? takerFeeRate;

  /// min_price_tick_size defines the minimum tick size that the price and margin
  /// required for orders in the market
  final String? minPriceTickSize;

  /// min_quantity_tick_size defines the minimum tick size of the quantity
  /// required for orders in the market
  final String? minQuantityTickSize;

  /// min_notional defines the minimum notional (in quote asset) required for
  /// orders in the market
  final String? minNotional;

  final int? adminPermissions;

  /// open_notional_cap defines the maximum open notional for the market
  final injective_exchange_v2_market.OpenNotionalCap? openNotionalCap;

  const BinaryOptionsMarketLaunchProposal({
    this.title,
    this.description,
    this.ticker,
    this.oracleSymbol,
    this.oracleProvider,
    this.oracleType,
    this.oracleScaleFactor,
    this.expirationTimestamp,
    this.settlementTimestamp,
    this.admin,
    this.quoteDenom,
    this.makerFeeRate,
    this.takerFeeRate,
    this.minPriceTickSize,
    this.minQuantityTickSize,
    this.minNotional,
    this.adminPermissions,
    this.openNotionalCap,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/BinaryOptionsMarketLaunchProposal",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.enumType(6),
        ProtoFieldConfig.uint32(7),
        ProtoFieldConfig.int64(8),
        ProtoFieldConfig.int64(9),
        ProtoFieldConfig.string(10),
        ProtoFieldConfig.string(11),
        ProtoFieldConfig.string(12, options: const []),
        ProtoFieldConfig.string(13, options: const []),
        ProtoFieldConfig.string(14, options: const []),
        ProtoFieldConfig.string(15, options: const []),
        ProtoFieldConfig.string(16, options: const []),
        ProtoFieldConfig.uint32(17),
        ProtoFieldConfig.message(18, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    title,
    description,
    ticker,
    oracleSymbol,
    oracleProvider,
    oracleType,
    oracleScaleFactor,
    expirationTimestamp,
    settlementTimestamp,
    admin,
    quoteDenom,
    makerFeeRate,
    takerFeeRate,
    minPriceTickSize,
    minQuantityTickSize,
    minNotional,
    adminPermissions,
    openNotionalCap,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'title': title,
      'description': description,
      'ticker': ticker,
      'oracle_symbol': oracleSymbol,
      'oracle_provider': oracleProvider,
      'oracle_type': config.encodeEnum(oracleType),
      'oracle_scale_factor': oracleScaleFactor,
      'expiration_timestamp': config.encodeBigint(expirationTimestamp),
      'settlement_timestamp': config.encodeBigint(settlementTimestamp),
      'admin': admin,
      'quote_denom': quoteDenom,
      'maker_fee_rate': makerFeeRate,
      'taker_fee_rate': takerFeeRate,
      'min_price_tick_size': minPriceTickSize,
      'min_quantity_tick_size': minQuantityTickSize,
      'min_notional': minNotional,
      'admin_permissions': adminPermissions,
      'open_notional_cap': config.encodeMessage(openNotionalCap),
    };
  }

  factory BinaryOptionsMarketLaunchProposal.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return BinaryOptionsMarketLaunchProposal(
      title: json.valueAsString<String?>(
        'title',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      description: json.valueAsString<String?>(
        'description',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      ticker: json.valueAsString<String?>(
        'ticker',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      oracleSymbol: json.valueAsString<String?>(
        'oracle_symbol',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      oracleProvider: json.valueAsString<String?>(
        'oracle_provider',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      oracleType: json
          .valueTo<injective_oracle_v1beta1_oracle.OracleType?, Object?>(
            key: 'oracle_type',
            parse: (v) => injective_oracle_v1beta1_oracle.OracleType.from(v),
          ),
      oracleScaleFactor: json.valueAsInt<int?>(
        'oracle_scale_factor',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      expirationTimestamp: json.valueAsBigInt<BigInt?>(
        'expiration_timestamp',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      settlementTimestamp: json.valueAsBigInt<BigInt?>(
        'settlement_timestamp',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      admin: json.valueAsString<String?>(
        'admin',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      quoteDenom: json.valueAsString<String?>(
        'quote_denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      makerFeeRate: json.valueAsString<String?>(
        'maker_fee_rate',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      takerFeeRate: json.valueAsString<String?>(
        'taker_fee_rate',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      minPriceTickSize: json.valueAsString<String?>(
        'min_price_tick_size',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      minQuantityTickSize: json.valueAsString<String?>(
        'min_quantity_tick_size',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      minNotional: json.valueAsString<String?>(
        'min_notional',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      adminPermissions: json.valueAsInt<int?>(
        'admin_permissions',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      openNotionalCap: json
          .valueTo<injective_exchange_v2_market.OpenNotionalCap?, Object>(
            key: 'open_notional_cap',
            parse:
                (v) => injective_exchange_v2_market.OpenNotionalCap.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory BinaryOptionsMarketLaunchProposal.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BinaryOptionsMarketLaunchProposal(
      title: decode.getString<String?>(1),
      description: decode.getString<String?>(2),
      ticker: decode.getString<String?>(3),
      oracleSymbol: decode.getString<String?>(4),
      oracleProvider: decode.getString<String?>(5),
      oracleType: decode.getEnum<injective_oracle_v1beta1_oracle.OracleType?>(
        6,
        injective_oracle_v1beta1_oracle.OracleType.values,
      ),
      oracleScaleFactor: decode.getInt<int?>(7),
      expirationTimestamp: decode.getBigInt<BigInt?>(8),
      settlementTimestamp: decode.getBigInt<BigInt?>(9),
      admin: decode.getString<String?>(10),
      quoteDenom: decode.getString<String?>(11),
      makerFeeRate: decode.getString<String?>(12),
      takerFeeRate: decode.getString<String?>(13),
      minPriceTickSize: decode.getString<String?>(14),
      minQuantityTickSize: decode.getString<String?>(15),
      minNotional: decode.getString<String?>(16),
      adminPermissions: decode.getInt<int?>(17),
      openNotionalCap: decode
          .messageTo<injective_exchange_v2_market.OpenNotionalCap?>(
            18,
            (b) => injective_exchange_v2_market.OpenNotionalCap.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2BinaryOptionsMarketLaunchProposal;
}

/// ExpiryFuturesMarketLaunchProposal defines a SDK message for proposing a new
/// expiry futures market through governance
class ExpiryFuturesMarketLaunchProposal extends CosmosProtoMessage {
  final String? title;

  final String? description;

  /// Ticker for the derivative market.
  final String? ticker;

  /// type of coin to use as the quote currency
  final String? quoteDenom;

  /// Oracle base currency
  final String? oracleBase;

  /// Oracle quote currency
  final String? oracleQuote;

  /// Scale factor for oracle prices.
  final int? oracleScaleFactor;

  /// Oracle type
  final injective_oracle_v1beta1_oracle.OracleType? oracleType;

  /// Expiration time of the market
  final BigInt? expiry;

  /// initial_margin_ratio defines the initial margin ratio for the derivative
  /// market
  final String? initialMarginRatio;

  /// maintenance_margin_ratio defines the maintenance margin ratio for the
  /// derivative market
  final String? maintenanceMarginRatio;

  /// maker_fee_rate defines the exchange trade fee for makers for the derivative
  /// market
  final String? makerFeeRate;

  /// taker_fee_rate defines the exchange trade fee for takers for the derivative
  /// market
  final String? takerFeeRate;

  /// min_price_tick_size defines the minimum tick size of the order's price and
  /// margin
  final String? minPriceTickSize;

  /// min_quantity_tick_size defines the minimum tick size of the order's
  /// quantity
  final String? minQuantityTickSize;

  /// min_notional defines the minimum notional (in quote asset) required for
  /// orders in the market
  final String? minNotional;

  final AdminInfo? adminInfo;

  /// reduce_margin_ratio defines the ratio of the margin that is reduced
  final String? reduceMarginRatio;

  /// open_notional_cap defines the maximum open notional for the market
  final injective_exchange_v2_market.OpenNotionalCap? openNotionalCap;

  /// cross_margin_eligible marks the market as eligible for cross-margin
  final bool? crossMarginEligible;

  const ExpiryFuturesMarketLaunchProposal({
    this.title,
    this.description,
    this.ticker,
    this.quoteDenom,
    this.oracleBase,
    this.oracleQuote,
    this.oracleScaleFactor,
    this.oracleType,
    this.expiry,
    this.initialMarginRatio,
    this.maintenanceMarginRatio,
    this.makerFeeRate,
    this.takerFeeRate,
    this.minPriceTickSize,
    this.minQuantityTickSize,
    this.minNotional,
    this.adminInfo,
    this.reduceMarginRatio,
    this.openNotionalCap,
    this.crossMarginEligible,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/ExpiryFuturesMarketLaunchProposal",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.string(6),
        ProtoFieldConfig.uint32(7),
        ProtoFieldConfig.enumType(8),
        ProtoFieldConfig.int64(9),
        ProtoFieldConfig.string(10, options: const []),
        ProtoFieldConfig.string(11, options: const []),
        ProtoFieldConfig.string(12, options: const []),
        ProtoFieldConfig.string(13, options: const []),
        ProtoFieldConfig.string(14, options: const []),
        ProtoFieldConfig.string(15, options: const []),
        ProtoFieldConfig.string(16, options: const []),
        ProtoFieldConfig.message(17),
        ProtoFieldConfig.string(18, options: const []),
        ProtoFieldConfig.message(19, options: const []),
        ProtoFieldConfig.bool(20),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    title,
    description,
    ticker,
    quoteDenom,
    oracleBase,
    oracleQuote,
    oracleScaleFactor,
    oracleType,
    expiry,
    initialMarginRatio,
    maintenanceMarginRatio,
    makerFeeRate,
    takerFeeRate,
    minPriceTickSize,
    minQuantityTickSize,
    minNotional,
    adminInfo,
    reduceMarginRatio,
    openNotionalCap,
    crossMarginEligible,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'title': title,
      'description': description,
      'ticker': ticker,
      'quote_denom': quoteDenom,
      'oracle_base': oracleBase,
      'oracle_quote': oracleQuote,
      'oracle_scale_factor': oracleScaleFactor,
      'oracle_type': config.encodeEnum(oracleType),
      'expiry': config.encodeBigint(expiry),
      'initial_margin_ratio': initialMarginRatio,
      'maintenance_margin_ratio': maintenanceMarginRatio,
      'maker_fee_rate': makerFeeRate,
      'taker_fee_rate': takerFeeRate,
      'min_price_tick_size': minPriceTickSize,
      'min_quantity_tick_size': minQuantityTickSize,
      'min_notional': minNotional,
      'admin_info': config.encodeMessage(adminInfo),
      'reduce_margin_ratio': reduceMarginRatio,
      'open_notional_cap': config.encodeMessage(openNotionalCap),
      'cross_margin_eligible': crossMarginEligible,
    };
  }

  factory ExpiryFuturesMarketLaunchProposal.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ExpiryFuturesMarketLaunchProposal(
      title: json.valueAsString<String?>(
        'title',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      description: json.valueAsString<String?>(
        'description',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      ticker: json.valueAsString<String?>(
        'ticker',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      quoteDenom: json.valueAsString<String?>(
        'quote_denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      oracleBase: json.valueAsString<String?>(
        'oracle_base',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      oracleQuote: json.valueAsString<String?>(
        'oracle_quote',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      oracleScaleFactor: json.valueAsInt<int?>(
        'oracle_scale_factor',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      oracleType: json
          .valueTo<injective_oracle_v1beta1_oracle.OracleType?, Object?>(
            key: 'oracle_type',
            parse: (v) => injective_oracle_v1beta1_oracle.OracleType.from(v),
          ),
      expiry: json.valueAsBigInt<BigInt?>(
        'expiry',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      initialMarginRatio: json.valueAsString<String?>(
        'initial_margin_ratio',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      maintenanceMarginRatio: json.valueAsString<String?>(
        'maintenance_margin_ratio',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      makerFeeRate: json.valueAsString<String?>(
        'maker_fee_rate',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      takerFeeRate: json.valueAsString<String?>(
        'taker_fee_rate',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      minPriceTickSize: json.valueAsString<String?>(
        'min_price_tick_size',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      minQuantityTickSize: json.valueAsString<String?>(
        'min_quantity_tick_size',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      minNotional: json.valueAsString<String?>(
        'min_notional',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      adminInfo: json.valueTo<AdminInfo?, Object>(
        key: 'admin_info',
        parse: (v) => AdminInfo.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      reduceMarginRatio: json.valueAsString<String?>(
        'reduce_margin_ratio',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      openNotionalCap: json
          .valueTo<injective_exchange_v2_market.OpenNotionalCap?, Object>(
            key: 'open_notional_cap',
            parse:
                (v) => injective_exchange_v2_market.OpenNotionalCap.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      crossMarginEligible: json.valueAsBool<bool?>(
        'cross_margin_eligible',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory ExpiryFuturesMarketLaunchProposal.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ExpiryFuturesMarketLaunchProposal(
      title: decode.getString<String?>(1),
      description: decode.getString<String?>(2),
      ticker: decode.getString<String?>(3),
      quoteDenom: decode.getString<String?>(4),
      oracleBase: decode.getString<String?>(5),
      oracleQuote: decode.getString<String?>(6),
      oracleScaleFactor: decode.getInt<int?>(7),
      oracleType: decode.getEnum<injective_oracle_v1beta1_oracle.OracleType?>(
        8,
        injective_oracle_v1beta1_oracle.OracleType.values,
      ),
      expiry: decode.getBigInt<BigInt?>(9),
      initialMarginRatio: decode.getString<String?>(10),
      maintenanceMarginRatio: decode.getString<String?>(11),
      makerFeeRate: decode.getString<String?>(12),
      takerFeeRate: decode.getString<String?>(13),
      minPriceTickSize: decode.getString<String?>(14),
      minQuantityTickSize: decode.getString<String?>(15),
      minNotional: decode.getString<String?>(16),
      adminInfo: decode.messageTo<AdminInfo?>(
        17,
        (b) => AdminInfo.deserialize(b),
      ),
      reduceMarginRatio: decode.getString<String?>(18),
      openNotionalCap: decode
          .messageTo<injective_exchange_v2_market.OpenNotionalCap?>(
            19,
            (b) => injective_exchange_v2_market.OpenNotionalCap.deserialize(b),
          ),
      crossMarginEligible: decode.getBool<bool?>(20),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2ExpiryFuturesMarketLaunchProposal;
}

class DerivativeMarketParamUpdateProposal extends CosmosProtoMessage {
  final String? title;

  final String? description;

  final String? marketId;

  /// initial_margin_ratio defines the initial margin ratio for the derivative
  /// market
  final String? initialMarginRatio;

  /// maintenance_margin_ratio defines the maintenance margin ratio for the
  /// derivative market
  final String? maintenanceMarginRatio;

  /// maker_fee_rate defines the exchange trade fee for makers for the derivative
  /// market
  final String? makerFeeRate;

  /// taker_fee_rate defines the exchange trade fee for takers for the derivative
  /// market
  final String? takerFeeRate;

  /// relayer_fee_share_rate defines the relayer fee share rate for the
  /// derivative market
  final String? relayerFeeShareRate;

  /// min_price_tick_size defines the minimum tick size of the order's price and
  /// margin
  final String? minPriceTickSize;

  /// min_quantity_tick_size defines the minimum tick size of the order's
  /// quantity
  final String? minQuantityTickSize;

  /// hourly_interest_rate defines the hourly interest rate
  final String? hourlyInterestRate;

  /// hourly_funding_rate_cap defines the maximum absolute value of the hourly
  /// funding rate
  final String? hourlyFundingRateCap;

  final injective_exchange_v2_market.MarketStatus? status;

  final OracleParams? oracleParams;

  final String? ticker;

  /// min_notional defines the minimum notional (in quote asset) required for
  /// orders in the market
  final String? minNotional;

  final AdminInfo? adminInfo;

  /// reduce_margin_ratio defines the ratio of the margin that is reduced
  final String? reduceMarginRatio;

  /// open_notional_cap defines the maximum open notional for the market
  final injective_exchange_v2_market.OpenNotionalCap? openNotionalCap;

  /// has_disabled_minimal_protocol_fee defines whether the minimal protocol fee
  /// is disabled for the market
  final DisableMinimalProtocolFeeUpdate? hasDisabledMinimalProtocolFee;

  /// cross_margin_eligibility controls whether the market can participate in
  /// cross-margin pools
  final CrossMarginEligibility? crossMarginEligibility;

  const DerivativeMarketParamUpdateProposal({
    this.title,
    this.description,
    this.marketId,
    this.initialMarginRatio,
    this.maintenanceMarginRatio,
    this.makerFeeRate,
    this.takerFeeRate,
    this.relayerFeeShareRate,
    this.minPriceTickSize,
    this.minQuantityTickSize,
    this.hourlyInterestRate,
    this.hourlyFundingRateCap,
    this.status,
    this.oracleParams,
    this.ticker,
    this.minNotional,
    this.adminInfo,
    this.reduceMarginRatio,
    this.openNotionalCap,
    this.hasDisabledMinimalProtocolFee,
    this.crossMarginEligibility,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/DerivativeMarketParamUpdateProposal",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(7, options: const []),
        ProtoFieldConfig.string(8, options: const []),
        ProtoFieldConfig.string(9, options: const []),
        ProtoFieldConfig.string(10, options: const []),
        ProtoFieldConfig.string(11, options: const []),
        ProtoFieldConfig.string(12, options: const []),
        ProtoFieldConfig.enumType(13),
        ProtoFieldConfig.message(14),
        ProtoFieldConfig.string(15, options: const []),
        ProtoFieldConfig.string(16, options: const []),
        ProtoFieldConfig.message(17),
        ProtoFieldConfig.string(18, options: const []),
        ProtoFieldConfig.message(19, options: const []),
        ProtoFieldConfig.enumType(20, options: const []),
        ProtoFieldConfig.enumType(21),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    title,
    description,
    marketId,
    initialMarginRatio,
    maintenanceMarginRatio,
    makerFeeRate,
    takerFeeRate,
    relayerFeeShareRate,
    minPriceTickSize,
    minQuantityTickSize,
    hourlyInterestRate,
    hourlyFundingRateCap,
    status,
    oracleParams,
    ticker,
    minNotional,
    adminInfo,
    reduceMarginRatio,
    openNotionalCap,
    hasDisabledMinimalProtocolFee,
    crossMarginEligibility,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'title': title,
      'description': description,
      'market_id': marketId,
      'initial_margin_ratio': initialMarginRatio,
      'maintenance_margin_ratio': maintenanceMarginRatio,
      'maker_fee_rate': makerFeeRate,
      'taker_fee_rate': takerFeeRate,
      'relayer_fee_share_rate': relayerFeeShareRate,
      'min_price_tick_size': minPriceTickSize,
      'min_quantity_tick_size': minQuantityTickSize,
      'HourlyInterestRate': hourlyInterestRate,
      'HourlyFundingRateCap': hourlyFundingRateCap,
      'status': config.encodeEnum(status),
      'oracle_params': config.encodeMessage(oracleParams),
      'ticker': ticker,
      'min_notional': minNotional,
      'admin_info': config.encodeMessage(adminInfo),
      'reduce_margin_ratio': reduceMarginRatio,
      'open_notional_cap': config.encodeMessage(openNotionalCap),
      'has_disabled_minimal_protocol_fee': config.encodeEnum(
        hasDisabledMinimalProtocolFee,
      ),
      'cross_margin_eligibility': config.encodeEnum(crossMarginEligibility),
    };
  }

  factory DerivativeMarketParamUpdateProposal.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return DerivativeMarketParamUpdateProposal(
      title: json.valueAsString<String?>(
        'title',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      description: json.valueAsString<String?>(
        'description',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      initialMarginRatio: json.valueAsString<String?>(
        'initial_margin_ratio',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      maintenanceMarginRatio: json.valueAsString<String?>(
        'maintenance_margin_ratio',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      makerFeeRate: json.valueAsString<String?>(
        'maker_fee_rate',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      takerFeeRate: json.valueAsString<String?>(
        'taker_fee_rate',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      relayerFeeShareRate: json.valueAsString<String?>(
        'relayer_fee_share_rate',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      minPriceTickSize: json.valueAsString<String?>(
        'min_price_tick_size',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      minQuantityTickSize: json.valueAsString<String?>(
        'min_quantity_tick_size',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      hourlyInterestRate: json.valueAsString<String?>(
        'HourlyInterestRate',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      hourlyFundingRateCap: json.valueAsString<String?>(
        'HourlyFundingRateCap',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      status: json.valueTo<injective_exchange_v2_market.MarketStatus?, Object?>(
        key: 'status',
        parse: (v) => injective_exchange_v2_market.MarketStatus.from(v),
      ),
      oracleParams: json.valueTo<OracleParams?, Object>(
        key: 'oracle_params',
        parse:
            (v) => OracleParams.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      ticker: json.valueAsString<String?>(
        'ticker',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      minNotional: json.valueAsString<String?>(
        'min_notional',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      adminInfo: json.valueTo<AdminInfo?, Object>(
        key: 'admin_info',
        parse: (v) => AdminInfo.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      reduceMarginRatio: json.valueAsString<String?>(
        'reduce_margin_ratio',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      openNotionalCap: json
          .valueTo<injective_exchange_v2_market.OpenNotionalCap?, Object>(
            key: 'open_notional_cap',
            parse:
                (v) => injective_exchange_v2_market.OpenNotionalCap.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      hasDisabledMinimalProtocolFee: json
          .valueTo<DisableMinimalProtocolFeeUpdate?, Object?>(
            key: 'has_disabled_minimal_protocol_fee',
            parse: (v) => DisableMinimalProtocolFeeUpdate.from(v),
          ),
      crossMarginEligibility: json.valueTo<CrossMarginEligibility?, Object?>(
        key: 'cross_margin_eligibility',
        parse: (v) => CrossMarginEligibility.from(v),
      ),
    );
  }

  factory DerivativeMarketParamUpdateProposal.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DerivativeMarketParamUpdateProposal(
      title: decode.getString<String?>(1),
      description: decode.getString<String?>(2),
      marketId: decode.getString<String?>(3),
      initialMarginRatio: decode.getString<String?>(4),
      maintenanceMarginRatio: decode.getString<String?>(5),
      makerFeeRate: decode.getString<String?>(6),
      takerFeeRate: decode.getString<String?>(7),
      relayerFeeShareRate: decode.getString<String?>(8),
      minPriceTickSize: decode.getString<String?>(9),
      minQuantityTickSize: decode.getString<String?>(10),
      hourlyInterestRate: decode.getString<String?>(11),
      hourlyFundingRateCap: decode.getString<String?>(12),
      status: decode.getEnum<injective_exchange_v2_market.MarketStatus?>(
        13,
        injective_exchange_v2_market.MarketStatus.values,
      ),
      oracleParams: decode.messageTo<OracleParams?>(
        14,
        (b) => OracleParams.deserialize(b),
      ),
      ticker: decode.getString<String?>(15),
      minNotional: decode.getString<String?>(16),
      adminInfo: decode.messageTo<AdminInfo?>(
        17,
        (b) => AdminInfo.deserialize(b),
      ),
      reduceMarginRatio: decode.getString<String?>(18),
      openNotionalCap: decode
          .messageTo<injective_exchange_v2_market.OpenNotionalCap?>(
            19,
            (b) => injective_exchange_v2_market.OpenNotionalCap.deserialize(b),
          ),
      hasDisabledMinimalProtocolFee: decode
          .getEnum<DisableMinimalProtocolFeeUpdate?>(
            20,
            DisableMinimalProtocolFeeUpdate.values,
          ),
      crossMarginEligibility: decode.getEnum<CrossMarginEligibility?>(
        21,
        CrossMarginEligibility.values,
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2DerivativeMarketParamUpdateProposal;
}

class AdminInfo extends CosmosProtoMessage {
  final String? admin;

  final int? adminPermissions;

  const AdminInfo({this.admin, this.adminPermissions});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.uint32(2)],
    );
  }

  @override
  List<Object?> get protoValues => [admin, adminPermissions];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'admin': admin, 'admin_permissions': adminPermissions};
  }

  factory AdminInfo.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return AdminInfo(
      admin: json.valueAsString<String?>(
        'admin',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      adminPermissions: json.valueAsInt<int?>(
        'admin_permissions',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory AdminInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AdminInfo(
      admin: decode.getString<String?>(1),
      adminPermissions: decode.getInt<int?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2AdminInfo;
}

class MarketForcedSettlementProposal extends CosmosProtoMessage {
  final String? title;

  final String? description;

  final String? marketId;

  final String? settlementPrice;

  const MarketForcedSettlementProposal({
    this.title,
    this.description,
    this.marketId,
    this.settlementPrice,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MarketForcedSettlementProposal",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    title,
    description,
    marketId,
    settlementPrice,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'title': title,
      'description': description,
      'market_id': marketId,
      'settlement_price': settlementPrice,
    };
  }

  factory MarketForcedSettlementProposal.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MarketForcedSettlementProposal(
      title: json.valueAsString<String?>(
        'title',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      description: json.valueAsString<String?>(
        'description',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      settlementPrice: json.valueAsString<String?>(
        'settlement_price',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MarketForcedSettlementProposal.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MarketForcedSettlementProposal(
      title: decode.getString<String?>(1),
      description: decode.getString<String?>(2),
      marketId: decode.getString<String?>(3),
      settlementPrice: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MarketForcedSettlementProposal;
}

class UpdateAuctionExchangeTransferDenomDecimalsProposal
    extends CosmosProtoMessage {
  final String? title;

  final String? description;

  final List<injective_exchange_v2_exchange.DenomDecimals> denomDecimals;

  const UpdateAuctionExchangeTransferDenomDecimalsProposal({
    this.title,
    this.description,
    this.denomDecimals = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/UpdateAuctionExchangeTransferDenomDecimalsProposal",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [title, description, denomDecimals];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'title': title,
      'description': description,
      'denom_decimals':
          denomDecimals.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory UpdateAuctionExchangeTransferDenomDecimalsProposal.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return UpdateAuctionExchangeTransferDenomDecimalsProposal(
      title: json.valueAsString<String?>(
        'title',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      description: json.valueAsString<String?>(
        'description',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      denomDecimals:
          (json.valueEnsureAsList<dynamic>(
                'denom_decimals',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_exchange.DenomDecimals,
                  Object
                >(
                  value: e,
                  parse:
                      (v) =>
                          injective_exchange_v2_exchange.DenomDecimals.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                ),
              )
              .toList(),
    );
  }

  factory UpdateAuctionExchangeTransferDenomDecimalsProposal.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return UpdateAuctionExchangeTransferDenomDecimalsProposal(
      title: decode.getString<String?>(1),
      description: decode.getString<String?>(2),
      denomDecimals:
          decode
              .getListOfBytes(3)
              .map(
                (b) =>
                    injective_exchange_v2_exchange.DenomDecimals.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2UpdateAuctionExchangeTransferDenomDecimalsProposal;
}

class BinaryOptionsMarketParamUpdateProposal extends CosmosProtoMessage {
  final String? title;

  final String? description;

  final String? marketId;

  /// maker_fee_rate defines the exchange trade fee for makers for the derivative
  /// market
  final String? makerFeeRate;

  /// taker_fee_rate defines the exchange trade fee for takers for the derivative
  /// market
  final String? takerFeeRate;

  /// relayer_fee_share_rate defines the relayer fee share rate for the
  /// derivative market
  final String? relayerFeeShareRate;

  /// min_price_tick_size defines the minimum tick size of the order's price and
  /// margin
  final String? minPriceTickSize;

  /// min_quantity_tick_size defines the minimum tick size of the order's
  /// quantity
  final String? minQuantityTickSize;

  /// expiration timestamp
  final BigInt? expirationTimestamp;

  /// expiration timestamp
  final BigInt? settlementTimestamp;

  /// new price at which market will be settled
  final String? settlementPrice;

  /// admin of the market
  final String? admin;

  final injective_exchange_v2_market.MarketStatus? status;

  final ProviderOracleParams? oracleParams;

  final String? ticker;

  /// min_notional defines the minimum notional (in quote asset) required for
  /// orders in the market
  final String? minNotional;

  /// open_notional_cap defines the maximum open notional for the market
  final injective_exchange_v2_market.OpenNotionalCap? openNotionalCap;

  /// has_disabled_minimal_protocol_fee defines whether the minimal protocol fee
  /// is disabled for the market
  final DisableMinimalProtocolFeeUpdate? hasDisabledMinimalProtocolFee;

  const BinaryOptionsMarketParamUpdateProposal({
    this.title,
    this.description,
    this.marketId,
    this.makerFeeRate,
    this.takerFeeRate,
    this.relayerFeeShareRate,
    this.minPriceTickSize,
    this.minQuantityTickSize,
    this.expirationTimestamp,
    this.settlementTimestamp,
    this.settlementPrice,
    this.admin,
    this.status,
    this.oracleParams,
    this.ticker,
    this.minNotional,
    this.openNotionalCap,
    this.hasDisabledMinimalProtocolFee,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/BinaryOptionsMarketParamUpdateProposal",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(7, options: const []),
        ProtoFieldConfig.string(8, options: const []),
        ProtoFieldConfig.int64(9),
        ProtoFieldConfig.int64(10),
        ProtoFieldConfig.string(11, options: const []),
        ProtoFieldConfig.string(12),
        ProtoFieldConfig.enumType(13),
        ProtoFieldConfig.message(14),
        ProtoFieldConfig.string(15, options: const []),
        ProtoFieldConfig.string(16, options: const []),
        ProtoFieldConfig.message(17, options: const []),
        ProtoFieldConfig.enumType(18, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    title,
    description,
    marketId,
    makerFeeRate,
    takerFeeRate,
    relayerFeeShareRate,
    minPriceTickSize,
    minQuantityTickSize,
    expirationTimestamp,
    settlementTimestamp,
    settlementPrice,
    admin,
    status,
    oracleParams,
    ticker,
    minNotional,
    openNotionalCap,
    hasDisabledMinimalProtocolFee,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'title': title,
      'description': description,
      'market_id': marketId,
      'maker_fee_rate': makerFeeRate,
      'taker_fee_rate': takerFeeRate,
      'relayer_fee_share_rate': relayerFeeShareRate,
      'min_price_tick_size': minPriceTickSize,
      'min_quantity_tick_size': minQuantityTickSize,
      'expiration_timestamp': config.encodeBigint(expirationTimestamp),
      'settlement_timestamp': config.encodeBigint(settlementTimestamp),
      'settlement_price': settlementPrice,
      'admin': admin,
      'status': config.encodeEnum(status),
      'oracle_params': config.encodeMessage(oracleParams),
      'ticker': ticker,
      'min_notional': minNotional,
      'open_notional_cap': config.encodeMessage(openNotionalCap),
      'has_disabled_minimal_protocol_fee': config.encodeEnum(
        hasDisabledMinimalProtocolFee,
      ),
    };
  }

  factory BinaryOptionsMarketParamUpdateProposal.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return BinaryOptionsMarketParamUpdateProposal(
      title: json.valueAsString<String?>(
        'title',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      description: json.valueAsString<String?>(
        'description',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      makerFeeRate: json.valueAsString<String?>(
        'maker_fee_rate',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      takerFeeRate: json.valueAsString<String?>(
        'taker_fee_rate',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      relayerFeeShareRate: json.valueAsString<String?>(
        'relayer_fee_share_rate',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      minPriceTickSize: json.valueAsString<String?>(
        'min_price_tick_size',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      minQuantityTickSize: json.valueAsString<String?>(
        'min_quantity_tick_size',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      expirationTimestamp: json.valueAsBigInt<BigInt?>(
        'expiration_timestamp',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      settlementTimestamp: json.valueAsBigInt<BigInt?>(
        'settlement_timestamp',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      settlementPrice: json.valueAsString<String?>(
        'settlement_price',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      admin: json.valueAsString<String?>(
        'admin',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      status: json.valueTo<injective_exchange_v2_market.MarketStatus?, Object?>(
        key: 'status',
        parse: (v) => injective_exchange_v2_market.MarketStatus.from(v),
      ),
      oracleParams: json.valueTo<ProviderOracleParams?, Object>(
        key: 'oracle_params',
        parse:
            (v) => ProviderOracleParams.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      ticker: json.valueAsString<String?>(
        'ticker',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      minNotional: json.valueAsString<String?>(
        'min_notional',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      openNotionalCap: json
          .valueTo<injective_exchange_v2_market.OpenNotionalCap?, Object>(
            key: 'open_notional_cap',
            parse:
                (v) => injective_exchange_v2_market.OpenNotionalCap.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      hasDisabledMinimalProtocolFee: json
          .valueTo<DisableMinimalProtocolFeeUpdate?, Object?>(
            key: 'has_disabled_minimal_protocol_fee',
            parse: (v) => DisableMinimalProtocolFeeUpdate.from(v),
          ),
    );
  }

  factory BinaryOptionsMarketParamUpdateProposal.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BinaryOptionsMarketParamUpdateProposal(
      title: decode.getString<String?>(1),
      description: decode.getString<String?>(2),
      marketId: decode.getString<String?>(3),
      makerFeeRate: decode.getString<String?>(4),
      takerFeeRate: decode.getString<String?>(5),
      relayerFeeShareRate: decode.getString<String?>(6),
      minPriceTickSize: decode.getString<String?>(7),
      minQuantityTickSize: decode.getString<String?>(8),
      expirationTimestamp: decode.getBigInt<BigInt?>(9),
      settlementTimestamp: decode.getBigInt<BigInt?>(10),
      settlementPrice: decode.getString<String?>(11),
      admin: decode.getString<String?>(12),
      status: decode.getEnum<injective_exchange_v2_market.MarketStatus?>(
        13,
        injective_exchange_v2_market.MarketStatus.values,
      ),
      oracleParams: decode.messageTo<ProviderOracleParams?>(
        14,
        (b) => ProviderOracleParams.deserialize(b),
      ),
      ticker: decode.getString<String?>(15),
      minNotional: decode.getString<String?>(16),
      openNotionalCap: decode
          .messageTo<injective_exchange_v2_market.OpenNotionalCap?>(
            17,
            (b) => injective_exchange_v2_market.OpenNotionalCap.deserialize(b),
          ),
      hasDisabledMinimalProtocolFee: decode
          .getEnum<DisableMinimalProtocolFeeUpdate?>(
            18,
            DisableMinimalProtocolFeeUpdate.values,
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2BinaryOptionsMarketParamUpdateProposal;
}

class ProviderOracleParams extends CosmosProtoMessage {
  /// Oracle base currency
  final String? symbol;

  /// Oracle quote currency
  final String? provider;

  /// Scale factor for oracle prices.
  final int? oracleScaleFactor;

  /// Oracle type
  final injective_oracle_v1beta1_oracle.OracleType? oracleType;

  const ProviderOracleParams({
    this.symbol,
    this.provider,
    this.oracleScaleFactor,
    this.oracleType,
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
        ProtoFieldConfig.uint32(3),
        ProtoFieldConfig.enumType(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    symbol,
    provider,
    oracleScaleFactor,
    oracleType,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'symbol': symbol,
      'provider': provider,
      'oracle_scale_factor': oracleScaleFactor,
      'oracle_type': config.encodeEnum(oracleType),
    };
  }

  factory ProviderOracleParams.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ProviderOracleParams(
      symbol: json.valueAsString<String?>(
        'symbol',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      provider: json.valueAsString<String?>(
        'provider',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      oracleScaleFactor: json.valueAsInt<int?>(
        'oracle_scale_factor',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      oracleType: json
          .valueTo<injective_oracle_v1beta1_oracle.OracleType?, Object?>(
            key: 'oracle_type',
            parse: (v) => injective_oracle_v1beta1_oracle.OracleType.from(v),
          ),
    );
  }

  factory ProviderOracleParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ProviderOracleParams(
      symbol: decode.getString<String?>(1),
      provider: decode.getString<String?>(2),
      oracleScaleFactor: decode.getInt<int?>(3),
      oracleType: decode.getEnum<injective_oracle_v1beta1_oracle.OracleType?>(
        4,
        injective_oracle_v1beta1_oracle.OracleType.values,
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2ProviderOracleParams;
}

class OracleParams extends CosmosProtoMessage {
  /// Oracle base currency
  final String? oracleBase;

  /// Oracle quote currency
  final String? oracleQuote;

  /// Scale factor for oracle prices.
  final int? oracleScaleFactor;

  /// Oracle type
  final injective_oracle_v1beta1_oracle.OracleType? oracleType;

  const OracleParams({
    this.oracleBase,
    this.oracleQuote,
    this.oracleScaleFactor,
    this.oracleType,
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
        ProtoFieldConfig.uint32(3),
        ProtoFieldConfig.enumType(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    oracleBase,
    oracleQuote,
    oracleScaleFactor,
    oracleType,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'oracle_base': oracleBase,
      'oracle_quote': oracleQuote,
      'oracle_scale_factor': oracleScaleFactor,
      'oracle_type': config.encodeEnum(oracleType),
    };
  }

  factory OracleParams.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return OracleParams(
      oracleBase: json.valueAsString<String?>(
        'oracle_base',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      oracleQuote: json.valueAsString<String?>(
        'oracle_quote',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      oracleScaleFactor: json.valueAsInt<int?>(
        'oracle_scale_factor',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      oracleType: json
          .valueTo<injective_oracle_v1beta1_oracle.OracleType?, Object?>(
            key: 'oracle_type',
            parse: (v) => injective_oracle_v1beta1_oracle.OracleType.from(v),
          ),
    );
  }

  factory OracleParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return OracleParams(
      oracleBase: decode.getString<String?>(1),
      oracleQuote: decode.getString<String?>(2),
      oracleScaleFactor: decode.getInt<int?>(3),
      oracleType: decode.getEnum<injective_oracle_v1beta1_oracle.OracleType?>(
        4,
        injective_oracle_v1beta1_oracle.OracleType.values,
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2OracleParams;
}

class TradingRewardCampaignLaunchProposal extends CosmosProtoMessage {
  final String? title;

  final String? description;

  final injective_exchange_v2_exchange.TradingRewardCampaignInfo? campaignInfo;

  final List<injective_exchange_v2_exchange.CampaignRewardPool>
  campaignRewardPools;

  const TradingRewardCampaignLaunchProposal({
    this.title,
    this.description,
    this.campaignInfo,
    this.campaignRewardPools = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/TradingRewardCampaignLaunchProposal",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.message(3),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    title,
    description,
    campaignInfo,
    campaignRewardPools,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'title': title,
      'description': description,
      'campaign_info': config.encodeMessage(campaignInfo),
      'campaign_reward_pools':
          campaignRewardPools.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory TradingRewardCampaignLaunchProposal.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return TradingRewardCampaignLaunchProposal(
      title: json.valueAsString<String?>(
        'title',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      description: json.valueAsString<String?>(
        'description',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      campaignInfo: json.valueTo<
        injective_exchange_v2_exchange.TradingRewardCampaignInfo?,
        Object
      >(
        key: 'campaign_info',
        parse:
            (v) => injective_exchange_v2_exchange
                .TradingRewardCampaignInfo.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      campaignRewardPools:
          (json.valueEnsureAsList<dynamic>(
                'campaign_reward_pools',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_exchange.CampaignRewardPool,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_exchange
                          .CampaignRewardPool.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory TradingRewardCampaignLaunchProposal.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TradingRewardCampaignLaunchProposal(
      title: decode.getString<String?>(1),
      description: decode.getString<String?>(2),
      campaignInfo: decode
          .messageTo<injective_exchange_v2_exchange.TradingRewardCampaignInfo?>(
            3,
            (b) => injective_exchange_v2_exchange
                .TradingRewardCampaignInfo.deserialize(b),
          ),
      campaignRewardPools:
          decode
              .getListOfBytes(4)
              .map(
                (b) => injective_exchange_v2_exchange
                    .CampaignRewardPool.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2TradingRewardCampaignLaunchProposal;
}

class TradingRewardCampaignUpdateProposal extends CosmosProtoMessage {
  final String? title;

  final String? description;

  final injective_exchange_v2_exchange.TradingRewardCampaignInfo? campaignInfo;

  final List<injective_exchange_v2_exchange.CampaignRewardPool>
  campaignRewardPoolsAdditions;

  final List<injective_exchange_v2_exchange.CampaignRewardPool>
  campaignRewardPoolsUpdates;

  const TradingRewardCampaignUpdateProposal({
    this.title,
    this.description,
    this.campaignInfo,
    this.campaignRewardPoolsAdditions = const [],
    this.campaignRewardPoolsUpdates = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/TradingRewardCampaignUpdateProposal",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.message(3),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    title,
    description,
    campaignInfo,
    campaignRewardPoolsAdditions,
    campaignRewardPoolsUpdates,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'title': title,
      'description': description,
      'campaign_info': config.encodeMessage(campaignInfo),
      'campaign_reward_pools_additions':
          campaignRewardPoolsAdditions
              .map((e) => config.encodeMessage(e))
              .toList(),
      'campaign_reward_pools_updates':
          campaignRewardPoolsUpdates
              .map((e) => config.encodeMessage(e))
              .toList(),
    };
  }

  factory TradingRewardCampaignUpdateProposal.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return TradingRewardCampaignUpdateProposal(
      title: json.valueAsString<String?>(
        'title',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      description: json.valueAsString<String?>(
        'description',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      campaignInfo: json.valueTo<
        injective_exchange_v2_exchange.TradingRewardCampaignInfo?,
        Object
      >(
        key: 'campaign_info',
        parse:
            (v) => injective_exchange_v2_exchange
                .TradingRewardCampaignInfo.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      campaignRewardPoolsAdditions:
          (json.valueEnsureAsList<dynamic>(
                'campaign_reward_pools_additions',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_exchange.CampaignRewardPool,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_exchange
                          .CampaignRewardPool.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      campaignRewardPoolsUpdates:
          (json.valueEnsureAsList<dynamic>(
                'campaign_reward_pools_updates',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_exchange.CampaignRewardPool,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_exchange
                          .CampaignRewardPool.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory TradingRewardCampaignUpdateProposal.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TradingRewardCampaignUpdateProposal(
      title: decode.getString<String?>(1),
      description: decode.getString<String?>(2),
      campaignInfo: decode
          .messageTo<injective_exchange_v2_exchange.TradingRewardCampaignInfo?>(
            3,
            (b) => injective_exchange_v2_exchange
                .TradingRewardCampaignInfo.deserialize(b),
          ),
      campaignRewardPoolsAdditions:
          decode
              .getListOfBytes(4)
              .map(
                (b) => injective_exchange_v2_exchange
                    .CampaignRewardPool.deserialize(b),
              )
              .toList(),
      campaignRewardPoolsUpdates:
          decode
              .getListOfBytes(5)
              .map(
                (b) => injective_exchange_v2_exchange
                    .CampaignRewardPool.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2TradingRewardCampaignUpdateProposal;
}

class RewardPointUpdate extends CosmosProtoMessage {
  final String? accountAddress;

  /// new_points overwrites the current trading reward points for the account
  final String? newPoints;

  const RewardPointUpdate({this.accountAddress, this.newPoints});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(12, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [accountAddress, newPoints];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'account_address': accountAddress, 'new_points': newPoints};
  }

  factory RewardPointUpdate.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return RewardPointUpdate(
      accountAddress: json.valueAsString<String?>(
        'account_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      newPoints: json.valueAsString<String?>(
        'new_points',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory RewardPointUpdate.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RewardPointUpdate(
      accountAddress: decode.getString<String?>(1),
      newPoints: decode.getString<String?>(12),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2RewardPointUpdate;
}

class TradingRewardPendingPointsUpdateProposal extends CosmosProtoMessage {
  final String? title;

  final String? description;

  final BigInt? pendingPoolTimestamp;

  final List<RewardPointUpdate> rewardPointUpdates;

  const TradingRewardPendingPointsUpdateProposal({
    this.title,
    this.description,
    this.pendingPoolTimestamp,
    this.rewardPointUpdates = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/TradingRewardPendingPointsUpdateProposal",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.int64(3),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    title,
    description,
    pendingPoolTimestamp,
    rewardPointUpdates,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'title': title,
      'description': description,
      'pending_pool_timestamp': config.encodeBigint(pendingPoolTimestamp),
      'reward_point_updates':
          rewardPointUpdates.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory TradingRewardPendingPointsUpdateProposal.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return TradingRewardPendingPointsUpdateProposal(
      title: json.valueAsString<String?>(
        'title',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      description: json.valueAsString<String?>(
        'description',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      pendingPoolTimestamp: json.valueAsBigInt<BigInt?>(
        'pending_pool_timestamp',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      rewardPointUpdates:
          (json.valueEnsureAsList<dynamic>(
                'reward_point_updates',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<RewardPointUpdate, Object>(
                  value: e,
                  parse:
                      (v) => RewardPointUpdate.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory TradingRewardPendingPointsUpdateProposal.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TradingRewardPendingPointsUpdateProposal(
      title: decode.getString<String?>(1),
      description: decode.getString<String?>(2),
      pendingPoolTimestamp: decode.getBigInt<BigInt?>(3),
      rewardPointUpdates:
          decode
              .getListOfBytes(4)
              .map((b) => RewardPointUpdate.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2TradingRewardPendingPointsUpdateProposal;
}

class FeeDiscountProposal extends CosmosProtoMessage {
  final String? title;

  final String? description;

  final injective_exchange_v2_exchange.FeeDiscountSchedule? schedule;

  const FeeDiscountProposal({this.title, this.description, this.schedule});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/FeeDiscountProposal",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.message(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [title, description, schedule];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'title': title,
      'description': description,
      'schedule': config.encodeMessage(schedule),
    };
  }

  factory FeeDiscountProposal.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return FeeDiscountProposal(
      title: json.valueAsString<String?>(
        'title',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      description: json.valueAsString<String?>(
        'description',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      schedule: json
          .valueTo<injective_exchange_v2_exchange.FeeDiscountSchedule?, Object>(
            key: 'schedule',
            parse:
                (v) =>
                    injective_exchange_v2_exchange.FeeDiscountSchedule.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory FeeDiscountProposal.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return FeeDiscountProposal(
      title: decode.getString<String?>(1),
      description: decode.getString<String?>(2),
      schedule: decode
          .messageTo<injective_exchange_v2_exchange.FeeDiscountSchedule?>(
            3,
            (b) => injective_exchange_v2_exchange
                .FeeDiscountSchedule.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2FeeDiscountProposal;
}

class BatchCommunityPoolSpendProposal extends CosmosProtoMessage {
  final String? title;

  final String? description;

  final List<
    cosmos_distribution_v1beta1_distribution.CommunityPoolSpendProposal
  >
  proposals;

  const BatchCommunityPoolSpendProposal({
    this.title,
    this.description,
    this.proposals = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/BatchCommunityPoolSpendProposal",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [title, description, proposals];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'title': title,
      'description': description,
      'proposals': proposals.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory BatchCommunityPoolSpendProposal.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return BatchCommunityPoolSpendProposal(
      title: json.valueAsString<String?>(
        'title',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      description: json.valueAsString<String?>(
        'description',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      proposals:
          (json.valueEnsureAsList<dynamic>(
                'proposals',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_distribution_v1beta1_distribution.CommunityPoolSpendProposal,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => cosmos_distribution_v1beta1_distribution
                          .CommunityPoolSpendProposal.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory BatchCommunityPoolSpendProposal.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BatchCommunityPoolSpendProposal(
      title: decode.getString<String?>(1),
      description: decode.getString<String?>(2),
      proposals:
          decode
              .getListOfBytes(3)
              .map(
                (b) => cosmos_distribution_v1beta1_distribution
                    .CommunityPoolSpendProposal.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2BatchCommunityPoolSpendProposal;
}

/// AtomicMarketOrderFeeMultiplierScheduleProposal defines a SDK message for
/// proposing new atomic take fee multipliers for specified markets
class AtomicMarketOrderFeeMultiplierScheduleProposal
    extends CosmosProtoMessage {
  final String? title;

  final String? description;

  final List<injective_exchange_v2_market.MarketFeeMultiplier>
  marketFeeMultipliers;

  const AtomicMarketOrderFeeMultiplierScheduleProposal({
    this.title,
    this.description,
    this.marketFeeMultipliers = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/AtomicMarketOrderFeeMultiplierScheduleProposal",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [title, description, marketFeeMultipliers];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'title': title,
      'description': description,
      'market_fee_multipliers':
          marketFeeMultipliers.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory AtomicMarketOrderFeeMultiplierScheduleProposal.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return AtomicMarketOrderFeeMultiplierScheduleProposal(
      title: json.valueAsString<String?>(
        'title',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      description: json.valueAsString<String?>(
        'description',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      marketFeeMultipliers:
          (json.valueEnsureAsList<dynamic>(
                'market_fee_multipliers',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_market.MarketFeeMultiplier,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_market
                          .MarketFeeMultiplier.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory AtomicMarketOrderFeeMultiplierScheduleProposal.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AtomicMarketOrderFeeMultiplierScheduleProposal(
      title: decode.getString<String?>(1),
      description: decode.getString<String?>(2),
      marketFeeMultipliers:
          decode
              .getListOfBytes(3)
              .map(
                (b) => injective_exchange_v2_market
                    .MarketFeeMultiplier.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2AtomicMarketOrderFeeMultiplierScheduleProposal;
}

class DenomMinNotionalProposal extends CosmosProtoMessage {
  final String? title;

  final String? description;

  final List<injective_exchange_v2_exchange.DenomMinNotional> denomMinNotionals;

  const DenomMinNotionalProposal({
    this.title,
    this.description,
    this.denomMinNotionals = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/DenomMinNotionalProposal",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [title, description, denomMinNotionals];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'title': title,
      'description': description,
      'denom_min_notionals':
          denomMinNotionals.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory DenomMinNotionalProposal.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return DenomMinNotionalProposal(
      title: json.valueAsString<String?>(
        'title',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      description: json.valueAsString<String?>(
        'description',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      denomMinNotionals:
          (json.valueEnsureAsList<dynamic>(
                'denom_min_notionals',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_exchange.DenomMinNotional,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_exchange
                          .DenomMinNotional.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory DenomMinNotionalProposal.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DenomMinNotionalProposal(
      title: decode.getString<String?>(1),
      description: decode.getString<String?>(2),
      denomMinNotionals:
          decode
              .getListOfBytes(3)
              .map(
                (b) => injective_exchange_v2_exchange
                    .DenomMinNotional.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2DenomMinNotionalProposal;
}
