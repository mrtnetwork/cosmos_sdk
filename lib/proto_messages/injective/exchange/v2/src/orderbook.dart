import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/exchange/v2/src/order.dart"
    as injective_exchange_v2_order;

/// Spot Exchange Limit Orderbook
class SpotOrderBook extends CosmosProtoMessage {
  final String? marketId;

  final bool? isBuySide;

  final List<injective_exchange_v2_order.SpotLimitOrder> orders;

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
  Map<String, dynamic> toJson() {
    return {
      'market_id': marketId,
      'isBuySide': isBuySide,
      'orders': orders.map((e) => e.toJson()).toList(),
    };
  }

  factory SpotOrderBook.fromJson(Map<String, dynamic> json) {
    return SpotOrderBook(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      isBuySide: json.valueAsBool<bool?>('isBuySide', acceptCamelCase: true),
      orders:
          (json.valueEnsureAsList<dynamic>('orders', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_order.SpotLimitOrder,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_order
                          .SpotLimitOrder.fromJson(v),
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
                (b) =>
                    injective_exchange_v2_order.SpotLimitOrder.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2SpotOrderBook;
}

/// Derivative Exchange Limit Orderbook
class DerivativeOrderBook extends CosmosProtoMessage {
  final String? marketId;

  final bool? isBuySide;

  final List<injective_exchange_v2_order.DerivativeLimitOrder> orders;

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
  Map<String, dynamic> toJson() {
    return {
      'market_id': marketId,
      'isBuySide': isBuySide,
      'orders': orders.map((e) => e.toJson()).toList(),
    };
  }

  factory DerivativeOrderBook.fromJson(Map<String, dynamic> json) {
    return DerivativeOrderBook(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      isBuySide: json.valueAsBool<bool?>('isBuySide', acceptCamelCase: true),
      orders:
          (json.valueEnsureAsList<dynamic>('orders', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_order.DerivativeLimitOrder,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_order
                          .DerivativeLimitOrder.fromJson(v),
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
                (b) => injective_exchange_v2_order
                    .DerivativeLimitOrder.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2DerivativeOrderBook;
}

/// Orderbook containing limit &amp; market conditional orders
class ConditionalDerivativeOrderBook extends CosmosProtoMessage {
  final String? marketId;

  final List<injective_exchange_v2_order.DerivativeLimitOrder> limitBuyOrders;

  final List<injective_exchange_v2_order.DerivativeMarketOrder> marketBuyOrders;

  final List<injective_exchange_v2_order.DerivativeLimitOrder> limitSellOrders;

  final List<injective_exchange_v2_order.DerivativeMarketOrder>
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
  Map<String, dynamic> toJson() {
    return {
      'market_id': marketId,
      'limit_buy_orders': limitBuyOrders.map((e) => e.toJson()).toList(),
      'market_buy_orders': marketBuyOrders.map((e) => e.toJson()).toList(),
      'limit_sell_orders': limitSellOrders.map((e) => e.toJson()).toList(),
      'market_sell_orders': marketSellOrders.map((e) => e.toJson()).toList(),
    };
  }

  factory ConditionalDerivativeOrderBook.fromJson(Map<String, dynamic> json) {
    return ConditionalDerivativeOrderBook(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      limitBuyOrders:
          (json.valueEnsureAsList<dynamic>(
                'limit_buy_orders',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_order.DerivativeLimitOrder,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_order
                          .DerivativeLimitOrder.fromJson(v),
                ),
              )
              .toList(),
      marketBuyOrders:
          (json.valueEnsureAsList<dynamic>(
                'market_buy_orders',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_order.DerivativeMarketOrder,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_order
                          .DerivativeMarketOrder.fromJson(v),
                ),
              )
              .toList(),
      limitSellOrders:
          (json.valueEnsureAsList<dynamic>(
                'limit_sell_orders',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_order.DerivativeLimitOrder,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_order
                          .DerivativeLimitOrder.fromJson(v),
                ),
              )
              .toList(),
      marketSellOrders:
          (json.valueEnsureAsList<dynamic>(
                'market_sell_orders',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_order.DerivativeMarketOrder,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_order
                          .DerivativeMarketOrder.fromJson(v),
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
                (b) => injective_exchange_v2_order
                    .DerivativeLimitOrder.deserialize(b),
              )
              .toList(),
      marketBuyOrders:
          decode
              .getListOfBytes(3)
              .map(
                (b) => injective_exchange_v2_order
                    .DerivativeMarketOrder.deserialize(b),
              )
              .toList(),
      limitSellOrders:
          decode
              .getListOfBytes(4)
              .map(
                (b) => injective_exchange_v2_order
                    .DerivativeLimitOrder.deserialize(b),
              )
              .toList(),
      marketSellOrders:
          decode
              .getListOfBytes(5)
              .map(
                (b) => injective_exchange_v2_order
                    .DerivativeMarketOrder.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2ConditionalDerivativeOrderBook;
}

class SubaccountOrderbookMetadata extends CosmosProtoMessage {
  /// The number of vanilla limit orders
  final int? vanillaLimitOrderCount;

  /// The number of reduce-only limit orders
  final int? reduceOnlyLimitOrderCount;

  /// The aggregate quantity of the subaccount's reduce-only limit orders (in
  /// human readable format)
  final String? aggregateReduceOnlyQuantity;

  /// The aggregate quantity of the subaccount's vanilla limit orders (in human
  /// readable format)
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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2SubaccountOrderbookMetadata;
}
