import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/exchange/v1beta1/src/exchange.dart"
    as injective_exchange_v1beta1_exchange;

/// GenesisState defines the exchange module's genesis state.
class GenesisState extends CosmosProtoMessage {
  /// params defines all the parameters of related to exchange.
  final injective_exchange_v1beta1_exchange.Params? params;

  /// spot_markets is an array containing the genesis trade pairs
  final List<injective_exchange_v1beta1_exchange.SpotMarket> spotMarkets;

  /// derivative_markets is an array containing the genesis derivative markets
  final List<injective_exchange_v1beta1_exchange.DerivativeMarket>
  derivativeMarkets;

  /// spot_orderbook defines the spot exchange limit orderbook active at genesis.
  final List<SpotOrderBook> spotOrderbook;

  /// derivative_orderbook defines the derivative exchange limit orderbook active
  /// at genesis.
  final List<DerivativeOrderBook> derivativeOrderbook;

  /// balances defines the exchange users balances active at genesis.
  final List<Balance> balances;

  /// positions defines the exchange derivative positions at genesis
  final List<DerivativePosition> positions;

  /// subaccount_trade_nonces defines the subaccount trade nonces for the
  /// subaccounts at genesis
  final List<SubaccountNonce> subaccountTradeNonces;

  /// expiry_futures_market_info defines the market info for the expiry futures
  /// markets at genesis
  final List<ExpiryFuturesMarketInfoState> expiryFuturesMarketInfoState;

  /// perpetual_market_info defines the market info for the perpetual derivative
  /// markets at genesis
  final List<injective_exchange_v1beta1_exchange.PerpetualMarketInfo>
  perpetualMarketInfo;

  /// perpetual_market_funding_state defines the funding state for the perpetual
  /// derivative markets at genesis
  final List<PerpetualMarketFundingState> perpetualMarketFundingState;

  /// derivative_market_settlement_scheduled defines the scheduled markets for
  /// settlement at genesis
  final List<injective_exchange_v1beta1_exchange.DerivativeMarketSettlementInfo>
  derivativeMarketSettlementScheduled;

  /// sets spot markets as enabled
  final bool? isSpotExchangeEnabled;

  /// sets derivative markets as enabled
  final bool? isDerivativesExchangeEnabled;

  /// the current trading reward campaign info
  final injective_exchange_v1beta1_exchange.TradingRewardCampaignInfo?
  tradingRewardCampaignInfo;

  /// the current and upcoming trading reward campaign pools
  final List<injective_exchange_v1beta1_exchange.CampaignRewardPool>
  tradingRewardPoolCampaignSchedule;

  /// the current trading reward account points
  final List<TradingRewardCampaignAccountPoints>
  tradingRewardCampaignAccountPoints;

  /// the fee discount schedule
  final injective_exchange_v1beta1_exchange.FeeDiscountSchedule?
  feeDiscountSchedule;

  /// the cached fee discount account tiers with TTL
  final List<FeeDiscountAccountTierTTL> feeDiscountAccountTierTtl;

  /// the fee discount paid by accounts in all buckets
  final List<FeeDiscountBucketVolumeAccounts> feeDiscountBucketVolumeAccounts;

  /// sets the first fee cycle as finished
  final bool? isFirstFeeCycleFinished;

  /// the current and upcoming trading reward campaign pending pools
  final List<injective_exchange_v1beta1_exchange.CampaignRewardPool>
  pendingTradingRewardPoolCampaignSchedule;

  /// the pending trading reward account points
  final List<TradingRewardCampaignAccountPendingPoints>
  pendingTradingRewardCampaignAccountPoints;

  /// the addresses opting out of trading rewards
  final List<String> rewardsOptOutAddresses;

  final List<injective_exchange_v1beta1_exchange.TradeRecords>
  historicalTradeRecords;

  /// binary_options_markets is an array containing the genesis binary options
  /// markets
  final List<injective_exchange_v1beta1_exchange.BinaryOptionsMarket>
  binaryOptionsMarkets;

  /// binary_options_markets_scheduled_for_settlement contains the marketIDs of
  /// binary options markets scheduled for next-block settlement
  final List<String> binaryOptionsMarketIdsScheduledForSettlement;

  /// spot_market_ids_scheduled_to_force_close defines the scheduled markets for
  /// forced closings at genesis
  final List<String> spotMarketIdsScheduledToForceClose;

  /// denom_decimals defines the denom decimals for the exchange.
  final List<injective_exchange_v1beta1_exchange.DenomDecimals> denomDecimals;

  /// conditional_derivative_orderbook contains conditional orderbooks for all
  /// markets (both lmit and market conditional orders)
  final List<ConditionalDerivativeOrderBook> conditionalDerivativeOrderbooks;

  /// market_fee_multipliers contains any non-default atomic order fee
  /// multipliers
  final List<injective_exchange_v1beta1_exchange.MarketFeeMultiplier>
  marketFeeMultipliers;

  final List<OrderbookSequence> orderbookSequences;

  final List<
    injective_exchange_v1beta1_exchange.AggregateSubaccountVolumeRecord
  >
  subaccountVolumes;

  final List<injective_exchange_v1beta1_exchange.MarketVolume> marketVolumes;

  final List<FullGrantAuthorizations> grantAuthorizations;

  final List<FullActiveGrant> activeGrants;

  final List<injective_exchange_v1beta1_exchange.DenomMinNotional>
  denomMinNotionals;

