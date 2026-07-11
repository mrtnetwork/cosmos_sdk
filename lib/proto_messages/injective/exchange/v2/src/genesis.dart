import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/exchange/v2/src/exchange.dart"
    as injective_exchange_v2_exchange;
import "package:cosmos_sdk/proto_messages/injective/exchange/v2/src/market.dart"
    as injective_exchange_v2_market;
import "package:cosmos_sdk/proto_messages/injective/exchange/v2/src/orderbook.dart"
    as injective_exchange_v2_orderbook;

/// GenesisState defines the exchange module's genesis state.
class GenesisState extends CosmosProtoMessage {
  /// params defines all the parameters of related to exchange.
  final injective_exchange_v2_exchange.Params? params;

  /// spot_markets is an array containing the genesis trade pairs
  final List<injective_exchange_v2_market.SpotMarket> spotMarkets;

  /// derivative_markets is an array containing the genesis derivative markets
  final List<injective_exchange_v2_market.DerivativeMarket> derivativeMarkets;

  /// spot_orderbook defines the spot exchange limit orderbook active at genesis.
  final List<injective_exchange_v2_orderbook.SpotOrderBook> spotOrderbook;

  /// derivative_orderbook defines the derivative exchange limit orderbook active
  /// at genesis.
  final List<injective_exchange_v2_orderbook.DerivativeOrderBook>
  derivativeOrderbook;

  /// balances defines the exchange users balances active at genesis.
  final List<injective_exchange_v2_exchange.Balance> balances;

  /// positions defines the exchange derivative positions at genesis
  final List<injective_exchange_v2_exchange.DerivativePosition> positions;

  /// subaccount_trade_nonces defines the subaccount trade nonces for the
  /// subaccounts at genesis
  final List<SubaccountNonce> subaccountTradeNonces;

  /// expiry_futures_market_info defines the market info for the expiry futures
  /// markets at genesis
  final List<injective_exchange_v2_market.ExpiryFuturesMarketInfoState>
  expiryFuturesMarketInfoState;

  /// perpetual_market_info defines the market info for the perpetual derivative
  /// markets at genesis
  final List<injective_exchange_v2_market.PerpetualMarketInfo>
  perpetualMarketInfo;

  /// perpetual_market_funding_state defines the funding state for the perpetual
  /// derivative markets at genesis
  final List<injective_exchange_v2_market.PerpetualMarketFundingState>
  perpetualMarketFundingState;

  /// derivative_market_settlement_scheduled defines the scheduled markets for
  /// settlement at genesis
  final List<injective_exchange_v2_market.DerivativeMarketSettlementInfo>
  derivativeMarketSettlementScheduled;

  /// sets spot markets as enabled
  final bool? isSpotExchangeEnabled;

  /// sets derivative markets as enabled
  final bool? isDerivativesExchangeEnabled;

  /// the current trading reward campaign info
  final injective_exchange_v2_exchange.TradingRewardCampaignInfo?
  tradingRewardCampaignInfo;

  /// the current and upcoming trading reward campaign pools
  final List<injective_exchange_v2_exchange.CampaignRewardPool>
  tradingRewardPoolCampaignSchedule;

  /// the current trading reward account points
  final List<TradingRewardCampaignAccountPoints>
  tradingRewardCampaignAccountPoints;

  /// the fee discount schedule
  final injective_exchange_v2_exchange.FeeDiscountSchedule? feeDiscountSchedule;

  /// the cached fee discount account tiers with TTL
  final List<FeeDiscountAccountTierTTL> feeDiscountAccountTierTtl;

  /// the fee discount paid by accounts in all buckets
  final List<FeeDiscountBucketVolumeAccounts> feeDiscountBucketVolumeAccounts;

  /// sets the first fee cycle as finished
  final bool? isFirstFeeCycleFinished;

  /// the current and upcoming trading reward campaign pending pools
  final List<injective_exchange_v2_exchange.CampaignRewardPool>
  pendingTradingRewardPoolCampaignSchedule;

  /// the pending trading reward account points
  final List<TradingRewardCampaignAccountPendingPoints>
  pendingTradingRewardCampaignAccountPoints;

  /// the addresses opting out of trading rewards
  final List<String> rewardsOptOutAddresses;

  final List<injective_exchange_v2_exchange.TradeRecords>
  historicalTradeRecords;

