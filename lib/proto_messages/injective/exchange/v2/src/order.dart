import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

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

class OrderInfo extends CosmosProtoMessage {
  /// bytes32 subaccount ID that created the order
  final String? subaccountId;

  /// address fee_recipient address that will receive fees for the order
  final String? feeRecipient;

  /// price of the order (in human readable format)
  final String? price;

  /// quantity of the order (in human readable format)
  final String? quantity;

  /// the client order ID (optional)
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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2OrderInfo;
}

class SpotOrder extends CosmosProtoMessage {
  /// market_id represents the unique ID of the market
  final String? marketId;

  /// order_info contains the information of the order
  final OrderInfo? orderInfo;

  /// order types
  final OrderType? orderType;

  /// trigger_price is the trigger price used by stop/take orders (in human
  /// readable format) (optional)
  final String? triggerPrice;

  /// expiration block is the block number at which the order will expire
  final BigInt? expirationBlock;

  const SpotOrder({
    this.marketId,
    this.orderInfo,
    this.orderType,
    this.triggerPrice,
    this.expirationBlock,
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
        ProtoFieldConfig.int64(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    marketId,
    orderInfo,
    orderType,
    triggerPrice,
    expirationBlock,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'market_id': marketId,
      'order_info': orderInfo?.toJson(),
      'order_type': orderType?.protoName,
      'trigger_price': triggerPrice,
      'expiration_block': expirationBlock?.toString(),
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
      expirationBlock: json.valueAsBigInt<BigInt?>(
        'expiration_block',
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
      expirationBlock: decode.getBigInt<BigInt?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2SpotOrder;
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

  /// order hash
  final List<int>? orderHash;

  /// expiration block is the block number at which the order will expire
  final BigInt? expirationBlock;

  const SpotLimitOrder({
    this.orderInfo,
    this.orderType,
    this.fillable,
    this.triggerPrice,
    this.orderHash,
    this.expirationBlock,
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
        ProtoFieldConfig.int64(6, options: const []),
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
    expirationBlock,
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
      'expiration_block': expirationBlock?.toString(),
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
      expirationBlock: json.valueAsBigInt<BigInt?>(
        'expiration_block',
        acceptCamelCase: true,
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
      expirationBlock: decode.getBigInt<BigInt?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2SpotLimitOrder;
}

class DerivativeOrder extends CosmosProtoMessage {
  /// market_id represents the unique ID of the market
  final String? marketId;

  /// order_info contains the information of the order
  final OrderInfo? orderInfo;

  /// order types
  final OrderType? orderType;

  /// margin is the margin used by the limit order (in human readable format)
  final String? margin;

  /// trigger_price is the trigger price used by stop/take orders (in human
  /// readable format) (optional)
  final String? triggerPrice;

  /// expiration block is the block number at which the order will expire
  final BigInt? expirationBlock;

  const DerivativeOrder({
    this.marketId,
    this.orderInfo,
    this.orderType,
    this.margin,
    this.triggerPrice,
    this.expirationBlock,
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
        ProtoFieldConfig.int64(6, options: const []),
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
    expirationBlock,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'market_id': marketId,
      'order_info': orderInfo?.toJson(),
      'order_type': orderType?.protoName,
      'margin': margin,
      'trigger_price': triggerPrice,
      'expiration_block': expirationBlock?.toString(),
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
      expirationBlock: json.valueAsBigInt<BigInt?>(
        'expiration_block',
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
      expirationBlock: decode.getBigInt<BigInt?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2DerivativeOrder;
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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2DerivativeMarketOrder;
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

  /// expiration block is the block number at which the order will expire
  final BigInt? expirationBlock;

  const DerivativeLimitOrder({
    this.orderInfo,
    this.orderType,
    this.margin,
    this.fillable,
    this.triggerPrice,
    this.orderHash,
    this.expirationBlock,
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
        ProtoFieldConfig.int64(7, options: const []),
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
    expirationBlock,
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
      'expiration_block': expirationBlock?.toString(),
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
      expirationBlock: json.valueAsBigInt<BigInt?>(
        'expiration_block',
        acceptCamelCase: true,
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
      expirationBlock: decode.getBigInt<BigInt?>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2DerivativeLimitOrder;
}