  const GenesisState({
    this.params,
    this.spotMarkets = const [],
    this.derivativeMarkets = const [],
    this.spotOrderbook = const [],
    this.derivativeOrderbook = const [],
    this.balances = const [],
    this.positions = const [],
    this.subaccountTradeNonces = const [],
    this.expiryFuturesMarketInfoState = const [],
    this.perpetualMarketInfo = const [],
    this.perpetualMarketFundingState = const [],
    this.derivativeMarketSettlementScheduled = const [],
    this.isSpotExchangeEnabled,
    this.isDerivativesExchangeEnabled,
    this.tradingRewardCampaignInfo,
    this.tradingRewardPoolCampaignSchedule = const [],
    this.tradingRewardCampaignAccountPoints = const [],
    this.feeDiscountSchedule,
    this.feeDiscountAccountTierTtl = const [],
    this.feeDiscountBucketVolumeAccounts = const [],
    this.isFirstFeeCycleFinished,
    this.pendingTradingRewardPoolCampaignSchedule = const [],
    this.pendingTradingRewardCampaignAccountPoints = const [],
    this.rewardsOptOutAddresses = const [],
    this.historicalTradeRecords = const [],
    this.binaryOptionsMarkets = const [],
    this.binaryOptionsMarketIdsScheduledForSettlement = const [],
    this.spotMarketIdsScheduledToForceClose = const [],
    this.denomDecimals = const [],
    this.conditionalDerivativeOrderbooks = const [],
    this.marketFeeMultipliers = const [],
    this.orderbookSequences = const [],
    this.subaccountVolumes = const [],
    this.marketVolumes = const [],
    this.grantAuthorizations = const [],
    this.activeGrants = const [],
    this.denomMinNotionals = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 7,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 8,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 9,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 10,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 11,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 12,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.bool(13),
        ProtoFieldConfig.bool(14),
        ProtoFieldConfig.message(15),
        ProtoFieldConfig.repeated(
          fieldNumber: 16,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 17,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.message(18),
        ProtoFieldConfig.repeated(
          fieldNumber: 19,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 20,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.bool(21),
        ProtoFieldConfig.repeated(
          fieldNumber: 22,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 23,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 24,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 25,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 26,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 27,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 28,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 29,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 30,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 31,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 32,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 33,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 34,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 35,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 36,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 37,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    params,
    spotMarkets,
    derivativeMarkets,
    spotOrderbook,
    derivativeOrderbook,
    balances,
    positions,
    subaccountTradeNonces,
    expiryFuturesMarketInfoState,
    perpetualMarketInfo,
    perpetualMarketFundingState,
    derivativeMarketSettlementScheduled,
    isSpotExchangeEnabled,
    isDerivativesExchangeEnabled,
    tradingRewardCampaignInfo,
    tradingRewardPoolCampaignSchedule,
    tradingRewardCampaignAccountPoints,
    feeDiscountSchedule,
    feeDiscountAccountTierTtl,
    feeDiscountBucketVolumeAccounts,
    isFirstFeeCycleFinished,
    pendingTradingRewardPoolCampaignSchedule,
    pendingTradingRewardCampaignAccountPoints,
    rewardsOptOutAddresses,
    historicalTradeRecords,
    binaryOptionsMarkets,
    binaryOptionsMarketIdsScheduledForSettlement,
    spotMarketIdsScheduledToForceClose,
    denomDecimals,
    conditionalDerivativeOrderbooks,
    marketFeeMultipliers,
    orderbookSequences,
    subaccountVolumes,
    marketVolumes,
    grantAuthorizations,
    activeGrants,
    denomMinNotionals,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'params': config.encodeMessage(params),
      'spot_markets': spotMarkets.map((e) => config.encodeMessage(e)).toList(),
      'derivative_markets':
          derivativeMarkets.map((e) => config.encodeMessage(e)).toList(),
      'spot_orderbook':
          spotOrderbook.map((e) => config.encodeMessage(e)).toList(),
      'derivative_orderbook':
          derivativeOrderbook.map((e) => config.encodeMessage(e)).toList(),
      'balances': balances.map((e) => config.encodeMessage(e)).toList(),
      'positions': positions.map((e) => config.encodeMessage(e)).toList(),
      'subaccount_trade_nonces':
          subaccountTradeNonces.map((e) => config.encodeMessage(e)).toList(),
      'expiry_futures_market_info_state':
          expiryFuturesMarketInfoState
              .map((e) => config.encodeMessage(e))
              .toList(),
      'perpetual_market_info':
          perpetualMarketInfo.map((e) => config.encodeMessage(e)).toList(),
      'perpetual_market_funding_state':
          perpetualMarketFundingState
              .map((e) => config.encodeMessage(e))
              .toList(),
      'derivative_market_settlement_scheduled':
          derivativeMarketSettlementScheduled
              .map((e) => config.encodeMessage(e))
              .toList(),
      'is_spot_exchange_enabled': isSpotExchangeEnabled,
      'is_derivatives_exchange_enabled': isDerivativesExchangeEnabled,
      'trading_reward_campaign_info': config.encodeMessage(
        tradingRewardCampaignInfo,
      ),
      'trading_reward_pool_campaign_schedule':
          tradingRewardPoolCampaignSchedule
              .map((e) => config.encodeMessage(e))
              .toList(),
      'trading_reward_campaign_account_points':
          tradingRewardCampaignAccountPoints
              .map((e) => config.encodeMessage(e))
              .toList(),
      'fee_discount_schedule': config.encodeMessage(feeDiscountSchedule),
      'fee_discount_account_tier_ttl':
          feeDiscountAccountTierTtl
              .map((e) => config.encodeMessage(e))
              .toList(),
      'fee_discount_bucket_volume_accounts':
          feeDiscountBucketVolumeAccounts
              .map((e) => config.encodeMessage(e))
              .toList(),
      'is_first_fee_cycle_finished': isFirstFeeCycleFinished,
      'pending_trading_reward_pool_campaign_schedule':
          pendingTradingRewardPoolCampaignSchedule
              .map((e) => config.encodeMessage(e))
              .toList(),
      'pending_trading_reward_campaign_account_points':
          pendingTradingRewardCampaignAccountPoints
              .map((e) => config.encodeMessage(e))
              .toList(),
      'rewards_opt_out_addresses':
          rewardsOptOutAddresses.map((e) => e).toList(),
      'historical_trade_records':
          historicalTradeRecords.map((e) => config.encodeMessage(e)).toList(),
      'binary_options_markets':
          binaryOptionsMarkets.map((e) => config.encodeMessage(e)).toList(),
      'binary_options_market_ids_scheduled_for_settlement':
          binaryOptionsMarketIdsScheduledForSettlement.map((e) => e).toList(),
      'spot_market_ids_scheduled_to_force_close':
          spotMarketIdsScheduledToForceClose.map((e) => e).toList(),
      'denom_decimals':
          denomDecimals.map((e) => config.encodeMessage(e)).toList(),
      'conditional_derivative_orderbooks':
          conditionalDerivativeOrderbooks
              .map((e) => config.encodeMessage(e))
              .toList(),
      'market_fee_multipliers':
          marketFeeMultipliers.map((e) => config.encodeMessage(e)).toList(),
      'orderbook_sequences':
          orderbookSequences.map((e) => config.encodeMessage(e)).toList(),
      'subaccount_volumes':
          subaccountVolumes.map((e) => config.encodeMessage(e)).toList(),
      'market_volumes':
          marketVolumes.map((e) => config.encodeMessage(e)).toList(),
      'grant_authorizations':
          grantAuthorizations.map((e) => config.encodeMessage(e)).toList(),
      'active_grants':
          activeGrants.map((e) => config.encodeMessage(e)).toList(),
      'denom_min_notionals':
          denomMinNotionals.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory GenesisState.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return GenesisState(
      params: json.valueTo<injective_exchange_v1beta1_exchange.Params?, Object>(
        key: 'params',
        parse:
            (v) => injective_exchange_v1beta1_exchange.Params.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      spotMarkets:
          (json.valueEnsureAsList<dynamic>(
                'spot_markets',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v1beta1_exchange.SpotMarket,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_exchange
                          .SpotMarket.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      derivativeMarkets:
          (json.valueEnsureAsList<dynamic>(
                'derivative_markets',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v1beta1_exchange.DerivativeMarket,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_exchange
                          .DerivativeMarket.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      spotOrderbook:
          (json.valueEnsureAsList<dynamic>(
                'spot_orderbook',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<SpotOrderBook, Object>(
                  value: e,
                  parse:
                      (v) => SpotOrderBook.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      derivativeOrderbook:
          (json.valueEnsureAsList<dynamic>(
                'derivative_orderbook',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<DerivativeOrderBook, Object>(
                  value: e,
                  parse:
                      (v) => DerivativeOrderBook.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      balances:
          (json.valueEnsureAsList<dynamic>(
                'balances',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<Balance, Object>(
                  value: e,
                  parse:
                      (v) => Balance.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      positions:
          (json.valueEnsureAsList<dynamic>(
                'positions',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<DerivativePosition, Object>(
                  value: e,
                  parse:
                      (v) => DerivativePosition.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      subaccountTradeNonces:
          (json.valueEnsureAsList<dynamic>(
                'subaccount_trade_nonces',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<SubaccountNonce, Object>(
                  value: e,
                  parse:
                      (v) => SubaccountNonce.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      expiryFuturesMarketInfoState:
          (json.valueEnsureAsList<dynamic>(
                'expiry_futures_market_info_state',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<ExpiryFuturesMarketInfoState, Object>(
                  value: e,
                  parse:
                      (v) => ExpiryFuturesMarketInfoState.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      perpetualMarketInfo:
          (json.valueEnsureAsList<dynamic>(
                'perpetual_market_info',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v1beta1_exchange.PerpetualMarketInfo,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_exchange
                          .PerpetualMarketInfo.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      perpetualMarketFundingState:
          (json.valueEnsureAsList<dynamic>(
                'perpetual_market_funding_state',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<PerpetualMarketFundingState, Object>(
                  value: e,
                  parse:
                      (v) => PerpetualMarketFundingState.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      derivativeMarketSettlementScheduled:
          (json.valueEnsureAsList<dynamic>(
                'derivative_market_settlement_scheduled',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v1beta1_exchange.DerivativeMarketSettlementInfo,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_exchange
                          .DerivativeMarketSettlementInfo.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      isSpotExchangeEnabled: json.valueAsBool<bool?>(
        'is_spot_exchange_enabled',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      isDerivativesExchangeEnabled: json.valueAsBool<bool?>(
        'is_derivatives_exchange_enabled',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      tradingRewardCampaignInfo: json.valueTo<
        injective_exchange_v1beta1_exchange.TradingRewardCampaignInfo?,
        Object
      >(
        key: 'trading_reward_campaign_info',
        parse:
            (v) => injective_exchange_v1beta1_exchange
                .TradingRewardCampaignInfo.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      tradingRewardPoolCampaignSchedule:
          (json.valueEnsureAsList<dynamic>(
                'trading_reward_pool_campaign_schedule',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v1beta1_exchange.CampaignRewardPool,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_exchange
                          .CampaignRewardPool.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      tradingRewardCampaignAccountPoints:
          (json.valueEnsureAsList<dynamic>(
                'trading_reward_campaign_account_points',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  TradingRewardCampaignAccountPoints,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => TradingRewardCampaignAccountPoints.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      feeDiscountSchedule: json.valueTo<
        injective_exchange_v1beta1_exchange.FeeDiscountSchedule?,
        Object
      >(
        key: 'fee_discount_schedule',
        parse:
            (v) => injective_exchange_v1beta1_exchange
                .FeeDiscountSchedule.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      feeDiscountAccountTierTtl:
          (json.valueEnsureAsList<dynamic>(
                'fee_discount_account_tier_ttl',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<FeeDiscountAccountTierTTL, Object>(
                  value: e,
                  parse:
                      (v) => FeeDiscountAccountTierTTL.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      feeDiscountBucketVolumeAccounts:
          (json.valueEnsureAsList<dynamic>(
                'fee_discount_bucket_volume_accounts',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<FeeDiscountBucketVolumeAccounts, Object>(
                      value: e,
                      parse:
                          (v) => FeeDiscountBucketVolumeAccounts.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
      isFirstFeeCycleFinished: json.valueAsBool<bool?>(
        'is_first_fee_cycle_finished',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      pendingTradingRewardPoolCampaignSchedule:
          (json.valueEnsureAsList<dynamic>(
                'pending_trading_reward_pool_campaign_schedule',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v1beta1_exchange.CampaignRewardPool,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_exchange
                          .CampaignRewardPool.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      pendingTradingRewardCampaignAccountPoints:
          (json.valueEnsureAsList<dynamic>(
                'pending_trading_reward_campaign_account_points',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  TradingRewardCampaignAccountPendingPoints,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => TradingRewardCampaignAccountPendingPoints.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      rewardsOptOutAddresses:
          (json.valueEnsureAsList<dynamic>(
            'rewards_opt_out_addresses',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      historicalTradeRecords:
          (json.valueEnsureAsList<dynamic>(
                'historical_trade_records',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v1beta1_exchange.TradeRecords,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_exchange
                          .TradeRecords.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      binaryOptionsMarkets:
          (json.valueEnsureAsList<dynamic>(
                'binary_options_markets',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v1beta1_exchange.BinaryOptionsMarket,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_exchange
                          .BinaryOptionsMarket.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      binaryOptionsMarketIdsScheduledForSettlement:
          (json.valueEnsureAsList<dynamic>(
            'binary_options_market_ids_scheduled_for_settlement',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      spotMarketIdsScheduledToForceClose:
          (json.valueEnsureAsList<dynamic>(
            'spot_market_ids_scheduled_to_force_close',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      denomDecimals:
          (json.valueEnsureAsList<dynamic>(
                'denom_decimals',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v1beta1_exchange.DenomDecimals,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_exchange
                          .DenomDecimals.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      conditionalDerivativeOrderbooks:
          (json.valueEnsureAsList<dynamic>(
                'conditional_derivative_orderbooks',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<ConditionalDerivativeOrderBook, Object>(
                      value: e,
                      parse:
                          (v) => ConditionalDerivativeOrderBook.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
      marketFeeMultipliers:
          (json.valueEnsureAsList<dynamic>(
                'market_fee_multipliers',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v1beta1_exchange.MarketFeeMultiplier,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_exchange
                          .MarketFeeMultiplier.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      orderbookSequences:
          (json.valueEnsureAsList<dynamic>(
                'orderbook_sequences',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<OrderbookSequence, Object>(
                  value: e,
                  parse:
                      (v) => OrderbookSequence.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      subaccountVolumes:
          (json.valueEnsureAsList<dynamic>(
                'subaccount_volumes',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v1beta1_exchange.AggregateSubaccountVolumeRecord,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_exchange
                          .AggregateSubaccountVolumeRecord.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      marketVolumes:
          (json.valueEnsureAsList<dynamic>(
                'market_volumes',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v1beta1_exchange.MarketVolume,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_exchange
                          .MarketVolume.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      grantAuthorizations:
          (json.valueEnsureAsList<dynamic>(
                'grant_authorizations',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<FullGrantAuthorizations, Object>(
                  value: e,
                  parse:
                      (v) => FullGrantAuthorizations.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      activeGrants:
          (json.valueEnsureAsList<dynamic>(
                'active_grants',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<FullActiveGrant, Object>(
                  value: e,
                  parse:
                      (v) => FullActiveGrant.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      denomMinNotionals:
          (json.valueEnsureAsList<dynamic>(
                'denom_min_notionals',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v1beta1_exchange.DenomMinNotional,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_exchange
                          .DenomMinNotional.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory GenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GenesisState(
      params: decode.messageTo<injective_exchange_v1beta1_exchange.Params?>(
        1,
        (b) => injective_exchange_v1beta1_exchange.Params.deserialize(b),
      ),
      spotMarkets:
          decode
              .getListOfBytes(2)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .SpotMarket.deserialize(b),
              )
              .toList(),
      derivativeMarkets:
          decode
              .getListOfBytes(3)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .DerivativeMarket.deserialize(b),
              )
              .toList(),
      spotOrderbook:
          decode
              .getListOfBytes(4)
              .map((b) => SpotOrderBook.deserialize(b))
              .toList(),
      derivativeOrderbook:
          decode
              .getListOfBytes(5)
              .map((b) => DerivativeOrderBook.deserialize(b))
              .toList(),
      balances:
          decode.getListOfBytes(6).map((b) => Balance.deserialize(b)).toList(),
      positions:
          decode
              .getListOfBytes(7)
              .map((b) => DerivativePosition.deserialize(b))
              .toList(),
      subaccountTradeNonces:
          decode
              .getListOfBytes(8)
              .map((b) => SubaccountNonce.deserialize(b))
              .toList(),
      expiryFuturesMarketInfoState:
          decode
              .getListOfBytes(9)
              .map((b) => ExpiryFuturesMarketInfoState.deserialize(b))
              .toList(),
      perpetualMarketInfo:
          decode
              .getListOfBytes(10)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .PerpetualMarketInfo.deserialize(b),
              )
              .toList(),
      perpetualMarketFundingState:
          decode
              .getListOfBytes(11)
              .map((b) => PerpetualMarketFundingState.deserialize(b))
              .toList(),
      derivativeMarketSettlementScheduled:
          decode
              .getListOfBytes(12)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .DerivativeMarketSettlementInfo.deserialize(b),
              )
              .toList(),
      isSpotExchangeEnabled: decode.getBool<bool?>(13),
      isDerivativesExchangeEnabled: decode.getBool<bool?>(14),
      tradingRewardCampaignInfo: decode.messageTo<
        injective_exchange_v1beta1_exchange.TradingRewardCampaignInfo?
      >(
        15,
        (b) => injective_exchange_v1beta1_exchange
            .TradingRewardCampaignInfo.deserialize(b),
      ),
      tradingRewardPoolCampaignSchedule:
          decode
              .getListOfBytes(16)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .CampaignRewardPool.deserialize(b),
              )
              .toList(),
      tradingRewardCampaignAccountPoints:
          decode
              .getListOfBytes(17)
              .map((b) => TradingRewardCampaignAccountPoints.deserialize(b))
              .toList(),
      feeDiscountSchedule: decode
          .messageTo<injective_exchange_v1beta1_exchange.FeeDiscountSchedule?>(
            18,
            (b) => injective_exchange_v1beta1_exchange
                .FeeDiscountSchedule.deserialize(b),
          ),
      feeDiscountAccountTierTtl:
          decode
              .getListOfBytes(19)
              .map((b) => FeeDiscountAccountTierTTL.deserialize(b))
              .toList(),
      feeDiscountBucketVolumeAccounts:
          decode
              .getListOfBytes(20)
              .map((b) => FeeDiscountBucketVolumeAccounts.deserialize(b))
              .toList(),
      isFirstFeeCycleFinished: decode.getBool<bool?>(21),
      pendingTradingRewardPoolCampaignSchedule:
          decode
              .getListOfBytes(22)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .CampaignRewardPool.deserialize(b),
              )
              .toList(),
      pendingTradingRewardCampaignAccountPoints:
          decode
              .getListOfBytes(23)
              .map(
                (b) => TradingRewardCampaignAccountPendingPoints.deserialize(b),
              )
              .toList(),
      rewardsOptOutAddresses: decode.getListOrEmpty<String>(24),
      historicalTradeRecords:
          decode
              .getListOfBytes(25)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .TradeRecords.deserialize(b),
              )
              .toList(),
      binaryOptionsMarkets:
          decode
              .getListOfBytes(26)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .BinaryOptionsMarket.deserialize(b),
              )
              .toList(),
      binaryOptionsMarketIdsScheduledForSettlement: decode
          .getListOrEmpty<String>(27),
      spotMarketIdsScheduledToForceClose: decode.getListOrEmpty<String>(28),
      denomDecimals:
          decode
              .getListOfBytes(29)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .DenomDecimals.deserialize(b),
              )
              .toList(),
      conditionalDerivativeOrderbooks:
          decode
              .getListOfBytes(30)
              .map((b) => ConditionalDerivativeOrderBook.deserialize(b))
              .toList(),
      marketFeeMultipliers:
          decode
              .getListOfBytes(31)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .MarketFeeMultiplier.deserialize(b),
              )
              .toList(),
      orderbookSequences:
          decode
              .getListOfBytes(32)
              .map((b) => OrderbookSequence.deserialize(b))
              .toList(),
      subaccountVolumes:
          decode
              .getListOfBytes(33)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .AggregateSubaccountVolumeRecord.deserialize(b),
              )
              .toList(),
      marketVolumes:
          decode
              .getListOfBytes(34)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .MarketVolume.deserialize(b),
              )
              .toList(),
      grantAuthorizations:
          decode
              .getListOfBytes(35)
              .map((b) => FullGrantAuthorizations.deserialize(b))
              .toList(),
      activeGrants:
          decode
              .getListOfBytes(36)
              .map((b) => FullActiveGrant.deserialize(b))
              .toList(),
      denomMinNotionals:
          decode
              .getListOfBytes(37)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .DenomMinNotional.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1GenesisState;
}

class OrderbookSequence extends CosmosProtoMessage {
  final BigInt? sequence;

  final String? marketId;

  const OrderbookSequence({this.sequence, this.marketId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint64(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [sequence, marketId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'sequence': config.encodeBigint(sequence), 'market_id': marketId};
  }

  factory OrderbookSequence.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return OrderbookSequence(
      sequence: json.valueAsBigInt<BigInt?>(
        'sequence',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory OrderbookSequence.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return OrderbookSequence(
      sequence: decode.getBigInt<BigInt?>(1),
      marketId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1OrderbookSequence;
}

class FeeDiscountAccountTierTTL extends CosmosProtoMessage {
  final String? account;

  final injective_exchange_v1beta1_exchange.FeeDiscountTierTTL? tierTtl;

  const FeeDiscountAccountTierTTL({this.account, this.tierTtl});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [account, tierTtl];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'account': account, 'tier_ttl': config.encodeMessage(tierTtl)};
  }

  factory FeeDiscountAccountTierTTL.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return FeeDiscountAccountTierTTL(
      account: json.valueAsString<String?>(
        'account',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      tierTtl: json.valueTo<
        injective_exchange_v1beta1_exchange.FeeDiscountTierTTL?,
        Object
      >(
        key: 'tier_ttl',
        parse:
            (v) =>
                injective_exchange_v1beta1_exchange.FeeDiscountTierTTL.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory FeeDiscountAccountTierTTL.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return FeeDiscountAccountTierTTL(
      account: decode.getString<String?>(1),
      tierTtl: decode
          .messageTo<injective_exchange_v1beta1_exchange.FeeDiscountTierTTL?>(
            2,
            (b) => injective_exchange_v1beta1_exchange
                .FeeDiscountTierTTL.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1FeeDiscountAccountTierTTL;
}

class FeeDiscountBucketVolumeAccounts extends CosmosProtoMessage {
  final BigInt? bucketStartTimestamp;

  final List<AccountVolume> accountVolume;

  const FeeDiscountBucketVolumeAccounts({
    this.bucketStartTimestamp,
    this.accountVolume = const [],
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
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [bucketStartTimestamp, accountVolume];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'bucket_start_timestamp': config.encodeBigint(bucketStartTimestamp),
      'account_volume':
          accountVolume.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory FeeDiscountBucketVolumeAccounts.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return FeeDiscountBucketVolumeAccounts(
      bucketStartTimestamp: json.valueAsBigInt<BigInt?>(
        'bucket_start_timestamp',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      accountVolume:
          (json.valueEnsureAsList<dynamic>(
                'account_volume',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<AccountVolume, Object>(
                  value: e,
                  parse:
                      (v) => AccountVolume.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory FeeDiscountBucketVolumeAccounts.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return FeeDiscountBucketVolumeAccounts(
      bucketStartTimestamp: decode.getBigInt<BigInt?>(1),
      accountVolume:
          decode
              .getListOfBytes(2)
              .map((b) => AccountVolume.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1FeeDiscountBucketVolumeAccounts;
}

class AccountVolume extends CosmosProtoMessage {
  final String? account;

  final String? volume;

  const AccountVolume({this.account, this.volume});

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
  List<Object?> get protoValues => [account, volume];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'account': account, 'volume': volume};
  }

  factory AccountVolume.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return AccountVolume(
      account: json.valueAsString<String?>(
        'account',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      volume: json.valueAsString<String?>(
        'volume',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory AccountVolume.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AccountVolume(
      account: decode.getString<String?>(1),
      volume: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1AccountVolume;
}

class TradingRewardCampaignAccountPoints extends CosmosProtoMessage {
  final String? account;

  final String? points;

  const TradingRewardCampaignAccountPoints({this.account, this.points});

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
  List<Object?> get protoValues => [account, points];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'account': account, 'points': points};
  }

  factory TradingRewardCampaignAccountPoints.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return TradingRewardCampaignAccountPoints(
      account: json.valueAsString<String?>(
        'account',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      points: json.valueAsString<String?>(
        'points',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory TradingRewardCampaignAccountPoints.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TradingRewardCampaignAccountPoints(
      account: decode.getString<String?>(1),
      points: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1TradingRewardCampaignAccountPoints;
}

class TradingRewardCampaignAccountPendingPoints extends CosmosProtoMessage {
  final BigInt? rewardPoolStartTimestamp;

  final List<TradingRewardCampaignAccountPoints> accountPoints;

  const TradingRewardCampaignAccountPendingPoints({
    this.rewardPoolStartTimestamp,
    this.accountPoints = const [],
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
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [rewardPoolStartTimestamp, accountPoints];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'reward_pool_start_timestamp': config.encodeBigint(
        rewardPoolStartTimestamp,
      ),
      'account_points':
          accountPoints.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory TradingRewardCampaignAccountPendingPoints.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return TradingRewardCampaignAccountPendingPoints(
      rewardPoolStartTimestamp: json.valueAsBigInt<BigInt?>(
        'reward_pool_start_timestamp',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      accountPoints:
          (json.valueEnsureAsList<dynamic>(
                'account_points',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  TradingRewardCampaignAccountPoints,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => TradingRewardCampaignAccountPoints.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory TradingRewardCampaignAccountPendingPoints.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TradingRewardCampaignAccountPendingPoints(
      rewardPoolStartTimestamp: decode.getBigInt<BigInt?>(1),
      accountPoints:
          decode
              .getListOfBytes(2)
              .map((b) => TradingRewardCampaignAccountPoints.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1TradingRewardCampaignAccountPendingPoints;
}

/// Spot Exchange Limit Orderbook
class SpotOrderBook extends CosmosProtoMessage {
  final String? marketId;

  final bool? isBuySide;

  final List<injective_exchange_v1beta1_exchange.SpotLimitOrder> orders;

  const SpotOrderBook({this.marketId, this.isBuySide, this.orders = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.bool(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [marketId, isBuySide, orders];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'market_id': marketId,
      'isBuySide': isBuySide,
      'orders': orders.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory SpotOrderBook.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return SpotOrderBook(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      isBuySide: json.valueAsBool<bool?>(
        'isBuySide',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      orders:
          (json.valueEnsureAsList<dynamic>(
                'orders',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v1beta1_exchange.SpotLimitOrder,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_exchange
                          .SpotLimitOrder.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory SpotOrderBook.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SpotOrderBook(
      marketId: decode.getString<String?>(1),
      isBuySide: decode.getBool<bool?>(2),
      orders:
          decode
              .getListOfBytes(3)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .SpotLimitOrder.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1SpotOrderBook;
}

/// Derivative Exchange Limit Orderbook
class DerivativeOrderBook extends CosmosProtoMessage {
  final String? marketId;

  final bool? isBuySide;

  final List<injective_exchange_v1beta1_exchange.DerivativeLimitOrder> orders;

  const DerivativeOrderBook({
    this.marketId,
    this.isBuySide,
    this.orders = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.bool(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [marketId, isBuySide, orders];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'market_id': marketId,
      'isBuySide': isBuySide,
      'orders': orders.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory DerivativeOrderBook.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return DerivativeOrderBook(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      isBuySide: json.valueAsBool<bool?>(
        'isBuySide',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      orders:
          (json.valueEnsureAsList<dynamic>(
                'orders',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v1beta1_exchange.DerivativeLimitOrder,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_exchange
                          .DerivativeLimitOrder.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory DerivativeOrderBook.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DerivativeOrderBook(
      marketId: decode.getString<String?>(1),
      isBuySide: decode.getBool<bool?>(2),
      orders:
          decode
              .getListOfBytes(3)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .DerivativeLimitOrder.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1DerivativeOrderBook;
}

/// Orderbook containing limit &amp; market conditional orders
class ConditionalDerivativeOrderBook extends CosmosProtoMessage {
  final String? marketId;

  final List<injective_exchange_v1beta1_exchange.DerivativeLimitOrder>
  limitBuyOrders;

  final List<injective_exchange_v1beta1_exchange.DerivativeMarketOrder>
  marketBuyOrders;

  final List<injective_exchange_v1beta1_exchange.DerivativeLimitOrder>
  limitSellOrders;

  final List<injective_exchange_v1beta1_exchange.DerivativeMarketOrder>
  marketSellOrders;

  const ConditionalDerivativeOrderBook({
    this.marketId,
    this.limitBuyOrders = const [],
    this.marketBuyOrders = const [],
    this.limitSellOrders = const [],
    this.marketSellOrders = const [],
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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    marketId,
    limitBuyOrders,
    marketBuyOrders,
    limitSellOrders,
    marketSellOrders,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'market_id': marketId,
      'limit_buy_orders':
          limitBuyOrders.map((e) => config.encodeMessage(e)).toList(),
      'market_buy_orders':
          marketBuyOrders.map((e) => config.encodeMessage(e)).toList(),
      'limit_sell_orders':
          limitSellOrders.map((e) => config.encodeMessage(e)).toList(),
      'market_sell_orders':
          marketSellOrders.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory ConditionalDerivativeOrderBook.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ConditionalDerivativeOrderBook(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      limitBuyOrders:
          (json.valueEnsureAsList<dynamic>(
                'limit_buy_orders',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v1beta1_exchange.DerivativeLimitOrder,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_exchange
                          .DerivativeLimitOrder.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      marketBuyOrders:
          (json.valueEnsureAsList<dynamic>(
                'market_buy_orders',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v1beta1_exchange.DerivativeMarketOrder,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_exchange
                          .DerivativeMarketOrder.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      limitSellOrders:
          (json.valueEnsureAsList<dynamic>(
                'limit_sell_orders',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v1beta1_exchange.DerivativeLimitOrder,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_exchange
                          .DerivativeLimitOrder.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      marketSellOrders:
          (json.valueEnsureAsList<dynamic>(
                'market_sell_orders',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v1beta1_exchange.DerivativeMarketOrder,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_exchange
                          .DerivativeMarketOrder.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory ConditionalDerivativeOrderBook.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ConditionalDerivativeOrderBook(
      marketId: decode.getString<String?>(1),
      limitBuyOrders:
          decode
              .getListOfBytes(2)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .DerivativeLimitOrder.deserialize(b),
              )
              .toList(),
      marketBuyOrders:
          decode
              .getListOfBytes(3)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .DerivativeMarketOrder.deserialize(b),
              )
              .toList(),
      limitSellOrders:
          decode
              .getListOfBytes(4)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .DerivativeLimitOrder.deserialize(b),
              )
              .toList(),
      marketSellOrders:
          decode
              .getListOfBytes(5)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .DerivativeMarketOrder.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1ConditionalDerivativeOrderBook;
}

class Balance extends CosmosProtoMessage {
  /// the subaccount ID
  final String? subaccountId;

  /// the denom of the balance
  final String? denom;

  /// the token deposits details
  final injective_exchange_v1beta1_exchange.Deposit? deposits;

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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'subaccount_id': subaccountId,
      'denom': denom,
      'deposits': config.encodeMessage(deposits),
    };
  }

  factory Balance.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Balance(
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      denom: json.valueAsString<String?>(
        'denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      deposits: json
          .valueTo<injective_exchange_v1beta1_exchange.Deposit?, Object>(
            key: 'deposits',
            parse:
                (v) => injective_exchange_v1beta1_exchange.Deposit.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory Balance.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Balance(
      subaccountId: decode.getString<String?>(1),
      denom: decode.getString<String?>(2),
      deposits: decode.messageTo<injective_exchange_v1beta1_exchange.Deposit?>(
        3,
        (b) => injective_exchange_v1beta1_exchange.Deposit.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1Balance;
}

class DerivativePosition extends CosmosProtoMessage {
  /// the subaccount ID
  final String? subaccountId;

  /// the market ID
  final String? marketId;

  /// the position details
  final injective_exchange_v1beta1_exchange.Position? position;

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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'subaccount_id': subaccountId,
      'market_id': marketId,
      'position': config.encodeMessage(position),
    };
  }

  factory DerivativePosition.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return DerivativePosition(
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      position: json
          .valueTo<injective_exchange_v1beta1_exchange.Position?, Object>(
            key: 'position',
            parse:
                (v) => injective_exchange_v1beta1_exchange.Position.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory DerivativePosition.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DerivativePosition(
      subaccountId: decode.getString<String?>(1),
      marketId: decode.getString<String?>(2),
      position: decode.messageTo<injective_exchange_v1beta1_exchange.Position?>(
        3,
        (b) => injective_exchange_v1beta1_exchange.Position.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1DerivativePosition;
}

class SubaccountNonce extends CosmosProtoMessage {
  /// the subaccount ID
  final String? subaccountId;

  /// the subaccount trade nonce
  final injective_exchange_v1beta1_exchange.SubaccountTradeNonce?
  subaccountTradeNonce;

  const SubaccountNonce({this.subaccountId, this.subaccountTradeNonce});

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
  List<Object?> get protoValues => [subaccountId, subaccountTradeNonce];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'subaccount_id': subaccountId,
      'subaccount_trade_nonce': config.encodeMessage(subaccountTradeNonce),
    };
  }

  factory SubaccountNonce.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return SubaccountNonce(
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      subaccountTradeNonce: json.valueTo<
        injective_exchange_v1beta1_exchange.SubaccountTradeNonce?,
        Object
      >(
        key: 'subaccount_trade_nonce',
        parse:
            (v) => injective_exchange_v1beta1_exchange
                .SubaccountTradeNonce.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory SubaccountNonce.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SubaccountNonce(
      subaccountId: decode.getString<String?>(1),
      subaccountTradeNonce: decode
          .messageTo<injective_exchange_v1beta1_exchange.SubaccountTradeNonce?>(
            2,
            (b) => injective_exchange_v1beta1_exchange
                .SubaccountTradeNonce.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1SubaccountNonce;
}

class ExpiryFuturesMarketInfoState extends CosmosProtoMessage {
  final String? marketId;

  final injective_exchange_v1beta1_exchange.ExpiryFuturesMarketInfo? marketInfo;

  const ExpiryFuturesMarketInfoState({this.marketId, this.marketInfo});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [marketId, marketInfo];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'market_id': marketId,
      'market_info': config.encodeMessage(marketInfo),
    };
  }

  factory ExpiryFuturesMarketInfoState.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ExpiryFuturesMarketInfoState(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      marketInfo: json.valueTo<
        injective_exchange_v1beta1_exchange.ExpiryFuturesMarketInfo?,
        Object
      >(
        key: 'market_info',
        parse:
            (v) => injective_exchange_v1beta1_exchange
                .ExpiryFuturesMarketInfo.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory ExpiryFuturesMarketInfoState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ExpiryFuturesMarketInfoState(
      marketId: decode.getString<String?>(1),
      marketInfo: decode.messageTo<
        injective_exchange_v1beta1_exchange.ExpiryFuturesMarketInfo?
      >(
        2,
        (b) => injective_exchange_v1beta1_exchange
            .ExpiryFuturesMarketInfo.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1ExpiryFuturesMarketInfoState;
}

class PerpetualMarketFundingState extends CosmosProtoMessage {
  final String? marketId;

  final injective_exchange_v1beta1_exchange.PerpetualMarketFunding? funding;

  const PerpetualMarketFundingState({this.marketId, this.funding});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [marketId, funding];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'market_id': marketId, 'funding': config.encodeMessage(funding)};
  }

  factory PerpetualMarketFundingState.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return PerpetualMarketFundingState(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      funding: json.valueTo<
        injective_exchange_v1beta1_exchange.PerpetualMarketFunding?,
        Object
      >(
        key: 'funding',
        parse:
            (v) => injective_exchange_v1beta1_exchange
                .PerpetualMarketFunding.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory PerpetualMarketFundingState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PerpetualMarketFundingState(
      marketId: decode.getString<String?>(1),
      funding: decode.messageTo<
        injective_exchange_v1beta1_exchange.PerpetualMarketFunding?
      >(
        2,
        (b) => injective_exchange_v1beta1_exchange
            .PerpetualMarketFunding.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1PerpetualMarketFundingState;
}

class FullGrantAuthorizations extends CosmosProtoMessage {
  final String? granter;

  final String? totalGrantAmount;

  final BigInt? lastDelegationsCheckedTime;

  final List<injective_exchange_v1beta1_exchange.GrantAuthorization> grants;

  const FullGrantAuthorizations({
    this.granter,
    this.totalGrantAmount,
    this.lastDelegationsCheckedTime,
    this.grants = const [],
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
    granter,
    totalGrantAmount,
    lastDelegationsCheckedTime,
    grants,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'granter': granter,
      'total_grant_amount': totalGrantAmount,
      'last_delegations_checked_time': config.encodeBigint(
        lastDelegationsCheckedTime,
      ),
      'grants': grants.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory FullGrantAuthorizations.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return FullGrantAuthorizations(
      granter: json.valueAsString<String?>(
        'granter',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      totalGrantAmount: json.valueAsString<String?>(
        'total_grant_amount',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      lastDelegationsCheckedTime: json.valueAsBigInt<BigInt?>(
        'last_delegations_checked_time',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      grants:
          (json.valueEnsureAsList<dynamic>(
                'grants',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v1beta1_exchange.GrantAuthorization,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_exchange
                          .GrantAuthorization.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory FullGrantAuthorizations.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return FullGrantAuthorizations(
      granter: decode.getString<String?>(1),
      totalGrantAmount: decode.getString<String?>(2),
      lastDelegationsCheckedTime: decode.getBigInt<BigInt?>(3),
      grants:
          decode
              .getListOfBytes(4)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .GrantAuthorization.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1FullGrantAuthorizations;
}

class FullActiveGrant extends CosmosProtoMessage {
  final String? grantee;

  final injective_exchange_v1beta1_exchange.ActiveGrant? activeGrant;

  const FullActiveGrant({this.grantee, this.activeGrant});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [grantee, activeGrant];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'grantee': grantee,
      'active_grant': config.encodeMessage(activeGrant),
    };
  }

  factory FullActiveGrant.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return FullActiveGrant(
      grantee: json.valueAsString<String?>(
        'grantee',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      activeGrant: json
          .valueTo<injective_exchange_v1beta1_exchange.ActiveGrant?, Object>(
            key: 'active_grant',
            parse:
                (v) => injective_exchange_v1beta1_exchange.ActiveGrant.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory FullActiveGrant.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return FullActiveGrant(
      grantee: decode.getString<String?>(1),
      activeGrant: decode
          .messageTo<injective_exchange_v1beta1_exchange.ActiveGrant?>(
            2,
            (b) =>
                injective_exchange_v1beta1_exchange.ActiveGrant.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1FullActiveGrant;
}