  /// binary_options_markets is an array containing the genesis binary options
  /// markets
  final List<injective_exchange_v2_market.BinaryOptionsMarket>
  binaryOptionsMarkets;

  /// binary_options_markets_scheduled_for_settlement contains the marketIDs of
  /// binary options markets scheduled for next-block settlement
  final List<String> binaryOptionsMarketIdsScheduledForSettlement;

  /// spot_market_ids_scheduled_to_force_close defines the scheduled markets for
  /// forced closings at genesis
  final List<String> spotMarketIdsScheduledToForceClose;

  /// auction_exchange_transfer_denom_decimals defines the denom decimals for the
  /// exchange.
  final List<injective_exchange_v2_exchange.DenomDecimals>
  auctionExchangeTransferDenomDecimals;

  /// conditional_derivative_orderbook contains conditional orderbooks for all
  /// markets (both lmit and market conditional orders)
  final List<injective_exchange_v2_orderbook.ConditionalDerivativeOrderBook>
  conditionalDerivativeOrderbooks;

  /// market_fee_multipliers contains any non-default atomic order fee
  /// multipliers
  final List<injective_exchange_v2_market.MarketFeeMultiplier>
  marketFeeMultipliers;

  final List<OrderbookSequence> orderbookSequences;

  final List<injective_exchange_v2_exchange.AggregateSubaccountVolumeRecord>
  subaccountVolumes;

  final List<injective_exchange_v2_market.MarketVolume> marketVolumes;

  final List<FullGrantAuthorizations> grantAuthorizations;

  final List<FullActiveGrant> activeGrants;

  final List<injective_exchange_v2_exchange.DenomMinNotional> denomMinNotionals;

