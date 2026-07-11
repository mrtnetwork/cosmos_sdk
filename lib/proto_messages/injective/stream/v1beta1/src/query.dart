import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/exchange/v1beta1/src/exchange.dart"
    as injective_exchange_v1beta1_exchange;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

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
    return OrderUpdateStatus.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "OrderUpdateStatus",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static OrderUpdateStatus from(Object? value) {
    return OrderUpdateStatus.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "OrderUpdateStatus",
                value: value,
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
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'bank_balances_filter': bankBalancesFilter?.toJson(),
      'subaccount_deposits_filter': subaccountDepositsFilter?.toJson(),
      'spot_trades_filter': spotTradesFilter?.toJson(),
      'derivative_trades_filter': derivativeTradesFilter?.toJson(),
      'spot_orders_filter': spotOrdersFilter?.toJson(),
      'derivative_orders_filter': derivativeOrdersFilter?.toJson(),
      'spot_orderbooks_filter': spotOrderbooksFilter?.toJson(),
      'derivative_orderbooks_filter': derivativeOrderbooksFilter?.toJson(),
      'positions_filter': positionsFilter?.toJson(),
      'oracle_price_filter': oraclePriceFilter?.toJson(),
    };
  }

  factory StreamRequest.fromJson(Map<String, dynamic> json) {
    return StreamRequest(
      bankBalancesFilter: json
          .valueTo<BankBalancesFilter?, Map<String, dynamic>>(
            key: 'bank_balances_filter',
            parse: (v) => BankBalancesFilter.fromJson(v),
            acceptCamelCase: true,
          ),
      subaccountDepositsFilter: json
          .valueTo<SubaccountDepositsFilter?, Map<String, dynamic>>(
            key: 'subaccount_deposits_filter',
            parse: (v) => SubaccountDepositsFilter.fromJson(v),
            acceptCamelCase: true,
          ),
      spotTradesFilter: json.valueTo<TradesFilter?, Map<String, dynamic>>(
        key: 'spot_trades_filter',
        parse: (v) => TradesFilter.fromJson(v),
        acceptCamelCase: true,
      ),
      derivativeTradesFilter: json.valueTo<TradesFilter?, Map<String, dynamic>>(
        key: 'derivative_trades_filter',
        parse: (v) => TradesFilter.fromJson(v),
        acceptCamelCase: true,
      ),
      spotOrdersFilter: json.valueTo<OrdersFilter?, Map<String, dynamic>>(
        key: 'spot_orders_filter',
        parse: (v) => OrdersFilter.fromJson(v),
        acceptCamelCase: true,
      ),
      derivativeOrdersFilter: json.valueTo<OrdersFilter?, Map<String, dynamic>>(
        key: 'derivative_orders_filter',
        parse: (v) => OrdersFilter.fromJson(v),
        acceptCamelCase: true,
      ),
      spotOrderbooksFilter: json
          .valueTo<OrderbookFilter?, Map<String, dynamic>>(
            key: 'spot_orderbooks_filter',
            parse: (v) => OrderbookFilter.fromJson(v),
            acceptCamelCase: true,
          ),
      derivativeOrderbooksFilter: json
          .valueTo<OrderbookFilter?, Map<String, dynamic>>(
            key: 'derivative_orderbooks_filter',
            parse: (v) => OrderbookFilter.fromJson(v),
            acceptCamelCase: true,
          ),
      positionsFilter: json.valueTo<PositionsFilter?, Map<String, dynamic>>(
        key: 'positions_filter',
        parse: (v) => PositionsFilter.fromJson(v),
        acceptCamelCase: true,
      ),
      oraclePriceFilter: json.valueTo<OraclePriceFilter?, Map<String, dynamic>>(
        key: 'oracle_price_filter',
        parse: (v) => OraclePriceFilter.fromJson(v),
        acceptCamelCase: true,
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
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveStreamV1beta1StreamRequest;
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
  final BigInt? blockHeight;

  final BigInt? blockTime;

  final List<BankBalance> bankBalances;

  final List<SubaccountDeposits> subaccountDeposits;

  final List<SpotTrade> spotTrades;

  final List<DerivativeTrade> derivativeTrades;

  final List<SpotOrderUpdate> spotOrders;

  final List<DerivativeOrderUpdate> derivativeOrders;

  final List<OrderbookUpdate> spotOrderbookUpdates;

  final List<OrderbookUpdate> derivativeOrderbookUpdates;

  final List<Position> positions;

  final List<OraclePrice> oraclePrices;

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
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'block_height': blockHeight?.toString(),
      'block_time': blockTime?.toString(),
      'bank_balances': bankBalances.map((e) => e.toJson()).toList(),
      'subaccount_deposits': subaccountDeposits.map((e) => e.toJson()).toList(),
      'spot_trades': spotTrades.map((e) => e.toJson()).toList(),
      'derivative_trades': derivativeTrades.map((e) => e.toJson()).toList(),
      'spot_orders': spotOrders.map((e) => e.toJson()).toList(),
      'derivative_orders': derivativeOrders.map((e) => e.toJson()).toList(),
      'spot_orderbook_updates':
          spotOrderbookUpdates.map((e) => e.toJson()).toList(),
      'derivative_orderbook_updates':
          derivativeOrderbookUpdates.map((e) => e.toJson()).toList(),
      'positions': positions.map((e) => e.toJson()).toList(),
      'oracle_prices': oraclePrices.map((e) => e.toJson()).toList(),
    };
  }

  factory StreamResponse.fromJson(Map<String, dynamic> json) {
    return StreamResponse(
      blockHeight: json.valueAsBigInt<BigInt?>(
        'block_height',
        acceptCamelCase: true,
      ),
      blockTime: json.valueAsBigInt<BigInt?>(
        'block_time',
        acceptCamelCase: true,
      ),
      bankBalances:
          (json.valueEnsureAsList<dynamic>(
                'bank_balances',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<BankBalance, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => BankBalance.fromJson(v),
                ),
              )
              .toList(),
      subaccountDeposits:
          (json.valueEnsureAsList<dynamic>(
                'subaccount_deposits',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  SubaccountDeposits,
                  Map<String, dynamic>
                >(value: e, parse: (v) => SubaccountDeposits.fromJson(v)),
              )
              .toList(),
      spotTrades:
          (json.valueEnsureAsList<dynamic>(
                'spot_trades',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<SpotTrade, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => SpotTrade.fromJson(v),
                ),
              )
              .toList(),
      derivativeTrades:
          (json.valueEnsureAsList<dynamic>(
                'derivative_trades',
                acceptCamelCase: true,
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<DerivativeTrade, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => DerivativeTrade.fromJson(v),
                    ),
              )
              .toList(),
      spotOrders:
          (json.valueEnsureAsList<dynamic>(
                'spot_orders',
                acceptCamelCase: true,
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<SpotOrderUpdate, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => SpotOrderUpdate.fromJson(v),
                    ),
              )
              .toList(),
      derivativeOrders:
          (json.valueEnsureAsList<dynamic>(
                'derivative_orders',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  DerivativeOrderUpdate,
                  Map<String, dynamic>
                >(value: e, parse: (v) => DerivativeOrderUpdate.fromJson(v)),
              )
              .toList(),
      spotOrderbookUpdates:
          (json.valueEnsureAsList<dynamic>(
                'spot_orderbook_updates',
                acceptCamelCase: true,
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<OrderbookUpdate, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => OrderbookUpdate.fromJson(v),
                    ),
              )
              .toList(),
      derivativeOrderbookUpdates:
          (json.valueEnsureAsList<dynamic>(
                'derivative_orderbook_updates',
                acceptCamelCase: true,
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<OrderbookUpdate, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => OrderbookUpdate.fromJson(v),
                    ),
              )
              .toList(),
      positions:
          (json.valueEnsureAsList<dynamic>('positions', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<Position, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => Position.fromJson(v),
                ),
              )
              .toList(),
      oraclePrices:
          (json.valueEnsureAsList<dynamic>(
                'oracle_prices',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<OraclePrice, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => OraclePrice.fromJson(v),
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
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveStreamV1beta1StreamResponse;
}

class OrderbookUpdate extends CosmosProtoMessage {
  final BigInt? seq;

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
  Map<String, dynamic> toJson() {
    return {'seq': seq?.toString(), 'orderbook': orderbook?.toJson()};
  }

  factory OrderbookUpdate.fromJson(Map<String, dynamic> json) {
    return OrderbookUpdate(
      seq: json.valueAsBigInt<BigInt?>('seq', acceptCamelCase: true),
      orderbook: json.valueTo<Orderbook?, Map<String, dynamic>>(
        key: 'orderbook',
        parse: (v) => Orderbook.fromJson(v),
        acceptCamelCase: true,
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
      DefaultCosmosProtoTypeUrl.injectiveStreamV1beta1OrderbookUpdate;
}

class Orderbook extends CosmosProtoMessage {
  final String? marketId;

  final List<injective_exchange_v1beta1_exchange.Level> buyLevels;

  final List<injective_exchange_v1beta1_exchange.Level> sellLevels;

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
  Map<String, dynamic> toJson() {
    return {
      'market_id': marketId,
      'buy_levels': buyLevels.map((e) => e.toJson()).toList(),
      'sell_levels': sellLevels.map((e) => e.toJson()).toList(),
    };
  }

  factory Orderbook.fromJson(Map<String, dynamic> json) {
    return Orderbook(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      buyLevels:
          (json.valueEnsureAsList<dynamic>('buy_levels', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v1beta1_exchange.Level,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) =>
                          injective_exchange_v1beta1_exchange.Level.fromJson(v),
                ),
              )
              .toList(),
      sellLevels:
          (json.valueEnsureAsList<dynamic>(
                'sell_levels',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v1beta1_exchange.Level,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) =>
                          injective_exchange_v1beta1_exchange.Level.fromJson(v),
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
              .map(
                (b) => injective_exchange_v1beta1_exchange.Level.deserialize(b),
              )
              .toList(),
      sellLevels:
          decode
              .getListOfBytes(3)
              .map(
                (b) => injective_exchange_v1beta1_exchange.Level.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveStreamV1beta1Orderbook;
}

class BankBalance extends CosmosProtoMessage {
  final String? account;

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
  Map<String, dynamic> toJson() {
    return {
      'account': account,
      'balances': balances.map((e) => e.toJson()).toList(),
    };
  }

  factory BankBalance.fromJson(Map<String, dynamic> json) {
    return BankBalance(
      account: json.valueAsString<String?>('account', acceptCamelCase: true),
      balances:
          (json.valueEnsureAsList<dynamic>('balances', acceptCamelCase: true))
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
      DefaultCosmosProtoTypeUrl.injectiveStreamV1beta1BankBalance;
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
  Map<String, dynamic> toJson() {
    return {
      'subaccount_id': subaccountId,
      'deposits': deposits.map((e) => e.toJson()).toList(),
    };
  }

  factory SubaccountDeposits.fromJson(Map<String, dynamic> json) {
    return SubaccountDeposits(
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      deposits:
          (json.valueEnsureAsList<dynamic>('deposits', acceptCamelCase: true))
              .map(
                (e) =>
                    JsonParser.valueTo<SubaccountDeposit, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => SubaccountDeposit.fromJson(v),
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
      DefaultCosmosProtoTypeUrl.injectiveStreamV1beta1SubaccountDeposits;
}

class SubaccountDeposit extends CosmosProtoMessage {
  final String? denom;

  final injective_exchange_v1beta1_exchange.Deposit? deposit;

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
  Map<String, dynamic> toJson() {
    return {'denom': denom, 'deposit': deposit?.toJson()};
  }

  factory SubaccountDeposit.fromJson(Map<String, dynamic> json) {
    return SubaccountDeposit(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      deposit: json.valueTo<
        injective_exchange_v1beta1_exchange.Deposit?,
        Map<String, dynamic>
      >(
        key: 'deposit',
        parse: (v) => injective_exchange_v1beta1_exchange.Deposit.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory SubaccountDeposit.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SubaccountDeposit(
      denom: decode.getString<String?>(1),
      deposit: decode.messageTo<injective_exchange_v1beta1_exchange.Deposit?>(
        2,
        (b) => injective_exchange_v1beta1_exchange.Deposit.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveStreamV1beta1SubaccountDeposit;
}

class SpotOrderUpdate extends CosmosProtoMessage {
  final OrderUpdateStatus? status;

  final String? orderHash;

  final String? cid;

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
  Map<String, dynamic> toJson() {
    return {
      'status': status?.protoName,
      'order_hash': orderHash,
      'cid': cid,
      'order': order?.toJson(),
    };
  }

  factory SpotOrderUpdate.fromJson(Map<String, dynamic> json) {
    return SpotOrderUpdate(
      status: json.valueTo<OrderUpdateStatus?, Object?>(
        key: 'status',
        parse: (v) => OrderUpdateStatus.from(v),
      ),
      orderHash: json.valueAsString<String?>(
        'order_hash',
        acceptCamelCase: true,
      ),
      cid: json.valueAsString<String?>('cid', acceptCamelCase: true),
      order: json.valueTo<SpotOrder?, Map<String, dynamic>>(
        key: 'order',
        parse: (v) => SpotOrder.fromJson(v),
        acceptCamelCase: true,
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
      DefaultCosmosProtoTypeUrl.injectiveStreamV1beta1SpotOrderUpdate;
}

class SpotOrder extends CosmosProtoMessage {
  final String? marketId;

  final injective_exchange_v1beta1_exchange.SpotLimitOrder? order;

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
  Map<String, dynamic> toJson() {
    return {'market_id': marketId, 'order': order?.toJson()};
  }

  factory SpotOrder.fromJson(Map<String, dynamic> json) {
    return SpotOrder(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      order: json.valueTo<
        injective_exchange_v1beta1_exchange.SpotLimitOrder?,
        Map<String, dynamic>
      >(
        key: 'order',
        parse:
            (v) =>
                injective_exchange_v1beta1_exchange.SpotLimitOrder.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory SpotOrder.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SpotOrder(
      marketId: decode.getString<String?>(1),
      order: decode
          .messageTo<injective_exchange_v1beta1_exchange.SpotLimitOrder?>(
            2,
            (b) => injective_exchange_v1beta1_exchange
                .SpotLimitOrder.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveStreamV1beta1SpotOrder;
}

class DerivativeOrderUpdate extends CosmosProtoMessage {
  final OrderUpdateStatus? status;

  final String? orderHash;

  final String? cid;

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
  Map<String, dynamic> toJson() {
    return {
      'status': status?.protoName,
      'order_hash': orderHash,
      'cid': cid,
      'order': order?.toJson(),
    };
  }

  factory DerivativeOrderUpdate.fromJson(Map<String, dynamic> json) {
    return DerivativeOrderUpdate(
      status: json.valueTo<OrderUpdateStatus?, Object?>(
        key: 'status',
        parse: (v) => OrderUpdateStatus.from(v),
      ),
      orderHash: json.valueAsString<String?>(
        'order_hash',
        acceptCamelCase: true,
      ),
      cid: json.valueAsString<String?>('cid', acceptCamelCase: true),
      order: json.valueTo<DerivativeOrder?, Map<String, dynamic>>(
        key: 'order',
        parse: (v) => DerivativeOrder.fromJson(v),
        acceptCamelCase: true,
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
      DefaultCosmosProtoTypeUrl.injectiveStreamV1beta1DerivativeOrderUpdate;
}

class DerivativeOrder extends CosmosProtoMessage {
  /// the market ID
  final String? marketId;

  /// the derivative order details
  final injective_exchange_v1beta1_exchange.DerivativeLimitOrder? order;

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
  Map<String, dynamic> toJson() {
    return {
      'market_id': marketId,
      'order': order?.toJson(),
      'is_market': isMarket,
    };
  }

  factory DerivativeOrder.fromJson(Map<String, dynamic> json) {
    return DerivativeOrder(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      order: json.valueTo<
        injective_exchange_v1beta1_exchange.DerivativeLimitOrder?,
        Map<String, dynamic>
      >(
        key: 'order',
        parse:
            (v) => injective_exchange_v1beta1_exchange
                .DerivativeLimitOrder.fromJson(v),
        acceptCamelCase: true,
      ),
      isMarket: json.valueAsBool<bool?>('is_market', acceptCamelCase: true),
    );
  }

  factory DerivativeOrder.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DerivativeOrder(
      marketId: decode.getString<String?>(1),
      order: decode
          .messageTo<injective_exchange_v1beta1_exchange.DerivativeLimitOrder?>(
            2,
            (b) => injective_exchange_v1beta1_exchange
                .DerivativeLimitOrder.deserialize(b),
          ),
      isMarket: decode.getBool<bool?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveStreamV1beta1DerivativeOrder;
}

class Position extends CosmosProtoMessage {
  /// the market ID
  final String? marketId;

  /// the subaccount ID
  final String? subaccountId;

  /// whether the position is long or short
  final bool? isLong;

  /// the quantity of the position
  final String? quantity;

  /// the entry price of the position
  final String? entryPrice;

  /// the margin of the position
  final String? margin;

  /// the cumulative funding entry of the position
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
  Map<String, dynamic> toJson() {
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

  factory Position.fromJson(Map<String, dynamic> json) {
    return Position(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
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
      DefaultCosmosProtoTypeUrl.injectiveStreamV1beta1Position;
}

class OraclePrice extends CosmosProtoMessage {
  final String? symbol;

  final String? price;

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
  Map<String, dynamic> toJson() {
    return {'symbol': symbol, 'price': price, 'type': type};
  }

  factory OraclePrice.fromJson(Map<String, dynamic> json) {
    return OraclePrice(
      symbol: json.valueAsString<String?>('symbol', acceptCamelCase: true),
      price: json.valueAsString<String?>('price', acceptCamelCase: true),
      type: json.valueAsString<String?>('type', acceptCamelCase: true),
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
      DefaultCosmosProtoTypeUrl.injectiveStreamV1beta1OraclePrice;
}

class SpotTrade extends CosmosProtoMessage {
  /// the market ID
  final String? marketId;

  /// whether the trade is a buy or sell
  final bool? isBuy;

  /// the execution type
  final String? executionType;

  /// the quantity of the trade
  final String? quantity;

  /// the price of the trade
  final String? price;

  /// the subaccount ID that executed the trade
  final String? subaccountId;

  /// the fee of the trade
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
  Map<String, dynamic> toJson() {
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

  factory SpotTrade.fromJson(Map<String, dynamic> json) {
    return SpotTrade(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      isBuy: json.valueAsBool<bool?>('is_buy', acceptCamelCase: true),
      executionType: json.valueAsString<String?>(
        'executionType',
        acceptCamelCase: true,
      ),
      quantity: json.valueAsString<String?>('quantity', acceptCamelCase: true),
      price: json.valueAsString<String?>('price', acceptCamelCase: true),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      fee: json.valueAsString<String?>('fee', acceptCamelCase: true),
      orderHash: json.valueAsString<String?>(
        'order_hash',
        acceptCamelCase: true,
      ),
      feeRecipientAddress: json.valueAsString<String?>(
        'fee_recipient_address',
        acceptCamelCase: true,
      ),
      cid: json.valueAsString<String?>('cid', acceptCamelCase: true),
      tradeId: json.valueAsString<String?>('trade_id', acceptCamelCase: true),
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
      DefaultCosmosProtoTypeUrl.injectiveStreamV1beta1SpotTrade;
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

  /// the position delta of the trade
  final injective_exchange_v1beta1_exchange.PositionDelta? positionDelta;

  /// the payout of the trade
  final String? payout;

  /// the fee of the trade
  final String? fee;

  /// the order hash
  final String? orderHash;

  /// the fee recipient address
  final String? feeRecipientAddress;

  /// the client order ID
  final String? cid;

  /// the trade ID
  final String? tradeId;

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
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'market_id': marketId,
      'is_buy': isBuy,
      'executionType': executionType,
      'subaccount_id': subaccountId,
      'position_delta': positionDelta?.toJson(),
      'payout': payout,
      'fee': fee,
      'order_hash': orderHash,
      'fee_recipient_address': feeRecipientAddress,
      'cid': cid,
      'trade_id': tradeId,
    };
  }

  factory DerivativeTrade.fromJson(Map<String, dynamic> json) {
    return DerivativeTrade(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      isBuy: json.valueAsBool<bool?>('is_buy', acceptCamelCase: true),
      executionType: json.valueAsString<String?>(
        'executionType',
        acceptCamelCase: true,
      ),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      positionDelta: json.valueTo<
        injective_exchange_v1beta1_exchange.PositionDelta?,
        Map<String, dynamic>
      >(
        key: 'position_delta',
        parse:
            (v) =>
                injective_exchange_v1beta1_exchange.PositionDelta.fromJson(v),
        acceptCamelCase: true,
      ),
      payout: json.valueAsString<String?>('payout', acceptCamelCase: true),
      fee: json.valueAsString<String?>('fee', acceptCamelCase: true),
      orderHash: json.valueAsString<String?>(
        'order_hash',
        acceptCamelCase: true,
      ),
      feeRecipientAddress: json.valueAsString<String?>(
        'fee_recipient_address',
        acceptCamelCase: true,
      ),
      cid: json.valueAsString<String?>('cid', acceptCamelCase: true),
      tradeId: json.valueAsString<String?>('trade_id', acceptCamelCase: true),
    );
  }

  factory DerivativeTrade.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DerivativeTrade(
      marketId: decode.getString<String?>(1),
      isBuy: decode.getBool<bool?>(2),
      executionType: decode.getString<String?>(3),
      subaccountId: decode.getString<String?>(4),
      positionDelta: decode.messageTo<
        injective_exchange_v1beta1_exchange.PositionDelta?
      >(
        5,
        (b) => injective_exchange_v1beta1_exchange.PositionDelta.deserialize(b),
      ),
      payout: decode.getString<String?>(6),
      fee: decode.getString<String?>(7),
      orderHash: decode.getString<String?>(8),
      feeRecipientAddress: decode.getString<String?>(9),
      cid: decode.getString<String?>(10),
      tradeId: decode.getString<String?>(11),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveStreamV1beta1DerivativeTrade;
}

class TradesFilter extends CosmosProtoMessage {
  final List<String> subaccountIds;

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
  Map<String, dynamic> toJson() {
    return {
      'subaccount_ids': subaccountIds.map((e) => e).toList(),
      'market_ids': marketIds.map((e) => e).toList(),
    };
  }

  factory TradesFilter.fromJson(Map<String, dynamic> json) {
    return TradesFilter(
      subaccountIds:
          (json.valueEnsureAsList<dynamic>(
            'subaccount_ids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      marketIds:
          (json.valueEnsureAsList<dynamic>(
            'market_ids',
            acceptCamelCase: true,
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
      DefaultCosmosProtoTypeUrl.injectiveStreamV1beta1TradesFilter;
}

class PositionsFilter extends CosmosProtoMessage {
  final List<String> subaccountIds;

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
  Map<String, dynamic> toJson() {
    return {
      'subaccount_ids': subaccountIds.map((e) => e).toList(),
      'market_ids': marketIds.map((e) => e).toList(),
    };
  }

  factory PositionsFilter.fromJson(Map<String, dynamic> json) {
    return PositionsFilter(
      subaccountIds:
          (json.valueEnsureAsList<dynamic>(
            'subaccount_ids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      marketIds:
          (json.valueEnsureAsList<dynamic>(
            'market_ids',
            acceptCamelCase: true,
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
      DefaultCosmosProtoTypeUrl.injectiveStreamV1beta1PositionsFilter;
}

class OrdersFilter extends CosmosProtoMessage {
  final List<String> subaccountIds;

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
  Map<String, dynamic> toJson() {
    return {
      'subaccount_ids': subaccountIds.map((e) => e).toList(),
      'market_ids': marketIds.map((e) => e).toList(),
    };
  }

  factory OrdersFilter.fromJson(Map<String, dynamic> json) {
    return OrdersFilter(
      subaccountIds:
          (json.valueEnsureAsList<dynamic>(
            'subaccount_ids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      marketIds:
          (json.valueEnsureAsList<dynamic>(
            'market_ids',
            acceptCamelCase: true,
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
      DefaultCosmosProtoTypeUrl.injectiveStreamV1beta1OrdersFilter;
}

class OrderbookFilter extends CosmosProtoMessage {
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
  Map<String, dynamic> toJson() {
    return {'market_ids': marketIds.map((e) => e).toList()};
  }

  factory OrderbookFilter.fromJson(Map<String, dynamic> json) {
    return OrderbookFilter(
      marketIds:
          (json.valueEnsureAsList<dynamic>(
            'market_ids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory OrderbookFilter.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return OrderbookFilter(marketIds: decode.getListOrEmpty<String>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveStreamV1beta1OrderbookFilter;
}

class BankBalancesFilter extends CosmosProtoMessage {
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
  Map<String, dynamic> toJson() {
    return {'accounts': accounts.map((e) => e).toList()};
  }

  factory BankBalancesFilter.fromJson(Map<String, dynamic> json) {
    return BankBalancesFilter(
      accounts:
          (json.valueEnsureAsList<dynamic>(
            'accounts',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory BankBalancesFilter.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BankBalancesFilter(accounts: decode.getListOrEmpty<String>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveStreamV1beta1BankBalancesFilter;
}

class SubaccountDepositsFilter extends CosmosProtoMessage {
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
  Map<String, dynamic> toJson() {
    return {'subaccount_ids': subaccountIds.map((e) => e).toList()};
  }

  factory SubaccountDepositsFilter.fromJson(Map<String, dynamic> json) {
    return SubaccountDepositsFilter(
      subaccountIds:
          (json.valueEnsureAsList<dynamic>(
            'subaccount_ids',
            acceptCamelCase: true,
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
      DefaultCosmosProtoTypeUrl.injectiveStreamV1beta1SubaccountDepositsFilter;
}

class OraclePriceFilter extends CosmosProtoMessage {
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
  Map<String, dynamic> toJson() {
    return {'symbol': symbol.map((e) => e).toList()};
  }

  factory OraclePriceFilter.fromJson(Map<String, dynamic> json) {
    return OraclePriceFilter(
      symbol:
          (json.valueEnsureAsList<dynamic>(
            'symbol',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory OraclePriceFilter.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return OraclePriceFilter(symbol: decode.getListOrEmpty<String>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveStreamV1beta1OraclePriceFilter;
}
