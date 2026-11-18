import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/exchange/v2/src/exchange.dart"
    as injective_exchange_v2_exchange;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/injective/exchange/v2/src/order.dart"
    as injective_exchange_v2_order;

enum OrderUpdateStatus implements ProtoEnumVariant {
  unspecified(0, 'Unspecified'),
  booked(1, 'Booked'),
  matched(2, 'Matched'),
  cancelled(3, 'Cancelled');

  const OrderUpdateStatus(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static OrderUpdateStatus fromValue(int? value) {
    value ??= 0;
    return OrderUpdateStatus.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching OrderUpdateStatus found for the given value. $value",
                details: {
                  "name": "OrderUpdateStatus",
                  "value": value?.toString(),
                },
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static OrderUpdateStatus from(Object? value) {
    value ??= 0;
    return OrderUpdateStatus.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching OrderUpdateStatus found for the given value. $value",
                details: {
                  "name": "OrderUpdateStatus",
                  "value": value?.toString(),
                },
              ),
    );
  }
}

class StreamRequest extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<StreamResponse> {
  /// filter for bank balances events
  final BankBalancesFilter? bankBalancesFilter;

  /// filter for subaccount deposits events
  final SubaccountDepositsFilter? subaccountDepositsFilter;

  /// filter for spot trades events
  final TradesFilter? spotTradesFilter;

  /// filter for derivative trades events
  final TradesFilter? derivativeTradesFilter;

  /// filter for spot orders events
  final OrdersFilter? spotOrdersFilter;

  /// filter for derivative orders events
  final OrdersFilter? derivativeOrdersFilter;

  /// filter for spot orderbooks events
  final OrderbookFilter? spotOrderbooksFilter;

  /// filter for derivative orderbooks events
  final OrderbookFilter? derivativeOrderbooksFilter;

  /// filter for positions events
  final PositionsFilter? positionsFilter;

  /// filter for oracle prices events
  final OraclePriceFilter? oraclePriceFilter;

  /// filter for order failures events
  final OrderFailuresFilter? orderFailuresFilter;

  /// filter for conditional order trigger failures events
  final ConditionalOrderTriggerFailuresFilter?
  conditionalOrderTriggerFailuresFilter;