  final List<SubaccountRiskProfileRecord> subaccountRiskProfiles;

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
    this.auctionExchangeTransferDenomDecimals = const [],
    this.conditionalDerivativeOrderbooks = const [],
    this.marketFeeMultipliers = const [],
    this.orderbookSequences = const [],
    this.subaccountVolumes = const [],
    this.marketVolumes = const [],
    this.grantAuthorizations = const [],
    this.activeGrants = const [],
    this.denomMinNotionals = const [],
    this.subaccountRiskProfiles = const [],
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
        ProtoFieldConfig.repeated(
          fieldNumber: 38,
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
    auctionExchangeTransferDenomDecimals,
    conditionalDerivativeOrderbooks,
    marketFeeMultipliers,
    orderbookSequences,
    subaccountVolumes,
    marketVolumes,
    grantAuthorizations,
    activeGrants,
    denomMinNotionals,
    subaccountRiskProfiles,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'params': params?.toJson(),
      'spot_markets': spotMarkets.map((e) => e.toJson()).toList(),
      'derivative_markets': derivativeMarkets.map((e) => e.toJson()).toList(),
      'spot_orderbook': spotOrderbook.map((e) => e.toJson()).toList(),
      'derivative_orderbook':
          derivativeOrderbook.map((e) => e.toJson()).toList(),
      'balances': balances.map((e) => e.toJson()).toList(),
      'positions': positions.map((e) => e.toJson()).toList(),
      'subaccount_trade_nonces':
          subaccountTradeNonces.map((e) => e.toJson()).toList(),
      'expiry_futures_market_info_state':
          expiryFuturesMarketInfoState.map((e) => e.toJson()).toList(),
      'perpetual_market_info':
          perpetualMarketInfo.map((e) => e.toJson()).toList(),
      'perpetual_market_funding_state':
          perpetualMarketFundingState.map((e) => e.toJson()).toList(),
      'derivative_market_settlement_scheduled':
          derivativeMarketSettlementScheduled.map((e) => e.toJson()).toList(),
      'is_spot_exchange_enabled': isSpotExchangeEnabled,
      'is_derivatives_exchange_enabled': isDerivativesExchangeEnabled,
      'trading_reward_campaign_info': tradingRewardCampaignInfo?.toJson(),
      'trading_reward_pool_campaign_schedule':
          tradingRewardPoolCampaignSchedule.map((e) => e.toJson()).toList(),
      'trading_reward_campaign_account_points':
          tradingRewardCampaignAccountPoints.map((e) => e.toJson()).toList(),
      'fee_discount_schedule': feeDiscountSchedule?.toJson(),
      'fee_discount_account_tier_ttl':
          feeDiscountAccountTierTtl.map((e) => e.toJson()).toList(),
      'fee_discount_bucket_volume_accounts':
          feeDiscountBucketVolumeAccounts.map((e) => e.toJson()).toList(),
      'is_first_fee_cycle_finished': isFirstFeeCycleFinished,
      'pending_trading_reward_pool_campaign_schedule':
          pendingTradingRewardPoolCampaignSchedule
              .map((e) => e.toJson())
              .toList(),
      'pending_trading_reward_campaign_account_points':
          pendingTradingRewardCampaignAccountPoints
              .map((e) => e.toJson())
              .toList(),
      'rewards_opt_out_addresses':
          rewardsOptOutAddresses.map((e) => e).toList(),
      'historical_trade_records':
          historicalTradeRecords.map((e) => e.toJson()).toList(),
      'binary_options_markets':
          binaryOptionsMarkets.map((e) => e.toJson()).toList(),
      'binary_options_market_ids_scheduled_for_settlement':
          binaryOptionsMarketIdsScheduledForSettlement.map((e) => e).toList(),
      'spot_market_ids_scheduled_to_force_close':
          spotMarketIdsScheduledToForceClose.map((e) => e).toList(),
      'auction_exchange_transfer_denom_decimals':
          auctionExchangeTransferDenomDecimals.map((e) => e.toJson()).toList(),
      'conditional_derivative_orderbooks':
          conditionalDerivativeOrderbooks.map((e) => e.toJson()).toList(),
      'market_fee_multipliers':
          marketFeeMultipliers.map((e) => e.toJson()).toList(),
      'orderbook_sequences': orderbookSequences.map((e) => e.toJson()).toList(),
      'subaccount_volumes': subaccountVolumes.map((e) => e.toJson()).toList(),
      'market_volumes': marketVolumes.map((e) => e.toJson()).toList(),
      'grant_authorizations':
          grantAuthorizations.map((e) => e.toJson()).toList(),
      'active_grants': activeGrants.map((e) => e.toJson()).toList(),
      'denom_min_notionals': denomMinNotionals.map((e) => e.toJson()).toList(),
      'subaccount_risk_profiles':
          subaccountRiskProfiles.map((e) => e.toJson()).toList(),
    };
  }

  factory GenesisState.fromJson(Map<String, dynamic> json) {
    return GenesisState(
      params: json.valueTo<
        injective_exchange_v2_exchange.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse: (v) => injective_exchange_v2_exchange.Params.fromJson(v),
        acceptCamelCase: true,
      ),
      spotMarkets:
          (json.valueEnsureAsList<dynamic>(
                'spot_markets',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_market.SpotMarket,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) =>
                          injective_exchange_v2_market.SpotMarket.fromJson(v),
                ),
              )
              .toList(),
      derivativeMarkets:
          (json.valueEnsureAsList<dynamic>(
                'derivative_markets',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_market.DerivativeMarket,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_market
                          .DerivativeMarket.fromJson(v),
                ),
              )
              .toList(),
      spotOrderbook:
          (json.valueEnsureAsList<dynamic>(
                'spot_orderbook',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_orderbook.SpotOrderBook,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_orderbook
                          .SpotOrderBook.fromJson(v),
                ),
              )
              .toList(),
      derivativeOrderbook:
          (json.valueEnsureAsList<dynamic>(
                'derivative_orderbook',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_orderbook.DerivativeOrderBook,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_orderbook
                          .DerivativeOrderBook.fromJson(v),
                ),
              )
              .toList(),
      balances:
          (json.valueEnsureAsList<dynamic>('balances', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_exchange.Balance,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_exchange.Balance.fromJson(v),
                ),
              )
              .toList(),
      positions:
          (json.valueEnsureAsList<dynamic>('positions', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_exchange.DerivativePosition,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_exchange
                          .DerivativePosition.fromJson(v),
                ),
              )
              .toList(),
      subaccountTradeNonces:
          (json.valueEnsureAsList<dynamic>(
                'subaccount_trade_nonces',
                acceptCamelCase: true,
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<SubaccountNonce, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => SubaccountNonce.fromJson(v),
                    ),
              )
              .toList(),
      expiryFuturesMarketInfoState:
          (json.valueEnsureAsList<dynamic>(
                'expiry_futures_market_info_state',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_market.ExpiryFuturesMarketInfoState,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_market
                          .ExpiryFuturesMarketInfoState.fromJson(v),
                ),
              )
              .toList(),
      perpetualMarketInfo:
          (json.valueEnsureAsList<dynamic>(
                'perpetual_market_info',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_market.PerpetualMarketInfo,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_market
                          .PerpetualMarketInfo.fromJson(v),
                ),
              )
              .toList(),
      perpetualMarketFundingState:
          (json.valueEnsureAsList<dynamic>(
                'perpetual_market_funding_state',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_market.PerpetualMarketFundingState,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_market
                          .PerpetualMarketFundingState.fromJson(v),
                ),
              )
              .toList(),
      derivativeMarketSettlementScheduled:
          (json.valueEnsureAsList<dynamic>(
                'derivative_market_settlement_scheduled',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_market.DerivativeMarketSettlementInfo,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_market
                          .DerivativeMarketSettlementInfo.fromJson(v),
                ),
              )
              .toList(),
      isSpotExchangeEnabled: json.valueAsBool<bool?>(
        'is_spot_exchange_enabled',
        acceptCamelCase: true,
      ),
      isDerivativesExchangeEnabled: json.valueAsBool<bool?>(
        'is_derivatives_exchange_enabled',
        acceptCamelCase: true,
      ),
      tradingRewardCampaignInfo: json.valueTo<
        injective_exchange_v2_exchange.TradingRewardCampaignInfo?,
        Map<String, dynamic>
      >(
        key: 'trading_reward_campaign_info',
        parse:
            (v) => injective_exchange_v2_exchange
                .TradingRewardCampaignInfo.fromJson(v),
        acceptCamelCase: true,
      ),
      tradingRewardPoolCampaignSchedule:
          (json.valueEnsureAsList<dynamic>(
                'trading_reward_pool_campaign_schedule',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_exchange.CampaignRewardPool,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_exchange
                          .CampaignRewardPool.fromJson(v),
                ),
              )
              .toList(),
      tradingRewardCampaignAccountPoints:
          (json.valueEnsureAsList<dynamic>(
                'trading_reward_campaign_account_points',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  TradingRewardCampaignAccountPoints,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => TradingRewardCampaignAccountPoints.fromJson(v),
                ),
              )
              .toList(),
      feeDiscountSchedule: json.valueTo<
        injective_exchange_v2_exchange.FeeDiscountSchedule?,
        Map<String, dynamic>
      >(
        key: 'fee_discount_schedule',
        parse:
            (v) =>
                injective_exchange_v2_exchange.FeeDiscountSchedule.fromJson(v),
        acceptCamelCase: true,
      ),
      feeDiscountAccountTierTtl:
          (json.valueEnsureAsList<dynamic>(
                'fee_discount_account_tier_ttl',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  FeeDiscountAccountTierTTL,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => FeeDiscountAccountTierTTL.fromJson(v),
                ),
              )
              .toList(),
      feeDiscountBucketVolumeAccounts:
          (json.valueEnsureAsList<dynamic>(
                'fee_discount_bucket_volume_accounts',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  FeeDiscountBucketVolumeAccounts,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => FeeDiscountBucketVolumeAccounts.fromJson(v),
                ),
              )
              .toList(),
      isFirstFeeCycleFinished: json.valueAsBool<bool?>(
        'is_first_fee_cycle_finished',
        acceptCamelCase: true,
      ),
      pendingTradingRewardPoolCampaignSchedule:
          (json.valueEnsureAsList<dynamic>(
                'pending_trading_reward_pool_campaign_schedule',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_exchange.CampaignRewardPool,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_exchange
                          .CampaignRewardPool.fromJson(v),
                ),
              )
              .toList(),
      pendingTradingRewardCampaignAccountPoints:
          (json.valueEnsureAsList<dynamic>(
                'pending_trading_reward_campaign_account_points',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  TradingRewardCampaignAccountPendingPoints,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) =>
                          TradingRewardCampaignAccountPendingPoints.fromJson(v),
                ),
              )
              .toList(),
      rewardsOptOutAddresses:
          (json.valueEnsureAsList<dynamic>(
            'rewards_opt_out_addresses',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      historicalTradeRecords:
          (json.valueEnsureAsList<dynamic>(
                'historical_trade_records',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_exchange.TradeRecords,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_exchange
                          .TradeRecords.fromJson(v),
                ),
              )
              .toList(),
      binaryOptionsMarkets:
          (json.valueEnsureAsList<dynamic>(
                'binary_options_markets',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_market.BinaryOptionsMarket,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_market
                          .BinaryOptionsMarket.fromJson(v),
                ),
              )
              .toList(),
      binaryOptionsMarketIdsScheduledForSettlement:
          (json.valueEnsureAsList<dynamic>(
            'binary_options_market_ids_scheduled_for_settlement',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      spotMarketIdsScheduledToForceClose:
          (json.valueEnsureAsList<dynamic>(
            'spot_market_ids_scheduled_to_force_close',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      auctionExchangeTransferDenomDecimals:
          (json.valueEnsureAsList<dynamic>(
                'auction_exchange_transfer_denom_decimals',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_exchange.DenomDecimals,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_exchange
                          .DenomDecimals.fromJson(v),
                ),
              )
              .toList(),
      conditionalDerivativeOrderbooks:
          (json.valueEnsureAsList<dynamic>(
                'conditional_derivative_orderbooks',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_orderbook.ConditionalDerivativeOrderBook,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_orderbook
                          .ConditionalDerivativeOrderBook.fromJson(v),
                ),
              )
              .toList(),
      marketFeeMultipliers:
          (json.valueEnsureAsList<dynamic>(
                'market_fee_multipliers',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_market.MarketFeeMultiplier,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_market
                          .MarketFeeMultiplier.fromJson(v),
                ),
              )
              .toList(),
      orderbookSequences:
          (json.valueEnsureAsList<dynamic>(
                'orderbook_sequences',
                acceptCamelCase: true,
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<OrderbookSequence, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => OrderbookSequence.fromJson(v),
                    ),
              )
              .toList(),
      subaccountVolumes:
          (json.valueEnsureAsList<dynamic>(
                'subaccount_volumes',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_exchange.AggregateSubaccountVolumeRecord,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_exchange
                          .AggregateSubaccountVolumeRecord.fromJson(v),
                ),
              )
              .toList(),
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
      grantAuthorizations:
          (json.valueEnsureAsList<dynamic>(
                'grant_authorizations',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  FullGrantAuthorizations,
                  Map<String, dynamic>
                >(value: e, parse: (v) => FullGrantAuthorizations.fromJson(v)),
              )
              .toList(),
      activeGrants:
          (json.valueEnsureAsList<dynamic>(
                'active_grants',
                acceptCamelCase: true,
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<FullActiveGrant, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => FullActiveGrant.fromJson(v),
                    ),
              )
              .toList(),
      denomMinNotionals:
          (json.valueEnsureAsList<dynamic>(
                'denom_min_notionals',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_exchange.DenomMinNotional,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_exchange
                          .DenomMinNotional.fromJson(v),
                ),
              )
              .toList(),
      subaccountRiskProfiles:
          (json.valueEnsureAsList<dynamic>(
                'subaccount_risk_profiles',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  SubaccountRiskProfileRecord,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => SubaccountRiskProfileRecord.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory GenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GenesisState(
      params: decode.messageTo<injective_exchange_v2_exchange.Params?>(
        1,
        (b) => injective_exchange_v2_exchange.Params.deserialize(b),
      ),
      spotMarkets:
          decode
              .getListOfBytes(2)
              .map(
                (b) => injective_exchange_v2_market.SpotMarket.deserialize(b),
              )
              .toList(),
      derivativeMarkets:
          decode
              .getListOfBytes(3)
              .map(
                (b) => injective_exchange_v2_market
                    .DerivativeMarket.deserialize(b),
              )
              .toList(),
      spotOrderbook:
          decode
              .getListOfBytes(4)
              .map(
                (b) => injective_exchange_v2_orderbook
                    .SpotOrderBook.deserialize(b),
              )
              .toList(),
      derivativeOrderbook:
          decode
              .getListOfBytes(5)
              .map(
                (b) => injective_exchange_v2_orderbook
                    .DerivativeOrderBook.deserialize(b),
              )
              .toList(),
      balances:
          decode
              .getListOfBytes(6)
              .map((b) => injective_exchange_v2_exchange.Balance.deserialize(b))
              .toList(),
      positions:
          decode
              .getListOfBytes(7)
              .map(
                (b) => injective_exchange_v2_exchange
                    .DerivativePosition.deserialize(b),
              )
              .toList(),
      subaccountTradeNonces:
          decode
              .getListOfBytes(8)
              .map((b) => SubaccountNonce.deserialize(b))
              .toList(),
      expiryFuturesMarketInfoState:
          decode
              .getListOfBytes(9)
              .map(
                (b) => injective_exchange_v2_market
                    .ExpiryFuturesMarketInfoState.deserialize(b),
              )
              .toList(),
      perpetualMarketInfo:
          decode
              .getListOfBytes(10)
              .map(
                (b) => injective_exchange_v2_market
                    .PerpetualMarketInfo.deserialize(b),
              )
              .toList(),
      perpetualMarketFundingState:
          decode
              .getListOfBytes(11)
              .map(
                (b) => injective_exchange_v2_market
                    .PerpetualMarketFundingState.deserialize(b),
              )
              .toList(),
      derivativeMarketSettlementScheduled:
          decode
              .getListOfBytes(12)
              .map(
                (b) => injective_exchange_v2_market
                    .DerivativeMarketSettlementInfo.deserialize(b),
              )
              .toList(),
      isSpotExchangeEnabled: decode.getBool<bool?>(13),
      isDerivativesExchangeEnabled: decode.getBool<bool?>(14),
      tradingRewardCampaignInfo: decode
          .messageTo<injective_exchange_v2_exchange.TradingRewardCampaignInfo?>(
            15,
            (b) => injective_exchange_v2_exchange
                .TradingRewardCampaignInfo.deserialize(b),
          ),
      tradingRewardPoolCampaignSchedule:
          decode
              .getListOfBytes(16)
              .map(
                (b) => injective_exchange_v2_exchange
                    .CampaignRewardPool.deserialize(b),
              )
              .toList(),
      tradingRewardCampaignAccountPoints:
          decode
              .getListOfBytes(17)
              .map((b) => TradingRewardCampaignAccountPoints.deserialize(b))
              .toList(),
      feeDiscountSchedule: decode
          .messageTo<injective_exchange_v2_exchange.FeeDiscountSchedule?>(
            18,
            (b) => injective_exchange_v2_exchange
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
                (b) => injective_exchange_v2_exchange
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
                (b) =>
                    injective_exchange_v2_exchange.TradeRecords.deserialize(b),
              )
              .toList(),
      binaryOptionsMarkets:
          decode
              .getListOfBytes(26)
              .map(
                (b) => injective_exchange_v2_market
                    .BinaryOptionsMarket.deserialize(b),
              )
              .toList(),
      binaryOptionsMarketIdsScheduledForSettlement: decode
          .getListOrEmpty<String>(27),
      spotMarketIdsScheduledToForceClose: decode.getListOrEmpty<String>(28),
      auctionExchangeTransferDenomDecimals:
          decode
              .getListOfBytes(29)
              .map(
                (b) =>
                    injective_exchange_v2_exchange.DenomDecimals.deserialize(b),
              )
              .toList(),
      conditionalDerivativeOrderbooks:
          decode
              .getListOfBytes(30)
              .map(
                (b) => injective_exchange_v2_orderbook
                    .ConditionalDerivativeOrderBook.deserialize(b),
              )
              .toList(),
      marketFeeMultipliers:
          decode
              .getListOfBytes(31)
              .map(
                (b) => injective_exchange_v2_market
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
                (b) => injective_exchange_v2_exchange
                    .AggregateSubaccountVolumeRecord.deserialize(b),
              )
              .toList(),
      marketVolumes:
          decode
              .getListOfBytes(34)
              .map(
                (b) => injective_exchange_v2_market.MarketVolume.deserialize(b),
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
                (b) => injective_exchange_v2_exchange
                    .DenomMinNotional.deserialize(b),
              )
              .toList(),
      subaccountRiskProfiles:
          decode
              .getListOfBytes(38)
              .map((b) => SubaccountRiskProfileRecord.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2GenesisState;
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
  Map<String, dynamic> toJson() {
    return {'sequence': sequence?.toString(), 'market_id': marketId};
  }

  factory OrderbookSequence.fromJson(Map<String, dynamic> json) {
    return OrderbookSequence(
      sequence: json.valueAsBigInt<BigInt?>('sequence', acceptCamelCase: true),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2OrderbookSequence;
}

class FeeDiscountAccountTierTTL extends CosmosProtoMessage {
  final String? account;

  final injective_exchange_v2_exchange.FeeDiscountTierTTL? tierTtl;

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
  Map<String, dynamic> toJson() {
    return {'account': account, 'tier_ttl': tierTtl?.toJson()};
  }

  factory FeeDiscountAccountTierTTL.fromJson(Map<String, dynamic> json) {
    return FeeDiscountAccountTierTTL(
      account: json.valueAsString<String?>('account', acceptCamelCase: true),
      tierTtl: json.valueTo<
        injective_exchange_v2_exchange.FeeDiscountTierTTL?,
        Map<String, dynamic>
      >(
        key: 'tier_ttl',
        parse:
            (v) =>
                injective_exchange_v2_exchange.FeeDiscountTierTTL.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory FeeDiscountAccountTierTTL.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return FeeDiscountAccountTierTTL(
      account: decode.getString<String?>(1),
      tierTtl: decode.messageTo<
        injective_exchange_v2_exchange.FeeDiscountTierTTL?
      >(
        2,
        (b) => injective_exchange_v2_exchange.FeeDiscountTierTTL.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2FeeDiscountAccountTierTTL;
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
  Map<String, dynamic> toJson() {
    return {
      'bucket_start_timestamp': bucketStartTimestamp?.toString(),
      'account_volume': accountVolume.map((e) => e.toJson()).toList(),
    };
  }

  factory FeeDiscountBucketVolumeAccounts.fromJson(Map<String, dynamic> json) {
    return FeeDiscountBucketVolumeAccounts(
      bucketStartTimestamp: json.valueAsBigInt<BigInt?>(
        'bucket_start_timestamp',
        acceptCamelCase: true,
      ),
      accountVolume:
          (json.valueEnsureAsList<dynamic>(
                'account_volume',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<AccountVolume, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => AccountVolume.fromJson(v),
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
          .injectiveExchangeV2FeeDiscountBucketVolumeAccounts;
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
  Map<String, dynamic> toJson() {
    return {'account': account, 'volume': volume};
  }

  factory AccountVolume.fromJson(Map<String, dynamic> json) {
    return AccountVolume(
      account: json.valueAsString<String?>('account', acceptCamelCase: true),
      volume: json.valueAsString<String?>('volume', acceptCamelCase: true),
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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2AccountVolume;
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
  Map<String, dynamic> toJson() {
    return {'account': account, 'points': points};
  }

  factory TradingRewardCampaignAccountPoints.fromJson(
    Map<String, dynamic> json,
  ) {
    return TradingRewardCampaignAccountPoints(
      account: json.valueAsString<String?>('account', acceptCamelCase: true),
      points: json.valueAsString<String?>('points', acceptCamelCase: true),
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
          .injectiveExchangeV2TradingRewardCampaignAccountPoints;
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
  Map<String, dynamic> toJson() {
    return {
      'reward_pool_start_timestamp': rewardPoolStartTimestamp?.toString(),
      'account_points': accountPoints.map((e) => e.toJson()).toList(),
    };
  }

  factory TradingRewardCampaignAccountPendingPoints.fromJson(
    Map<String, dynamic> json,
  ) {
    return TradingRewardCampaignAccountPendingPoints(
      rewardPoolStartTimestamp: json.valueAsBigInt<BigInt?>(
        'reward_pool_start_timestamp',
        acceptCamelCase: true,
      ),
      accountPoints:
          (json.valueEnsureAsList<dynamic>(
                'account_points',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  TradingRewardCampaignAccountPoints,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => TradingRewardCampaignAccountPoints.fromJson(v),
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
          .injectiveExchangeV2TradingRewardCampaignAccountPendingPoints;
}

class SubaccountNonce extends CosmosProtoMessage {
  /// the subaccount ID
  final String? subaccountId;

  /// the subaccount trade nonce
  final injective_exchange_v2_exchange.SubaccountTradeNonce?
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
  Map<String, dynamic> toJson() {
    return {
      'subaccount_id': subaccountId,
      'subaccount_trade_nonce': subaccountTradeNonce?.toJson(),
    };
  }

  factory SubaccountNonce.fromJson(Map<String, dynamic> json) {
    return SubaccountNonce(
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      subaccountTradeNonce: json.valueTo<
        injective_exchange_v2_exchange.SubaccountTradeNonce?,
        Map<String, dynamic>
      >(
        key: 'subaccount_trade_nonce',
        parse:
            (v) =>
                injective_exchange_v2_exchange.SubaccountTradeNonce.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory SubaccountNonce.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SubaccountNonce(
      subaccountId: decode.getString<String?>(1),
      subaccountTradeNonce: decode
          .messageTo<injective_exchange_v2_exchange.SubaccountTradeNonce?>(
            2,
            (b) => injective_exchange_v2_exchange
                .SubaccountTradeNonce.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2SubaccountNonce;
}

class FullGrantAuthorizations extends CosmosProtoMessage {
  final String? granter;

  final String? totalGrantAmount;

  final BigInt? lastDelegationsCheckedTime;

  final List<injective_exchange_v2_exchange.GrantAuthorization> grants;

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
  Map<String, dynamic> toJson() {
    return {
      'granter': granter,
      'total_grant_amount': totalGrantAmount,
      'last_delegations_checked_time': lastDelegationsCheckedTime?.toString(),
      'grants': grants.map((e) => e.toJson()).toList(),
    };
  }

  factory FullGrantAuthorizations.fromJson(Map<String, dynamic> json) {
    return FullGrantAuthorizations(
      granter: json.valueAsString<String?>('granter', acceptCamelCase: true),
      totalGrantAmount: json.valueAsString<String?>(
        'total_grant_amount',
        acceptCamelCase: true,
      ),
      lastDelegationsCheckedTime: json.valueAsBigInt<BigInt?>(
        'last_delegations_checked_time',
        acceptCamelCase: true,
      ),
      grants:
          (json.valueEnsureAsList<dynamic>('grants', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_exchange.GrantAuthorization,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_exchange
                          .GrantAuthorization.fromJson(v),
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
                (b) => injective_exchange_v2_exchange
                    .GrantAuthorization.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2FullGrantAuthorizations;
}

class FullActiveGrant extends CosmosProtoMessage {
  final String? grantee;

  final injective_exchange_v2_exchange.ActiveGrant? activeGrant;

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
  Map<String, dynamic> toJson() {
    return {'grantee': grantee, 'active_grant': activeGrant?.toJson()};
  }

  factory FullActiveGrant.fromJson(Map<String, dynamic> json) {
    return FullActiveGrant(
      grantee: json.valueAsString<String?>('grantee', acceptCamelCase: true),
      activeGrant: json.valueTo<
        injective_exchange_v2_exchange.ActiveGrant?,
        Map<String, dynamic>
      >(
        key: 'active_grant',
        parse: (v) => injective_exchange_v2_exchange.ActiveGrant.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory FullActiveGrant.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return FullActiveGrant(
      grantee: decode.getString<String?>(1),
      activeGrant: decode
          .messageTo<injective_exchange_v2_exchange.ActiveGrant?>(
            2,
            (b) => injective_exchange_v2_exchange.ActiveGrant.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2FullActiveGrant;
}

class SubaccountRiskProfileRecord extends CosmosProtoMessage {
  final String? subaccountId;

  final injective_exchange_v2_exchange.SubaccountRiskProfile? riskProfile;

  const SubaccountRiskProfileRecord({this.subaccountId, this.riskProfile});

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
  List<Object?> get protoValues => [subaccountId, riskProfile];

  @override
  Map<String, dynamic> toJson() {
    return {
      'subaccount_id': subaccountId,
      'risk_profile': riskProfile?.toJson(),
    };
  }

  factory SubaccountRiskProfileRecord.fromJson(Map<String, dynamic> json) {
    return SubaccountRiskProfileRecord(
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      riskProfile: json.valueTo<
        injective_exchange_v2_exchange.SubaccountRiskProfile?,
        Map<String, dynamic>
      >(
        key: 'risk_profile',
        parse:
            (v) => injective_exchange_v2_exchange
                .SubaccountRiskProfile.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory SubaccountRiskProfileRecord.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SubaccountRiskProfileRecord(
      subaccountId: decode.getString<String?>(1),
      riskProfile: decode
          .messageTo<injective_exchange_v2_exchange.SubaccountRiskProfile?>(
            2,
            (b) => injective_exchange_v2_exchange
                .SubaccountRiskProfile.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2SubaccountRiskProfileRecord;
}
