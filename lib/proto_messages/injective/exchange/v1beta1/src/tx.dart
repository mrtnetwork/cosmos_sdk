import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/exchange/v1beta1/src/exchange.dart"
    as injective_exchange_v1beta1_exchange;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/injective/oracle/v1beta1/src/oracle.dart"
    as injective_oracle_v1beta1_oracle;
import "package:cosmos_sdk/proto_messages/injective/exchange/v1beta1/src/proposal.dart"
    as injective_exchange_v1beta1_proposal;

class MsgUpdateSpotMarket extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateSpotMarketResponse>,
        ICosmosProtoAminoMessage {
  /// current admin address of the associated market
  final String? admin;

  /// id of the market to be updated
  final String? marketId;

  /// (optional) updated ticker value
  final String? newTicker;

  /// (optional) updated min price tick size value
  final String? newMinPriceTickSize;

  /// (optional) updated min quantity tick size value
  final String? newMinQuantityTickSize;

  /// (optional) updated min notional
  final String? newMinNotional;

  const MsgUpdateSpotMarket({
    this.admin,
    this.marketId,
    this.newTicker,
    this.newMinPriceTickSize,
    this.newMinQuantityTickSize,
    this.newMinNotional,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgUpdateSpotMarket",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "admin"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    admin,
    marketId,
    newTicker,
    newMinPriceTickSize,
    newMinQuantityTickSize,
    newMinNotional,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'admin': admin,
      'market_id': marketId,
      'new_ticker': newTicker,
      'new_min_price_tick_size': newMinPriceTickSize,
      'new_min_quantity_tick_size': newMinQuantityTickSize,
      'new_min_notional': newMinNotional,
    };
  }

  factory MsgUpdateSpotMarket.fromJson(Map<String, dynamic> json) {
    return MsgUpdateSpotMarket(
      admin: json.valueAsString<String?>('admin', acceptCamelCase: true),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      newTicker: json.valueAsString<String?>(
        'new_ticker',
        acceptCamelCase: true,
      ),
      newMinPriceTickSize: json.valueAsString<String?>(
        'new_min_price_tick_size',
        acceptCamelCase: true,
      ),
      newMinQuantityTickSize: json.valueAsString<String?>(
        'new_min_quantity_tick_size',
        acceptCamelCase: true,
      ),
      newMinNotional: json.valueAsString<String?>(
        'new_min_notional',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateSpotMarket.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateSpotMarket(
      admin: decode.getString<String?>(1),
      marketId: decode.getString<String?>(2),
      newTicker: decode.getString<String?>(3),
      newMinPriceTickSize: decode.getString<String?>(4),
      newMinQuantityTickSize: decode.getString<String?>(5),
      newMinNotional: decode.getString<String?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1MsgUpdateSpotMarket;
  @override
  MsgUpdateSpotMarketResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateSpotMarketResponse.deserialize(bytes);
  }

  @override
  MsgUpdateSpotMarketResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateSpotMarketResponse.fromJson(json);
  }
}

class MsgUpdateSpotMarketResponse extends CosmosProtoMessage {
  const MsgUpdateSpotMarketResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgUpdateSpotMarketResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateSpotMarketResponse();
  }

  factory MsgUpdateSpotMarketResponse.deserialize(List<int> bytes) {
    return MsgUpdateSpotMarketResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgUpdateSpotMarketResponse;
}

class MsgUpdateDerivativeMarket extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateDerivativeMarketResponse>,
        ICosmosProtoAminoMessage {
  /// current admin address of the associated market
  final String? admin;

  /// id of the market to be updated
  final String? marketId;

  /// (optional) updated value for ticker
  final String? newTicker;

  /// (optional) updated value for min_price_tick_size
  final String? newMinPriceTickSize;

  /// (optional) updated value min_quantity_tick_size
  final String? newMinQuantityTickSize;

  /// (optional) updated min notional
  final String? newMinNotional;

  /// (optional) updated value for initial_margin_ratio
  final String? newInitialMarginRatio;

  /// (optional) updated value for maintenance_margin_ratio
  final String? newMaintenanceMarginRatio;

  const MsgUpdateDerivativeMarket({
    this.admin,
    this.marketId,
    this.newTicker,
    this.newMinPriceTickSize,
    this.newMinQuantityTickSize,
    this.newMinNotional,
    this.newInitialMarginRatio,
    this.newMaintenanceMarginRatio,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgUpdateDerivativeMarket",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "admin"),
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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    admin,
    marketId,
    newTicker,
    newMinPriceTickSize,
    newMinQuantityTickSize,
    newMinNotional,
    newInitialMarginRatio,
    newMaintenanceMarginRatio,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'admin': admin,
      'market_id': marketId,
      'new_ticker': newTicker,
      'new_min_price_tick_size': newMinPriceTickSize,
      'new_min_quantity_tick_size': newMinQuantityTickSize,
      'new_min_notional': newMinNotional,
      'new_initial_margin_ratio': newInitialMarginRatio,
      'new_maintenance_margin_ratio': newMaintenanceMarginRatio,
    };
  }

  factory MsgUpdateDerivativeMarket.fromJson(Map<String, dynamic> json) {
    return MsgUpdateDerivativeMarket(
      admin: json.valueAsString<String?>('admin', acceptCamelCase: true),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      newTicker: json.valueAsString<String?>(
        'new_ticker',
        acceptCamelCase: true,
      ),
      newMinPriceTickSize: json.valueAsString<String?>(
        'new_min_price_tick_size',
        acceptCamelCase: true,
      ),
      newMinQuantityTickSize: json.valueAsString<String?>(
        'new_min_quantity_tick_size',
        acceptCamelCase: true,
      ),
      newMinNotional: json.valueAsString<String?>(
        'new_min_notional',
        acceptCamelCase: true,
      ),
      newInitialMarginRatio: json.valueAsString<String?>(
        'new_initial_margin_ratio',
        acceptCamelCase: true,
      ),
      newMaintenanceMarginRatio: json.valueAsString<String?>(
        'new_maintenance_margin_ratio',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateDerivativeMarket.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateDerivativeMarket(
      admin: decode.getString<String?>(1),
      marketId: decode.getString<String?>(2),
      newTicker: decode.getString<String?>(3),
      newMinPriceTickSize: decode.getString<String?>(4),
      newMinQuantityTickSize: decode.getString<String?>(5),
      newMinNotional: decode.getString<String?>(6),
      newInitialMarginRatio: decode.getString<String?>(7),
      newMaintenanceMarginRatio: decode.getString<String?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgUpdateDerivativeMarket;
  @override
  MsgUpdateDerivativeMarketResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateDerivativeMarketResponse.deserialize(bytes);
  }

  @override
  MsgUpdateDerivativeMarketResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateDerivativeMarketResponse.fromJson(json);
  }
}

class MsgUpdateDerivativeMarketResponse extends CosmosProtoMessage {
  const MsgUpdateDerivativeMarketResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgUpdateDerivativeMarketResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateDerivativeMarketResponse();
  }

  factory MsgUpdateDerivativeMarketResponse.deserialize(List<int> bytes) {
    return MsgUpdateDerivativeMarketResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgUpdateDerivativeMarketResponse;
}

/// MsgDeposit defines a SDK message for transferring coins from the sender's
/// bank balance into the subaccount's exchange deposits
class MsgDeposit extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgDepositResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// (Optional) bytes32 subaccount ID to deposit funds into. If empty, the coin
  /// will be deposited to the sender's default subaccount address
  final String? subaccountId;

  /// the amount of the deposit (in chain format)
  final cosmos_base_v1beta1_coin.Coin? amount;

  const MsgDeposit({this.sender, this.subaccountId, this.amount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "exchange/MsgDeposit"),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, subaccountId, amount];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'subaccount_id': subaccountId,
      'amount': amount?.toJson(),
    };
  }

  factory MsgDeposit.fromJson(Map<String, dynamic> json) {
    return MsgDeposit(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      amount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgDeposit.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgDeposit(
      sender: decode.getString<String?>(1),
      subaccountId: decode.getString<String?>(2),
      amount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        3,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1MsgDeposit;
  @override
  MsgDepositResponse onServiceResponse(List<int> bytes) {
    return MsgDepositResponse.deserialize(bytes);
  }

  @override
  MsgDepositResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgDepositResponse.fromJson(json);
  }
}

/// MsgDepositResponse defines the Msg/Deposit response type.
class MsgDepositResponse extends CosmosProtoMessage {
  const MsgDepositResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgDepositResponse.fromJson(Map<String, dynamic> json) {
    return MsgDepositResponse();
  }

  factory MsgDepositResponse.deserialize(List<int> bytes) {
    return MsgDepositResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1MsgDepositResponse;
}

/// MsgWithdraw defines a SDK message for withdrawing coins from a subaccount's
/// deposits to the user's bank balance
class MsgWithdraw extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgWithdrawResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// the subaccount ID to withdraw funds from
  final String? subaccountId;

  /// the amount of the withdrawal (in chain format)
  final cosmos_base_v1beta1_coin.Coin? amount;

  const MsgWithdraw({this.sender, this.subaccountId, this.amount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "exchange/MsgWithdraw"),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, subaccountId, amount];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'subaccount_id': subaccountId,
      'amount': amount?.toJson(),
    };
  }

  factory MsgWithdraw.fromJson(Map<String, dynamic> json) {
    return MsgWithdraw(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      amount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgWithdraw.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgWithdraw(
      sender: decode.getString<String?>(1),
      subaccountId: decode.getString<String?>(2),
      amount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        3,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1MsgWithdraw;
  @override
  MsgWithdrawResponse onServiceResponse(List<int> bytes) {
    return MsgWithdrawResponse.deserialize(bytes);
  }

  @override
  MsgWithdrawResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgWithdrawResponse.fromJson(json);
  }
}

/// MsgWithdraw defines the Msg/Withdraw response type.
class MsgWithdrawResponse extends CosmosProtoMessage {
  const MsgWithdrawResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgWithdrawResponse.fromJson(Map<String, dynamic> json) {
    return MsgWithdrawResponse();
  }

  factory MsgWithdrawResponse.deserialize(List<int> bytes) {
    return MsgWithdrawResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1MsgWithdrawResponse;
}

/// MsgCreateSpotLimitOrder defines a SDK message for creating a new spot limit
/// order.
class MsgCreateSpotLimitOrder extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreateSpotLimitOrderResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// the spot order to create
  final injective_exchange_v1beta1_exchange.SpotOrder? order;

  const MsgCreateSpotLimitOrder({this.sender, this.order});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgCreateSpotLimitOrder",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, order];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'order': order?.toJson()};
  }

  factory MsgCreateSpotLimitOrder.fromJson(Map<String, dynamic> json) {
    return MsgCreateSpotLimitOrder(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      order: json.valueTo<
        injective_exchange_v1beta1_exchange.SpotOrder?,
        Map<String, dynamic>
      >(
        key: 'order',
        parse: (v) => injective_exchange_v1beta1_exchange.SpotOrder.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCreateSpotLimitOrder.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateSpotLimitOrder(
      sender: decode.getString<String?>(1),
      order: decode.messageTo<injective_exchange_v1beta1_exchange.SpotOrder?>(
        2,
        (b) => injective_exchange_v1beta1_exchange.SpotOrder.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1MsgCreateSpotLimitOrder;
  @override
  MsgCreateSpotLimitOrderResponse onServiceResponse(List<int> bytes) {
    return MsgCreateSpotLimitOrderResponse.deserialize(bytes);
  }

  @override
  MsgCreateSpotLimitOrderResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateSpotLimitOrderResponse.fromJson(json);
  }
}

/// MsgCreateSpotLimitOrderResponse defines the Msg/CreateSpotOrder response
/// type.
class MsgCreateSpotLimitOrderResponse extends CosmosProtoMessage {
  /// the order hash
  final String? orderHash;

  /// the client order ID
  final String? cid;

  const MsgCreateSpotLimitOrderResponse({this.orderHash, this.cid});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [orderHash, cid];

  @override
  Map<String, dynamic> toJson() {
    return {'order_hash': orderHash, 'cid': cid};
  }

  factory MsgCreateSpotLimitOrderResponse.fromJson(Map<String, dynamic> json) {
    return MsgCreateSpotLimitOrderResponse(
      orderHash: json.valueAsString<String?>(
        'order_hash',
        acceptCamelCase: true,
      ),
      cid: json.valueAsString<String?>('cid', acceptCamelCase: true),
    );
  }

  factory MsgCreateSpotLimitOrderResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateSpotLimitOrderResponse(
      orderHash: decode.getString<String?>(1),
      cid: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgCreateSpotLimitOrderResponse;
}

/// MsgBatchCreateSpotLimitOrders defines a SDK message for creating a new batch
/// of spot limit orders.
class MsgBatchCreateSpotLimitOrders extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgBatchCreateSpotLimitOrdersResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// the spot orders details
  final List<injective_exchange_v1beta1_exchange.SpotOrder> orders;

  const MsgBatchCreateSpotLimitOrders({this.sender, this.orders = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgBatchCreateSpotLimitOrders",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
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
  List<Object?> get protoValues => [sender, orders];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'orders': orders.map((e) => e.toJson()).toList()};
  }

  factory MsgBatchCreateSpotLimitOrders.fromJson(Map<String, dynamic> json) {
    return MsgBatchCreateSpotLimitOrders(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      orders:
          (json.valueEnsureAsList<dynamic>('orders', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v1beta1_exchange.SpotOrder,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_exchange
                          .SpotOrder.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory MsgBatchCreateSpotLimitOrders.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBatchCreateSpotLimitOrders(
      sender: decode.getString<String?>(1),
      orders:
          decode
              .getListOfBytes(2)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .SpotOrder.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgBatchCreateSpotLimitOrders;
  @override
  MsgBatchCreateSpotLimitOrdersResponse onServiceResponse(List<int> bytes) {
    return MsgBatchCreateSpotLimitOrdersResponse.deserialize(bytes);
  }

  @override
  MsgBatchCreateSpotLimitOrdersResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgBatchCreateSpotLimitOrdersResponse.fromJson(json);
  }
}

/// MsgBatchCreateSpotLimitOrdersResponse defines the
/// Msg/BatchCreateSpotLimitOrders response type.
class MsgBatchCreateSpotLimitOrdersResponse extends CosmosProtoMessage {
  /// the order hashes
  final List<String> orderHashes;

  /// the client order IDs
  final List<String> createdOrdersCids;

  /// the failed client order IDs
  final List<String> failedOrdersCids;

  const MsgBatchCreateSpotLimitOrdersResponse({
    this.orderHashes = const [],
    this.createdOrdersCids = const [],
    this.failedOrdersCids = const [],
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
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    orderHashes,
    createdOrdersCids,
    failedOrdersCids,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'order_hashes': orderHashes.map((e) => e).toList(),
      'created_orders_cids': createdOrdersCids.map((e) => e).toList(),
      'failed_orders_cids': failedOrdersCids.map((e) => e).toList(),
    };
  }

  factory MsgBatchCreateSpotLimitOrdersResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgBatchCreateSpotLimitOrdersResponse(
      orderHashes:
          (json.valueEnsureAsList<dynamic>(
            'order_hashes',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      createdOrdersCids:
          (json.valueEnsureAsList<dynamic>(
            'created_orders_cids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      failedOrdersCids:
          (json.valueEnsureAsList<dynamic>(
            'failed_orders_cids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory MsgBatchCreateSpotLimitOrdersResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBatchCreateSpotLimitOrdersResponse(
      orderHashes: decode.getListOrEmpty<String>(1),
      createdOrdersCids: decode.getListOrEmpty<String>(2),
      failedOrdersCids: decode.getListOrEmpty<String>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgBatchCreateSpotLimitOrdersResponse;
}

/// MsgInstantSpotMarketLaunch defines a SDK message for creating a new spot
/// market by paying listing fee without governance
class MsgInstantSpotMarketLaunch extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgInstantSpotMarketLaunchResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// the ticker for the spot market
  final String? ticker;

  /// the type of coin to use as the base currency
  final String? baseDenom;

  /// type of coin to use as the quote currency
  final String? quoteDenom;

  /// min_price_tick_size defines the minimum tick size of the order's price
  final String? minPriceTickSize;

  /// min_quantity_tick_size defines the minimum tick size of the order's
  /// quantity
  final String? minQuantityTickSize;

  /// min_notional defines the minimum notional (in quote asset) required for
  /// orders in the market
  final String? minNotional;

  /// base token decimals
  final int? baseDecimals;

  /// quote token decimals
  final int? quoteDecimals;

  const MsgInstantSpotMarketLaunch({
    this.sender,
    this.ticker,
    this.baseDenom,
    this.quoteDenom,
    this.minPriceTickSize,
    this.minQuantityTickSize,
    this.minNotional,
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
          value: "exchange/MsgInstantSpotMarketLaunch",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(7, options: const []),
        ProtoFieldConfig.uint32(8),
        ProtoFieldConfig.uint32(9),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    ticker,
    baseDenom,
    quoteDenom,
    minPriceTickSize,
    minQuantityTickSize,
    minNotional,
    baseDecimals,
    quoteDecimals,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'ticker': ticker,
      'base_denom': baseDenom,
      'quote_denom': quoteDenom,
      'min_price_tick_size': minPriceTickSize,
      'min_quantity_tick_size': minQuantityTickSize,
      'min_notional': minNotional,
      'base_decimals': baseDecimals,
      'quote_decimals': quoteDecimals,
    };
  }

  factory MsgInstantSpotMarketLaunch.fromJson(Map<String, dynamic> json) {
    return MsgInstantSpotMarketLaunch(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      ticker: json.valueAsString<String?>('ticker', acceptCamelCase: true),
      baseDenom: json.valueAsString<String?>(
        'base_denom',
        acceptCamelCase: true,
      ),
      quoteDenom: json.valueAsString<String?>(
        'quote_denom',
        acceptCamelCase: true,
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

  factory MsgInstantSpotMarketLaunch.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgInstantSpotMarketLaunch(
      sender: decode.getString<String?>(1),
      ticker: decode.getString<String?>(2),
      baseDenom: decode.getString<String?>(3),
      quoteDenom: decode.getString<String?>(4),
      minPriceTickSize: decode.getString<String?>(5),
      minQuantityTickSize: decode.getString<String?>(6),
      minNotional: decode.getString<String?>(7),
      baseDecimals: decode.getInt<int?>(8),
      quoteDecimals: decode.getInt<int?>(9),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgInstantSpotMarketLaunch;
  @override
  MsgInstantSpotMarketLaunchResponse onServiceResponse(List<int> bytes) {
    return MsgInstantSpotMarketLaunchResponse.deserialize(bytes);
  }

  @override
  MsgInstantSpotMarketLaunchResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgInstantSpotMarketLaunchResponse.fromJson(json);
  }
}

/// MsgInstantSpotMarketLaunchResponse defines the Msg/InstantSpotMarketLaunch
/// response type.
class MsgInstantSpotMarketLaunchResponse extends CosmosProtoMessage {
  const MsgInstantSpotMarketLaunchResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgInstantSpotMarketLaunchResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgInstantSpotMarketLaunchResponse();
  }

  factory MsgInstantSpotMarketLaunchResponse.deserialize(List<int> bytes) {
    return MsgInstantSpotMarketLaunchResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgInstantSpotMarketLaunchResponse;
}

/// MsgInstantBinaryOptionsMarketLaunch defines a SDK message for creating a new
/// perpetual futures market by paying listing fee without governance
class MsgInstantBinaryOptionsMarketLaunch extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgInstantBinaryOptionsMarketLaunchResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// the ticker for the derivative contract
  final String? ticker;

  /// the oracle symbol
  final String? oracleSymbol;

  /// the oracle provider
  final String? oracleProvider;

  /// Oracle type
  final injective_oracle_v1beta1_oracle.OracleType? oracleType;

  /// Scale factor for oracle prices.
  final int? oracleScaleFactor;

  /// maker_fee_rate defines the trade fee rate for makers on the perpetual
  /// market
  final String? makerFeeRate;

  /// taker_fee_rate defines the trade fee rate for takers on the perpetual
  /// market
  final String? takerFeeRate;

  /// expiration timestamp
  final BigInt? expirationTimestamp;

  /// expiration timestamp
  final BigInt? settlementTimestamp;

  /// admin of the market
  final String? admin;

  /// Address of the quote currency denomination for the binary options contract
  final String? quoteDenom;

  /// min_price_tick_size defines the minimum tick size that the price and margin
  /// required for orders in the market
  final String? minPriceTickSize;

  /// min_quantity_tick_size defines the minimum tick size of the quantity
  /// required for orders in the market
  final String? minQuantityTickSize;

  /// min_notional defines the minimum notional (in quote asset) required for
  /// orders in the market
  final String? minNotional;

  const MsgInstantBinaryOptionsMarketLaunch({
    this.sender,
    this.ticker,
    this.oracleSymbol,
    this.oracleProvider,
    this.oracleType,
    this.oracleScaleFactor,
    this.makerFeeRate,
    this.takerFeeRate,
    this.expirationTimestamp,
    this.settlementTimestamp,
    this.admin,
    this.quoteDenom,
    this.minPriceTickSize,
    this.minQuantityTickSize,
    this.minNotional,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgInstantBinaryOptionsMarketLaunch",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.enumType(5),
        ProtoFieldConfig.uint32(6),
        ProtoFieldConfig.string(7, options: const []),
        ProtoFieldConfig.string(8, options: const []),
        ProtoFieldConfig.int64(9),
        ProtoFieldConfig.int64(10),
        ProtoFieldConfig.string(11),
        ProtoFieldConfig.string(12),
        ProtoFieldConfig.string(13, options: const []),
        ProtoFieldConfig.string(14, options: const []),
        ProtoFieldConfig.string(15, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    ticker,
    oracleSymbol,
    oracleProvider,
    oracleType,
    oracleScaleFactor,
    makerFeeRate,
    takerFeeRate,
    expirationTimestamp,
    settlementTimestamp,
    admin,
    quoteDenom,
    minPriceTickSize,
    minQuantityTickSize,
    minNotional,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'ticker': ticker,
      'oracle_symbol': oracleSymbol,
      'oracle_provider': oracleProvider,
      'oracle_type': oracleType?.protoName,
      'oracle_scale_factor': oracleScaleFactor,
      'maker_fee_rate': makerFeeRate,
      'taker_fee_rate': takerFeeRate,
      'expiration_timestamp': expirationTimestamp?.toString(),
      'settlement_timestamp': settlementTimestamp?.toString(),
      'admin': admin,
      'quote_denom': quoteDenom,
      'min_price_tick_size': minPriceTickSize,
      'min_quantity_tick_size': minQuantityTickSize,
      'min_notional': minNotional,
    };
  }

  factory MsgInstantBinaryOptionsMarketLaunch.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgInstantBinaryOptionsMarketLaunch(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
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
      makerFeeRate: json.valueAsString<String?>(
        'maker_fee_rate',
        acceptCamelCase: true,
      ),
      takerFeeRate: json.valueAsString<String?>(
        'taker_fee_rate',
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
    );
  }

  factory MsgInstantBinaryOptionsMarketLaunch.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgInstantBinaryOptionsMarketLaunch(
      sender: decode.getString<String?>(1),
      ticker: decode.getString<String?>(2),
      oracleSymbol: decode.getString<String?>(3),
      oracleProvider: decode.getString<String?>(4),
      oracleType: decode.getEnum<injective_oracle_v1beta1_oracle.OracleType?>(
        5,
        injective_oracle_v1beta1_oracle.OracleType.values,
      ),
      oracleScaleFactor: decode.getInt<int?>(6),
      makerFeeRate: decode.getString<String?>(7),
      takerFeeRate: decode.getString<String?>(8),
      expirationTimestamp: decode.getBigInt<BigInt?>(9),
      settlementTimestamp: decode.getBigInt<BigInt?>(10),
      admin: decode.getString<String?>(11),
      quoteDenom: decode.getString<String?>(12),
      minPriceTickSize: decode.getString<String?>(13),
      minQuantityTickSize: decode.getString<String?>(14),
      minNotional: decode.getString<String?>(15),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgInstantBinaryOptionsMarketLaunch;
  @override
  MsgInstantBinaryOptionsMarketLaunchResponse onServiceResponse(
    List<int> bytes,
  ) {
    return MsgInstantBinaryOptionsMarketLaunchResponse.deserialize(bytes);
  }

  @override
  MsgInstantBinaryOptionsMarketLaunchResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgInstantBinaryOptionsMarketLaunchResponse.fromJson(json);
  }
}

/// MsgInstantBinaryOptionsMarketLaunchResponse defines the
/// Msg/InstantBinaryOptionsMarketLaunchResponse response type.
class MsgInstantBinaryOptionsMarketLaunchResponse extends CosmosProtoMessage {
  const MsgInstantBinaryOptionsMarketLaunchResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgInstantBinaryOptionsMarketLaunchResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgInstantBinaryOptionsMarketLaunchResponse();
  }

  factory MsgInstantBinaryOptionsMarketLaunchResponse.deserialize(
    List<int> bytes,
  ) {
    return MsgInstantBinaryOptionsMarketLaunchResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgInstantBinaryOptionsMarketLaunchResponse;
}

/// MsgCreateSpotMarketOrder defines a SDK message for creating a new spot market
/// order.
class MsgCreateSpotMarketOrder extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreateSpotMarketOrderResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final injective_exchange_v1beta1_exchange.SpotOrder? order;

  const MsgCreateSpotMarketOrder({this.sender, this.order});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgCreateSpotMarketOrder",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, order];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'order': order?.toJson()};
  }

  factory MsgCreateSpotMarketOrder.fromJson(Map<String, dynamic> json) {
    return MsgCreateSpotMarketOrder(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      order: json.valueTo<
        injective_exchange_v1beta1_exchange.SpotOrder?,
        Map<String, dynamic>
      >(
        key: 'order',
        parse: (v) => injective_exchange_v1beta1_exchange.SpotOrder.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCreateSpotMarketOrder.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateSpotMarketOrder(
      sender: decode.getString<String?>(1),
      order: decode.messageTo<injective_exchange_v1beta1_exchange.SpotOrder?>(
        2,
        (b) => injective_exchange_v1beta1_exchange.SpotOrder.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgCreateSpotMarketOrder;
  @override
  MsgCreateSpotMarketOrderResponse onServiceResponse(List<int> bytes) {
    return MsgCreateSpotMarketOrderResponse.deserialize(bytes);
  }

  @override
  MsgCreateSpotMarketOrderResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateSpotMarketOrderResponse.fromJson(json);
  }
}

/// MsgCreateSpotMarketOrderResponse defines the Msg/CreateSpotMarketLimitOrder
/// response type.
class MsgCreateSpotMarketOrderResponse extends CosmosProtoMessage {
  final String? orderHash;

  final SpotMarketOrderResults? results;

  final String? cid;

  const MsgCreateSpotMarketOrderResponse({
    this.orderHash,
    this.results,
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
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [orderHash, results, cid];

  @override
  Map<String, dynamic> toJson() {
    return {'order_hash': orderHash, 'results': results?.toJson(), 'cid': cid};
  }

  factory MsgCreateSpotMarketOrderResponse.fromJson(Map<String, dynamic> json) {
    return MsgCreateSpotMarketOrderResponse(
      orderHash: json.valueAsString<String?>(
        'order_hash',
        acceptCamelCase: true,
      ),
      results: json.valueTo<SpotMarketOrderResults?, Map<String, dynamic>>(
        key: 'results',
        parse: (v) => SpotMarketOrderResults.fromJson(v),
        acceptCamelCase: true,
      ),
      cid: json.valueAsString<String?>('cid', acceptCamelCase: true),
    );
  }

  factory MsgCreateSpotMarketOrderResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateSpotMarketOrderResponse(
      orderHash: decode.getString<String?>(1),
      results: decode.messageTo<SpotMarketOrderResults?>(
        2,
        (b) => SpotMarketOrderResults.deserialize(b),
      ),
      cid: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgCreateSpotMarketOrderResponse;
}

class SpotMarketOrderResults extends CosmosProtoMessage {
  final String? quantity;

  final String? price;

  final String? fee;

  const SpotMarketOrderResults({this.quantity, this.price, this.fee});

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
  List<Object?> get protoValues => [quantity, price, fee];

  @override
  Map<String, dynamic> toJson() {
    return {'quantity': quantity, 'price': price, 'fee': fee};
  }

  factory SpotMarketOrderResults.fromJson(Map<String, dynamic> json) {
    return SpotMarketOrderResults(
      quantity: json.valueAsString<String?>('quantity', acceptCamelCase: true),
      price: json.valueAsString<String?>('price', acceptCamelCase: true),
      fee: json.valueAsString<String?>('fee', acceptCamelCase: true),
    );
  }

  factory SpotMarketOrderResults.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SpotMarketOrderResults(
      quantity: decode.getString<String?>(1),
      price: decode.getString<String?>(2),
      fee: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1SpotMarketOrderResults;
}

/// A Cosmos-SDK MsgCreateDerivativeLimitOrder
class MsgCreateDerivativeLimitOrder extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreateDerivativeLimitOrderResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final injective_exchange_v1beta1_exchange.DerivativeOrder? order;

  const MsgCreateDerivativeLimitOrder({this.sender, this.order});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgCreateDerivativeLimitOrder",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, order];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'order': order?.toJson()};
  }

  factory MsgCreateDerivativeLimitOrder.fromJson(Map<String, dynamic> json) {
    return MsgCreateDerivativeLimitOrder(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      order: json.valueTo<
        injective_exchange_v1beta1_exchange.DerivativeOrder?,
        Map<String, dynamic>
      >(
        key: 'order',
        parse:
            (v) =>
                injective_exchange_v1beta1_exchange.DerivativeOrder.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCreateDerivativeLimitOrder.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateDerivativeLimitOrder(
      sender: decode.getString<String?>(1),
      order: decode
          .messageTo<injective_exchange_v1beta1_exchange.DerivativeOrder?>(
            2,
            (b) => injective_exchange_v1beta1_exchange
                .DerivativeOrder.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgCreateDerivativeLimitOrder;
  @override
  MsgCreateDerivativeLimitOrderResponse onServiceResponse(List<int> bytes) {
    return MsgCreateDerivativeLimitOrderResponse.deserialize(bytes);
  }

  @override
  MsgCreateDerivativeLimitOrderResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateDerivativeLimitOrderResponse.fromJson(json);
  }
}

/// MsgCreateDerivativeLimitOrderResponse defines the
/// Msg/CreateDerivativeMarketOrder response type.
class MsgCreateDerivativeLimitOrderResponse extends CosmosProtoMessage {
  final String? orderHash;

  final String? cid;

  const MsgCreateDerivativeLimitOrderResponse({this.orderHash, this.cid});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [orderHash, cid];

  @override
  Map<String, dynamic> toJson() {
    return {'order_hash': orderHash, 'cid': cid};
  }

  factory MsgCreateDerivativeLimitOrderResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateDerivativeLimitOrderResponse(
      orderHash: json.valueAsString<String?>(
        'order_hash',
        acceptCamelCase: true,
      ),
      cid: json.valueAsString<String?>('cid', acceptCamelCase: true),
    );
  }

  factory MsgCreateDerivativeLimitOrderResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateDerivativeLimitOrderResponse(
      orderHash: decode.getString<String?>(1),
      cid: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgCreateDerivativeLimitOrderResponse;
}

/// A Cosmos-SDK MsgCreateBinaryOptionsLimitOrder
class MsgCreateBinaryOptionsLimitOrder extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreateBinaryOptionsLimitOrderResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final injective_exchange_v1beta1_exchange.DerivativeOrder? order;

  const MsgCreateBinaryOptionsLimitOrder({this.sender, this.order});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgCreateBinaryOptionsLimitOrder",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, order];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'order': order?.toJson()};
  }

  factory MsgCreateBinaryOptionsLimitOrder.fromJson(Map<String, dynamic> json) {
    return MsgCreateBinaryOptionsLimitOrder(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      order: json.valueTo<
        injective_exchange_v1beta1_exchange.DerivativeOrder?,
        Map<String, dynamic>
      >(
        key: 'order',
        parse:
            (v) =>
                injective_exchange_v1beta1_exchange.DerivativeOrder.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCreateBinaryOptionsLimitOrder.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateBinaryOptionsLimitOrder(
      sender: decode.getString<String?>(1),
      order: decode
          .messageTo<injective_exchange_v1beta1_exchange.DerivativeOrder?>(
            2,
            (b) => injective_exchange_v1beta1_exchange
                .DerivativeOrder.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgCreateBinaryOptionsLimitOrder;
  @override
  MsgCreateBinaryOptionsLimitOrderResponse onServiceResponse(List<int> bytes) {
    return MsgCreateBinaryOptionsLimitOrderResponse.deserialize(bytes);
  }

  @override
  MsgCreateBinaryOptionsLimitOrderResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateBinaryOptionsLimitOrderResponse.fromJson(json);
  }
}

/// MsgCreateBinaryOptionsLimitOrderResponse defines the
/// Msg/CreateBinaryOptionsLimitOrder response type.
class MsgCreateBinaryOptionsLimitOrderResponse extends CosmosProtoMessage {
  final String? orderHash;

  final String? cid;

  const MsgCreateBinaryOptionsLimitOrderResponse({this.orderHash, this.cid});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [orderHash, cid];

  @override
  Map<String, dynamic> toJson() {
    return {'order_hash': orderHash, 'cid': cid};
  }

  factory MsgCreateBinaryOptionsLimitOrderResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateBinaryOptionsLimitOrderResponse(
      orderHash: json.valueAsString<String?>(
        'order_hash',
        acceptCamelCase: true,
      ),
      cid: json.valueAsString<String?>('cid', acceptCamelCase: true),
    );
  }

  factory MsgCreateBinaryOptionsLimitOrderResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateBinaryOptionsLimitOrderResponse(
      orderHash: decode.getString<String?>(1),
      cid: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgCreateBinaryOptionsLimitOrderResponse;
}

/// A Cosmos-SDK MsgBatchCreateDerivativeLimitOrders
class MsgBatchCreateDerivativeLimitOrders extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgBatchCreateDerivativeLimitOrdersResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final List<injective_exchange_v1beta1_exchange.DerivativeOrder> orders;

  const MsgBatchCreateDerivativeLimitOrders({
    this.sender,
    this.orders = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgBatchCreateDerivativeLimitOrders",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
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
  List<Object?> get protoValues => [sender, orders];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'orders': orders.map((e) => e.toJson()).toList()};
  }

  factory MsgBatchCreateDerivativeLimitOrders.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgBatchCreateDerivativeLimitOrders(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      orders:
          (json.valueEnsureAsList<dynamic>('orders', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v1beta1_exchange.DerivativeOrder,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_exchange
                          .DerivativeOrder.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory MsgBatchCreateDerivativeLimitOrders.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBatchCreateDerivativeLimitOrders(
      sender: decode.getString<String?>(1),
      orders:
          decode
              .getListOfBytes(2)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .DerivativeOrder.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgBatchCreateDerivativeLimitOrders;
  @override
  MsgBatchCreateDerivativeLimitOrdersResponse onServiceResponse(
    List<int> bytes,
  ) {
    return MsgBatchCreateDerivativeLimitOrdersResponse.deserialize(bytes);
  }

  @override
  MsgBatchCreateDerivativeLimitOrdersResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgBatchCreateDerivativeLimitOrdersResponse.fromJson(json);
  }
}

/// MsgBatchCreateDerivativeLimitOrdersResponse defines the
/// Msg/BatchCreateDerivativeLimitOrders response type.
class MsgBatchCreateDerivativeLimitOrdersResponse extends CosmosProtoMessage {
  final List<String> orderHashes;

  final List<String> createdOrdersCids;

  final List<String> failedOrdersCids;

  const MsgBatchCreateDerivativeLimitOrdersResponse({
    this.orderHashes = const [],
    this.createdOrdersCids = const [],
    this.failedOrdersCids = const [],
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
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    orderHashes,
    createdOrdersCids,
    failedOrdersCids,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'order_hashes': orderHashes.map((e) => e).toList(),
      'created_orders_cids': createdOrdersCids.map((e) => e).toList(),
      'failed_orders_cids': failedOrdersCids.map((e) => e).toList(),
    };
  }

  factory MsgBatchCreateDerivativeLimitOrdersResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgBatchCreateDerivativeLimitOrdersResponse(
      orderHashes:
          (json.valueEnsureAsList<dynamic>(
            'order_hashes',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      createdOrdersCids:
          (json.valueEnsureAsList<dynamic>(
            'created_orders_cids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      failedOrdersCids:
          (json.valueEnsureAsList<dynamic>(
            'failed_orders_cids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory MsgBatchCreateDerivativeLimitOrdersResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBatchCreateDerivativeLimitOrdersResponse(
      orderHashes: decode.getListOrEmpty<String>(1),
      createdOrdersCids: decode.getListOrEmpty<String>(2),
      failedOrdersCids: decode.getListOrEmpty<String>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgBatchCreateDerivativeLimitOrdersResponse;
}

/// MsgCancelSpotOrder defines the Msg/CancelSpotOrder response type.
class MsgCancelSpotOrder extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCancelSpotOrderResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final String? marketId;

  final String? subaccountId;

  final String? orderHash;

  final String? cid;

  const MsgCancelSpotOrder({
    this.sender,
    this.marketId,
    this.subaccountId,
    this.orderHash,
    this.cid,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgCancelSpotOrder",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    marketId,
    subaccountId,
    orderHash,
    cid,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'market_id': marketId,
      'subaccount_id': subaccountId,
      'order_hash': orderHash,
      'cid': cid,
    };
  }

  factory MsgCancelSpotOrder.fromJson(Map<String, dynamic> json) {
    return MsgCancelSpotOrder(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      orderHash: json.valueAsString<String?>(
        'order_hash',
        acceptCamelCase: true,
      ),
      cid: json.valueAsString<String?>('cid', acceptCamelCase: true),
    );
  }

  factory MsgCancelSpotOrder.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCancelSpotOrder(
      sender: decode.getString<String?>(1),
      marketId: decode.getString<String?>(2),
      subaccountId: decode.getString<String?>(3),
      orderHash: decode.getString<String?>(4),
      cid: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1MsgCancelSpotOrder;
  @override
  MsgCancelSpotOrderResponse onServiceResponse(List<int> bytes) {
    return MsgCancelSpotOrderResponse.deserialize(bytes);
  }

  @override
  MsgCancelSpotOrderResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgCancelSpotOrderResponse.fromJson(json);
  }
}

/// MsgCancelSpotOrderResponse defines the Msg/CancelSpotOrder response type.
class MsgCancelSpotOrderResponse extends CosmosProtoMessage {
  const MsgCancelSpotOrderResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgCancelSpotOrderResponse.fromJson(Map<String, dynamic> json) {
    return MsgCancelSpotOrderResponse();
  }

  factory MsgCancelSpotOrderResponse.deserialize(List<int> bytes) {
    return MsgCancelSpotOrderResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgCancelSpotOrderResponse;
}

/// MsgBatchCancelSpotOrders defines the Msg/BatchCancelSpotOrders response type.
class MsgBatchCancelSpotOrders extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgBatchCancelSpotOrdersResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final List<OrderData> data;

  const MsgBatchCancelSpotOrders({this.sender, this.data = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgBatchCancelSpotOrders",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
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
  List<Object?> get protoValues => [sender, data];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'data': data.map((e) => e.toJson()).toList()};
  }

  factory MsgBatchCancelSpotOrders.fromJson(Map<String, dynamic> json) {
    return MsgBatchCancelSpotOrders(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      data:
          (json.valueEnsureAsList<dynamic>('data', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<OrderData, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => OrderData.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory MsgBatchCancelSpotOrders.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBatchCancelSpotOrders(
      sender: decode.getString<String?>(1),
      data:
          decode
              .getListOfBytes(2)
              .map((b) => OrderData.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgBatchCancelSpotOrders;
  @override
  MsgBatchCancelSpotOrdersResponse onServiceResponse(List<int> bytes) {
    return MsgBatchCancelSpotOrdersResponse.deserialize(bytes);
  }

  @override
  MsgBatchCancelSpotOrdersResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgBatchCancelSpotOrdersResponse.fromJson(json);
  }
}

/// MsgBatchCancelSpotOrdersResponse defines the Msg/BatchCancelSpotOrders
/// response type.
class MsgBatchCancelSpotOrdersResponse extends CosmosProtoMessage {
  final List<bool> success;

  const MsgBatchCancelSpotOrdersResponse({this.success = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.bool,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [success];

  @override
  Map<String, dynamic> toJson() {
    return {'success': success.map((e) => e).toList()};
  }

  factory MsgBatchCancelSpotOrdersResponse.fromJson(Map<String, dynamic> json) {
    return MsgBatchCancelSpotOrdersResponse(
      success:
          (json.valueEnsureAsList<dynamic>(
            'success',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBool<bool>(e)).toList(),
    );
  }

  factory MsgBatchCancelSpotOrdersResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBatchCancelSpotOrdersResponse(
      success: decode.getListOrEmpty<bool>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgBatchCancelSpotOrdersResponse;
}

/// MsgBatchCancelBinaryOptionsOrders defines the
/// Msg/BatchCancelBinaryOptionsOrders response type.
class MsgBatchCancelBinaryOptionsOrders extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgBatchCancelBinaryOptionsOrdersResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final List<OrderData> data;

  const MsgBatchCancelBinaryOptionsOrders({this.sender, this.data = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgBatchCancelBinaryOptionsOrders",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
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
  List<Object?> get protoValues => [sender, data];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'data': data.map((e) => e.toJson()).toList()};
  }

  factory MsgBatchCancelBinaryOptionsOrders.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgBatchCancelBinaryOptionsOrders(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      data:
          (json.valueEnsureAsList<dynamic>('data', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<OrderData, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => OrderData.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory MsgBatchCancelBinaryOptionsOrders.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBatchCancelBinaryOptionsOrders(
      sender: decode.getString<String?>(1),
      data:
          decode
              .getListOfBytes(2)
              .map((b) => OrderData.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgBatchCancelBinaryOptionsOrders;
  @override
  MsgBatchCancelBinaryOptionsOrdersResponse onServiceResponse(List<int> bytes) {
    return MsgBatchCancelBinaryOptionsOrdersResponse.deserialize(bytes);
  }

  @override
  MsgBatchCancelBinaryOptionsOrdersResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgBatchCancelBinaryOptionsOrdersResponse.fromJson(json);
  }
}

/// BatchCancelBinaryOptionsOrdersResponse defines the
/// Msg/BatchCancelBinaryOptionsOrders response type.
class MsgBatchCancelBinaryOptionsOrdersResponse extends CosmosProtoMessage {
  final List<bool> success;

  const MsgBatchCancelBinaryOptionsOrdersResponse({this.success = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.bool,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [success];

  @override
  Map<String, dynamic> toJson() {
    return {'success': success.map((e) => e).toList()};
  }

  factory MsgBatchCancelBinaryOptionsOrdersResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgBatchCancelBinaryOptionsOrdersResponse(
      success:
          (json.valueEnsureAsList<dynamic>(
            'success',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBool<bool>(e)).toList(),
    );
  }

  factory MsgBatchCancelBinaryOptionsOrdersResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBatchCancelBinaryOptionsOrdersResponse(
      success: decode.getListOrEmpty<bool>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgBatchCancelBinaryOptionsOrdersResponse;
}

/// MsgBatchUpdateOrders defines the Msg/BatchUpdateOrders response type.
class MsgBatchUpdateOrders extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgBatchUpdateOrdersResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// the subaccount ID only used for the spot_market_ids_to_cancel_all and
  /// derivative_market_ids_to_cancel_all
  final String? subaccountId;

  /// the spot market IDs to cancel all
  final List<String> spotMarketIdsToCancelAll;

  /// the derivative market IDs to cancel all
  final List<String> derivativeMarketIdsToCancelAll;

  /// the spot orders to cancel
  final List<OrderData> spotOrdersToCancel;

  /// the derivative orders to cancel
  final List<OrderData> derivativeOrdersToCancel;

  /// the spot orders to create
  final List<injective_exchange_v1beta1_exchange.SpotOrder> spotOrdersToCreate;

  /// the derivative orders to create
  final List<injective_exchange_v1beta1_exchange.DerivativeOrder>
  derivativeOrdersToCreate;

  /// the binary options orders to cancel
  final List<OrderData> binaryOptionsOrdersToCancel;

  /// the binary options market IDs to cancel all
  final List<String> binaryOptionsMarketIdsToCancelAll;

  /// the binary options orders to create
  final List<injective_exchange_v1beta1_exchange.DerivativeOrder>
  binaryOptionsOrdersToCreate;

  const MsgBatchUpdateOrders({
    this.sender,
    this.subaccountId,
    this.spotMarketIdsToCancelAll = const [],
    this.derivativeMarketIdsToCancelAll = const [],
    this.spotOrdersToCancel = const [],
    this.derivativeOrdersToCancel = const [],
    this.spotOrdersToCreate = const [],
    this.derivativeOrdersToCreate = const [],
    this.binaryOptionsOrdersToCancel = const [],
    this.binaryOptionsMarketIdsToCancelAll = const [],
    this.binaryOptionsOrdersToCreate = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgBatchUpdateOrders",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.string,
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
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 11,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    subaccountId,
    spotMarketIdsToCancelAll,
    derivativeMarketIdsToCancelAll,
    spotOrdersToCancel,
    derivativeOrdersToCancel,
    spotOrdersToCreate,
    derivativeOrdersToCreate,
    binaryOptionsOrdersToCancel,
    binaryOptionsMarketIdsToCancelAll,
    binaryOptionsOrdersToCreate,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'subaccount_id': subaccountId,
      'spot_market_ids_to_cancel_all':
          spotMarketIdsToCancelAll.map((e) => e).toList(),
      'derivative_market_ids_to_cancel_all':
          derivativeMarketIdsToCancelAll.map((e) => e).toList(),
      'spot_orders_to_cancel':
          spotOrdersToCancel.map((e) => e.toJson()).toList(),
      'derivative_orders_to_cancel':
          derivativeOrdersToCancel.map((e) => e.toJson()).toList(),
      'spot_orders_to_create':
          spotOrdersToCreate.map((e) => e.toJson()).toList(),
      'derivative_orders_to_create':
          derivativeOrdersToCreate.map((e) => e.toJson()).toList(),
      'binary_options_orders_to_cancel':
          binaryOptionsOrdersToCancel.map((e) => e.toJson()).toList(),
      'binary_options_market_ids_to_cancel_all':
          binaryOptionsMarketIdsToCancelAll.map((e) => e).toList(),
      'binary_options_orders_to_create':
          binaryOptionsOrdersToCreate.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgBatchUpdateOrders.fromJson(Map<String, dynamic> json) {
    return MsgBatchUpdateOrders(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      spotMarketIdsToCancelAll:
          (json.valueEnsureAsList<dynamic>(
            'spot_market_ids_to_cancel_all',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      derivativeMarketIdsToCancelAll:
          (json.valueEnsureAsList<dynamic>(
            'derivative_market_ids_to_cancel_all',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      spotOrdersToCancel:
          (json.valueEnsureAsList<dynamic>(
                'spot_orders_to_cancel',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<OrderData, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => OrderData.fromJson(v),
                ),
              )
              .toList(),
      derivativeOrdersToCancel:
          (json.valueEnsureAsList<dynamic>(
                'derivative_orders_to_cancel',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<OrderData, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => OrderData.fromJson(v),
                ),
              )
              .toList(),
      spotOrdersToCreate:
          (json.valueEnsureAsList<dynamic>(
                'spot_orders_to_create',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v1beta1_exchange.SpotOrder,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_exchange
                          .SpotOrder.fromJson(v),
                ),
              )
              .toList(),
      derivativeOrdersToCreate:
          (json.valueEnsureAsList<dynamic>(
                'derivative_orders_to_create',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v1beta1_exchange.DerivativeOrder,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_exchange
                          .DerivativeOrder.fromJson(v),
                ),
              )
              .toList(),
      binaryOptionsOrdersToCancel:
          (json.valueEnsureAsList<dynamic>(
                'binary_options_orders_to_cancel',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<OrderData, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => OrderData.fromJson(v),
                ),
              )
              .toList(),
      binaryOptionsMarketIdsToCancelAll:
          (json.valueEnsureAsList<dynamic>(
            'binary_options_market_ids_to_cancel_all',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      binaryOptionsOrdersToCreate:
          (json.valueEnsureAsList<dynamic>(
                'binary_options_orders_to_create',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v1beta1_exchange.DerivativeOrder,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_exchange
                          .DerivativeOrder.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory MsgBatchUpdateOrders.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBatchUpdateOrders(
      sender: decode.getString<String?>(1),
      subaccountId: decode.getString<String?>(2),
      spotMarketIdsToCancelAll: decode.getListOrEmpty<String>(3),
      derivativeMarketIdsToCancelAll: decode.getListOrEmpty<String>(4),
      spotOrdersToCancel:
          decode
              .getListOfBytes(5)
              .map((b) => OrderData.deserialize(b))
              .toList(),
      derivativeOrdersToCancel:
          decode
              .getListOfBytes(6)
              .map((b) => OrderData.deserialize(b))
              .toList(),
      spotOrdersToCreate:
          decode
              .getListOfBytes(7)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .SpotOrder.deserialize(b),
              )
              .toList(),
      derivativeOrdersToCreate:
          decode
              .getListOfBytes(8)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .DerivativeOrder.deserialize(b),
              )
              .toList(),
      binaryOptionsOrdersToCancel:
          decode
              .getListOfBytes(9)
              .map((b) => OrderData.deserialize(b))
              .toList(),
      binaryOptionsMarketIdsToCancelAll: decode.getListOrEmpty<String>(10),
      binaryOptionsOrdersToCreate:
          decode
              .getListOfBytes(11)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .DerivativeOrder.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1MsgBatchUpdateOrders;
  @override
  MsgBatchUpdateOrdersResponse onServiceResponse(List<int> bytes) {
    return MsgBatchUpdateOrdersResponse.deserialize(bytes);
  }

  @override
  MsgBatchUpdateOrdersResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgBatchUpdateOrdersResponse.fromJson(json);
  }
}

/// MsgBatchUpdateOrdersResponse defines the Msg/BatchUpdateOrders response type.
class MsgBatchUpdateOrdersResponse extends CosmosProtoMessage {
  final List<bool> spotCancelSuccess;

  final List<bool> derivativeCancelSuccess;

  final List<String> spotOrderHashes;

  final List<String> derivativeOrderHashes;

  final List<bool> binaryOptionsCancelSuccess;

  final List<String> binaryOptionsOrderHashes;

  final List<String> createdSpotOrdersCids;

  final List<String> failedSpotOrdersCids;

  final List<String> createdDerivativeOrdersCids;

  final List<String> failedDerivativeOrdersCids;

  final List<String> createdBinaryOptionsOrdersCids;

  final List<String> failedBinaryOptionsOrdersCids;

  const MsgBatchUpdateOrdersResponse({
    this.spotCancelSuccess = const [],
    this.derivativeCancelSuccess = const [],
    this.spotOrderHashes = const [],
    this.derivativeOrderHashes = const [],
    this.binaryOptionsCancelSuccess = const [],
    this.binaryOptionsOrderHashes = const [],
    this.createdSpotOrdersCids = const [],
    this.failedSpotOrdersCids = const [],
    this.createdDerivativeOrdersCids = const [],
    this.failedDerivativeOrdersCids = const [],
    this.createdBinaryOptionsOrdersCids = const [],
    this.failedBinaryOptionsOrdersCids = const [],
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
          elementType: ProtoFieldType.bool,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.bool,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.bool,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 7,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 8,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 9,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 10,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 11,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 12,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    spotCancelSuccess,
    derivativeCancelSuccess,
    spotOrderHashes,
    derivativeOrderHashes,
    binaryOptionsCancelSuccess,
    binaryOptionsOrderHashes,
    createdSpotOrdersCids,
    failedSpotOrdersCids,
    createdDerivativeOrdersCids,
    failedDerivativeOrdersCids,
    createdBinaryOptionsOrdersCids,
    failedBinaryOptionsOrdersCids,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'spot_cancel_success': spotCancelSuccess.map((e) => e).toList(),
      'derivative_cancel_success':
          derivativeCancelSuccess.map((e) => e).toList(),
      'spot_order_hashes': spotOrderHashes.map((e) => e).toList(),
      'derivative_order_hashes': derivativeOrderHashes.map((e) => e).toList(),
      'binary_options_cancel_success':
          binaryOptionsCancelSuccess.map((e) => e).toList(),
      'binary_options_order_hashes':
          binaryOptionsOrderHashes.map((e) => e).toList(),
      'created_spot_orders_cids': createdSpotOrdersCids.map((e) => e).toList(),
      'failed_spot_orders_cids': failedSpotOrdersCids.map((e) => e).toList(),
      'created_derivative_orders_cids':
          createdDerivativeOrdersCids.map((e) => e).toList(),
      'failed_derivative_orders_cids':
          failedDerivativeOrdersCids.map((e) => e).toList(),
      'created_binary_options_orders_cids':
          createdBinaryOptionsOrdersCids.map((e) => e).toList(),
      'failed_binary_options_orders_cids':
          failedBinaryOptionsOrdersCids.map((e) => e).toList(),
    };
  }

  factory MsgBatchUpdateOrdersResponse.fromJson(Map<String, dynamic> json) {
    return MsgBatchUpdateOrdersResponse(
      spotCancelSuccess:
          (json.valueEnsureAsList<dynamic>(
            'spot_cancel_success',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBool<bool>(e)).toList(),
      derivativeCancelSuccess:
          (json.valueEnsureAsList<dynamic>(
            'derivative_cancel_success',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBool<bool>(e)).toList(),
      spotOrderHashes:
          (json.valueEnsureAsList<dynamic>(
            'spot_order_hashes',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      derivativeOrderHashes:
          (json.valueEnsureAsList<dynamic>(
            'derivative_order_hashes',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      binaryOptionsCancelSuccess:
          (json.valueEnsureAsList<dynamic>(
            'binary_options_cancel_success',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBool<bool>(e)).toList(),
      binaryOptionsOrderHashes:
          (json.valueEnsureAsList<dynamic>(
            'binary_options_order_hashes',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      createdSpotOrdersCids:
          (json.valueEnsureAsList<dynamic>(
            'created_spot_orders_cids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      failedSpotOrdersCids:
          (json.valueEnsureAsList<dynamic>(
            'failed_spot_orders_cids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      createdDerivativeOrdersCids:
          (json.valueEnsureAsList<dynamic>(
            'created_derivative_orders_cids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      failedDerivativeOrdersCids:
          (json.valueEnsureAsList<dynamic>(
            'failed_derivative_orders_cids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      createdBinaryOptionsOrdersCids:
          (json.valueEnsureAsList<dynamic>(
            'created_binary_options_orders_cids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      failedBinaryOptionsOrdersCids:
          (json.valueEnsureAsList<dynamic>(
            'failed_binary_options_orders_cids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory MsgBatchUpdateOrdersResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBatchUpdateOrdersResponse(
      spotCancelSuccess: decode.getListOrEmpty<bool>(1),
      derivativeCancelSuccess: decode.getListOrEmpty<bool>(2),
      spotOrderHashes: decode.getListOrEmpty<String>(3),
      derivativeOrderHashes: decode.getListOrEmpty<String>(4),
      binaryOptionsCancelSuccess: decode.getListOrEmpty<bool>(5),
      binaryOptionsOrderHashes: decode.getListOrEmpty<String>(6),
      createdSpotOrdersCids: decode.getListOrEmpty<String>(7),
      failedSpotOrdersCids: decode.getListOrEmpty<String>(8),
      createdDerivativeOrdersCids: decode.getListOrEmpty<String>(9),
      failedDerivativeOrdersCids: decode.getListOrEmpty<String>(10),
      createdBinaryOptionsOrdersCids: decode.getListOrEmpty<String>(11),
      failedBinaryOptionsOrdersCids: decode.getListOrEmpty<String>(12),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgBatchUpdateOrdersResponse;
}

/// A Cosmos-SDK MsgCreateDerivativeMarketOrder
class MsgCreateDerivativeMarketOrder extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreateDerivativeMarketOrderResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final injective_exchange_v1beta1_exchange.DerivativeOrder? order;

  const MsgCreateDerivativeMarketOrder({this.sender, this.order});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgCreateDerivativeMarketOrder",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, order];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'order': order?.toJson()};
  }

  factory MsgCreateDerivativeMarketOrder.fromJson(Map<String, dynamic> json) {
    return MsgCreateDerivativeMarketOrder(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      order: json.valueTo<
        injective_exchange_v1beta1_exchange.DerivativeOrder?,
        Map<String, dynamic>
      >(
        key: 'order',
        parse:
            (v) =>
                injective_exchange_v1beta1_exchange.DerivativeOrder.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCreateDerivativeMarketOrder.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateDerivativeMarketOrder(
      sender: decode.getString<String?>(1),
      order: decode
          .messageTo<injective_exchange_v1beta1_exchange.DerivativeOrder?>(
            2,
            (b) => injective_exchange_v1beta1_exchange
                .DerivativeOrder.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgCreateDerivativeMarketOrder;
  @override
  MsgCreateDerivativeMarketOrderResponse onServiceResponse(List<int> bytes) {
    return MsgCreateDerivativeMarketOrderResponse.deserialize(bytes);
  }

  @override
  MsgCreateDerivativeMarketOrderResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateDerivativeMarketOrderResponse.fromJson(json);
  }
}

/// MsgCreateDerivativeMarketOrderResponse defines the
/// Msg/CreateDerivativeMarketOrder response type.
class MsgCreateDerivativeMarketOrderResponse extends CosmosProtoMessage {
  final String? orderHash;

  final DerivativeMarketOrderResults? results;

  final String? cid;

  const MsgCreateDerivativeMarketOrderResponse({
    this.orderHash,
    this.results,
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
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [orderHash, results, cid];

  @override
  Map<String, dynamic> toJson() {
    return {'order_hash': orderHash, 'results': results?.toJson(), 'cid': cid};
  }

  factory MsgCreateDerivativeMarketOrderResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateDerivativeMarketOrderResponse(
      orderHash: json.valueAsString<String?>(
        'order_hash',
        acceptCamelCase: true,
      ),
      results: json
          .valueTo<DerivativeMarketOrderResults?, Map<String, dynamic>>(
            key: 'results',
            parse: (v) => DerivativeMarketOrderResults.fromJson(v),
            acceptCamelCase: true,
          ),
      cid: json.valueAsString<String?>('cid', acceptCamelCase: true),
    );
  }

  factory MsgCreateDerivativeMarketOrderResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateDerivativeMarketOrderResponse(
      orderHash: decode.getString<String?>(1),
      results: decode.messageTo<DerivativeMarketOrderResults?>(
        2,
        (b) => DerivativeMarketOrderResults.deserialize(b),
      ),
      cid: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgCreateDerivativeMarketOrderResponse;
}

class DerivativeMarketOrderResults extends CosmosProtoMessage {
  final String? quantity;

  final String? price;

  final String? fee;

  final injective_exchange_v1beta1_exchange.PositionDelta? positionDelta;

  final String? payout;

  const DerivativeMarketOrderResults({
    this.quantity,
    this.price,
    this.fee,
    this.positionDelta,
    this.payout,
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
        ProtoFieldConfig.message(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    quantity,
    price,
    fee,
    positionDelta,
    payout,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'quantity': quantity,
      'price': price,
      'fee': fee,
      'position_delta': positionDelta?.toJson(),
      'payout': payout,
    };
  }

  factory DerivativeMarketOrderResults.fromJson(Map<String, dynamic> json) {
    return DerivativeMarketOrderResults(
      quantity: json.valueAsString<String?>('quantity', acceptCamelCase: true),
      price: json.valueAsString<String?>('price', acceptCamelCase: true),
      fee: json.valueAsString<String?>('fee', acceptCamelCase: true),
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
    );
  }

  factory DerivativeMarketOrderResults.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DerivativeMarketOrderResults(
      quantity: decode.getString<String?>(1),
      price: decode.getString<String?>(2),
      fee: decode.getString<String?>(3),
      positionDelta: decode.messageTo<
        injective_exchange_v1beta1_exchange.PositionDelta?
      >(
        4,
        (b) => injective_exchange_v1beta1_exchange.PositionDelta.deserialize(b),
      ),
      payout: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1DerivativeMarketOrderResults;
}

/// A Cosmos-SDK MsgCreateBinaryOptionsMarketOrder
class MsgCreateBinaryOptionsMarketOrder extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreateBinaryOptionsMarketOrderResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final injective_exchange_v1beta1_exchange.DerivativeOrder? order;

  const MsgCreateBinaryOptionsMarketOrder({this.sender, this.order});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgCreateBinaryOptionsMarketOrder",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, order];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'order': order?.toJson()};
  }

  factory MsgCreateBinaryOptionsMarketOrder.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateBinaryOptionsMarketOrder(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      order: json.valueTo<
        injective_exchange_v1beta1_exchange.DerivativeOrder?,
        Map<String, dynamic>
      >(
        key: 'order',
        parse:
            (v) =>
                injective_exchange_v1beta1_exchange.DerivativeOrder.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCreateBinaryOptionsMarketOrder.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateBinaryOptionsMarketOrder(
      sender: decode.getString<String?>(1),
      order: decode
          .messageTo<injective_exchange_v1beta1_exchange.DerivativeOrder?>(
            2,
            (b) => injective_exchange_v1beta1_exchange
                .DerivativeOrder.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgCreateBinaryOptionsMarketOrder;
  @override
  MsgCreateBinaryOptionsMarketOrderResponse onServiceResponse(List<int> bytes) {
    return MsgCreateBinaryOptionsMarketOrderResponse.deserialize(bytes);
  }

  @override
  MsgCreateBinaryOptionsMarketOrderResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateBinaryOptionsMarketOrderResponse.fromJson(json);
  }
}

/// MsgCreateBinaryOptionsMarketOrderResponse defines the
/// Msg/CreateBinaryOptionsMarketOrder response type.
class MsgCreateBinaryOptionsMarketOrderResponse extends CosmosProtoMessage {
  final String? orderHash;

  final DerivativeMarketOrderResults? results;

  final String? cid;

  const MsgCreateBinaryOptionsMarketOrderResponse({
    this.orderHash,
    this.results,
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
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [orderHash, results, cid];

  @override
  Map<String, dynamic> toJson() {
    return {'order_hash': orderHash, 'results': results?.toJson(), 'cid': cid};
  }

  factory MsgCreateBinaryOptionsMarketOrderResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateBinaryOptionsMarketOrderResponse(
      orderHash: json.valueAsString<String?>(
        'order_hash',
        acceptCamelCase: true,
      ),
      results: json
          .valueTo<DerivativeMarketOrderResults?, Map<String, dynamic>>(
            key: 'results',
            parse: (v) => DerivativeMarketOrderResults.fromJson(v),
            acceptCamelCase: true,
          ),
      cid: json.valueAsString<String?>('cid', acceptCamelCase: true),
    );
  }

  factory MsgCreateBinaryOptionsMarketOrderResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateBinaryOptionsMarketOrderResponse(
      orderHash: decode.getString<String?>(1),
      results: decode.messageTo<DerivativeMarketOrderResults?>(
        2,
        (b) => DerivativeMarketOrderResults.deserialize(b),
      ),
      cid: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgCreateBinaryOptionsMarketOrderResponse;
}

/// MsgCancelDerivativeOrder defines the Msg/CancelDerivativeOrder response type.
class MsgCancelDerivativeOrder extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCancelDerivativeOrderResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// the market ID
  final String? marketId;

  /// the subaccount ID
  final String? subaccountId;

  /// the order hash
  final String? orderHash;

  /// the order mask
  final int? orderMask;

  /// bitwise combination of OrderMask enum values
  /// the client order ID
  final String? cid;

  const MsgCancelDerivativeOrder({
    this.sender,
    this.marketId,
    this.subaccountId,
    this.orderHash,
    this.orderMask,
    this.cid,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgCancelDerivativeOrder",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.int32(5),
        ProtoFieldConfig.string(6),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    marketId,
    subaccountId,
    orderHash,
    orderMask,
    cid,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'market_id': marketId,
      'subaccount_id': subaccountId,
      'order_hash': orderHash,
      'order_mask': orderMask,
      'cid': cid,
    };
  }

  factory MsgCancelDerivativeOrder.fromJson(Map<String, dynamic> json) {
    return MsgCancelDerivativeOrder(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      orderHash: json.valueAsString<String?>(
        'order_hash',
        acceptCamelCase: true,
      ),
      orderMask: json.valueAsInt<int?>('order_mask', acceptCamelCase: true),
      cid: json.valueAsString<String?>('cid', acceptCamelCase: true),
    );
  }

  factory MsgCancelDerivativeOrder.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCancelDerivativeOrder(
      sender: decode.getString<String?>(1),
      marketId: decode.getString<String?>(2),
      subaccountId: decode.getString<String?>(3),
      orderHash: decode.getString<String?>(4),
      orderMask: decode.getInt<int?>(5),
      cid: decode.getString<String?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgCancelDerivativeOrder;
  @override
  MsgCancelDerivativeOrderResponse onServiceResponse(List<int> bytes) {
    return MsgCancelDerivativeOrderResponse.deserialize(bytes);
  }

  @override
  MsgCancelDerivativeOrderResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCancelDerivativeOrderResponse.fromJson(json);
  }
}

/// MsgCancelDerivativeOrderResponse defines the
/// Msg/CancelDerivativeOrderResponse response type.
class MsgCancelDerivativeOrderResponse extends CosmosProtoMessage {
  const MsgCancelDerivativeOrderResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgCancelDerivativeOrderResponse.fromJson(Map<String, dynamic> json) {
    return MsgCancelDerivativeOrderResponse();
  }

  factory MsgCancelDerivativeOrderResponse.deserialize(List<int> bytes) {
    return MsgCancelDerivativeOrderResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgCancelDerivativeOrderResponse;
}

/// MsgCancelBinaryOptionsOrder defines the Msg/CancelBinaryOptionsOrder response
/// type.
class MsgCancelBinaryOptionsOrder extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCancelBinaryOptionsOrderResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// the market ID
  final String? marketId;

  /// the subaccount ID
  final String? subaccountId;

  /// the order hash
  final String? orderHash;

  /// the order mask (bitwise combination of OrderMask enum values)
  final int? orderMask;

  /// the client order ID
  final String? cid;

  const MsgCancelBinaryOptionsOrder({
    this.sender,
    this.marketId,
    this.subaccountId,
    this.orderHash,
    this.orderMask,
    this.cid,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgCancelBinaryOptionsOrder",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.int32(5),
        ProtoFieldConfig.string(6),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    marketId,
    subaccountId,
    orderHash,
    orderMask,
    cid,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'market_id': marketId,
      'subaccount_id': subaccountId,
      'order_hash': orderHash,
      'order_mask': orderMask,
      'cid': cid,
    };
  }

  factory MsgCancelBinaryOptionsOrder.fromJson(Map<String, dynamic> json) {
    return MsgCancelBinaryOptionsOrder(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      orderHash: json.valueAsString<String?>(
        'order_hash',
        acceptCamelCase: true,
      ),
      orderMask: json.valueAsInt<int?>('order_mask', acceptCamelCase: true),
      cid: json.valueAsString<String?>('cid', acceptCamelCase: true),
    );
  }

  factory MsgCancelBinaryOptionsOrder.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCancelBinaryOptionsOrder(
      sender: decode.getString<String?>(1),
      marketId: decode.getString<String?>(2),
      subaccountId: decode.getString<String?>(3),
      orderHash: decode.getString<String?>(4),
      orderMask: decode.getInt<int?>(5),
      cid: decode.getString<String?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgCancelBinaryOptionsOrder;
  @override
  MsgCancelBinaryOptionsOrderResponse onServiceResponse(List<int> bytes) {
    return MsgCancelBinaryOptionsOrderResponse.deserialize(bytes);
  }

  @override
  MsgCancelBinaryOptionsOrderResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCancelBinaryOptionsOrderResponse.fromJson(json);
  }
}

/// MsgCancelBinaryOptionsOrderResponse defines the
/// Msg/CancelBinaryOptionsOrderResponse response type.
class MsgCancelBinaryOptionsOrderResponse extends CosmosProtoMessage {
  const MsgCancelBinaryOptionsOrderResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgCancelBinaryOptionsOrderResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgCancelBinaryOptionsOrderResponse();
  }

  factory MsgCancelBinaryOptionsOrderResponse.deserialize(List<int> bytes) {
    return MsgCancelBinaryOptionsOrderResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgCancelBinaryOptionsOrderResponse;
}

class OrderData extends CosmosProtoMessage {
  /// the market ID
  final String? marketId;

  /// the subaccount ID
  final String? subaccountId;

  /// the order hash
  final String? orderHash;

  /// the order mask (bitwise combination of OrderMask enum values)
  final int? orderMask;

  /// the client order ID
  final String? cid;

  const OrderData({
    this.marketId,
    this.subaccountId,
    this.orderHash,
    this.orderMask,
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
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.int32(4),
        ProtoFieldConfig.string(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    marketId,
    subaccountId,
    orderHash,
    orderMask,
    cid,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'market_id': marketId,
      'subaccount_id': subaccountId,
      'order_hash': orderHash,
      'order_mask': orderMask,
      'cid': cid,
    };
  }

  factory OrderData.fromJson(Map<String, dynamic> json) {
    return OrderData(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      orderHash: json.valueAsString<String?>(
        'order_hash',
        acceptCamelCase: true,
      ),
      orderMask: json.valueAsInt<int?>('order_mask', acceptCamelCase: true),
      cid: json.valueAsString<String?>('cid', acceptCamelCase: true),
    );
  }

  factory OrderData.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return OrderData(
      marketId: decode.getString<String?>(1),
      subaccountId: decode.getString<String?>(2),
      orderHash: decode.getString<String?>(3),
      orderMask: decode.getInt<int?>(4),
      cid: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1OrderData;
}

/// MsgBatchCancelDerivativeOrders defines the Msg/CancelDerivativeOrders
/// response type.
class MsgBatchCancelDerivativeOrders extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgBatchCancelDerivativeOrdersResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// orders details
  final List<OrderData> data;

  const MsgBatchCancelDerivativeOrders({this.sender, this.data = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgBatchCancelDerivativeOrders",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
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
  List<Object?> get protoValues => [sender, data];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'data': data.map((e) => e.toJson()).toList()};
  }

  factory MsgBatchCancelDerivativeOrders.fromJson(Map<String, dynamic> json) {
    return MsgBatchCancelDerivativeOrders(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      data:
          (json.valueEnsureAsList<dynamic>('data', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<OrderData, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => OrderData.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory MsgBatchCancelDerivativeOrders.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBatchCancelDerivativeOrders(
      sender: decode.getString<String?>(1),
      data:
          decode
              .getListOfBytes(2)
              .map((b) => OrderData.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgBatchCancelDerivativeOrders;
  @override
  MsgBatchCancelDerivativeOrdersResponse onServiceResponse(List<int> bytes) {
    return MsgBatchCancelDerivativeOrdersResponse.deserialize(bytes);
  }

  @override
  MsgBatchCancelDerivativeOrdersResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgBatchCancelDerivativeOrdersResponse.fromJson(json);
  }
}

/// MsgBatchCancelDerivativeOrdersResponse defines the
/// Msg/CancelDerivativeOrderResponse response type.
class MsgBatchCancelDerivativeOrdersResponse extends CosmosProtoMessage {
  final List<bool> success;

  const MsgBatchCancelDerivativeOrdersResponse({this.success = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.bool,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [success];

  @override
  Map<String, dynamic> toJson() {
    return {'success': success.map((e) => e).toList()};
  }

  factory MsgBatchCancelDerivativeOrdersResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgBatchCancelDerivativeOrdersResponse(
      success:
          (json.valueEnsureAsList<dynamic>(
            'success',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBool<bool>(e)).toList(),
    );
  }

  factory MsgBatchCancelDerivativeOrdersResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBatchCancelDerivativeOrdersResponse(
      success: decode.getListOrEmpty<bool>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgBatchCancelDerivativeOrdersResponse;
}

/// A Cosmos-SDK MsgSubaccountTransfer
class MsgSubaccountTransfer extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSubaccountTransferResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// the source subaccount ID
  final String? sourceSubaccountId;

  /// the destination subaccount ID
  final String? destinationSubaccountId;

  /// the amount of the transfer
  final cosmos_base_v1beta1_coin.Coin? amount;

  const MsgSubaccountTransfer({
    this.sender,
    this.sourceSubaccountId,
    this.destinationSubaccountId,
    this.amount,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgSubaccountTransfer",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.message(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    sourceSubaccountId,
    destinationSubaccountId,
    amount,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'source_subaccount_id': sourceSubaccountId,
      'destination_subaccount_id': destinationSubaccountId,
      'amount': amount?.toJson(),
    };
  }

  factory MsgSubaccountTransfer.fromJson(Map<String, dynamic> json) {
    return MsgSubaccountTransfer(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      sourceSubaccountId: json.valueAsString<String?>(
        'source_subaccount_id',
        acceptCamelCase: true,
      ),
      destinationSubaccountId: json.valueAsString<String?>(
        'destination_subaccount_id',
        acceptCamelCase: true,
      ),
      amount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgSubaccountTransfer.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSubaccountTransfer(
      sender: decode.getString<String?>(1),
      sourceSubaccountId: decode.getString<String?>(2),
      destinationSubaccountId: decode.getString<String?>(3),
      amount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        4,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1MsgSubaccountTransfer;
  @override
  MsgSubaccountTransferResponse onServiceResponse(List<int> bytes) {
    return MsgSubaccountTransferResponse.deserialize(bytes);
  }

  @override
  MsgSubaccountTransferResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgSubaccountTransferResponse.fromJson(json);
  }
}

/// MsgSubaccountTransferResponse defines the Msg/SubaccountTransfer response
/// type.
class MsgSubaccountTransferResponse extends CosmosProtoMessage {
  const MsgSubaccountTransferResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgSubaccountTransferResponse.fromJson(Map<String, dynamic> json) {
    return MsgSubaccountTransferResponse();
  }

  factory MsgSubaccountTransferResponse.deserialize(List<int> bytes) {
    return MsgSubaccountTransferResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgSubaccountTransferResponse;
}

/// A Cosmos-SDK MsgExternalTransfer
class MsgExternalTransfer extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgExternalTransferResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final String? sourceSubaccountId;

  final String? destinationSubaccountId;

  final cosmos_base_v1beta1_coin.Coin? amount;

  const MsgExternalTransfer({
    this.sender,
    this.sourceSubaccountId,
    this.destinationSubaccountId,
    this.amount,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgExternalTransfer",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.message(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    sourceSubaccountId,
    destinationSubaccountId,
    amount,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'source_subaccount_id': sourceSubaccountId,
      'destination_subaccount_id': destinationSubaccountId,
      'amount': amount?.toJson(),
    };
  }

  factory MsgExternalTransfer.fromJson(Map<String, dynamic> json) {
    return MsgExternalTransfer(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      sourceSubaccountId: json.valueAsString<String?>(
        'source_subaccount_id',
        acceptCamelCase: true,
      ),
      destinationSubaccountId: json.valueAsString<String?>(
        'destination_subaccount_id',
        acceptCamelCase: true,
      ),
      amount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgExternalTransfer.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgExternalTransfer(
      sender: decode.getString<String?>(1),
      sourceSubaccountId: decode.getString<String?>(2),
      destinationSubaccountId: decode.getString<String?>(3),
      amount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        4,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1MsgExternalTransfer;
  @override
  MsgExternalTransferResponse onServiceResponse(List<int> bytes) {
    return MsgExternalTransferResponse.deserialize(bytes);
  }

  @override
  MsgExternalTransferResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgExternalTransferResponse.fromJson(json);
  }
}

/// MsgExternalTransferResponse defines the Msg/ExternalTransfer response type.
class MsgExternalTransferResponse extends CosmosProtoMessage {
  const MsgExternalTransferResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgExternalTransferResponse.fromJson(Map<String, dynamic> json) {
    return MsgExternalTransferResponse();
  }

  factory MsgExternalTransferResponse.deserialize(List<int> bytes) {
    return MsgExternalTransferResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgExternalTransferResponse;
}

/// A Cosmos-SDK MsgLiquidatePosition
class MsgLiquidatePosition extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgLiquidatePositionResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// the subaccount ID
  final String? subaccountId;

  /// the market ID
  final String? marketId;

  /// optional order to provide for liquidation
  final injective_exchange_v1beta1_exchange.DerivativeOrder? order;

  const MsgLiquidatePosition({
    this.sender,
    this.subaccountId,
    this.marketId,
    this.order,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgLiquidatePosition",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.message(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, subaccountId, marketId, order];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'subaccount_id': subaccountId,
      'market_id': marketId,
      'order': order?.toJson(),
    };
  }

  factory MsgLiquidatePosition.fromJson(Map<String, dynamic> json) {
    return MsgLiquidatePosition(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      order: json.valueTo<
        injective_exchange_v1beta1_exchange.DerivativeOrder?,
        Map<String, dynamic>
      >(
        key: 'order',
        parse:
            (v) =>
                injective_exchange_v1beta1_exchange.DerivativeOrder.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgLiquidatePosition.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgLiquidatePosition(
      sender: decode.getString<String?>(1),
      subaccountId: decode.getString<String?>(2),
      marketId: decode.getString<String?>(3),
      order: decode
          .messageTo<injective_exchange_v1beta1_exchange.DerivativeOrder?>(
            4,
            (b) => injective_exchange_v1beta1_exchange
                .DerivativeOrder.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1MsgLiquidatePosition;
  @override
  MsgLiquidatePositionResponse onServiceResponse(List<int> bytes) {
    return MsgLiquidatePositionResponse.deserialize(bytes);
  }

  @override
  MsgLiquidatePositionResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgLiquidatePositionResponse.fromJson(json);
  }
}

/// MsgLiquidatePositionResponse defines the Msg/LiquidatePosition response type.
class MsgLiquidatePositionResponse extends CosmosProtoMessage {
  const MsgLiquidatePositionResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgLiquidatePositionResponse.fromJson(Map<String, dynamic> json) {
    return MsgLiquidatePositionResponse();
  }

  factory MsgLiquidatePositionResponse.deserialize(List<int> bytes) {
    return MsgLiquidatePositionResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgLiquidatePositionResponse;
}

/// A Cosmos-SDK MsgEmergencySettleMarket
class MsgEmergencySettleMarket extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgEmergencySettleMarketResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// the subaccount ID
  final String? subaccountId;

  /// the market ID
  final String? marketId;

  const MsgEmergencySettleMarket({
    this.sender,
    this.subaccountId,
    this.marketId,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgEmergencySettleMarket",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, subaccountId, marketId];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'subaccount_id': subaccountId,
      'market_id': marketId,
    };
  }

  factory MsgEmergencySettleMarket.fromJson(Map<String, dynamic> json) {
    return MsgEmergencySettleMarket(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
    );
  }

  factory MsgEmergencySettleMarket.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgEmergencySettleMarket(
      sender: decode.getString<String?>(1),
      subaccountId: decode.getString<String?>(2),
      marketId: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgEmergencySettleMarket;
  @override
  MsgEmergencySettleMarketResponse onServiceResponse(List<int> bytes) {
    return MsgEmergencySettleMarketResponse.deserialize(bytes);
  }

  @override
  MsgEmergencySettleMarketResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgEmergencySettleMarketResponse.fromJson(json);
  }
}

/// MsgEmergencySettleMarketResponse defines the Msg/EmergencySettleMarket
/// response type.
class MsgEmergencySettleMarketResponse extends CosmosProtoMessage {
  const MsgEmergencySettleMarketResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgEmergencySettleMarketResponse.fromJson(Map<String, dynamic> json) {
    return MsgEmergencySettleMarketResponse();
  }

  factory MsgEmergencySettleMarketResponse.deserialize(List<int> bytes) {
    return MsgEmergencySettleMarketResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgEmergencySettleMarketResponse;
}

/// A Cosmos-SDK MsgIncreasePositionMargin
class MsgIncreasePositionMargin extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgIncreasePositionMarginResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// the subaccount ID sending the funds
  final String? sourceSubaccountId;

  /// the subaccount ID the position belongs to
  final String? destinationSubaccountId;

  /// the market ID
  final String? marketId;

  /// amount defines the amount of margin to add to the position (in chain
  /// format)
  final String? amount;

  const MsgIncreasePositionMargin({
    this.sender,
    this.sourceSubaccountId,
    this.destinationSubaccountId,
    this.marketId,
    this.amount,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgIncreasePositionMargin",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    sourceSubaccountId,
    destinationSubaccountId,
    marketId,
    amount,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'source_subaccount_id': sourceSubaccountId,
      'destination_subaccount_id': destinationSubaccountId,
      'market_id': marketId,
      'amount': amount,
    };
  }

  factory MsgIncreasePositionMargin.fromJson(Map<String, dynamic> json) {
    return MsgIncreasePositionMargin(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      sourceSubaccountId: json.valueAsString<String?>(
        'source_subaccount_id',
        acceptCamelCase: true,
      ),
      destinationSubaccountId: json.valueAsString<String?>(
        'destination_subaccount_id',
        acceptCamelCase: true,
      ),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
    );
  }

  factory MsgIncreasePositionMargin.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgIncreasePositionMargin(
      sender: decode.getString<String?>(1),
      sourceSubaccountId: decode.getString<String?>(2),
      destinationSubaccountId: decode.getString<String?>(3),
      marketId: decode.getString<String?>(4),
      amount: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgIncreasePositionMargin;
  @override
  MsgIncreasePositionMarginResponse onServiceResponse(List<int> bytes) {
    return MsgIncreasePositionMarginResponse.deserialize(bytes);
  }

  @override
  MsgIncreasePositionMarginResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgIncreasePositionMarginResponse.fromJson(json);
  }
}

/// MsgIncreasePositionMarginResponse defines the Msg/IncreasePositionMargin
/// response type.
class MsgIncreasePositionMarginResponse extends CosmosProtoMessage {
  const MsgIncreasePositionMarginResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgIncreasePositionMarginResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgIncreasePositionMarginResponse();
  }

  factory MsgIncreasePositionMarginResponse.deserialize(List<int> bytes) {
    return MsgIncreasePositionMarginResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgIncreasePositionMarginResponse;
}

/// A Cosmos-SDK MsgIncreasePositionMargin
/// A Cosmos-SDK MsgDecreasePositionMargin
class MsgDecreasePositionMargin extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgDecreasePositionMarginResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// the subaccount ID sending the funds
  final String? sourceSubaccountId;

  /// the subaccount ID the position belongs to
  final String? destinationSubaccountId;

  /// the market ID
  final String? marketId;

  /// amount defines the amount of margin to withdraw from the position (in chain
  /// format)
  final String? amount;

  const MsgDecreasePositionMargin({
    this.sender,
    this.sourceSubaccountId,
    this.destinationSubaccountId,
    this.marketId,
    this.amount,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgDecreasePositionMargin",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    sourceSubaccountId,
    destinationSubaccountId,
    marketId,
    amount,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'source_subaccount_id': sourceSubaccountId,
      'destination_subaccount_id': destinationSubaccountId,
      'market_id': marketId,
      'amount': amount,
    };
  }

  factory MsgDecreasePositionMargin.fromJson(Map<String, dynamic> json) {
    return MsgDecreasePositionMargin(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      sourceSubaccountId: json.valueAsString<String?>(
        'source_subaccount_id',
        acceptCamelCase: true,
      ),
      destinationSubaccountId: json.valueAsString<String?>(
        'destination_subaccount_id',
        acceptCamelCase: true,
      ),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
    );
  }

  factory MsgDecreasePositionMargin.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgDecreasePositionMargin(
      sender: decode.getString<String?>(1),
      sourceSubaccountId: decode.getString<String?>(2),
      destinationSubaccountId: decode.getString<String?>(3),
      marketId: decode.getString<String?>(4),
      amount: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgDecreasePositionMargin;
  @override
  MsgDecreasePositionMarginResponse onServiceResponse(List<int> bytes) {
    return MsgDecreasePositionMarginResponse.deserialize(bytes);
  }

  @override
  MsgDecreasePositionMarginResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgDecreasePositionMarginResponse.fromJson(json);
  }
}

/// MsgDecreasePositionMarginResponse defines the Msg/MsgDecreasePositionMargin
/// response type.
class MsgDecreasePositionMarginResponse extends CosmosProtoMessage {
  const MsgDecreasePositionMarginResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgDecreasePositionMarginResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgDecreasePositionMarginResponse();
  }

  factory MsgDecreasePositionMarginResponse.deserialize(List<int> bytes) {
    return MsgDecreasePositionMarginResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgDecreasePositionMarginResponse;
}

/// MsgPrivilegedExecuteContract defines the Msg/Exec message type
class MsgPrivilegedExecuteContract extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgPrivilegedExecuteContractResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  /// funds defines the user's bank coins used to fund the execution (e.g.
  /// 100inj).
  final String? funds;

  /// contract_address defines the contract address to execute
  final String? contractAddress;

  /// data defines the call data used when executing the contract
  final String? data;

  const MsgPrivilegedExecuteContract({
    this.sender,
    this.funds,
    this.contractAddress,
    this.data,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgPrivilegedExecuteContract",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, funds, contractAddress, data];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'funds': funds,
      'contract_address': contractAddress,
      'data': data,
    };
  }

  factory MsgPrivilegedExecuteContract.fromJson(Map<String, dynamic> json) {
    return MsgPrivilegedExecuteContract(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      funds: json.valueAsString<String?>('funds', acceptCamelCase: true),
      contractAddress: json.valueAsString<String?>(
        'contract_address',
        acceptCamelCase: true,
      ),
      data: json.valueAsString<String?>('data', acceptCamelCase: true),
    );
  }

  factory MsgPrivilegedExecuteContract.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgPrivilegedExecuteContract(
      sender: decode.getString<String?>(1),
      funds: decode.getString<String?>(2),
      contractAddress: decode.getString<String?>(3),
      data: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgPrivilegedExecuteContract;
  @override
  MsgPrivilegedExecuteContractResponse onServiceResponse(List<int> bytes) {
    return MsgPrivilegedExecuteContractResponse.deserialize(bytes);
  }

  @override
  MsgPrivilegedExecuteContractResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgPrivilegedExecuteContractResponse.fromJson(json);
  }
}

/// MsgPrivilegedExecuteContractResponse defines the Msg/Exec response type.
class MsgPrivilegedExecuteContractResponse extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> fundsDiff;

  const MsgPrivilegedExecuteContractResponse({this.fundsDiff = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [fundsDiff];

  @override
  Map<String, dynamic> toJson() {
    return {'funds_diff': fundsDiff.map((e) => e.toJson()).toList()};
  }

  factory MsgPrivilegedExecuteContractResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgPrivilegedExecuteContractResponse(
      fundsDiff:
          (json.valueEnsureAsList<dynamic>('funds_diff', acceptCamelCase: true))
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

  factory MsgPrivilegedExecuteContractResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgPrivilegedExecuteContractResponse(
      fundsDiff:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgPrivilegedExecuteContractResponse;
}

/// A Cosmos-SDK MsgRewardsOptOut
class MsgRewardsOptOut extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRewardsOptOutResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  const MsgRewardsOptOut({this.sender});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgRewardsOptOut",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [sender];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender};
  }

  factory MsgRewardsOptOut.fromJson(Map<String, dynamic> json) {
    return MsgRewardsOptOut(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
    );
  }

  factory MsgRewardsOptOut.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRewardsOptOut(sender: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1MsgRewardsOptOut;
  @override
  MsgRewardsOptOutResponse onServiceResponse(List<int> bytes) {
    return MsgRewardsOptOutResponse.deserialize(bytes);
  }

  @override
  MsgRewardsOptOutResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgRewardsOptOutResponse.fromJson(json);
  }
}

/// MsgRewardsOptOutResponse defines the Msg/RewardsOptOut response type.
class MsgRewardsOptOutResponse extends CosmosProtoMessage {
  const MsgRewardsOptOutResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgRewardsOptOutResponse.fromJson(Map<String, dynamic> json) {
    return MsgRewardsOptOutResponse();
  }

  factory MsgRewardsOptOutResponse.deserialize(List<int> bytes) {
    return MsgRewardsOptOutResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgRewardsOptOutResponse;
}

/// MsgAdminUpdateBinaryOptionsMarket is used by the market Admin to operate the
/// market
class MsgAdminUpdateBinaryOptionsMarket extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgAdminUpdateBinaryOptionsMarketResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final String? marketId;

  /// new price at which market will be settled
  final String? settlementPrice;

  /// expiration timestamp
  final BigInt? expirationTimestamp;

  /// expiration timestamp
  final BigInt? settlementTimestamp;

  /// Status of the market
  final injective_exchange_v1beta1_exchange.MarketStatus? status;

  const MsgAdminUpdateBinaryOptionsMarket({
    this.sender,
    this.marketId,
    this.settlementPrice,
    this.expirationTimestamp,
    this.settlementTimestamp,
    this.status,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgAdminUpdateBinaryOptionsMarket",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.int64(4),
        ProtoFieldConfig.int64(5),
        ProtoFieldConfig.enumType(6),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    marketId,
    settlementPrice,
    expirationTimestamp,
    settlementTimestamp,
    status,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'market_id': marketId,
      'settlement_price': settlementPrice,
      'expiration_timestamp': expirationTimestamp?.toString(),
      'settlement_timestamp': settlementTimestamp?.toString(),
      'status': status?.protoName,
    };
  }

  factory MsgAdminUpdateBinaryOptionsMarket.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgAdminUpdateBinaryOptionsMarket(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      settlementPrice: json.valueAsString<String?>(
        'settlement_price',
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
      status: json
          .valueTo<injective_exchange_v1beta1_exchange.MarketStatus?, Object?>(
            key: 'status',
            parse:
                (v) => injective_exchange_v1beta1_exchange.MarketStatus.from(v),
          ),
    );
  }

  factory MsgAdminUpdateBinaryOptionsMarket.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgAdminUpdateBinaryOptionsMarket(
      sender: decode.getString<String?>(1),
      marketId: decode.getString<String?>(2),
      settlementPrice: decode.getString<String?>(3),
      expirationTimestamp: decode.getBigInt<BigInt?>(4),
      settlementTimestamp: decode.getBigInt<BigInt?>(5),
      status: decode.getEnum<injective_exchange_v1beta1_exchange.MarketStatus?>(
        6,
        injective_exchange_v1beta1_exchange.MarketStatus.values,
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgAdminUpdateBinaryOptionsMarket;
  @override
  MsgAdminUpdateBinaryOptionsMarketResponse onServiceResponse(List<int> bytes) {
    return MsgAdminUpdateBinaryOptionsMarketResponse.deserialize(bytes);
  }

  @override
  MsgAdminUpdateBinaryOptionsMarketResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgAdminUpdateBinaryOptionsMarketResponse.fromJson(json);
  }
}

/// MsgAdminUpdateBinaryOptionsMarketResponse is the response for
/// AdminUpdateBinaryOptionsMarket rpc method
class MsgAdminUpdateBinaryOptionsMarketResponse extends CosmosProtoMessage {
  const MsgAdminUpdateBinaryOptionsMarketResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgAdminUpdateBinaryOptionsMarketResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgAdminUpdateBinaryOptionsMarketResponse();
  }

  factory MsgAdminUpdateBinaryOptionsMarketResponse.deserialize(
    List<int> bytes,
  ) {
    return MsgAdminUpdateBinaryOptionsMarketResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgAdminUpdateBinaryOptionsMarketResponse;
}

/// MsgAuthorizeStakeGrants grants stakes to grantees.
class MsgAuthorizeStakeGrants extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgAuthorizeStakeGrantsResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final List<injective_exchange_v1beta1_exchange.GrantAuthorization> grants;

  const MsgAuthorizeStakeGrants({this.sender, this.grants = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgAuthorizeStakeGrants",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
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
  List<Object?> get protoValues => [sender, grants];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'grants': grants.map((e) => e.toJson()).toList()};
  }

  factory MsgAuthorizeStakeGrants.fromJson(Map<String, dynamic> json) {
    return MsgAuthorizeStakeGrants(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      grants:
          (json.valueEnsureAsList<dynamic>('grants', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v1beta1_exchange.GrantAuthorization,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_exchange
                          .GrantAuthorization.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory MsgAuthorizeStakeGrants.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgAuthorizeStakeGrants(
      sender: decode.getString<String?>(1),
      grants:
          decode
              .getListOfBytes(2)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .GrantAuthorization.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1MsgAuthorizeStakeGrants;
  @override
  MsgAuthorizeStakeGrantsResponse onServiceResponse(List<int> bytes) {
    return MsgAuthorizeStakeGrantsResponse.deserialize(bytes);
  }

  @override
  MsgAuthorizeStakeGrantsResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgAuthorizeStakeGrantsResponse.fromJson(json);
  }
}

class MsgAuthorizeStakeGrantsResponse extends CosmosProtoMessage {
  const MsgAuthorizeStakeGrantsResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgAuthorizeStakeGrantsResponse.fromJson(Map<String, dynamic> json) {
    return MsgAuthorizeStakeGrantsResponse();
  }

  factory MsgAuthorizeStakeGrantsResponse.deserialize(List<int> bytes) {
    return MsgAuthorizeStakeGrantsResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgAuthorizeStakeGrantsResponse;
}

/// MsgActivateStakeGrant allows a grantee to activate a stake grant.
class MsgActivateStakeGrant extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgActivateStakeGrantResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final String? granter;

  const MsgActivateStakeGrant({this.sender, this.granter});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgActivateStakeGrant",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [sender, granter];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'granter': granter};
  }

  factory MsgActivateStakeGrant.fromJson(Map<String, dynamic> json) {
    return MsgActivateStakeGrant(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      granter: json.valueAsString<String?>('granter', acceptCamelCase: true),
    );
  }

  factory MsgActivateStakeGrant.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgActivateStakeGrant(
      sender: decode.getString<String?>(1),
      granter: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1MsgActivateStakeGrant;
  @override
  MsgActivateStakeGrantResponse onServiceResponse(List<int> bytes) {
    return MsgActivateStakeGrantResponse.deserialize(bytes);
  }

  @override
  MsgActivateStakeGrantResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgActivateStakeGrantResponse.fromJson(json);
  }
}

class MsgActivateStakeGrantResponse extends CosmosProtoMessage {
  const MsgActivateStakeGrantResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgActivateStakeGrantResponse.fromJson(Map<String, dynamic> json) {
    return MsgActivateStakeGrantResponse();
  }

  factory MsgActivateStakeGrantResponse.deserialize(List<int> bytes) {
    return MsgActivateStakeGrantResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgActivateStakeGrantResponse;
}

class MsgBatchExchangeModification extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgBatchExchangeModificationResponse>,
        ICosmosProtoAminoMessage {
  /// message sender, that is also the TX signer
  final String? sender;

  final injective_exchange_v1beta1_proposal.BatchExchangeModificationProposal?
  proposal;

  const MsgBatchExchangeModification({this.sender, this.proposal});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgBatchExchangeModification",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [sender, proposal];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'proposal': proposal?.toJson()};
  }

  factory MsgBatchExchangeModification.fromJson(Map<String, dynamic> json) {
    return MsgBatchExchangeModification(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      proposal: json.valueTo<
        injective_exchange_v1beta1_proposal.BatchExchangeModificationProposal?,
        Map<String, dynamic>
      >(
        key: 'proposal',
        parse:
            (v) => injective_exchange_v1beta1_proposal
                .BatchExchangeModificationProposal.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgBatchExchangeModification.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBatchExchangeModification(
      sender: decode.getString<String?>(1),
      proposal: decode.messageTo<
        injective_exchange_v1beta1_proposal.BatchExchangeModificationProposal?
      >(
        2,
        (b) => injective_exchange_v1beta1_proposal
            .BatchExchangeModificationProposal.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgBatchExchangeModification;
  @override
  MsgBatchExchangeModificationResponse onServiceResponse(List<int> bytes) {
    return MsgBatchExchangeModificationResponse.deserialize(bytes);
  }

  @override
  MsgBatchExchangeModificationResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgBatchExchangeModificationResponse.fromJson(json);
  }
}

class MsgBatchExchangeModificationResponse extends CosmosProtoMessage {
  const MsgBatchExchangeModificationResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgBatchExchangeModificationResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgBatchExchangeModificationResponse();
  }

  factory MsgBatchExchangeModificationResponse.deserialize(List<int> bytes) {
    return MsgBatchExchangeModificationResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1MsgBatchExchangeModificationResponse;
}