  const StreamRequest({
    this.bankBalancesFilter,
    this.subaccountDepositsFilter,
    this.spotTradesFilter,
    this.derivativeTradesFilter,
    this.spotOrdersFilter,
    this.derivativeOrdersFilter,
    this.spotOrderbooksFilter,
    this.derivativeOrderbooksFilter,
    this.positionsFilter,
    this.oraclePriceFilter,
    this.orderFailuresFilter,
    this.conditionalOrderTriggerFailuresFilter,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.message(4, options: const []),
        ProtoFieldConfig.message(5, options: const []),
        ProtoFieldConfig.message(6, options: const []),
        ProtoFieldConfig.message(7, options: const []),
        ProtoFieldConfig.message(8, options: const []),
        ProtoFieldConfig.message(9, options: const []),
        ProtoFieldConfig.message(10, options: const []),
        ProtoFieldConfig.message(11, options: const []),
        ProtoFieldConfig.message(12, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    bankBalancesFilter,
    subaccountDepositsFilter,
    spotTradesFilter,
    derivativeTradesFilter,
    spotOrdersFilter,
    derivativeOrdersFilter,
    spotOrderbooksFilter,
    derivativeOrderbooksFilter,
    positionsFilter,
    oraclePriceFilter,
    orderFailuresFilter,
    conditionalOrderTriggerFailuresFilter,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'bank_balances_filter': config.encodeMessage(bankBalancesFilter),
      'subaccount_deposits_filter': config.encodeMessage(
        subaccountDepositsFilter,
      ),
      'spot_trades_filter': config.encodeMessage(spotTradesFilter),
      'derivative_trades_filter': config.encodeMessage(derivativeTradesFilter),
      'spot_orders_filter': config.encodeMessage(spotOrdersFilter),
      'derivative_orders_filter': config.encodeMessage(derivativeOrdersFilter),
      'spot_orderbooks_filter': config.encodeMessage(spotOrderbooksFilter),
      'derivative_orderbooks_filter': config.encodeMessage(
        derivativeOrderbooksFilter,
      ),
      'positions_filter': config.encodeMessage(positionsFilter),
      'oracle_price_filter': config.encodeMessage(oraclePriceFilter),
      'order_failures_filter': config.encodeMessage(orderFailuresFilter),
      'conditional_order_trigger_failures_filter': config.encodeMessage(
        conditionalOrderTriggerFailuresFilter,
      ),
    };
  }

  factory StreamRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return StreamRequest(
      bankBalancesFilter: json.valueTo<BankBalancesFilter?, Object>(
        key: 'bank_balances_filter',
        parse:
            (v) => BankBalancesFilter.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      subaccountDepositsFilter: json.valueTo<SubaccountDepositsFilter?, Object>(
        key: 'subaccount_deposits_filter',
        parse:
            (v) => SubaccountDepositsFilter.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      spotTradesFilter: json.valueTo<TradesFilter?, Object>(
        key: 'spot_trades_filter',
        parse:
            (v) => TradesFilter.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      derivativeTradesFilter: json.valueTo<TradesFilter?, Object>(
        key: 'derivative_trades_filter',
        parse:
            (v) => TradesFilter.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      spotOrdersFilter: json.valueTo<OrdersFilter?, Object>(
        key: 'spot_orders_filter',
        parse:
            (v) => OrdersFilter.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      derivativeOrdersFilter: json.valueTo<OrdersFilter?, Object>(
        key: 'derivative_orders_filter',
        parse:
            (v) => OrdersFilter.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      spotOrderbooksFilter: json.valueTo<OrderbookFilter?, Object>(
        key: 'spot_orderbooks_filter',
        parse:
            (v) =>
                OrderbookFilter.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      derivativeOrderbooksFilter: json.valueTo<OrderbookFilter?, Object>(
        key: 'derivative_orderbooks_filter',
        parse:
            (v) =>
                OrderbookFilter.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      positionsFilter: json.valueTo<PositionsFilter?, Object>(
        key: 'positions_filter',
        parse:
            (v) =>
                PositionsFilter.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      oraclePriceFilter: json.valueTo<OraclePriceFilter?, Object>(
        key: 'oracle_price_filter',
        parse:
            (v) => OraclePriceFilter.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      orderFailuresFilter: json.valueTo<OrderFailuresFilter?, Object>(
        key: 'order_failures_filter',
        parse:
            (v) => OrderFailuresFilter.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      conditionalOrderTriggerFailuresFilter: json
          .valueTo<ConditionalOrderTriggerFailuresFilter?, Object>(
            key: 'conditional_order_trigger_failures_filter',
            parse:
                (v) => ConditionalOrderTriggerFailuresFilter.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory StreamRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return StreamRequest(
      bankBalancesFilter: decode.messageTo<BankBalancesFilter?>(
        1,
        (b) => BankBalancesFilter.deserialize(b),
      ),
      subaccountDepositsFilter: decode.messageTo<SubaccountDepositsFilter?>(
        2,
        (b) => SubaccountDepositsFilter.deserialize(b),
      ),
      spotTradesFilter: decode.messageTo<TradesFilter?>(
        3,
        (b) => TradesFilter.deserialize(b),
      ),
      derivativeTradesFilter: decode.messageTo<TradesFilter?>(
        4,
        (b) => TradesFilter.deserialize(b),
      ),
      spotOrdersFilter: decode.messageTo<OrdersFilter?>(
        5,
        (b) => OrdersFilter.deserialize(b),
      ),
      derivativeOrdersFilter: decode.messageTo<OrdersFilter?>(
        6,
        (b) => OrdersFilter.deserialize(b),
      ),
      spotOrderbooksFilter: decode.messageTo<OrderbookFilter?>(
        7,
        (b) => OrderbookFilter.deserialize(b),
      ),
      derivativeOrderbooksFilter: decode.messageTo<OrderbookFilter?>(
        8,
        (b) => OrderbookFilter.deserialize(b),
      ),
      positionsFilter: decode.messageTo<PositionsFilter?>(
        9,
        (b) => PositionsFilter.deserialize(b),
      ),
      oraclePriceFilter: decode.messageTo<OraclePriceFilter?>(
        10,
        (b) => OraclePriceFilter.deserialize(b),
      ),
      orderFailuresFilter: decode.messageTo<OrderFailuresFilter?>(
        11,
        (b) => OrderFailuresFilter.deserialize(b),
      ),
      conditionalOrderTriggerFailuresFilter: decode
          .messageTo<ConditionalOrderTriggerFailuresFilter?>(
            12,
            (b) => ConditionalOrderTriggerFailuresFilter.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveStreamV2StreamRequest;
  @override
  StreamResponse onServiceResponse(List<int> bytes) {
    return StreamResponse.deserialize(bytes);
  }

  @override
  StreamResponse onServiceResponseJson(Map<String, dynamic> json) {
    return StreamResponse.fromJson(json);
  }
}

class StreamResponse extends CosmosProtoMessage {
  /// the block height
  final BigInt? blockHeight;

  /// the block time
  final BigInt? blockTime;

  /// list of bank balances updates
  final List<BankBalance> bankBalances;

  /// list of subaccount deposits updates
  final List<SubaccountDeposits> subaccountDeposits;

  /// list of spot trades updates
  final List<SpotTrade> spotTrades;

  /// list of derivative trades updates
  final List<DerivativeTrade> derivativeTrades;

  /// list of spot orders updates
  final List<SpotOrderUpdate> spotOrders;

  /// list of derivative orders updates
  final List<DerivativeOrderUpdate> derivativeOrders;

  /// list of spot orderbook updates
  final List<OrderbookUpdate> spotOrderbookUpdates;

  /// list of derivative orderbook updates
  final List<OrderbookUpdate> derivativeOrderbookUpdates;

  /// list of positions updates
  final List<Position> positions;

  /// list of oracle prices updates
  final List<OraclePrice> oraclePrices;

  /// the current gas price when the block was processed (in chain format)
  final String? gasPrice;

  /// list of order failures updates
  final List<OrderFailureUpdate> orderFailures;

  /// list of conditional order trigger failures updates
  final List<ConditionalOrderTriggerFailureUpdate>
  conditionalOrderTriggerFailures;

  const StreamResponse({
    this.blockHeight,
    this.blockTime,
    this.bankBalances = const [],
    this.subaccountDeposits = const [],
    this.spotTrades = const [],
    this.derivativeTrades = const [],
    this.spotOrders = const [],
    this.derivativeOrders = const [],
    this.spotOrderbookUpdates = const [],
    this.derivativeOrderbookUpdates = const [],
    this.positions = const [],
    this.oraclePrices = const [],
    this.gasPrice,
    this.orderFailures = const [],
    this.conditionalOrderTriggerFailures = const [],
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
        ProtoFieldConfig.repeated(
          fieldNumber: 8,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 9,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 10,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 11,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 12,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.string(13),
        ProtoFieldConfig.repeated(
          fieldNumber: 14,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 15,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    blockHeight,
    blockTime,
    bankBalances,
    subaccountDeposits,
    spotTrades,
    derivativeTrades,
    spotOrders,
    derivativeOrders,
    spotOrderbookUpdates,
    derivativeOrderbookUpdates,
    positions,
    oraclePrices,
    gasPrice,
    orderFailures,
    conditionalOrderTriggerFailures,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'block_height': config.encodeBigint(blockHeight),
      'block_time': config.encodeBigint(blockTime),
      'bank_balances':
          bankBalances.map((e) => config.encodeMessage(e)).toList(),
      'subaccount_deposits':
          subaccountDeposits.map((e) => config.encodeMessage(e)).toList(),
      'spot_trades': spotTrades.map((e) => config.encodeMessage(e)).toList(),
      'derivative_trades':
          derivativeTrades.map((e) => config.encodeMessage(e)).toList(),
      'spot_orders': spotOrders.map((e) => config.encodeMessage(e)).toList(),
      'derivative_orders':
          derivativeOrders.map((e) => config.encodeMessage(e)).toList(),
      'spot_orderbook_updates':
          spotOrderbookUpdates.map((e) => config.encodeMessage(e)).toList(),
      'derivative_orderbook_updates':
          derivativeOrderbookUpdates
              .map((e) => config.encodeMessage(e))
              .toList(),
      'positions': positions.map((e) => config.encodeMessage(e)).toList(),
      'oracle_prices':
          oraclePrices.map((e) => config.encodeMessage(e)).toList(),
      'gas_price': gasPrice,
      'order_failures':
          orderFailures.map((e) => config.encodeMessage(e)).toList(),
      'conditional_order_trigger_failures':
          conditionalOrderTriggerFailures
              .map((e) => config.encodeMessage(e))
              .toList(),
    };
  }

  factory StreamResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return StreamResponse(
      blockHeight: json.valueAsBigInt<BigInt?>(
        'block_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      blockTime: json.valueAsBigInt<BigInt?>(
        'block_time',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      bankBalances:
          (json.valueEnsureAsList<dynamic>(
                'bank_balances',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<BankBalance, Object>(
                  value: e,
                  parse:
                      (v) => BankBalance.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      subaccountDeposits:
          (json.valueEnsureAsList<dynamic>(
                'subaccount_deposits',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<SubaccountDeposits, Object>(
                  value: e,
                  parse:
                      (v) => SubaccountDeposits.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      spotTrades:
          (json.valueEnsureAsList<dynamic>(
                'spot_trades',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<SpotTrade, Object>(
                  value: e,
                  parse:
                      (v) => SpotTrade.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      derivativeTrades:
          (json.valueEnsureAsList<dynamic>(
                'derivative_trades',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<DerivativeTrade, Object>(
                  value: e,
                  parse:
                      (v) => DerivativeTrade.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      spotOrders:
          (json.valueEnsureAsList<dynamic>(
                'spot_orders',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<SpotOrderUpdate, Object>(
                  value: e,
                  parse:
                      (v) => SpotOrderUpdate.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      derivativeOrders:
          (json.valueEnsureAsList<dynamic>(
                'derivative_orders',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<DerivativeOrderUpdate, Object>(
                  value: e,
                  parse:
                      (v) => DerivativeOrderUpdate.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      spotOrderbookUpdates:
          (json.valueEnsureAsList<dynamic>(
                'spot_orderbook_updates',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<OrderbookUpdate, Object>(
                  value: e,
                  parse:
                      (v) => OrderbookUpdate.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      derivativeOrderbookUpdates:
          (json.valueEnsureAsList<dynamic>(
                'derivative_orderbook_updates',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<OrderbookUpdate, Object>(
                  value: e,
                  parse:
                      (v) => OrderbookUpdate.fromJson(
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
                (e) => JsonParser.valueTo<Position, Object>(
                  value: e,
                  parse:
                      (v) => Position.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      oraclePrices:
          (json.valueEnsureAsList<dynamic>(
                'oracle_prices',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<OraclePrice, Object>(
                  value: e,
                  parse:
                      (v) => OraclePrice.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      gasPrice: json.valueAsString<String?>(
        'gas_price',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      orderFailures:
          (json.valueEnsureAsList<dynamic>(
                'order_failures',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<OrderFailureUpdate, Object>(
                  value: e,
                  parse:
                      (v) => OrderFailureUpdate.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      conditionalOrderTriggerFailures:
          (json.valueEnsureAsList<dynamic>(
                'conditional_order_trigger_failures',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  ConditionalOrderTriggerFailureUpdate,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => ConditionalOrderTriggerFailureUpdate.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory StreamResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return StreamResponse(
      blockHeight: decode.getBigInt<BigInt?>(1),
      blockTime: decode.getBigInt<BigInt?>(2),
      bankBalances:
          decode
              .getListOfBytes(3)
              .map((b) => BankBalance.deserialize(b))
              .toList(),
      subaccountDeposits:
          decode
              .getListOfBytes(4)
              .map((b) => SubaccountDeposits.deserialize(b))
              .toList(),
      spotTrades:
          decode
              .getListOfBytes(5)
              .map((b) => SpotTrade.deserialize(b))
              .toList(),
      derivativeTrades:
          decode
              .getListOfBytes(6)
              .map((b) => DerivativeTrade.deserialize(b))
              .toList(),
      spotOrders:
          decode
              .getListOfBytes(7)
              .map((b) => SpotOrderUpdate.deserialize(b))
              .toList(),
      derivativeOrders:
          decode
              .getListOfBytes(8)
              .map((b) => DerivativeOrderUpdate.deserialize(b))
              .toList(),
      spotOrderbookUpdates:
          decode
              .getListOfBytes(9)
              .map((b) => OrderbookUpdate.deserialize(b))
              .toList(),
      derivativeOrderbookUpdates:
          decode
              .getListOfBytes(10)
              .map((b) => OrderbookUpdate.deserialize(b))
              .toList(),
      positions:
          decode
              .getListOfBytes(11)
              .map((b) => Position.deserialize(b))
              .toList(),
      oraclePrices:
          decode
              .getListOfBytes(12)
              .map((b) => OraclePrice.deserialize(b))
              .toList(),
      gasPrice: decode.getString<String?>(13),
      orderFailures:
          decode
              .getListOfBytes(14)
              .map((b) => OrderFailureUpdate.deserialize(b))
              .toList(),
      conditionalOrderTriggerFailures:
          decode
              .getListOfBytes(15)
              .map((b) => ConditionalOrderTriggerFailureUpdate.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveStreamV2StreamResponse;
}

class OrderbookUpdate extends CosmosProtoMessage {
  /// the sequence number of the orderbook update
  final BigInt? seq;

  /// the orderbook details
  final Orderbook? orderbook;

  const OrderbookUpdate({this.seq, this.orderbook});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint64(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [seq, orderbook];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'seq': config.encodeBigint(seq),
      'orderbook': config.encodeMessage(orderbook),
    };
  }

  factory OrderbookUpdate.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return OrderbookUpdate(
      seq: json.valueAsBigInt<BigInt?>(
        'seq',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      orderbook: json.valueTo<Orderbook?, Object>(
        key: 'orderbook',
        parse: (v) => Orderbook.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory OrderbookUpdate.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return OrderbookUpdate(
      seq: decode.getBigInt<BigInt?>(1),
      orderbook: decode.messageTo<Orderbook?>(
        2,
        (b) => Orderbook.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveStreamV2OrderbookUpdate;
}

class Orderbook extends CosmosProtoMessage {
  /// the market ID
  final String? marketId;

  /// list of buy levels
  final List<injective_exchange_v2_exchange.Level> buyLevels;

  /// list of sell levels
  final List<injective_exchange_v2_exchange.Level> sellLevels;

  const Orderbook({
    this.marketId,
    this.buyLevels = const [],
    this.sellLevels = const [],
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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [marketId, buyLevels, sellLevels];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'market_id': marketId,
      'buy_levels': buyLevels.map((e) => config.encodeMessage(e)).toList(),
      'sell_levels': sellLevels.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory Orderbook.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Orderbook(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      buyLevels:
          (json.valueEnsureAsList<dynamic>(
                'buy_levels',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_exchange.Level,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_exchange.Level.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      sellLevels:
          (json.valueEnsureAsList<dynamic>(
                'sell_levels',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_exchange.Level,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_exchange.Level.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory Orderbook.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Orderbook(
      marketId: decode.getString<String?>(1),
      buyLevels:
          decode
              .getListOfBytes(2)
              .map((b) => injective_exchange_v2_exchange.Level.deserialize(b))
              .toList(),
      sellLevels:
          decode
              .getListOfBytes(3)
              .map((b) => injective_exchange_v2_exchange.Level.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveStreamV2Orderbook;
}

class BankBalance extends CosmosProtoMessage {
  /// the account address
  final String? account;

  /// list of account balances
  final List<cosmos_base_v1beta1_coin.Coin> balances;

  const BankBalance({this.account, this.balances = const []});

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
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [account, balances];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'account': account,
      'balances': balances.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory BankBalance.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return BankBalance(
      account: json.valueAsString<String?>(
        'account',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      balances:
          (json.valueEnsureAsList<dynamic>(
                'balances',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<cosmos_base_v1beta1_coin.Coin, Object>(
                      value: e,
                      parse:
                          (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
    );
  }

  factory BankBalance.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BankBalance(
      account: decode.getString<String?>(1),
      balances:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveStreamV2BankBalance;
}

class SubaccountDeposits extends CosmosProtoMessage {
  /// the subaccount ID
  final String? subaccountId;

  /// the deposits details
  final List<SubaccountDeposit> deposits;

  const SubaccountDeposits({this.subaccountId, this.deposits = const []});

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
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [subaccountId, deposits];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'subaccount_id': subaccountId,
      'deposits': deposits.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory SubaccountDeposits.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return SubaccountDeposits(
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      deposits:
          (json.valueEnsureAsList<dynamic>(
                'deposits',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<SubaccountDeposit, Object>(
                  value: e,
                  parse:
                      (v) => SubaccountDeposit.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory SubaccountDeposits.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SubaccountDeposits(
      subaccountId: decode.getString<String?>(1),
      deposits:
          decode
              .getListOfBytes(2)
              .map((b) => SubaccountDeposit.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveStreamV2SubaccountDeposits;
}

class SubaccountDeposit extends CosmosProtoMessage {
  final String? denom;

  final injective_exchange_v2_exchange.Deposit? deposit;

  const SubaccountDeposit({this.denom, this.deposit});

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
  List<Object?> get protoValues => [denom, deposit];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'denom': denom, 'deposit': config.encodeMessage(deposit)};
  }

  factory SubaccountDeposit.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return SubaccountDeposit(
      denom: json.valueAsString<String?>(
        'denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      deposit: json.valueTo<injective_exchange_v2_exchange.Deposit?, Object>(
        key: 'deposit',
        parse:
            (v) => injective_exchange_v2_exchange.Deposit.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory SubaccountDeposit.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SubaccountDeposit(
      denom: decode.getString<String?>(1),
      deposit: decode.messageTo<injective_exchange_v2_exchange.Deposit?>(
        2,
        (b) => injective_exchange_v2_exchange.Deposit.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveStreamV2SubaccountDeposit;
}

class SpotOrderUpdate extends CosmosProtoMessage {
  /// the status of the order
  final OrderUpdateStatus? status;

  /// the order hash
  final String? orderHash;

  /// the client order ID
  final String? cid;

  /// the order details
  final SpotOrder? order;

  const SpotOrderUpdate({this.status, this.orderHash, this.cid, this.order});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.enumType(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.message(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [status, orderHash, cid, order];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'status': config.encodeEnum(status),
      'order_hash': orderHash,
      'cid': cid,
      'order': config.encodeMessage(order),
    };
  }

  factory SpotOrderUpdate.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return SpotOrderUpdate(
      status: json.valueTo<OrderUpdateStatus?, Object?>(
        key: 'status',
        parse: (v) => OrderUpdateStatus.from(v),
      ),
      orderHash: json.valueAsString<String?>(
        'order_hash',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      cid: json.valueAsString<String?>(
        'cid',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      order: json.valueTo<SpotOrder?, Object>(
        key: 'order',
        parse: (v) => SpotOrder.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory SpotOrderUpdate.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SpotOrderUpdate(
      status: decode.getEnum<OrderUpdateStatus?>(1, OrderUpdateStatus.values),
      orderHash: decode.getString<String?>(2),
      cid: decode.getString<String?>(3),
      order: decode.messageTo<SpotOrder?>(4, (b) => SpotOrder.deserialize(b)),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveStreamV2SpotOrderUpdate;
}

class SpotOrder extends CosmosProtoMessage {
  /// the market ID
  final String? marketId;

  /// the order details
  final injective_exchange_v2_order.SpotLimitOrder? order;

  const SpotOrder({this.marketId, this.order});

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
  List<Object?> get protoValues => [marketId, order];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'market_id': marketId, 'order': config.encodeMessage(order)};
  }

  factory SpotOrder.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return SpotOrder(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      order: json.valueTo<injective_exchange_v2_order.SpotLimitOrder?, Object>(
        key: 'order',
        parse:
            (v) => injective_exchange_v2_order.SpotLimitOrder.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory SpotOrder.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SpotOrder(
      marketId: decode.getString<String?>(1),
      order: decode.messageTo<injective_exchange_v2_order.SpotLimitOrder?>(
        2,
        (b) => injective_exchange_v2_order.SpotLimitOrder.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveStreamV2SpotOrder;
}

class DerivativeOrderUpdate extends CosmosProtoMessage {
  /// the status of the order
  final OrderUpdateStatus? status;

  /// the order hash
  final String? orderHash;

  /// the client order ID
  final String? cid;

  /// the order details
  final DerivativeOrder? order;

  const DerivativeOrderUpdate({
    this.status,
    this.orderHash,
    this.cid,
    this.order,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.enumType(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.message(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [status, orderHash, cid, order];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'status': config.encodeEnum(status),
      'order_hash': orderHash,
      'cid': cid,
      'order': config.encodeMessage(order),
    };
  }

  factory DerivativeOrderUpdate.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return DerivativeOrderUpdate(
      status: json.valueTo<OrderUpdateStatus?, Object?>(
        key: 'status',
        parse: (v) => OrderUpdateStatus.from(v),
      ),
      orderHash: json.valueAsString<String?>(
        'order_hash',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      cid: json.valueAsString<String?>(
        'cid',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      order: json.valueTo<DerivativeOrder?, Object>(
        key: 'order',
        parse:
            (v) =>
                DerivativeOrder.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory DerivativeOrderUpdate.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DerivativeOrderUpdate(
      status: decode.getEnum<OrderUpdateStatus?>(1, OrderUpdateStatus.values),
      orderHash: decode.getString<String?>(2),
      cid: decode.getString<String?>(3),
      order: decode.messageTo<DerivativeOrder?>(
        4,
        (b) => DerivativeOrder.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveStreamV2DerivativeOrderUpdate;
}

class DerivativeOrder extends CosmosProtoMessage {
  /// the market ID
  final String? marketId;

  /// the order details
  final injective_exchange_v2_order.DerivativeLimitOrder? order;

  /// whether the order is a market order
  final bool? isMarket;

  const DerivativeOrder({this.marketId, this.order, this.isMarket});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.bool(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [marketId, order, isMarket];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'market_id': marketId,
      'order': config.encodeMessage(order),
      'is_market': isMarket,
    };
  }

  factory DerivativeOrder.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return DerivativeOrder(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      order: json
          .valueTo<injective_exchange_v2_order.DerivativeLimitOrder?, Object>(
            key: 'order',
            parse:
                (v) =>
                    injective_exchange_v2_order.DerivativeLimitOrder.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      isMarket: json.valueAsBool<bool?>(
        'is_market',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory DerivativeOrder.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DerivativeOrder(
      marketId: decode.getString<String?>(1),
      order: decode
          .messageTo<injective_exchange_v2_order.DerivativeLimitOrder?>(
            2,
            (b) =>
                injective_exchange_v2_order.DerivativeLimitOrder.deserialize(b),
          ),
      isMarket: decode.getBool<bool?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveStreamV2DerivativeOrder;
}

class Position extends CosmosProtoMessage {
  /// the market ID
  final String? marketId;

  /// the subaccount ID
  final String? subaccountId;

  /// whether the position is long or short
  final bool? isLong;

  /// the quantity of the position (in human readable format)
  final String? quantity;

  /// the entry price of the position (in human readable format)
  final String? entryPrice;

  /// the margin of the position (in human readable format)
  final String? margin;

  /// the cumulative funding entry of the position (in human readable format)
  final String? cumulativeFundingEntry;

  const Position({
    this.marketId,
    this.subaccountId,
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
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.bool(3),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(7, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    marketId,
    subaccountId,
    isLong,
    quantity,
    entryPrice,
    margin,
    cumulativeFundingEntry,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'market_id': marketId,
      'subaccount_id': subaccountId,
      'isLong': isLong,
      'quantity': quantity,
      'entry_price': entryPrice,
      'margin': margin,
      'cumulative_funding_entry': cumulativeFundingEntry,
    };
  }

  factory Position.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Position(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      isLong: json.valueAsBool<bool?>(
        'isLong',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      quantity: json.valueAsString<String?>(
        'quantity',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      entryPrice: json.valueAsString<String?>(
        'entry_price',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      margin: json.valueAsString<String?>(
        'margin',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      cumulativeFundingEntry: json.valueAsString<String?>(
        'cumulative_funding_entry',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Position.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Position(
      marketId: decode.getString<String?>(1),
      subaccountId: decode.getString<String?>(2),
      isLong: decode.getBool<bool?>(3),
      quantity: decode.getString<String?>(4),
      entryPrice: decode.getString<String?>(5),
      margin: decode.getString<String?>(6),
      cumulativeFundingEntry: decode.getString<String?>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveStreamV2Position;
}

class OraclePrice extends CosmosProtoMessage {
  /// the symbol of the oracle price
  final String? symbol;

  /// the updated price
  final String? price;

  /// the oracle type
  final String? type;

  const OraclePrice({this.symbol, this.price, this.type});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [symbol, price, type];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'symbol': symbol, 'price': price, 'type': type};
  }

  factory OraclePrice.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return OraclePrice(
      symbol: json.valueAsString<String?>(
        'symbol',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      price: json.valueAsString<String?>(
        'price',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      type: json.valueAsString<String?>(
        'type',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory OraclePrice.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return OraclePrice(
      symbol: decode.getString<String?>(1),
      price: decode.getString<String?>(2),
      type: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveStreamV2OraclePrice;
}

class SpotTrade extends CosmosProtoMessage {
  /// the market ID
  final String? marketId;

  /// whether the trade is a buy or sell
  final bool? isBuy;

  /// the execution type
  final String? executionType;

  /// the quantity of the trade (in human readable format)
  final String? quantity;

  /// the price of the trade (in human readable format)
  final String? price;

  /// the subaccount ID that executed the trade
  final String? subaccountId;

  /// the fee of the trade (in human readable format)
  final String? fee;

  /// the order hash
  final String? orderHash;

  /// the fee recipient address
  final String? feeRecipientAddress;

  /// the client order ID
  final String? cid;

  /// the trade ID
  final String? tradeId;

  const SpotTrade({
    this.marketId,
    this.isBuy,
    this.executionType,
    this.quantity,
    this.price,
    this.subaccountId,
    this.fee,
    this.orderHash,
    this.feeRecipientAddress,
    this.cid,
    this.tradeId,
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
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6),
        ProtoFieldConfig.string(7, options: const []),
        ProtoFieldConfig.string(8),
        ProtoFieldConfig.string(9, options: const []),
        ProtoFieldConfig.string(10),
        ProtoFieldConfig.string(11),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    marketId,
    isBuy,
    executionType,
    quantity,
    price,
    subaccountId,
    fee,
    orderHash,
    feeRecipientAddress,
    cid,
    tradeId,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'market_id': marketId,
      'is_buy': isBuy,
      'executionType': executionType,
      'quantity': quantity,
      'price': price,
      'subaccount_id': subaccountId,
      'fee': fee,
      'order_hash': orderHash,
      'fee_recipient_address': feeRecipientAddress,
      'cid': cid,
      'trade_id': tradeId,
    };
  }

  factory SpotTrade.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return SpotTrade(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      isBuy: json.valueAsBool<bool?>(
        'is_buy',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      executionType: json.valueAsString<String?>(
        'executionType',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      quantity: json.valueAsString<String?>(
        'quantity',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      price: json.valueAsString<String?>(
        'price',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      fee: json.valueAsString<String?>(
        'fee',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      orderHash: json.valueAsString<String?>(
        'order_hash',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      feeRecipientAddress: json.valueAsString<String?>(
        'fee_recipient_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      cid: json.valueAsString<String?>(
        'cid',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      tradeId: json.valueAsString<String?>(
        'trade_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory SpotTrade.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SpotTrade(
      marketId: decode.getString<String?>(1),
      isBuy: decode.getBool<bool?>(2),
      executionType: decode.getString<String?>(3),
      quantity: decode.getString<String?>(4),
      price: decode.getString<String?>(5),
      subaccountId: decode.getString<String?>(6),
      fee: decode.getString<String?>(7),
      orderHash: decode.getString<String?>(8),
      feeRecipientAddress: decode.getString<String?>(9),
      cid: decode.getString<String?>(10),
      tradeId: decode.getString<String?>(11),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveStreamV2SpotTrade;
}

class DerivativeTrade extends CosmosProtoMessage {
  /// the market ID
  final String? marketId;

  /// whether the trade is a buy or sell
  final bool? isBuy;

  /// the execution type
  final String? executionType;

  /// the subaccount ID
  final String? subaccountId;

  /// the position delta of the trade (in human readable format)
  final injective_exchange_v2_exchange.PositionDelta? positionDelta;

  /// the payout of the trade (in human readable format)
  final String? payout;

  /// the fee of the trade (in human readable format)
  final String? fee;

  /// the order hash
  final String? orderHash;

  /// the fee recipient address
  final String? feeRecipientAddress;

  /// the client order ID
  final String? cid;

  /// the trade ID
  final String? tradeId;

  /// whether the trade resulted from a liquidation
  final bool? isLiquidation;

  const DerivativeTrade({
    this.marketId,
    this.isBuy,
    this.executionType,
    this.subaccountId,
    this.positionDelta,
    this.payout,
    this.fee,
    this.orderHash,
    this.feeRecipientAddress,
    this.cid,
    this.tradeId,
    this.isLiquidation,
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
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.message(5),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(7, options: const []),
        ProtoFieldConfig.string(8),
        ProtoFieldConfig.string(9, options: const []),
        ProtoFieldConfig.string(10),
        ProtoFieldConfig.string(11),
        ProtoFieldConfig.bool(12),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    marketId,
    isBuy,
    executionType,
    subaccountId,
    positionDelta,
    payout,
    fee,
    orderHash,
    feeRecipientAddress,
    cid,
    tradeId,
    isLiquidation,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'market_id': marketId,
      'is_buy': isBuy,
      'executionType': executionType,
      'subaccount_id': subaccountId,
      'position_delta': config.encodeMessage(positionDelta),
      'payout': payout,
      'fee': fee,
      'order_hash': orderHash,
      'fee_recipient_address': feeRecipientAddress,
      'cid': cid,
      'trade_id': tradeId,
      'is_liquidation': isLiquidation,
    };
  }

  factory DerivativeTrade.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return DerivativeTrade(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      isBuy: json.valueAsBool<bool?>(
        'is_buy',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      executionType: json.valueAsString<String?>(
        'executionType',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      positionDelta: json
          .valueTo<injective_exchange_v2_exchange.PositionDelta?, Object>(
            key: 'position_delta',
            parse:
                (v) => injective_exchange_v2_exchange.PositionDelta.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      payout: json.valueAsString<String?>(
        'payout',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      fee: json.valueAsString<String?>(
        'fee',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      orderHash: json.valueAsString<String?>(
        'order_hash',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      feeRecipientAddress: json.valueAsString<String?>(
        'fee_recipient_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      cid: json.valueAsString<String?>(
        'cid',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      tradeId: json.valueAsString<String?>(
        'trade_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      isLiquidation: json.valueAsBool<bool?>(
        'is_liquidation',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory DerivativeTrade.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DerivativeTrade(
      marketId: decode.getString<String?>(1),
      isBuy: decode.getBool<bool?>(2),
      executionType: decode.getString<String?>(3),
      subaccountId: decode.getString<String?>(4),
      positionDelta: decode
          .messageTo<injective_exchange_v2_exchange.PositionDelta?>(
            5,
            (b) => injective_exchange_v2_exchange.PositionDelta.deserialize(b),
          ),
      payout: decode.getString<String?>(6),
      fee: decode.getString<String?>(7),
      orderHash: decode.getString<String?>(8),
      feeRecipientAddress: decode.getString<String?>(9),
      cid: decode.getString<String?>(10),
      tradeId: decode.getString<String?>(11),
      isLiquidation: decode.getBool<bool?>(12),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveStreamV2DerivativeTrade;
}

class OrderFailureUpdate extends CosmosProtoMessage {
  /// the account address
  final String? account;

  /// the order hash
  final String? orderHash;

  /// the client order ID
  final String? cid;

  /// the error code
  final int? errorCode;

  const OrderFailureUpdate({
    this.account,
    this.orderHash,
    this.cid,
    this.errorCode,
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
        ProtoFieldConfig.uint32(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [account, orderHash, cid, errorCode];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'account': account,
      'order_hash': orderHash,
      'cid': cid,
      'error_code': errorCode,
    };
  }

  factory OrderFailureUpdate.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return OrderFailureUpdate(
      account: json.valueAsString<String?>(
        'account',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      orderHash: json.valueAsString<String?>(
        'order_hash',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      cid: json.valueAsString<String?>(
        'cid',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      errorCode: json.valueAsInt<int?>(
        'error_code',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory OrderFailureUpdate.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return OrderFailureUpdate(
      account: decode.getString<String?>(1),
      orderHash: decode.getString<String?>(2),
      cid: decode.getString<String?>(3),
      errorCode: decode.getInt<int?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveStreamV2OrderFailureUpdate;
}

class ConditionalOrderTriggerFailureUpdate extends CosmosProtoMessage {
  /// the market ID
  final String? marketId;

  /// the subaccount ID
  final String? subaccountId;

  /// the mark price
  final String? markPrice;

  /// the order hash
  final String? orderHash;

  /// the client order ID
  final String? cid;

  /// the error code
  final String? errorDescription;

  const ConditionalOrderTriggerFailureUpdate({
    this.marketId,
    this.subaccountId,
    this.markPrice,
    this.orderHash,
    this.cid,
    this.errorDescription,
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
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.string(6),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    marketId,
    subaccountId,
    markPrice,
    orderHash,
    cid,
    errorDescription,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'market_id': marketId,
      'subaccount_id': subaccountId,
      'mark_price': markPrice,
      'order_hash': orderHash,
      'cid': cid,
      'error_description': errorDescription,
    };
  }

  factory ConditionalOrderTriggerFailureUpdate.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ConditionalOrderTriggerFailureUpdate(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      markPrice: json.valueAsString<String?>(
        'mark_price',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      orderHash: json.valueAsString<String?>(
        'order_hash',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      cid: json.valueAsString<String?>(
        'cid',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      errorDescription: json.valueAsString<String?>(
        'error_description',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory ConditionalOrderTriggerFailureUpdate.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ConditionalOrderTriggerFailureUpdate(
      marketId: decode.getString<String?>(1),
      subaccountId: decode.getString<String?>(2),
      markPrice: decode.getString<String?>(3),
      orderHash: decode.getString<String?>(4),
      cid: decode.getString<String?>(5),
      errorDescription: decode.getString<String?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveStreamV2ConditionalOrderTriggerFailureUpdate;
}

class TradesFilter extends CosmosProtoMessage {
  /// list of subaccount IDs to filter by
  final List<String> subaccountIds;

  /// list of market IDs to filter by
  final List<String> marketIds;

  const TradesFilter({
    this.subaccountIds = const [],
    this.marketIds = const [],
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
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [subaccountIds, marketIds];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'subaccount_ids': subaccountIds.map((e) => e).toList(),
      'market_ids': marketIds.map((e) => e).toList(),
    };
  }

  factory TradesFilter.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return TradesFilter(
      subaccountIds:
          (json.valueEnsureAsList<dynamic>(
            'subaccount_ids',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      marketIds:
          (json.valueEnsureAsList<dynamic>(
            'market_ids',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory TradesFilter.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TradesFilter(
      subaccountIds: decode.getListOrEmpty<String>(1),
      marketIds: decode.getListOrEmpty<String>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveStreamV2TradesFilter;
}

class PositionsFilter extends CosmosProtoMessage {
  /// list of subaccount IDs to filter by
  final List<String> subaccountIds;

  /// list of market IDs to filter by
  final List<String> marketIds;

  const PositionsFilter({
    this.subaccountIds = const [],
    this.marketIds = const [],
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
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [subaccountIds, marketIds];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'subaccount_ids': subaccountIds.map((e) => e).toList(),
      'market_ids': marketIds.map((e) => e).toList(),
    };
  }

  factory PositionsFilter.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return PositionsFilter(
      subaccountIds:
          (json.valueEnsureAsList<dynamic>(
            'subaccount_ids',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      marketIds:
          (json.valueEnsureAsList<dynamic>(
            'market_ids',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory PositionsFilter.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PositionsFilter(
      subaccountIds: decode.getListOrEmpty<String>(1),
      marketIds: decode.getListOrEmpty<String>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveStreamV2PositionsFilter;
}

class OrdersFilter extends CosmosProtoMessage {
  /// list of subaccount IDs to filter by
  final List<String> subaccountIds;

  /// list of market IDs to filter by
  final List<String> marketIds;

  const OrdersFilter({
    this.subaccountIds = const [],
    this.marketIds = const [],
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
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [subaccountIds, marketIds];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'subaccount_ids': subaccountIds.map((e) => e).toList(),
      'market_ids': marketIds.map((e) => e).toList(),
    };
  }

  factory OrdersFilter.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return OrdersFilter(
      subaccountIds:
          (json.valueEnsureAsList<dynamic>(
            'subaccount_ids',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      marketIds:
          (json.valueEnsureAsList<dynamic>(
            'market_ids',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory OrdersFilter.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return OrdersFilter(
      subaccountIds: decode.getListOrEmpty<String>(1),
      marketIds: decode.getListOrEmpty<String>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveStreamV2OrdersFilter;
}

class OrderbookFilter extends CosmosProtoMessage {
  /// list of market IDs to filter by
  final List<String> marketIds;

  const OrderbookFilter({this.marketIds = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [marketIds];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'market_ids': marketIds.map((e) => e).toList()};
  }

  factory OrderbookFilter.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return OrderbookFilter(
      marketIds:
          (json.valueEnsureAsList<dynamic>(
            'market_ids',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory OrderbookFilter.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return OrderbookFilter(marketIds: decode.getListOrEmpty<String>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveStreamV2OrderbookFilter;
}

class BankBalancesFilter extends CosmosProtoMessage {
  /// list of account addresses to filter by
  final List<String> accounts;

  const BankBalancesFilter({this.accounts = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [accounts];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'accounts': accounts.map((e) => e).toList()};
  }

  factory BankBalancesFilter.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return BankBalancesFilter(
      accounts:
          (json.valueEnsureAsList<dynamic>(
            'accounts',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory BankBalancesFilter.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BankBalancesFilter(accounts: decode.getListOrEmpty<String>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveStreamV2BankBalancesFilter;
}

class SubaccountDepositsFilter extends CosmosProtoMessage {
  /// list of subaccount IDs to filter by
  final List<String> subaccountIds;

  const SubaccountDepositsFilter({this.subaccountIds = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [subaccountIds];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'subaccount_ids': subaccountIds.map((e) => e).toList()};
  }

  factory SubaccountDepositsFilter.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return SubaccountDepositsFilter(
      subaccountIds:
          (json.valueEnsureAsList<dynamic>(
            'subaccount_ids',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory SubaccountDepositsFilter.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SubaccountDepositsFilter(
      subaccountIds: decode.getListOrEmpty<String>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveStreamV2SubaccountDepositsFilter;
}

class OraclePriceFilter extends CosmosProtoMessage {
  /// list of symbols to filter by
  final List<String> symbol;

  const OraclePriceFilter({this.symbol = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [symbol];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'symbol': symbol.map((e) => e).toList()};
  }

  factory OraclePriceFilter.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return OraclePriceFilter(
      symbol:
          (json.valueEnsureAsList<dynamic>(
            'symbol',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory OraclePriceFilter.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return OraclePriceFilter(symbol: decode.getListOrEmpty<String>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveStreamV2OraclePriceFilter;
}

class OrderFailuresFilter extends CosmosProtoMessage {
  /// list of account addresses to filter by
  final List<String> accounts;

  const OrderFailuresFilter({this.accounts = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [accounts];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'accounts': accounts.map((e) => e).toList()};
  }

  factory OrderFailuresFilter.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return OrderFailuresFilter(
      accounts:
          (json.valueEnsureAsList<dynamic>(
            'accounts',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory OrderFailuresFilter.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return OrderFailuresFilter(accounts: decode.getListOrEmpty<String>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveStreamV2OrderFailuresFilter;
}

class ConditionalOrderTriggerFailuresFilter extends CosmosProtoMessage {
  /// list of subaccount IDs to filter by
  final List<String> subaccountIds;

  /// list of market IDs to filter by
  final List<String> marketIds;

  const ConditionalOrderTriggerFailuresFilter({
    this.subaccountIds = const [],
    this.marketIds = const [],
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
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [subaccountIds, marketIds];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'subaccount_ids': subaccountIds.map((e) => e).toList(),
      'market_ids': marketIds.map((e) => e).toList(),
    };
  }

  factory ConditionalOrderTriggerFailuresFilter.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ConditionalOrderTriggerFailuresFilter(
      subaccountIds:
          (json.valueEnsureAsList<dynamic>(
            'subaccount_ids',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      marketIds:
          (json.valueEnsureAsList<dynamic>(
            'market_ids',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory ConditionalOrderTriggerFailuresFilter.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ConditionalOrderTriggerFailuresFilter(
      subaccountIds: decode.getListOrEmpty<String>(1),
      marketIds: decode.getListOrEmpty<String>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveStreamV2ConditionalOrderTriggerFailuresFilter;
}
