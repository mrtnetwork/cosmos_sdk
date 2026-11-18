import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/exchange/v2/src/exchange.dart"
    as injective_exchange_v2_exchange;
import "package:cosmos_sdk/proto_messages/injective/exchange/v2/src/orderbook.dart"
    as injective_exchange_v2_orderbook;
import "package:cosmos_sdk/proto_messages/injective/exchange/v2/src/market.dart"
    as injective_exchange_v2_market;
import "package:cosmos_sdk/proto_messages/injective/exchange/v2/src/genesis.dart"
    as injective_exchange_v2_genesis;
import "package:cosmos_sdk/proto_messages/injective/oracle/v1beta1/src/oracle.dart"
    as injective_oracle_v1beta1_oracle;

enum OrderSide implements ProtoEnumVariant {
  /// will return both
  sideUnspecified(0, 'Side_Unspecified'),
  buy(1, 'Buy'),
  sell(2, 'Sell');

  const OrderSide(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static OrderSide fromValue(int? value) {
    value ??= 0;
    return OrderSide.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching OrderSide found for the given value. $value",
                details: {"name": "OrderSide", "value": value?.toString()},
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static OrderSide from(Object? value) {
    value ??= 0;
    return OrderSide.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching OrderSide found for the given value. $value",
                details: {"name": "OrderSide", "value": value?.toString()},
              ),
    );
  }
}

class Subaccount extends CosmosProtoMessage {
  /// the subaccount's trader address
  final String? trader;

  /// the subaccount's nonce number
  final int? subaccountNonce;

  const Subaccount({this.trader, this.subaccountNonce});

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
  List<Object?> get protoValues => [trader, subaccountNonce];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'trader': trader, 'subaccount_nonce': subaccountNonce};
  }

  factory Subaccount.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Subaccount(
      trader: json.valueAsString<String?>(
        'trader',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      subaccountNonce: json.valueAsInt<int?>(
        'subaccount_nonce',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Subaccount.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Subaccount(
      trader: decode.getString<String?>(1),
      subaccountNonce: decode.getInt<int?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2Subaccount;
}

class QuerySubaccountOrdersRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySubaccountOrdersResponse> {
  /// the subaccount ID
  final String? subaccountId;

  /// the market ID
  final String? marketId;

  const QuerySubaccountOrdersRequest({this.subaccountId, this.marketId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/orders/{subaccount_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [subaccountId, marketId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'subaccount_id': subaccountId, 'market_id': marketId};
  }

  factory QuerySubaccountOrdersRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySubaccountOrdersRequest(
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QuerySubaccountOrdersRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySubaccountOrdersRequest(
      subaccountId: decode.getString<String?>(1),
      marketId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2QuerySubaccountOrdersRequest;
  @override
  QuerySubaccountOrdersResponse onQueryResponse(List<int> bytes) {
    return QuerySubaccountOrdersResponse.deserialize(bytes);
  }

  @override
  QuerySubaccountOrdersResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QuerySubaccountOrdersResponse.fromJson(json);
  }
}

class QuerySubaccountOrdersResponse extends CosmosProtoMessage {
  final List<injective_exchange_v2_exchange.SubaccountOrderData> buyOrders;

  final List<injective_exchange_v2_exchange.SubaccountOrderData> sellOrders;

  const QuerySubaccountOrdersResponse({
    this.buyOrders = const [],
    this.sellOrders = const [],
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
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [buyOrders, sellOrders];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'buy_orders': buyOrders.map((e) => config.encodeMessage(e)).toList(),
      'sell_orders': sellOrders.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QuerySubaccountOrdersResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySubaccountOrdersResponse(
      buyOrders:
          (json.valueEnsureAsList<dynamic>(
                'buy_orders',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_exchange.SubaccountOrderData,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_exchange
                          .SubaccountOrderData.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      sellOrders:
          (json.valueEnsureAsList<dynamic>(
                'sell_orders',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_exchange.SubaccountOrderData,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_exchange
                          .SubaccountOrderData.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QuerySubaccountOrdersResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySubaccountOrdersResponse(
      buyOrders:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_exchange_v2_exchange
                    .SubaccountOrderData.deserialize(b),
              )
              .toList(),
      sellOrders:
          decode
              .getListOfBytes(2)
              .map(
                (b) => injective_exchange_v2_exchange
                    .SubaccountOrderData.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QuerySubaccountOrdersResponse;
}

class SubaccountOrderbookMetadataWithMarket extends CosmosProtoMessage {
  /// the subaccount orderbook details
  final injective_exchange_v2_orderbook.SubaccountOrderbookMetadata? metadata;

  /// the market ID
  final String? marketId;

  /// true if the orderbook is for a buy orders
  final bool? isBuy;

  const SubaccountOrderbookMetadataWithMarket({
    this.metadata,
    this.marketId,
    this.isBuy,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.bool(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [metadata, marketId, isBuy];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'metadata': config.encodeMessage(metadata),
      'market_id': marketId,
      'isBuy': isBuy,
    };
  }

  factory SubaccountOrderbookMetadataWithMarket.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return SubaccountOrderbookMetadataWithMarket(
      metadata: json.valueTo<
        injective_exchange_v2_orderbook.SubaccountOrderbookMetadata?,
        Object
      >(
        key: 'metadata',
        parse:
            (v) => injective_exchange_v2_orderbook
                .SubaccountOrderbookMetadata.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      isBuy: json.valueAsBool<bool?>(
        'isBuy',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory SubaccountOrderbookMetadataWithMarket.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SubaccountOrderbookMetadataWithMarket(
      metadata: decode.messageTo<
        injective_exchange_v2_orderbook.SubaccountOrderbookMetadata?
      >(
        1,
        (b) => injective_exchange_v2_orderbook
            .SubaccountOrderbookMetadata.deserialize(b),
      ),
      marketId: decode.getString<String?>(2),
      isBuy: decode.getBool<bool?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2SubaccountOrderbookMetadataWithMarket;
}

/// QueryExchangeParamsRequest is the request type for the Query/ExchangeParams
/// RPC method.
class QueryExchangeParamsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryExchangeParamsResponse> {
  const QueryExchangeParamsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/exchangeParams",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory QueryExchangeParamsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryExchangeParamsRequest();
  }

  factory QueryExchangeParamsRequest.deserialize(List<int> bytes) {
    return QueryExchangeParamsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2QueryExchangeParamsRequest;
  @override
  QueryExchangeParamsResponse onQueryResponse(List<int> bytes) {
    return QueryExchangeParamsResponse.deserialize(bytes);
  }

  @override
  QueryExchangeParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryExchangeParamsResponse.fromJson(json);
  }
}

/// QueryExchangeParamsRequest is the response type for the Query/ExchangeParams
/// RPC method.
class QueryExchangeParamsResponse extends CosmosProtoMessage {
  final injective_exchange_v2_exchange.Params? params;

  const QueryExchangeParamsResponse({this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [params];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'params': config.encodeMessage(params)};
  }

  factory QueryExchangeParamsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryExchangeParamsResponse(
      params: json.valueTo<injective_exchange_v2_exchange.Params?, Object>(
        key: 'params',
        parse:
            (v) => injective_exchange_v2_exchange.Params.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryExchangeParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryExchangeParamsResponse(
      params: decode.messageTo<injective_exchange_v2_exchange.Params?>(
        1,
        (b) => injective_exchange_v2_exchange.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2QueryExchangeParamsResponse;
}

/// QuerySubaccountDepositsRequest is the request type for the
/// Query/SubaccountDeposits RPC method.
class QuerySubaccountDepositsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySubaccountDepositsResponse> {
  /// the subaccount ID
  final String? subaccountId;

  /// the subaccount details
  final Subaccount? subaccount;

  const QuerySubaccountDepositsRequest({this.subaccountId, this.subaccount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/exchange/subaccountDeposits",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [subaccountId, subaccount];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'subaccount_id': subaccountId,
      'subaccount': config.encodeMessage(subaccount),
    };
  }

  factory QuerySubaccountDepositsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySubaccountDepositsRequest(
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      subaccount: json.valueTo<Subaccount?, Object>(
        key: 'subaccount',
        parse:
            (v) => Subaccount.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QuerySubaccountDepositsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySubaccountDepositsRequest(
      subaccountId: decode.getString<String?>(1),
      subaccount: decode.messageTo<Subaccount?>(
        2,
        (b) => Subaccount.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QuerySubaccountDepositsRequest;
  @override
  QuerySubaccountDepositsResponse onQueryResponse(List<int> bytes) {
    return QuerySubaccountDepositsResponse.deserialize(bytes);
  }

  @override
  QuerySubaccountDepositsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QuerySubaccountDepositsResponse.fromJson(json);
  }
}

/// QuerySubaccountDepositsResponse is the response type for the
/// Query/SubaccountDeposits RPC method.
class QuerySubaccountDepositsResponse extends CosmosProtoMessage {
  final Map<String, injective_exchange_v2_exchange.Deposit> deposits;

  const QuerySubaccountDepositsResponse({this.deposits = const {}});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.map(
          fieldNumber: 1,
          keyType: ProtoFieldType.string,
          valueType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [deposits];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'deposits': config.encodeMap(
        deposits,
        (k, v) => MapEntry(k, config.encodeMessage(v)),
      ),
    };
  }

  factory QuerySubaccountDepositsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySubaccountDepositsResponse(
      deposits: config.decodeMap(
        json.valueAs('deposits', normalizeKeyLookup: config.normalizeKeys),
        (k, v) => MapEntry(
          JsonParser.valueAsString<String>(k),
          JsonParser.valueTo<injective_exchange_v2_exchange.Deposit, Object>(
            value: v,
            parse:
                (v) => injective_exchange_v2_exchange.Deposit.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
          ),
        ),
      ),
    );
  }

  factory QuerySubaccountDepositsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySubaccountDepositsResponse(
      deposits: decode
          .getMapField<String, injective_exchange_v2_exchange.Deposit>(
            fieldNumber: 1,
            keyMapper: (v) => JsonParser.valueAs<String>(v),
            valueMapper:
                (v) => injective_exchange_v2_exchange.Deposit.deserialize(
                  JsonParser.valueAsBytes<List<int>>(v),
                ),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QuerySubaccountDepositsResponse;
}

/// QueryExchangeBalancesRequest is the request type for the
/// Query/ExchangeBalances RPC method.
class QueryExchangeBalancesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryExchangeBalancesResponse> {
  const QueryExchangeBalancesRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/exchange/exchangeBalances",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory QueryExchangeBalancesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryExchangeBalancesRequest();
  }

  factory QueryExchangeBalancesRequest.deserialize(List<int> bytes) {
    return QueryExchangeBalancesRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2QueryExchangeBalancesRequest;
  @override
  QueryExchangeBalancesResponse onQueryResponse(List<int> bytes) {
    return QueryExchangeBalancesResponse.deserialize(bytes);
  }

  @override
  QueryExchangeBalancesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryExchangeBalancesResponse.fromJson(json);
  }
}

/// QuerySubaccountDepositsResponse is the response type for the
/// Query/SubaccountDeposits RPC method.
class QueryExchangeBalancesResponse extends CosmosProtoMessage {
  final List<injective_exchange_v2_exchange.Balance> balances;

  const QueryExchangeBalancesResponse({this.balances = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
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
  List<Object?> get protoValues => [balances];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'balances': balances.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QueryExchangeBalancesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryExchangeBalancesResponse(
      balances:
          (json.valueEnsureAsList<dynamic>(
                'balances',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_exchange.Balance,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_exchange.Balance.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryExchangeBalancesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryExchangeBalancesResponse(
      balances:
          decode
              .getListOfBytes(1)
              .map((b) => injective_exchange_v2_exchange.Balance.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryExchangeBalancesResponse;
}

/// QueryAggregateVolumeRequest is the request type for the Query/AggregateVolume
/// RPC method.
class QueryAggregateVolumeRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAggregateVolumeResponse> {
  /// can either be an address or a subaccount
  final String? account;

  const QueryAggregateVolumeRequest({this.account});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/exchange/aggregateVolume/{account}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [account];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'account': account};
  }

  factory QueryAggregateVolumeRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAggregateVolumeRequest(
      account: json.valueAsString<String?>(
        'account',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryAggregateVolumeRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAggregateVolumeRequest(account: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2QueryAggregateVolumeRequest;
  @override
  QueryAggregateVolumeResponse onQueryResponse(List<int> bytes) {
    return QueryAggregateVolumeResponse.deserialize(bytes);
  }

  @override
  QueryAggregateVolumeResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAggregateVolumeResponse.fromJson(json);
  }
}

/// QueryAggregateVolumeResponse is the response type for the
/// Query/AggregateVolume RPC method.
class QueryAggregateVolumeResponse extends CosmosProtoMessage {
  /// if an address is specified, then the aggregate_volumes will aggregate the
  /// volumes across all subaccounts for the address
  final List<injective_exchange_v2_market.MarketVolume> aggregateVolumes;

  const QueryAggregateVolumeResponse({this.aggregateVolumes = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [aggregateVolumes];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'aggregate_volumes':
          aggregateVolumes.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QueryAggregateVolumeResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAggregateVolumeResponse(
      aggregateVolumes:
          (json.valueEnsureAsList<dynamic>(
                'aggregate_volumes',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_market.MarketVolume,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_market.MarketVolume.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryAggregateVolumeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAggregateVolumeResponse(
      aggregateVolumes:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_exchange_v2_market.MarketVolume.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2QueryAggregateVolumeResponse;
}

/// QueryAggregateVolumesRequest is the request type for the
/// Query/AggregateVolumes RPC method.
class QueryAggregateVolumesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAggregateVolumesResponse> {
  final List<String> accounts;

  final List<String> marketIds;

  const QueryAggregateVolumesRequest({
    this.accounts = const [],
    this.marketIds = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/exchange/aggregateVolumes",
        ),
      ],
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
  List<Object?> get protoValues => [accounts, marketIds];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'accounts': accounts.map((e) => e).toList(),
      'market_ids': marketIds.map((e) => e).toList(),
    };
  }

  factory QueryAggregateVolumesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAggregateVolumesRequest(
      accounts:
          (json.valueEnsureAsList<dynamic>(
            'accounts',
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

  factory QueryAggregateVolumesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAggregateVolumesRequest(
      accounts: decode.getListOrEmpty<String>(1),
      marketIds: decode.getListOrEmpty<String>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2QueryAggregateVolumesRequest;
  @override
  QueryAggregateVolumesResponse onQueryResponse(List<int> bytes) {
    return QueryAggregateVolumesResponse.deserialize(bytes);
  }

  @override
  QueryAggregateVolumesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAggregateVolumesResponse.fromJson(json);
  }
}

/// QueryAggregateVolumesResponse is the response type for the
/// Query/AggregateVolumes RPC method.
class QueryAggregateVolumesResponse extends CosmosProtoMessage {
  /// the aggregate volume records for the accounts specified
  final List<injective_exchange_v2_exchange.AggregateAccountVolumeRecord>
  aggregateAccountVolumes;

  /// the aggregate volumes for the markets specified
  final List<injective_exchange_v2_market.MarketVolume> aggregateMarketVolumes;

  const QueryAggregateVolumesResponse({
    this.aggregateAccountVolumes = const [],
    this.aggregateMarketVolumes = const [],
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
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    aggregateAccountVolumes,
    aggregateMarketVolumes,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'aggregate_account_volumes':
          aggregateAccountVolumes.map((e) => config.encodeMessage(e)).toList(),
      'aggregate_market_volumes':
          aggregateMarketVolumes.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QueryAggregateVolumesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAggregateVolumesResponse(
      aggregateAccountVolumes:
          (json.valueEnsureAsList<dynamic>(
                'aggregate_account_volumes',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_exchange.AggregateAccountVolumeRecord,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_exchange
                          .AggregateAccountVolumeRecord.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      aggregateMarketVolumes:
          (json.valueEnsureAsList<dynamic>(
                'aggregate_market_volumes',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_market.MarketVolume,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_market.MarketVolume.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryAggregateVolumesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAggregateVolumesResponse(
      aggregateAccountVolumes:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_exchange_v2_exchange
                    .AggregateAccountVolumeRecord.deserialize(b),
              )
              .toList(),
      aggregateMarketVolumes:
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
          .injectiveExchangeV2QueryAggregateVolumesResponse;
}

/// QueryAggregateMarketVolumeRequest is the request type for the
/// Query/AggregateMarketVolume RPC method.
class QueryAggregateMarketVolumeRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAggregateMarketVolumeResponse> {
  final String? marketId;

  const QueryAggregateMarketVolumeRequest({this.marketId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/injective/exchange/v2/exchange/aggregateMarketVolume/{market_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [marketId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'market_id': marketId};
  }

  factory QueryAggregateMarketVolumeRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAggregateMarketVolumeRequest(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryAggregateMarketVolumeRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAggregateMarketVolumeRequest(
      marketId: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryAggregateMarketVolumeRequest;
  @override
  QueryAggregateMarketVolumeResponse onQueryResponse(List<int> bytes) {
    return QueryAggregateMarketVolumeResponse.deserialize(bytes);
  }

  @override
  QueryAggregateMarketVolumeResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryAggregateMarketVolumeResponse.fromJson(json);
  }
}

/// QueryAggregateMarketVolumeResponse is the response type for the
/// Query/AggregateMarketVolume RPC method.
class QueryAggregateMarketVolumeResponse extends CosmosProtoMessage {
  final injective_exchange_v2_market.VolumeRecord? volume;

  const QueryAggregateMarketVolumeResponse({this.volume});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [volume];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'volume': config.encodeMessage(volume)};
  }

  factory QueryAggregateMarketVolumeResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAggregateMarketVolumeResponse(
      volume: json.valueTo<injective_exchange_v2_market.VolumeRecord?, Object>(
        key: 'volume',
        parse:
            (v) => injective_exchange_v2_market.VolumeRecord.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryAggregateMarketVolumeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAggregateMarketVolumeResponse(
      volume: decode.messageTo<injective_exchange_v2_market.VolumeRecord?>(
        1,
        (b) => injective_exchange_v2_market.VolumeRecord.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryAggregateMarketVolumeResponse;
}

/// QueryAuctionExchangeTransferDenomDecimalRequest is the request type for the
/// Query/DenomDecimal RPC method.
class QueryAuctionExchangeTransferDenomDecimalRequest extends CosmosProtoMessage
    with
        ICosmosProtoQueryMessage<
          QueryAuctionExchangeTransferDenomDecimalResponse
        > {
  final String? denom;

  const QueryAuctionExchangeTransferDenomDecimalRequest({this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/injective/exchange/v2/exchange/auction_exchange_transfer_denom_decimal/{denom}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [denom];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'denom': denom};
  }

  factory QueryAuctionExchangeTransferDenomDecimalRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAuctionExchangeTransferDenomDecimalRequest(
      denom: json.valueAsString<String?>(
        'denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryAuctionExchangeTransferDenomDecimalRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAuctionExchangeTransferDenomDecimalRequest(
      denom: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryAuctionExchangeTransferDenomDecimalRequest;
  @override
  QueryAuctionExchangeTransferDenomDecimalResponse onQueryResponse(
    List<int> bytes,
  ) {
    return QueryAuctionExchangeTransferDenomDecimalResponse.deserialize(bytes);
  }

  @override
  QueryAuctionExchangeTransferDenomDecimalResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryAuctionExchangeTransferDenomDecimalResponse.fromJson(json);
  }
}

/// QueryDenomDecimalResponse is the response type for the Query/DenomDecimal RPC
/// method.
class QueryAuctionExchangeTransferDenomDecimalResponse
    extends CosmosProtoMessage {
  final BigInt? decimal;

  const QueryAuctionExchangeTransferDenomDecimalResponse({this.decimal});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [decimal];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'decimal': config.encodeBigint(decimal)};
  }

  factory QueryAuctionExchangeTransferDenomDecimalResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAuctionExchangeTransferDenomDecimalResponse(
      decimal: json.valueAsBigInt<BigInt?>(
        'decimal',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryAuctionExchangeTransferDenomDecimalResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAuctionExchangeTransferDenomDecimalResponse(
      decimal: decode.getBigInt<BigInt?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryAuctionExchangeTransferDenomDecimalResponse;
}

/// QueryDenomDecimalsRequest is the request type for the Query/DenomDecimals RPC
/// method.
class QueryAuctionExchangeTransferDenomDecimalsRequest
    extends CosmosProtoMessage
    with
        ICosmosProtoQueryMessage<
          QueryAuctionExchangeTransferDenomDecimalsResponse
        > {
  /// denoms can be empty to query all denom decimals
  final List<String> denoms;

  const QueryAuctionExchangeTransferDenomDecimalsRequest({
    this.denoms = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/injective/exchange/v2/exchange/auction_exchange_transfer_denom_decimals",
        ),
      ],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [denoms];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'denoms': denoms.map((e) => e).toList()};
  }

  factory QueryAuctionExchangeTransferDenomDecimalsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAuctionExchangeTransferDenomDecimalsRequest(
      denoms:
          (json.valueEnsureAsList<dynamic>(
            'denoms',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory QueryAuctionExchangeTransferDenomDecimalsRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAuctionExchangeTransferDenomDecimalsRequest(
      denoms: decode.getListOrEmpty<String>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryAuctionExchangeTransferDenomDecimalsRequest;
  @override
  QueryAuctionExchangeTransferDenomDecimalsResponse onQueryResponse(
    List<int> bytes,
  ) {
    return QueryAuctionExchangeTransferDenomDecimalsResponse.deserialize(bytes);
  }

  @override
  QueryAuctionExchangeTransferDenomDecimalsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryAuctionExchangeTransferDenomDecimalsResponse.fromJson(json);
  }
}

/// QueryDenomDecimalsRequest is the response type for the Query/DenomDecimals
/// RPC method.
class QueryAuctionExchangeTransferDenomDecimalsResponse
    extends CosmosProtoMessage {
  final List<injective_exchange_v2_exchange.DenomDecimals> denomDecimals;

  const QueryAuctionExchangeTransferDenomDecimalsResponse({
    this.denomDecimals = const [],
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
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [denomDecimals];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'denom_decimals':
          denomDecimals.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QueryAuctionExchangeTransferDenomDecimalsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAuctionExchangeTransferDenomDecimalsResponse(
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

  factory QueryAuctionExchangeTransferDenomDecimalsResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAuctionExchangeTransferDenomDecimalsResponse(
      denomDecimals:
          decode
              .getListOfBytes(1)
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
          .injectiveExchangeV2QueryAuctionExchangeTransferDenomDecimalsResponse;
}

/// QueryAggregateMarketVolumesRequest is the request type for the
/// Query/AggregateMarketVolumes RPC method.
class QueryAggregateMarketVolumesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAggregateMarketVolumesResponse> {
  final List<String> marketIds;

  const QueryAggregateMarketVolumesRequest({this.marketIds = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/exchange/aggregateMarketVolumes",
        ),
      ],
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

  factory QueryAggregateMarketVolumesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAggregateMarketVolumesRequest(
      marketIds:
          (json.valueEnsureAsList<dynamic>(
            'market_ids',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory QueryAggregateMarketVolumesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAggregateMarketVolumesRequest(
      marketIds: decode.getListOrEmpty<String>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryAggregateMarketVolumesRequest;
  @override
  QueryAggregateMarketVolumesResponse onQueryResponse(List<int> bytes) {
    return QueryAggregateMarketVolumesResponse.deserialize(bytes);
  }

  @override
  QueryAggregateMarketVolumesResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryAggregateMarketVolumesResponse.fromJson(json);
  }
}

/// QueryAggregateMarketVolumesResponse is the response type for the
/// Query/AggregateMarketVolumes RPC method.
class QueryAggregateMarketVolumesResponse extends CosmosProtoMessage {
  /// the aggregate volumes for the entire market
  final List<injective_exchange_v2_market.MarketVolume> volumes;

  const QueryAggregateMarketVolumesResponse({this.volumes = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [volumes];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'volumes': volumes.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QueryAggregateMarketVolumesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAggregateMarketVolumesResponse(
      volumes:
          (json.valueEnsureAsList<dynamic>(
                'volumes',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_market.MarketVolume,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_market.MarketVolume.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryAggregateMarketVolumesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAggregateMarketVolumesResponse(
      volumes:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_exchange_v2_market.MarketVolume.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryAggregateMarketVolumesResponse;
}

/// QuerySubaccountDepositsRequest is the request type for the
/// Query/SubaccountDeposits RPC method.
class QuerySubaccountDepositRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySubaccountDepositResponse> {
  /// the subaccount ID
  final String? subaccountId;

  /// the token denom
  final String? denom;

  const QuerySubaccountDepositRequest({this.subaccountId, this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/exchange/subaccountDeposit",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [subaccountId, denom];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'subaccount_id': subaccountId, 'denom': denom};
  }

  factory QuerySubaccountDepositRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySubaccountDepositRequest(
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      denom: json.valueAsString<String?>(
        'denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QuerySubaccountDepositRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySubaccountDepositRequest(
      subaccountId: decode.getString<String?>(1),
      denom: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QuerySubaccountDepositRequest;
  @override
  QuerySubaccountDepositResponse onQueryResponse(List<int> bytes) {
    return QuerySubaccountDepositResponse.deserialize(bytes);
  }

  @override
  QuerySubaccountDepositResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QuerySubaccountDepositResponse.fromJson(json);
  }
}

/// QuerySubaccountDepositsResponse is the response type for the
/// Query/SubaccountDeposits RPC method.
class QuerySubaccountDepositResponse extends CosmosProtoMessage {
  final injective_exchange_v2_exchange.Deposit? deposits;

  const QuerySubaccountDepositResponse({this.deposits});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [deposits];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'deposits': config.encodeMessage(deposits)};
  }

  factory QuerySubaccountDepositResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySubaccountDepositResponse(
      deposits: json.valueTo<injective_exchange_v2_exchange.Deposit?, Object>(
        key: 'deposits',
        parse:
            (v) => injective_exchange_v2_exchange.Deposit.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QuerySubaccountDepositResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySubaccountDepositResponse(
      deposits: decode.messageTo<injective_exchange_v2_exchange.Deposit?>(
        1,
        (b) => injective_exchange_v2_exchange.Deposit.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QuerySubaccountDepositResponse;
}

/// QuerySpotMarketsRequest is the request type for the Query/SpotMarkets RPC
/// method.
class QuerySpotMarketsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySpotMarketsResponse> {
  /// Status of the market, for convenience it is set to string - not enum
  final String? status;

  /// Filter by market IDs
  final List<String> marketIds;

  const QuerySpotMarketsRequest({this.status, this.marketIds = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/spot/markets",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [status, marketIds];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'status': status, 'market_ids': marketIds.map((e) => e).toList()};
  }

  factory QuerySpotMarketsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySpotMarketsRequest(
      status: json.valueAsString<String?>(
        'status',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      marketIds:
          (json.valueEnsureAsList<dynamic>(
            'market_ids',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory QuerySpotMarketsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySpotMarketsRequest(
      status: decode.getString<String?>(1),
      marketIds: decode.getListOrEmpty<String>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2QuerySpotMarketsRequest;
  @override
  QuerySpotMarketsResponse onQueryResponse(List<int> bytes) {
    return QuerySpotMarketsResponse.deserialize(bytes);
  }

  @override
  QuerySpotMarketsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QuerySpotMarketsResponse.fromJson(json);
  }
}

/// QuerySpotMarketsResponse is the response type for the Query/SpotMarkets RPC
/// method.
class QuerySpotMarketsResponse extends CosmosProtoMessage {
  final List<injective_exchange_v2_market.SpotMarket> markets;

  const QuerySpotMarketsResponse({this.markets = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [markets];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'markets': markets.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QuerySpotMarketsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySpotMarketsResponse(
      markets:
          (json.valueEnsureAsList<dynamic>(
                'markets',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_market.SpotMarket,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_market.SpotMarket.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QuerySpotMarketsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySpotMarketsResponse(
      markets:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_exchange_v2_market.SpotMarket.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2QuerySpotMarketsResponse;
}

/// QuerySpotMarketRequest is the request type for the Query/SpotMarket RPC
/// method.
class QuerySpotMarketRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySpotMarketResponse> {
  /// Market ID for the market
  final String? marketId;

  const QuerySpotMarketRequest({this.marketId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/spot/markets/{market_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [marketId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'market_id': marketId};
  }

  factory QuerySpotMarketRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySpotMarketRequest(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QuerySpotMarketRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySpotMarketRequest(marketId: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2QuerySpotMarketRequest;
  @override
  QuerySpotMarketResponse onQueryResponse(List<int> bytes) {
    return QuerySpotMarketResponse.deserialize(bytes);
  }

  @override
  QuerySpotMarketResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QuerySpotMarketResponse.fromJson(json);
  }
}

/// QuerySpotMarketResponse is the response type for the Query/SpotMarket RPC
/// method.
class QuerySpotMarketResponse extends CosmosProtoMessage {
  final injective_exchange_v2_market.SpotMarket? market;

  const QuerySpotMarketResponse({this.market});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [market];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'market': config.encodeMessage(market)};
  }

  factory QuerySpotMarketResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySpotMarketResponse(
      market: json.valueTo<injective_exchange_v2_market.SpotMarket?, Object>(
        key: 'market',
        parse:
            (v) => injective_exchange_v2_market.SpotMarket.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QuerySpotMarketResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySpotMarketResponse(
      market: decode.messageTo<injective_exchange_v2_market.SpotMarket?>(
        1,
        (b) => injective_exchange_v2_market.SpotMarket.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2QuerySpotMarketResponse;
}

/// QuerySpotOrderbookRequest is the request type for the Query/SpotOrderbook RPC
/// method.
class QuerySpotOrderbookRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySpotOrderbookResponse> {
  /// Market ID for the market
  final String? marketId;

  /// the maximum number of orderbook entries to return per side (optional)
  final BigInt? limit;

  /// the order side to return the orderbook entries for (optional)
  final OrderSide? orderSide;

  /// limits the number of entries to return per side based on the cumulative
  /// notional (in human readable format)
  final String? limitCumulativeNotional;

  /// limits the number of entries to return per side based on the cumulative
  /// quantity (in human readable format)
  final String? limitCumulativeQuantity;

  const QuerySpotOrderbookRequest({
    this.marketId,
    this.limit,
    this.orderSide,
    this.limitCumulativeNotional,
    this.limitCumulativeQuantity,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/spot/orderbook/{market_id}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.enumType(3),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    marketId,
    limit,
    orderSide,
    limitCumulativeNotional,
    limitCumulativeQuantity,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'market_id': marketId,
      'limit': config.encodeBigint(limit),
      'order_side': config.encodeEnum(orderSide),
      'limit_cumulative_notional': limitCumulativeNotional,
      'limit_cumulative_quantity': limitCumulativeQuantity,
    };
  }

  factory QuerySpotOrderbookRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySpotOrderbookRequest(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      limit: json.valueAsBigInt<BigInt?>(
        'limit',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      orderSide: json.valueTo<OrderSide?, Object?>(
        key: 'order_side',
        parse: (v) => OrderSide.from(v),
      ),
      limitCumulativeNotional: json.valueAsString<String?>(
        'limit_cumulative_notional',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      limitCumulativeQuantity: json.valueAsString<String?>(
        'limit_cumulative_quantity',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QuerySpotOrderbookRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySpotOrderbookRequest(
      marketId: decode.getString<String?>(1),
      limit: decode.getBigInt<BigInt?>(2),
      orderSide: decode.getEnum<OrderSide?>(3, OrderSide.values),
      limitCumulativeNotional: decode.getString<String?>(4),
      limitCumulativeQuantity: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2QuerySpotOrderbookRequest;
  @override
  QuerySpotOrderbookResponse onQueryResponse(List<int> bytes) {
    return QuerySpotOrderbookResponse.deserialize(bytes);
  }

  @override
  QuerySpotOrderbookResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QuerySpotOrderbookResponse.fromJson(json);
  }
}

/// QuerySpotOrderbookResponse is the response type for the Query/SpotOrderbook
/// RPC method.
class QuerySpotOrderbookResponse extends CosmosProtoMessage {
  final List<injective_exchange_v2_exchange.Level> buysPriceLevel;

  final List<injective_exchange_v2_exchange.Level> sellsPriceLevel;

  /// the current orderbook sequence number
  final BigInt? seq;

  const QuerySpotOrderbookResponse({
    this.buysPriceLevel = const [],
    this.sellsPriceLevel = const [],
    this.seq,
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
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.uint64(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [buysPriceLevel, sellsPriceLevel, seq];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'buys_price_level':
          buysPriceLevel.map((e) => config.encodeMessage(e)).toList(),
      'sells_price_level':
          sellsPriceLevel.map((e) => config.encodeMessage(e)).toList(),
      'seq': config.encodeBigint(seq),
    };
  }

  factory QuerySpotOrderbookResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySpotOrderbookResponse(
      buysPriceLevel:
          (json.valueEnsureAsList<dynamic>(
                'buys_price_level',
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
      sellsPriceLevel:
          (json.valueEnsureAsList<dynamic>(
                'sells_price_level',
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
      seq: json.valueAsBigInt<BigInt?>(
        'seq',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QuerySpotOrderbookResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySpotOrderbookResponse(
      buysPriceLevel:
          decode
              .getListOfBytes(1)
              .map((b) => injective_exchange_v2_exchange.Level.deserialize(b))
              .toList(),
      sellsPriceLevel:
          decode
              .getListOfBytes(2)
              .map((b) => injective_exchange_v2_exchange.Level.deserialize(b))
              .toList(),
      seq: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2QuerySpotOrderbookResponse;
}

class FullSpotMarket extends CosmosProtoMessage {
  /// spot market details
  final injective_exchange_v2_market.SpotMarket? market;

  /// mid_price_and_tob defines the mid price for this market and the best ask
  /// and bid orders
  final injective_exchange_v2_exchange.MidPriceAndTOB? midPriceAndTob;

  const FullSpotMarket({this.market, this.midPriceAndTob});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [market, midPriceAndTob];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'market': config.encodeMessage(market),
      'mid_price_and_tob': config.encodeMessage(midPriceAndTob),
    };
  }

  factory FullSpotMarket.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return FullSpotMarket(
      market: json.valueTo<injective_exchange_v2_market.SpotMarket?, Object>(
        key: 'market',
        parse:
            (v) => injective_exchange_v2_market.SpotMarket.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      midPriceAndTob: json
          .valueTo<injective_exchange_v2_exchange.MidPriceAndTOB?, Object>(
            key: 'mid_price_and_tob',
            parse:
                (v) => injective_exchange_v2_exchange.MidPriceAndTOB.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory FullSpotMarket.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return FullSpotMarket(
      market: decode.messageTo<injective_exchange_v2_market.SpotMarket?>(
        1,
        (b) => injective_exchange_v2_market.SpotMarket.deserialize(b),
      ),
      midPriceAndTob: decode
          .messageTo<injective_exchange_v2_exchange.MidPriceAndTOB?>(
            2,
            (b) => injective_exchange_v2_exchange.MidPriceAndTOB.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2FullSpotMarket;
}

/// QueryFullSpotMarketsRequest is the request type for the Query/FullSpotMarkets
/// RPC method.
class QueryFullSpotMarketsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryFullSpotMarketsResponse> {
  /// Status of the market, for convenience it is set to string - not enum
  final String? status;

  /// Filter by market IDs
  final List<String> marketIds;

  /// Flag to return the markets mid price and top of the book buy and sell
  /// orders.
  final bool? withMidPriceAndTob;

  const QueryFullSpotMarketsRequest({
    this.status,
    this.marketIds = const [],
    this.withMidPriceAndTob,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/spot/full_markets",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.bool(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [status, marketIds, withMidPriceAndTob];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'status': status,
      'market_ids': marketIds.map((e) => e).toList(),
      'with_mid_price_and_tob': withMidPriceAndTob,
    };
  }

  factory QueryFullSpotMarketsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryFullSpotMarketsRequest(
      status: json.valueAsString<String?>(
        'status',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      marketIds:
          (json.valueEnsureAsList<dynamic>(
            'market_ids',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      withMidPriceAndTob: json.valueAsBool<bool?>(
        'with_mid_price_and_tob',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryFullSpotMarketsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryFullSpotMarketsRequest(
      status: decode.getString<String?>(1),
      marketIds: decode.getListOrEmpty<String>(2),
      withMidPriceAndTob: decode.getBool<bool?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2QueryFullSpotMarketsRequest;
  @override
  QueryFullSpotMarketsResponse onQueryResponse(List<int> bytes) {
    return QueryFullSpotMarketsResponse.deserialize(bytes);
  }

  @override
  QueryFullSpotMarketsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryFullSpotMarketsResponse.fromJson(json);
  }
}

/// QueryFullSpotMarketsResponse is the response type for the
/// Query/FullSpotMarkets RPC method.
class QueryFullSpotMarketsResponse extends CosmosProtoMessage {
  final List<FullSpotMarket> markets;

  const QueryFullSpotMarketsResponse({this.markets = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [markets];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'markets': markets.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QueryFullSpotMarketsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryFullSpotMarketsResponse(
      markets:
          (json.valueEnsureAsList<dynamic>(
                'markets',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<FullSpotMarket, Object>(
                  value: e,
                  parse:
                      (v) => FullSpotMarket.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryFullSpotMarketsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryFullSpotMarketsResponse(
      markets:
          decode
              .getListOfBytes(1)
              .map((b) => FullSpotMarket.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2QueryFullSpotMarketsResponse;
}

/// QuerySpotMarketRequest is the request type for the Query/SpotMarket RPC
/// method.
class QueryFullSpotMarketRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryFullSpotMarketResponse> {
  /// Market ID for the market
  final String? marketId;

  /// Flag to return the markets mid price and top of the book buy and sell
  /// orders.
  final bool? withMidPriceAndTob;

  const QueryFullSpotMarketRequest({this.marketId, this.withMidPriceAndTob});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/spot/full_market/{market_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.bool(2)],
    );
  }

  @override
  List<Object?> get protoValues => [marketId, withMidPriceAndTob];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'market_id': marketId,
      'with_mid_price_and_tob': withMidPriceAndTob,
    };
  }

  factory QueryFullSpotMarketRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryFullSpotMarketRequest(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      withMidPriceAndTob: json.valueAsBool<bool?>(
        'with_mid_price_and_tob',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryFullSpotMarketRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryFullSpotMarketRequest(
      marketId: decode.getString<String?>(1),
      withMidPriceAndTob: decode.getBool<bool?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2QueryFullSpotMarketRequest;
  @override
  QueryFullSpotMarketResponse onQueryResponse(List<int> bytes) {
    return QueryFullSpotMarketResponse.deserialize(bytes);
  }

  @override
  QueryFullSpotMarketResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryFullSpotMarketResponse.fromJson(json);
  }
}

/// QuerySpotMarketResponse is the response type for the Query/SpotMarket RPC
/// method.
class QueryFullSpotMarketResponse extends CosmosProtoMessage {
  final FullSpotMarket? market;

  const QueryFullSpotMarketResponse({this.market});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [market];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'market': config.encodeMessage(market)};
  }

  factory QueryFullSpotMarketResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryFullSpotMarketResponse(
      market: json.valueTo<FullSpotMarket?, Object>(
        key: 'market',
        parse:
            (v) =>
                FullSpotMarket.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryFullSpotMarketResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryFullSpotMarketResponse(
      market: decode.messageTo<FullSpotMarket?>(
        1,
        (b) => FullSpotMarket.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2QueryFullSpotMarketResponse;
}

/// QuerySpotOrdersByHashesRequest is the request type for the
/// Query/SpotOrdersByHashes RPC method.
class QuerySpotOrdersByHashesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySpotOrdersByHashesResponse> {
  /// Market ID for the market
  final String? marketId;

  /// SubaccountID of the trader
  final String? subaccountId;

  /// the order hashes
  final List<String> orderHashes;

  const QuerySpotOrdersByHashesRequest({
    this.marketId,
    this.subaccountId,
    this.orderHashes = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/injective/exchange/v2/spot/orders_by_hashes/{market_id}/{subaccount_id}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [marketId, subaccountId, orderHashes];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'market_id': marketId,
      'subaccount_id': subaccountId,
      'order_hashes': orderHashes.map((e) => e).toList(),
    };
  }

  factory QuerySpotOrdersByHashesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySpotOrdersByHashesRequest(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      orderHashes:
          (json.valueEnsureAsList<dynamic>(
            'order_hashes',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory QuerySpotOrdersByHashesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySpotOrdersByHashesRequest(
      marketId: decode.getString<String?>(1),
      subaccountId: decode.getString<String?>(2),
      orderHashes: decode.getListOrEmpty<String>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QuerySpotOrdersByHashesRequest;
  @override
  QuerySpotOrdersByHashesResponse onQueryResponse(List<int> bytes) {
    return QuerySpotOrdersByHashesResponse.deserialize(bytes);
  }

  @override
  QuerySpotOrdersByHashesResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QuerySpotOrdersByHashesResponse.fromJson(json);
  }
}

/// QuerySpotOrdersByHashesResponse is the response type for the
/// Query/SpotOrdersByHashes RPC method.
class QuerySpotOrdersByHashesResponse extends CosmosProtoMessage {
  final List<TrimmedSpotLimitOrder> orders;

  const QuerySpotOrdersByHashesResponse({this.orders = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [orders];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'orders': orders.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QuerySpotOrdersByHashesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySpotOrdersByHashesResponse(
      orders:
          (json.valueEnsureAsList<dynamic>(
                'orders',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<TrimmedSpotLimitOrder, Object>(
                  value: e,
                  parse:
                      (v) => TrimmedSpotLimitOrder.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QuerySpotOrdersByHashesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySpotOrdersByHashesResponse(
      orders:
          decode
              .getListOfBytes(1)
              .map((b) => TrimmedSpotLimitOrder.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QuerySpotOrdersByHashesResponse;
}

/// QueryTraderSpotOrdersRequest is the request type for the
/// Query/TraderSpotOrders RPC method.
class QueryTraderSpotOrdersRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTraderSpotOrdersResponse> {
  /// Market ID for the market
  final String? marketId;

  /// SubaccountID of the trader
  final String? subaccountId;

  const QueryTraderSpotOrdersRequest({this.marketId, this.subaccountId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/injective/exchange/v2/spot/orders/{market_id}/{subaccount_id}",
        ),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/injective/exchange/v2/spot/transient_orders/{market_id}/{subaccount_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [marketId, subaccountId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'market_id': marketId, 'subaccount_id': subaccountId};
  }

  factory QueryTraderSpotOrdersRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTraderSpotOrdersRequest(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryTraderSpotOrdersRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTraderSpotOrdersRequest(
      marketId: decode.getString<String?>(1),
      subaccountId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2QueryTraderSpotOrdersRequest;
  @override
  QueryTraderSpotOrdersResponse onQueryResponse(List<int> bytes) {
    return QueryTraderSpotOrdersResponse.deserialize(bytes);
  }

  @override
  QueryTraderSpotOrdersResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryTraderSpotOrdersResponse.fromJson(json);
  }
}

/// QueryAccountAddressSpotOrdersRequest is the request type for the
/// Query/AccountAddressSpotOrders RPC method.
class QueryAccountAddressSpotOrdersRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAccountAddressSpotOrdersResponse> {
  /// Market ID for the market
  final String? marketId;

  /// Account address of the trader
  final String? accountAddress;

  const QueryAccountAddressSpotOrdersRequest({
    this.marketId,
    this.accountAddress,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/injective/exchange/v2/spot/orders/{market_id}/account/{account_address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [marketId, accountAddress];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'market_id': marketId, 'account_address': accountAddress};
  }

  factory QueryAccountAddressSpotOrdersRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAccountAddressSpotOrdersRequest(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      accountAddress: json.valueAsString<String?>(
        'account_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryAccountAddressSpotOrdersRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAccountAddressSpotOrdersRequest(
      marketId: decode.getString<String?>(1),
      accountAddress: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryAccountAddressSpotOrdersRequest;
  @override
  QueryAccountAddressSpotOrdersResponse onQueryResponse(List<int> bytes) {
    return QueryAccountAddressSpotOrdersResponse.deserialize(bytes);
  }

  @override
  QueryAccountAddressSpotOrdersResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryAccountAddressSpotOrdersResponse.fromJson(json);
  }
}

class TrimmedSpotLimitOrder extends CosmosProtoMessage {
  /// price of the order (in human readable format)
  final String? price;

  /// quantity of the order (in human readable format)
  final String? quantity;

  /// the amount of the quantity remaining fillable (in human readable format)
  final String? fillable;

  /// true if the order is a buy
  final bool? isBuy;

  /// the order hash (optional)
  final String? orderHash;

  /// the client order ID (optional)
  final String? cid;

  const TrimmedSpotLimitOrder({
    this.price,
    this.quantity,
    this.fillable,
    this.isBuy,
    this.orderHash,
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
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.bool(4),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.string(6),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    price,
    quantity,
    fillable,
    isBuy,
    orderHash,
    cid,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'price': price,
      'quantity': quantity,
      'fillable': fillable,
      'isBuy': isBuy,
      'order_hash': orderHash,
      'cid': cid,
    };
  }

  factory TrimmedSpotLimitOrder.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return TrimmedSpotLimitOrder(
      price: json.valueAsString<String?>(
        'price',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      quantity: json.valueAsString<String?>(
        'quantity',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      fillable: json.valueAsString<String?>(
        'fillable',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      isBuy: json.valueAsBool<bool?>(
        'isBuy',
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
    );
  }

  factory TrimmedSpotLimitOrder.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TrimmedSpotLimitOrder(
      price: decode.getString<String?>(1),
      quantity: decode.getString<String?>(2),
      fillable: decode.getString<String?>(3),
      isBuy: decode.getBool<bool?>(4),
      orderHash: decode.getString<String?>(5),
      cid: decode.getString<String?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2TrimmedSpotLimitOrder;
}

/// QueryTraderSpotOrdersResponse is the response type for the
/// Query/TraderSpotOrders RPC method.
class QueryTraderSpotOrdersResponse extends CosmosProtoMessage {
  final List<TrimmedSpotLimitOrder> orders;

  const QueryTraderSpotOrdersResponse({this.orders = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [orders];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'orders': orders.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QueryTraderSpotOrdersResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTraderSpotOrdersResponse(
      orders:
          (json.valueEnsureAsList<dynamic>(
                'orders',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<TrimmedSpotLimitOrder, Object>(
                  value: e,
                  parse:
                      (v) => TrimmedSpotLimitOrder.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryTraderSpotOrdersResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTraderSpotOrdersResponse(
      orders:
          decode
              .getListOfBytes(1)
              .map((b) => TrimmedSpotLimitOrder.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryTraderSpotOrdersResponse;
}

/// QueryAccountAddressSpotOrdersResponse is the response type for the
/// Query/AccountAddressSpotOrders RPC method.
class QueryAccountAddressSpotOrdersResponse extends CosmosProtoMessage {
  final List<TrimmedSpotLimitOrder> orders;

  const QueryAccountAddressSpotOrdersResponse({this.orders = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [orders];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'orders': orders.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QueryAccountAddressSpotOrdersResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAccountAddressSpotOrdersResponse(
      orders:
          (json.valueEnsureAsList<dynamic>(
                'orders',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<TrimmedSpotLimitOrder, Object>(
                  value: e,
                  parse:
                      (v) => TrimmedSpotLimitOrder.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryAccountAddressSpotOrdersResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAccountAddressSpotOrdersResponse(
      orders:
          decode
              .getListOfBytes(1)
              .map((b) => TrimmedSpotLimitOrder.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryAccountAddressSpotOrdersResponse;
}

/// QuerySpotMidPriceAndTOBRequest is the request type for the
/// Query/SpotMidPriceAndTOB RPC method.
class QuerySpotMidPriceAndTOBRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySpotMidPriceAndTOBResponse> {
  /// Market ID for the market
  final String? marketId;

  const QuerySpotMidPriceAndTOBRequest({this.marketId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/spot/mid_price_and_tob/{market_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [marketId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'market_id': marketId};
  }

  factory QuerySpotMidPriceAndTOBRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySpotMidPriceAndTOBRequest(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QuerySpotMidPriceAndTOBRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySpotMidPriceAndTOBRequest(
      marketId: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QuerySpotMidPriceAndTOBRequest;
  @override
  QuerySpotMidPriceAndTOBResponse onQueryResponse(List<int> bytes) {
    return QuerySpotMidPriceAndTOBResponse.deserialize(bytes);
  }

  @override
  QuerySpotMidPriceAndTOBResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QuerySpotMidPriceAndTOBResponse.fromJson(json);
  }
}

/// QuerySpotMidPriceAndTOBResponse is the response type for the
/// Query/SpotMidPriceAndTOB RPC method.
class QuerySpotMidPriceAndTOBResponse extends CosmosProtoMessage {
  /// mid price of the market (in human readable format)
  final String? midPrice;

  /// best buy price of the market (in human readable format)
  final String? bestBuyPrice;

  /// best sell price of the market
  final String? bestSellPrice;

  const QuerySpotMidPriceAndTOBResponse({
    this.midPrice,
    this.bestBuyPrice,
    this.bestSellPrice,
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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [midPrice, bestBuyPrice, bestSellPrice];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'mid_price': midPrice,
      'best_buy_price': bestBuyPrice,
      'best_sell_price': bestSellPrice,
    };
  }

  factory QuerySpotMidPriceAndTOBResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySpotMidPriceAndTOBResponse(
      midPrice: json.valueAsString<String?>(
        'mid_price',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      bestBuyPrice: json.valueAsString<String?>(
        'best_buy_price',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      bestSellPrice: json.valueAsString<String?>(
        'best_sell_price',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QuerySpotMidPriceAndTOBResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySpotMidPriceAndTOBResponse(
      midPrice: decode.getString<String?>(1),
      bestBuyPrice: decode.getString<String?>(2),
      bestSellPrice: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QuerySpotMidPriceAndTOBResponse;
}

/// QueryDerivativeMidPriceAndTOBRequest is the request type for the
/// Query/GetDerivativeMidPriceAndTOB RPC method.
class QueryDerivativeMidPriceAndTOBRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDerivativeMidPriceAndTOBResponse> {
  /// Market ID for the market
  final String? marketId;

  const QueryDerivativeMidPriceAndTOBRequest({this.marketId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/injective/exchange/v2/derivative/mid_price_and_tob/{market_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [marketId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'market_id': marketId};
  }

  factory QueryDerivativeMidPriceAndTOBRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryDerivativeMidPriceAndTOBRequest(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryDerivativeMidPriceAndTOBRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDerivativeMidPriceAndTOBRequest(
      marketId: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryDerivativeMidPriceAndTOBRequest;
  @override
  QueryDerivativeMidPriceAndTOBResponse onQueryResponse(List<int> bytes) {
    return QueryDerivativeMidPriceAndTOBResponse.deserialize(bytes);
  }

  @override
  QueryDerivativeMidPriceAndTOBResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryDerivativeMidPriceAndTOBResponse.fromJson(json);
  }
}

/// QueryDerivativeMidPriceAndTOBResponse is the response type for the
/// Query/GetDerivativeMidPriceAndTOB RPC method.
class QueryDerivativeMidPriceAndTOBResponse extends CosmosProtoMessage {
  /// mid price of the market
  final String? midPrice;

  /// best buy price of the market
  final String? bestBuyPrice;

  /// best sell price of the market
  final String? bestSellPrice;

  const QueryDerivativeMidPriceAndTOBResponse({
    this.midPrice,
    this.bestBuyPrice,
    this.bestSellPrice,
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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [midPrice, bestBuyPrice, bestSellPrice];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'mid_price': midPrice,
      'best_buy_price': bestBuyPrice,
      'best_sell_price': bestSellPrice,
    };
  }

  factory QueryDerivativeMidPriceAndTOBResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryDerivativeMidPriceAndTOBResponse(
      midPrice: json.valueAsString<String?>(
        'mid_price',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      bestBuyPrice: json.valueAsString<String?>(
        'best_buy_price',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      bestSellPrice: json.valueAsString<String?>(
        'best_sell_price',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryDerivativeMidPriceAndTOBResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDerivativeMidPriceAndTOBResponse(
      midPrice: decode.getString<String?>(1),
      bestBuyPrice: decode.getString<String?>(2),
      bestSellPrice: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryDerivativeMidPriceAndTOBResponse;
}

/// QueryDerivativeOrderbookRequest is the request type for the
/// Query/DerivativeOrderbook RPC method.
class QueryDerivativeOrderbookRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDerivativeOrderbookResponse> {
  /// Market ID for the market
  final String? marketId;

  final BigInt? limit;

  final String? limitCumulativeNotional;

  const QueryDerivativeOrderbookRequest({
    this.marketId,
    this.limit,
    this.limitCumulativeNotional,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/derivative/orderbook/{market_id}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [marketId, limit, limitCumulativeNotional];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'market_id': marketId,
      'limit': config.encodeBigint(limit),
      'limit_cumulative_notional': limitCumulativeNotional,
    };
  }

  factory QueryDerivativeOrderbookRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryDerivativeOrderbookRequest(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      limit: json.valueAsBigInt<BigInt?>(
        'limit',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      limitCumulativeNotional: json.valueAsString<String?>(
        'limit_cumulative_notional',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryDerivativeOrderbookRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDerivativeOrderbookRequest(
      marketId: decode.getString<String?>(1),
      limit: decode.getBigInt<BigInt?>(2),
      limitCumulativeNotional: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryDerivativeOrderbookRequest;
  @override
  QueryDerivativeOrderbookResponse onQueryResponse(List<int> bytes) {
    return QueryDerivativeOrderbookResponse.deserialize(bytes);
  }

  @override
  QueryDerivativeOrderbookResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryDerivativeOrderbookResponse.fromJson(json);
  }
}

/// QueryDerivativeOrderbookResponse is the response type for the
/// Query/DerivativeOrderbook RPC method.
class QueryDerivativeOrderbookResponse extends CosmosProtoMessage {
  final List<injective_exchange_v2_exchange.Level> buysPriceLevel;

  final List<injective_exchange_v2_exchange.Level> sellsPriceLevel;

  /// the current orderbook sequence number
  final BigInt? seq;

  const QueryDerivativeOrderbookResponse({
    this.buysPriceLevel = const [],
    this.sellsPriceLevel = const [],
    this.seq,
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
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.uint64(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [buysPriceLevel, sellsPriceLevel, seq];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'buys_price_level':
          buysPriceLevel.map((e) => config.encodeMessage(e)).toList(),
      'sells_price_level':
          sellsPriceLevel.map((e) => config.encodeMessage(e)).toList(),
      'seq': config.encodeBigint(seq),
    };
  }

  factory QueryDerivativeOrderbookResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryDerivativeOrderbookResponse(
      buysPriceLevel:
          (json.valueEnsureAsList<dynamic>(
                'buys_price_level',
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
      sellsPriceLevel:
          (json.valueEnsureAsList<dynamic>(
                'sells_price_level',
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
      seq: json.valueAsBigInt<BigInt?>(
        'seq',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryDerivativeOrderbookResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDerivativeOrderbookResponse(
      buysPriceLevel:
          decode
              .getListOfBytes(1)
              .map((b) => injective_exchange_v2_exchange.Level.deserialize(b))
              .toList(),
      sellsPriceLevel:
          decode
              .getListOfBytes(2)
              .map((b) => injective_exchange_v2_exchange.Level.deserialize(b))
              .toList(),
      seq: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryDerivativeOrderbookResponse;
}

/// QueryTraderDerivativeOrdersRequest is the request type for the
/// Query/TraderDerivativeOrders RPC method.
class QueryTraderDerivativeOrdersRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTraderDerivativeOrdersResponse> {
  /// Market ID for the market
  final String? marketId;

  /// SubaccountID of the trader
  final String? subaccountId;

  const QueryTraderDerivativeOrdersRequest({this.marketId, this.subaccountId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/injective/exchange/v2/derivative/orders/{market_id}/{subaccount_id}",
        ),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/injective/exchange/v2/derivative/transient_orders/{market_id}/{subaccount_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [marketId, subaccountId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'market_id': marketId, 'subaccount_id': subaccountId};
  }

  factory QueryTraderDerivativeOrdersRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTraderDerivativeOrdersRequest(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryTraderDerivativeOrdersRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTraderDerivativeOrdersRequest(
      marketId: decode.getString<String?>(1),
      subaccountId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryTraderDerivativeOrdersRequest;
  @override
  QueryTraderDerivativeOrdersResponse onQueryResponse(List<int> bytes) {
    return QueryTraderDerivativeOrdersResponse.deserialize(bytes);
  }

  @override
  QueryTraderDerivativeOrdersResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryTraderDerivativeOrdersResponse.fromJson(json);
  }
}

/// QueryAccountAddressSpotOrdersRequest is the request type for the
/// Query/AccountAddressDerivativeOrders RPC method.
class QueryAccountAddressDerivativeOrdersRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAccountAddressDerivativeOrdersResponse> {
  /// Market ID for the market
  final String? marketId;

  /// Account address of the trader
  final String? accountAddress;

  const QueryAccountAddressDerivativeOrdersRequest({
    this.marketId,
    this.accountAddress,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/injective/exchange/v2/derivative/orders/{market_id}/account/{account_address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [marketId, accountAddress];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'market_id': marketId, 'account_address': accountAddress};
  }

  factory QueryAccountAddressDerivativeOrdersRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAccountAddressDerivativeOrdersRequest(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      accountAddress: json.valueAsString<String?>(
        'account_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryAccountAddressDerivativeOrdersRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAccountAddressDerivativeOrdersRequest(
      marketId: decode.getString<String?>(1),
      accountAddress: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryAccountAddressDerivativeOrdersRequest;
  @override
  QueryAccountAddressDerivativeOrdersResponse onQueryResponse(List<int> bytes) {
    return QueryAccountAddressDerivativeOrdersResponse.deserialize(bytes);
  }

  @override
  QueryAccountAddressDerivativeOrdersResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryAccountAddressDerivativeOrdersResponse.fromJson(json);
  }
}

class TrimmedDerivativeLimitOrder extends CosmosProtoMessage {
  /// price of the order (in human readable format)
  final String? price;

  /// quantity of the order (in human readable format)
  final String? quantity;

  /// margin of the order (in human readable format)
  final String? margin;

  /// the amount of the quantity remaining fillable (in human readable format)
  final String? fillable;

  /// true if the order is a buy
  final bool? isBuy;

  /// the order hash (optional)
  final String? orderHash;

  /// the client order ID (optional)
  final String? cid;

  const TrimmedDerivativeLimitOrder({
    this.price,
    this.quantity,
    this.margin,
    this.fillable,
    this.isBuy,
    this.orderHash,
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
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.bool(5, options: const []),
        ProtoFieldConfig.string(6),
        ProtoFieldConfig.string(7),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    price,
    quantity,
    margin,
    fillable,
    isBuy,
    orderHash,
    cid,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'price': price,
      'quantity': quantity,
      'margin': margin,
      'fillable': fillable,
      'isBuy': isBuy,
      'order_hash': orderHash,
      'cid': cid,
    };
  }

  factory TrimmedDerivativeLimitOrder.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return TrimmedDerivativeLimitOrder(
      price: json.valueAsString<String?>(
        'price',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      quantity: json.valueAsString<String?>(
        'quantity',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      margin: json.valueAsString<String?>(
        'margin',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      fillable: json.valueAsString<String?>(
        'fillable',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      isBuy: json.valueAsBool<bool?>(
        'isBuy',
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
    );
  }

  factory TrimmedDerivativeLimitOrder.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TrimmedDerivativeLimitOrder(
      price: decode.getString<String?>(1),
      quantity: decode.getString<String?>(2),
      margin: decode.getString<String?>(3),
      fillable: decode.getString<String?>(4),
      isBuy: decode.getBool<bool?>(5),
      orderHash: decode.getString<String?>(6),
      cid: decode.getString<String?>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2TrimmedDerivativeLimitOrder;
}

/// QueryTraderDerivativeOrdersResponse is the response type for the
/// Query/TraderDerivativeOrders RPC method.
class QueryTraderDerivativeOrdersResponse extends CosmosProtoMessage {
  final List<TrimmedDerivativeLimitOrder> orders;

  const QueryTraderDerivativeOrdersResponse({this.orders = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [orders];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'orders': orders.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QueryTraderDerivativeOrdersResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTraderDerivativeOrdersResponse(
      orders:
          (json.valueEnsureAsList<dynamic>(
                'orders',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<TrimmedDerivativeLimitOrder, Object>(
                  value: e,
                  parse:
                      (v) => TrimmedDerivativeLimitOrder.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryTraderDerivativeOrdersResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTraderDerivativeOrdersResponse(
      orders:
          decode
              .getListOfBytes(1)
              .map((b) => TrimmedDerivativeLimitOrder.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryTraderDerivativeOrdersResponse;
}

/// QueryAccountAddressDerivativeOrdersResponse is the response type for the
/// Query/AccountAddressDerivativeOrders RPC method.
class QueryAccountAddressDerivativeOrdersResponse extends CosmosProtoMessage {
  final List<TrimmedDerivativeLimitOrder> orders;

  const QueryAccountAddressDerivativeOrdersResponse({this.orders = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [orders];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'orders': orders.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QueryAccountAddressDerivativeOrdersResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAccountAddressDerivativeOrdersResponse(
      orders:
          (json.valueEnsureAsList<dynamic>(
                'orders',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<TrimmedDerivativeLimitOrder, Object>(
                  value: e,
                  parse:
                      (v) => TrimmedDerivativeLimitOrder.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryAccountAddressDerivativeOrdersResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAccountAddressDerivativeOrdersResponse(
      orders:
          decode
              .getListOfBytes(1)
              .map((b) => TrimmedDerivativeLimitOrder.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryAccountAddressDerivativeOrdersResponse;
}

/// QueryTraderDerivativeOrdersRequest is the request type for the
/// Query/TraderDerivativeOrders RPC method.
class QueryDerivativeOrdersByHashesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDerivativeOrdersByHashesResponse> {
  /// Market ID for the market
  final String? marketId;

  /// SubaccountID of the trader
  final String? subaccountId;

  /// the order hashes
  final List<String> orderHashes;

  const QueryDerivativeOrdersByHashesRequest({
    this.marketId,
    this.subaccountId,
    this.orderHashes = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/injective/exchange/v2/derivative/orders_by_hashes/{market_id}/{subaccount_id}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [marketId, subaccountId, orderHashes];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'market_id': marketId,
      'subaccount_id': subaccountId,
      'order_hashes': orderHashes.map((e) => e).toList(),
    };
  }

  factory QueryDerivativeOrdersByHashesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryDerivativeOrdersByHashesRequest(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      orderHashes:
          (json.valueEnsureAsList<dynamic>(
            'order_hashes',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory QueryDerivativeOrdersByHashesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDerivativeOrdersByHashesRequest(
      marketId: decode.getString<String?>(1),
      subaccountId: decode.getString<String?>(2),
      orderHashes: decode.getListOrEmpty<String>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryDerivativeOrdersByHashesRequest;
  @override
  QueryDerivativeOrdersByHashesResponse onQueryResponse(List<int> bytes) {
    return QueryDerivativeOrdersByHashesResponse.deserialize(bytes);
  }

  @override
  QueryDerivativeOrdersByHashesResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryDerivativeOrdersByHashesResponse.fromJson(json);
  }
}

/// QueryDerivativeOrdersByHashesResponse is the response type for the
/// Query/DerivativeOrdersByHashes RPC method.
class QueryDerivativeOrdersByHashesResponse extends CosmosProtoMessage {
  final List<TrimmedDerivativeLimitOrder> orders;

  const QueryDerivativeOrdersByHashesResponse({this.orders = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [orders];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'orders': orders.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QueryDerivativeOrdersByHashesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryDerivativeOrdersByHashesResponse(
      orders:
          (json.valueEnsureAsList<dynamic>(
                'orders',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<TrimmedDerivativeLimitOrder, Object>(
                  value: e,
                  parse:
                      (v) => TrimmedDerivativeLimitOrder.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryDerivativeOrdersByHashesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDerivativeOrdersByHashesResponse(
      orders:
          decode
              .getListOfBytes(1)
              .map((b) => TrimmedDerivativeLimitOrder.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryDerivativeOrdersByHashesResponse;
}

/// QueryDerivativeMarketsRequest is the request type for the
/// Query/DerivativeMarkets RPC method.
class QueryDerivativeMarketsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDerivativeMarketsResponse> {
  /// Status of the market, for convenience it is set to string - not enum
  final String? status;

  /// Filter by market IDs
  final List<String> marketIds;

  /// Flag to return the markets mid price and top of the book buy and sell
  /// orders.
  final bool? withMidPriceAndTob;

  const QueryDerivativeMarketsRequest({
    this.status,
    this.marketIds = const [],
    this.withMidPriceAndTob,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/derivative/markets",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.bool(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [status, marketIds, withMidPriceAndTob];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'status': status,
      'market_ids': marketIds.map((e) => e).toList(),
      'with_mid_price_and_tob': withMidPriceAndTob,
    };
  }

  factory QueryDerivativeMarketsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryDerivativeMarketsRequest(
      status: json.valueAsString<String?>(
        'status',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      marketIds:
          (json.valueEnsureAsList<dynamic>(
            'market_ids',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      withMidPriceAndTob: json.valueAsBool<bool?>(
        'with_mid_price_and_tob',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryDerivativeMarketsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDerivativeMarketsRequest(
      status: decode.getString<String?>(1),
      marketIds: decode.getListOrEmpty<String>(2),
      withMidPriceAndTob: decode.getBool<bool?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryDerivativeMarketsRequest;
  @override
  QueryDerivativeMarketsResponse onQueryResponse(List<int> bytes) {
    return QueryDerivativeMarketsResponse.deserialize(bytes);
  }

  @override
  QueryDerivativeMarketsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryDerivativeMarketsResponse.fromJson(json);
  }
}

class PerpetualMarketState extends CosmosProtoMessage {
  final injective_exchange_v2_market.PerpetualMarketInfo? marketInfo;

  final injective_exchange_v2_market.PerpetualMarketFunding? fundingInfo;

  const PerpetualMarketState({this.marketInfo, this.fundingInfo});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [marketInfo, fundingInfo];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'market_info': config.encodeMessage(marketInfo),
      'funding_info': config.encodeMessage(fundingInfo),
    };
  }

  factory PerpetualMarketState.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return PerpetualMarketState(
      marketInfo: json
          .valueTo<injective_exchange_v2_market.PerpetualMarketInfo?, Object>(
            key: 'market_info',
            parse:
                (v) =>
                    injective_exchange_v2_market.PerpetualMarketInfo.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      fundingInfo: json.valueTo<
        injective_exchange_v2_market.PerpetualMarketFunding?,
        Object
      >(
        key: 'funding_info',
        parse:
            (v) => injective_exchange_v2_market.PerpetualMarketFunding.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory PerpetualMarketState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PerpetualMarketState(
      marketInfo: decode
          .messageTo<injective_exchange_v2_market.PerpetualMarketInfo?>(
            1,
            (b) =>
                injective_exchange_v2_market.PerpetualMarketInfo.deserialize(b),
          ),
      fundingInfo: decode
          .messageTo<injective_exchange_v2_market.PerpetualMarketFunding?>(
            2,
            (b) => injective_exchange_v2_market
                .PerpetualMarketFunding.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2PerpetualMarketState;
}

class FullDerivativeMarket extends CosmosProtoMessage {
  /// derivative market details
  final injective_exchange_v2_market.DerivativeMarket? market;

  /// perpetual market state or expiry futures market state
  /// perpetual market info
  final PerpetualMarketState? perpetualInfo;

  /// expiry futures market info
  final injective_exchange_v2_market.ExpiryFuturesMarketInfo? futuresInfo;

  /// mark price (in human readable format)
  final String? markPrice;

  /// mid_price_and_tob defines the mid price for this market and the best ask
  /// and bid orders
  final injective_exchange_v2_exchange.MidPriceAndTOB? midPriceAndTob;

  const FullDerivativeMarket({
    this.market,
    this.perpetualInfo,
    this.futuresInfo,
    this.markPrice,
    this.midPriceAndTob,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1),
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.message(3),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.message(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    market,
    perpetualInfo,
    futuresInfo,
    markPrice,
    midPriceAndTob,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'market': config.encodeMessage(market),
      'perpetual_info': config.encodeMessage(perpetualInfo),
      'futures_info': config.encodeMessage(futuresInfo),
      'mark_price': markPrice,
      'mid_price_and_tob': config.encodeMessage(midPriceAndTob),
    };
  }

  factory FullDerivativeMarket.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return FullDerivativeMarket(
      market: json
          .valueTo<injective_exchange_v2_market.DerivativeMarket?, Object>(
            key: 'market',
            parse:
                (v) => injective_exchange_v2_market.DerivativeMarket.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      perpetualInfo: json.valueTo<PerpetualMarketState?, Object>(
        key: 'perpetual_info',
        parse:
            (v) => PerpetualMarketState.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      futuresInfo: json.valueTo<
        injective_exchange_v2_market.ExpiryFuturesMarketInfo?,
        Object
      >(
        key: 'futures_info',
        parse:
            (v) =>
                injective_exchange_v2_market.ExpiryFuturesMarketInfo.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      markPrice: json.valueAsString<String?>(
        'mark_price',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      midPriceAndTob: json
          .valueTo<injective_exchange_v2_exchange.MidPriceAndTOB?, Object>(
            key: 'mid_price_and_tob',
            parse:
                (v) => injective_exchange_v2_exchange.MidPriceAndTOB.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory FullDerivativeMarket.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return FullDerivativeMarket(
      market: decode.messageTo<injective_exchange_v2_market.DerivativeMarket?>(
        1,
        (b) => injective_exchange_v2_market.DerivativeMarket.deserialize(b),
      ),
      perpetualInfo: decode.messageTo<PerpetualMarketState?>(
        2,
        (b) => PerpetualMarketState.deserialize(b),
      ),
      futuresInfo: decode
          .messageTo<injective_exchange_v2_market.ExpiryFuturesMarketInfo?>(
            3,
            (b) => injective_exchange_v2_market
                .ExpiryFuturesMarketInfo.deserialize(b),
          ),
      markPrice: decode.getString<String?>(4),
      midPriceAndTob: decode
          .messageTo<injective_exchange_v2_exchange.MidPriceAndTOB?>(
            5,
            (b) => injective_exchange_v2_exchange.MidPriceAndTOB.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2FullDerivativeMarket;
}

/// QueryDerivativeMarketsResponse is the response type for the
/// Query/DerivativeMarkets RPC method.
class QueryDerivativeMarketsResponse extends CosmosProtoMessage {
  final List<FullDerivativeMarket> markets;

  const QueryDerivativeMarketsResponse({this.markets = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [markets];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'markets': markets.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QueryDerivativeMarketsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryDerivativeMarketsResponse(
      markets:
          (json.valueEnsureAsList<dynamic>(
                'markets',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<FullDerivativeMarket, Object>(
                  value: e,
                  parse:
                      (v) => FullDerivativeMarket.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryDerivativeMarketsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDerivativeMarketsResponse(
      markets:
          decode
              .getListOfBytes(1)
              .map((b) => FullDerivativeMarket.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryDerivativeMarketsResponse;
}

/// QueryDerivativeMarketRequest is the request type for the
/// Query/DerivativeMarket RPC method.
class QueryDerivativeMarketRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDerivativeMarketResponse> {
  /// Market ID for the market
  final String? marketId;

  const QueryDerivativeMarketRequest({this.marketId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/derivative/markets/{market_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [marketId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'market_id': marketId};
  }

  factory QueryDerivativeMarketRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryDerivativeMarketRequest(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryDerivativeMarketRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDerivativeMarketRequest(marketId: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2QueryDerivativeMarketRequest;
  @override
  QueryDerivativeMarketResponse onQueryResponse(List<int> bytes) {
    return QueryDerivativeMarketResponse.deserialize(bytes);
  }

  @override
  QueryDerivativeMarketResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryDerivativeMarketResponse.fromJson(json);
  }
}

/// QueryDerivativeMarketResponse is the response type for the
/// Query/DerivativeMarket RPC method.
class QueryDerivativeMarketResponse extends CosmosProtoMessage {
  final FullDerivativeMarket? market;

  const QueryDerivativeMarketResponse({this.market});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [market];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'market': config.encodeMessage(market)};
  }

  factory QueryDerivativeMarketResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryDerivativeMarketResponse(
      market: json.valueTo<FullDerivativeMarket?, Object>(
        key: 'market',
        parse:
            (v) => FullDerivativeMarket.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryDerivativeMarketResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDerivativeMarketResponse(
      market: decode.messageTo<FullDerivativeMarket?>(
        1,
        (b) => FullDerivativeMarket.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryDerivativeMarketResponse;
}

/// QueryDerivativeMarketAddressRequest is the request type for the
/// Query/DerivativeMarketAddress RPC method.
class QueryDerivativeMarketAddressRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDerivativeMarketAddressResponse> {
  /// Market ID for the market
  final String? marketId;

  const QueryDerivativeMarketAddressRequest({this.marketId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/derivative/market_address/{market_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [marketId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'market_id': marketId};
  }

  factory QueryDerivativeMarketAddressRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryDerivativeMarketAddressRequest(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryDerivativeMarketAddressRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDerivativeMarketAddressRequest(
      marketId: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryDerivativeMarketAddressRequest;
  @override
  QueryDerivativeMarketAddressResponse onQueryResponse(List<int> bytes) {
    return QueryDerivativeMarketAddressResponse.deserialize(bytes);
  }

  @override
  QueryDerivativeMarketAddressResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryDerivativeMarketAddressResponse.fromJson(json);
  }
}

/// QueryDerivativeMarketAddressResponse is the response type for the
/// Query/DerivativeMarketAddress RPC method.
class QueryDerivativeMarketAddressResponse extends CosmosProtoMessage {
  /// address for the market
  final String? address;

  /// subaccountID for the market
  final String? subaccountId;

  const QueryDerivativeMarketAddressResponse({this.address, this.subaccountId});

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
  List<Object?> get protoValues => [address, subaccountId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'address': address, 'subaccount_id': subaccountId};
  }

  factory QueryDerivativeMarketAddressResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryDerivativeMarketAddressResponse(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryDerivativeMarketAddressResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDerivativeMarketAddressResponse(
      address: decode.getString<String?>(1),
      subaccountId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryDerivativeMarketAddressResponse;
}

/// QuerySubaccountTradeNonceRequest is the request type for the
/// Query/SubaccountTradeNonce RPC method.
class QuerySubaccountTradeNonceRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySubaccountTradeNonceResponse> {
  /// the subaccount ID
  final String? subaccountId;

  const QuerySubaccountTradeNonceRequest({this.subaccountId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/exchange/{subaccount_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [subaccountId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'subaccount_id': subaccountId};
  }

  factory QuerySubaccountTradeNonceRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySubaccountTradeNonceRequest(
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QuerySubaccountTradeNonceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySubaccountTradeNonceRequest(
      subaccountId: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QuerySubaccountTradeNonceRequest;
  @override
  QuerySubaccountTradeNonceResponse onQueryResponse(List<int> bytes) {
    return QuerySubaccountTradeNonceResponse.deserialize(bytes);
  }

  @override
  QuerySubaccountTradeNonceResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QuerySubaccountTradeNonceResponse.fromJson(json);
  }
}

/// QueryPositionsInMarketRequest is the request type for the
/// Query/PositionsInMarket RPC method.
class QueryPositionsInMarketRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryPositionsInMarketResponse> {
  final String? marketId;

  const QueryPositionsInMarketRequest({this.marketId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/positions_in_market/{market_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [marketId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'market_id': marketId};
  }

  factory QueryPositionsInMarketRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPositionsInMarketRequest(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryPositionsInMarketRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPositionsInMarketRequest(
      marketId: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryPositionsInMarketRequest;
  @override
  QueryPositionsInMarketResponse onQueryResponse(List<int> bytes) {
    return QueryPositionsInMarketResponse.deserialize(bytes);
  }

  @override
  QueryPositionsInMarketResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryPositionsInMarketResponse.fromJson(json);
  }
}

/// QueryPositionsInMarketResponse is the response type for the
/// Query/PositionsInMarket RPC method.
class QueryPositionsInMarketResponse extends CosmosProtoMessage {
  final List<injective_exchange_v2_exchange.DerivativePosition> state;

  const QueryPositionsInMarketResponse({this.state = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
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
  List<Object?> get protoValues => [state];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'state': state.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QueryPositionsInMarketResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPositionsInMarketResponse(
      state:
          (json.valueEnsureAsList<dynamic>(
                'state',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_exchange.DerivativePosition,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_exchange
                          .DerivativePosition.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryPositionsInMarketResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPositionsInMarketResponse(
      state:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_exchange_v2_exchange
                    .DerivativePosition.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryPositionsInMarketResponse;
}

/// QuerySubaccountPositionsRequest is the request type for the
/// Query/SubaccountPositions RPC method.
class QuerySubaccountPositionsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySubaccountPositionsResponse> {
  /// the subaccount ID
  final String? subaccountId;

  const QuerySubaccountPositionsRequest({this.subaccountId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/subaccount_positions/{subaccount_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [subaccountId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'subaccount_id': subaccountId};
  }

  factory QuerySubaccountPositionsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySubaccountPositionsRequest(
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QuerySubaccountPositionsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySubaccountPositionsRequest(
      subaccountId: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QuerySubaccountPositionsRequest;
  @override
  QuerySubaccountPositionsResponse onQueryResponse(List<int> bytes) {
    return QuerySubaccountPositionsResponse.deserialize(bytes);
  }

  @override
  QuerySubaccountPositionsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QuerySubaccountPositionsResponse.fromJson(json);
  }
}

/// QuerySubaccountPositionInMarketRequest is the request type for the
/// Query/SubaccountPositionInMarket RPC method.
class QuerySubaccountPositionInMarketRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySubaccountPositionInMarketResponse> {
  /// the subaccount ID
  final String? subaccountId;

  /// the market ID
  final String? marketId;

  const QuerySubaccountPositionInMarketRequest({
    this.subaccountId,
    this.marketId,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/positions/{subaccount_id}/{market_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [subaccountId, marketId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'subaccount_id': subaccountId, 'market_id': marketId};
  }

  factory QuerySubaccountPositionInMarketRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySubaccountPositionInMarketRequest(
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QuerySubaccountPositionInMarketRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySubaccountPositionInMarketRequest(
      subaccountId: decode.getString<String?>(1),
      marketId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QuerySubaccountPositionInMarketRequest;
  @override
  QuerySubaccountPositionInMarketResponse onQueryResponse(List<int> bytes) {
    return QuerySubaccountPositionInMarketResponse.deserialize(bytes);
  }

  @override
  QuerySubaccountPositionInMarketResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QuerySubaccountPositionInMarketResponse.fromJson(json);
  }
}

/// QuerySubaccountEffectivePositionInMarketRequest is the request type for the
/// Query/SubaccountEffectivePositionInMarket RPC method.
class QuerySubaccountEffectivePositionInMarketRequest extends CosmosProtoMessage
    with
        ICosmosProtoQueryMessage<
          QuerySubaccountEffectivePositionInMarketResponse
        > {
  /// the subaccount ID
  final String? subaccountId;

  /// the market ID
  final String? marketId;

  const QuerySubaccountEffectivePositionInMarketRequest({
    this.subaccountId,
    this.marketId,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/injective/exchange/v2/effective_positions/{subaccount_id}/{market_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [subaccountId, marketId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'subaccount_id': subaccountId, 'market_id': marketId};
  }

  factory QuerySubaccountEffectivePositionInMarketRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySubaccountEffectivePositionInMarketRequest(
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QuerySubaccountEffectivePositionInMarketRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySubaccountEffectivePositionInMarketRequest(
      subaccountId: decode.getString<String?>(1),
      marketId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QuerySubaccountEffectivePositionInMarketRequest;
  @override
  QuerySubaccountEffectivePositionInMarketResponse onQueryResponse(
    List<int> bytes,
  ) {
    return QuerySubaccountEffectivePositionInMarketResponse.deserialize(bytes);
  }

  @override
  QuerySubaccountEffectivePositionInMarketResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QuerySubaccountEffectivePositionInMarketResponse.fromJson(json);
  }
}

/// QuerySubaccountOrderMetadataRequest is the request type for the
/// Query/SubaccountOrderMetadata RPC method.
class QuerySubaccountOrderMetadataRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySubaccountOrderMetadataResponse> {
  /// the subaccount ID
  final String? subaccountId;

  const QuerySubaccountOrderMetadataRequest({this.subaccountId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/order_metadata/{subaccount_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [subaccountId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'subaccount_id': subaccountId};
  }

  factory QuerySubaccountOrderMetadataRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySubaccountOrderMetadataRequest(
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QuerySubaccountOrderMetadataRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySubaccountOrderMetadataRequest(
      subaccountId: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QuerySubaccountOrderMetadataRequest;
  @override
  QuerySubaccountOrderMetadataResponse onQueryResponse(List<int> bytes) {
    return QuerySubaccountOrderMetadataResponse.deserialize(bytes);
  }

  @override
  QuerySubaccountOrderMetadataResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QuerySubaccountOrderMetadataResponse.fromJson(json);
  }
}

/// QuerySubaccountPositionsResponse is the response type for the
/// Query/SubaccountPositions RPC method.
class QuerySubaccountPositionsResponse extends CosmosProtoMessage {
  final List<injective_exchange_v2_exchange.DerivativePosition> state;

  const QuerySubaccountPositionsResponse({this.state = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
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
  List<Object?> get protoValues => [state];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'state': state.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QuerySubaccountPositionsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySubaccountPositionsResponse(
      state:
          (json.valueEnsureAsList<dynamic>(
                'state',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_exchange.DerivativePosition,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_exchange
                          .DerivativePosition.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QuerySubaccountPositionsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySubaccountPositionsResponse(
      state:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_exchange_v2_exchange
                    .DerivativePosition.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QuerySubaccountPositionsResponse;
}

/// QuerySubaccountPositionInMarketResponse is the response type for the
/// Query/SubaccountPositionInMarket RPC method.
class QuerySubaccountPositionInMarketResponse extends CosmosProtoMessage {
  final injective_exchange_v2_exchange.Position? state;

  /// The risk mode of the subaccount (ISOLATED or CROSS).
  /// For CROSS mode, the position's margin is an accounting value; actual
  /// collateral is pooled. Use CrossMarginPoolSnapshot for pool-level health.
  final injective_exchange_v2_exchange.RiskMode? riskMode;

  const QuerySubaccountPositionInMarketResponse({this.state, this.riskMode});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.enumType(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [state, riskMode];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'state': config.encodeMessage(state),
      'risk_mode': config.encodeEnum(riskMode),
    };
  }

  factory QuerySubaccountPositionInMarketResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySubaccountPositionInMarketResponse(
      state: json.valueTo<injective_exchange_v2_exchange.Position?, Object>(
        key: 'state',
        parse:
            (v) => injective_exchange_v2_exchange.Position.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      riskMode: json.valueTo<injective_exchange_v2_exchange.RiskMode?, Object?>(
        key: 'risk_mode',
        parse: (v) => injective_exchange_v2_exchange.RiskMode.from(v),
      ),
    );
  }

  factory QuerySubaccountPositionInMarketResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySubaccountPositionInMarketResponse(
      state: decode.messageTo<injective_exchange_v2_exchange.Position?>(
        1,
        (b) => injective_exchange_v2_exchange.Position.deserialize(b),
      ),
      riskMode: decode.getEnum<injective_exchange_v2_exchange.RiskMode?>(
        2,
        injective_exchange_v2_exchange.RiskMode.values,
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QuerySubaccountPositionInMarketResponse;
}

class EffectivePosition extends CosmosProtoMessage {
  /// whether the position is long or short
  final bool? isLong;

  /// the quantity of the position (in human readable format)
  final String? quantity;

  /// the entry price of the position (in human readable format)
  final String? entryPrice;

  /// the effective margin of the position (in human readable format)
  final String? effectiveMargin;

  const EffectivePosition({
    this.isLong,
    this.quantity,
    this.entryPrice,
    this.effectiveMargin,
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
    quantity,
    entryPrice,
    effectiveMargin,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'is_long': isLong,
      'quantity': quantity,
      'entry_price': entryPrice,
      'effective_margin': effectiveMargin,
    };
  }

  factory EffectivePosition.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return EffectivePosition(
      isLong: json.valueAsBool<bool?>(
        'is_long',
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
      effectiveMargin: json.valueAsString<String?>(
        'effective_margin',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory EffectivePosition.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return EffectivePosition(
      isLong: decode.getBool<bool?>(1),
      quantity: decode.getString<String?>(2),
      entryPrice: decode.getString<String?>(3),
      effectiveMargin: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2EffectivePosition;
}

/// QuerySubaccountEffectivePositionInMarketResponse is the response type for the
/// Query/SubaccountEffectivePositionInMarket RPC method.
class QuerySubaccountEffectivePositionInMarketResponse
    extends CosmosProtoMessage {
  final EffectivePosition? state;

  /// The risk mode of the subaccount (ISOLATED or CROSS).
  /// For CROSS mode, effective_margin reflects position value but liquidation
  /// is determined at pool level. Use CrossMarginPoolSnapshot for pool health.
  final injective_exchange_v2_exchange.RiskMode? riskMode;

  const QuerySubaccountEffectivePositionInMarketResponse({
    this.state,
    this.riskMode,
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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [state, riskMode];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'state': config.encodeMessage(state),
      'risk_mode': config.encodeEnum(riskMode),
    };
  }

  factory QuerySubaccountEffectivePositionInMarketResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySubaccountEffectivePositionInMarketResponse(
      state: json.valueTo<EffectivePosition?, Object>(
        key: 'state',
        parse:
            (v) => EffectivePosition.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      riskMode: json.valueTo<injective_exchange_v2_exchange.RiskMode?, Object?>(
        key: 'risk_mode',
        parse: (v) => injective_exchange_v2_exchange.RiskMode.from(v),
      ),
    );
  }

  factory QuerySubaccountEffectivePositionInMarketResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySubaccountEffectivePositionInMarketResponse(
      state: decode.messageTo<EffectivePosition?>(
        1,
        (b) => EffectivePosition.deserialize(b),
      ),
      riskMode: decode.getEnum<injective_exchange_v2_exchange.RiskMode?>(
        2,
        injective_exchange_v2_exchange.RiskMode.values,
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QuerySubaccountEffectivePositionInMarketResponse;
}

/// QueryPerpetualMarketInfoRequest is the request type for the
/// Query/PerpetualMarketInfo RPC method.
class QueryPerpetualMarketInfoRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryPerpetualMarketInfoResponse> {
  final String? marketId;

  const QueryPerpetualMarketInfoRequest({this.marketId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/perpetual_market_info/{market_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [marketId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'market_id': marketId};
  }

  factory QueryPerpetualMarketInfoRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPerpetualMarketInfoRequest(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryPerpetualMarketInfoRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPerpetualMarketInfoRequest(
      marketId: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryPerpetualMarketInfoRequest;
  @override
  QueryPerpetualMarketInfoResponse onQueryResponse(List<int> bytes) {
    return QueryPerpetualMarketInfoResponse.deserialize(bytes);
  }

  @override
  QueryPerpetualMarketInfoResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryPerpetualMarketInfoResponse.fromJson(json);
  }
}

/// QueryPerpetualMarketInfoResponse is the response type for the
/// Query/PerpetualMarketInfo RPC method.
class QueryPerpetualMarketInfoResponse extends CosmosProtoMessage {
  final injective_exchange_v2_market.PerpetualMarketInfo? info;

  const QueryPerpetualMarketInfoResponse({this.info});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [info];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'info': config.encodeMessage(info)};
  }

  factory QueryPerpetualMarketInfoResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPerpetualMarketInfoResponse(
      info: json
          .valueTo<injective_exchange_v2_market.PerpetualMarketInfo?, Object>(
            key: 'info',
            parse:
                (v) =>
                    injective_exchange_v2_market.PerpetualMarketInfo.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory QueryPerpetualMarketInfoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPerpetualMarketInfoResponse(
      info: decode.messageTo<injective_exchange_v2_market.PerpetualMarketInfo?>(
        1,
        (b) => injective_exchange_v2_market.PerpetualMarketInfo.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryPerpetualMarketInfoResponse;
}

/// QueryExpiryFuturesMarketInfoRequest is the request type for the Query/
/// ExpiryFuturesMarketInfo RPC method.
class QueryExpiryFuturesMarketInfoRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryExpiryFuturesMarketInfoResponse> {
  final String? marketId;

  const QueryExpiryFuturesMarketInfoRequest({this.marketId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/expiry_market_info/{market_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [marketId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'market_id': marketId};
  }

  factory QueryExpiryFuturesMarketInfoRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryExpiryFuturesMarketInfoRequest(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryExpiryFuturesMarketInfoRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryExpiryFuturesMarketInfoRequest(
      marketId: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryExpiryFuturesMarketInfoRequest;
  @override
  QueryExpiryFuturesMarketInfoResponse onQueryResponse(List<int> bytes) {
    return QueryExpiryFuturesMarketInfoResponse.deserialize(bytes);
  }

  @override
  QueryExpiryFuturesMarketInfoResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryExpiryFuturesMarketInfoResponse.fromJson(json);
  }
}

/// QueryExpiryFuturesMarketInfoResponse is the response type for the Query/
/// ExpiryFuturesMarketInfo RPC method.
class QueryExpiryFuturesMarketInfoResponse extends CosmosProtoMessage {
  final injective_exchange_v2_market.ExpiryFuturesMarketInfo? info;

  const QueryExpiryFuturesMarketInfoResponse({this.info});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [info];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'info': config.encodeMessage(info)};
  }

  factory QueryExpiryFuturesMarketInfoResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryExpiryFuturesMarketInfoResponse(
      info: json.valueTo<
        injective_exchange_v2_market.ExpiryFuturesMarketInfo?,
        Object
      >(
        key: 'info',
        parse:
            (v) =>
                injective_exchange_v2_market.ExpiryFuturesMarketInfo.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryExpiryFuturesMarketInfoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryExpiryFuturesMarketInfoResponse(
      info: decode
          .messageTo<injective_exchange_v2_market.ExpiryFuturesMarketInfo?>(
            1,
            (b) => injective_exchange_v2_market
                .ExpiryFuturesMarketInfo.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryExpiryFuturesMarketInfoResponse;
}

/// QueryPerpetualMarketFundingRequest is the request type for the
/// Query/PerpetualMarketFunding RPC method.
class QueryPerpetualMarketFundingRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryPerpetualMarketFundingResponse> {
  final String? marketId;

  const QueryPerpetualMarketFundingRequest({this.marketId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/perpetual_market_funding/{market_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [marketId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'market_id': marketId};
  }

  factory QueryPerpetualMarketFundingRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPerpetualMarketFundingRequest(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryPerpetualMarketFundingRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPerpetualMarketFundingRequest(
      marketId: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryPerpetualMarketFundingRequest;
  @override
  QueryPerpetualMarketFundingResponse onQueryResponse(List<int> bytes) {
    return QueryPerpetualMarketFundingResponse.deserialize(bytes);
  }

  @override
  QueryPerpetualMarketFundingResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryPerpetualMarketFundingResponse.fromJson(json);
  }
}

/// QueryPerpetualMarketFundingResponse is the response type for the
/// Query/PerpetualMarketFunding RPC method.
class QueryPerpetualMarketFundingResponse extends CosmosProtoMessage {
  final injective_exchange_v2_market.PerpetualMarketFunding? state;

  const QueryPerpetualMarketFundingResponse({this.state});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [state];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'state': config.encodeMessage(state)};
  }

  factory QueryPerpetualMarketFundingResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPerpetualMarketFundingResponse(
      state: json.valueTo<
        injective_exchange_v2_market.PerpetualMarketFunding?,
        Object
      >(
        key: 'state',
        parse:
            (v) => injective_exchange_v2_market.PerpetualMarketFunding.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryPerpetualMarketFundingResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPerpetualMarketFundingResponse(
      state: decode
          .messageTo<injective_exchange_v2_market.PerpetualMarketFunding?>(
            1,
            (b) => injective_exchange_v2_market
                .PerpetualMarketFunding.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryPerpetualMarketFundingResponse;
}

/// QuerySubaccountOrderMetadataResponse is the response type for the
/// Query/SubaccountOrderMetadata RPC method.
class QuerySubaccountOrderMetadataResponse extends CosmosProtoMessage {
  final List<SubaccountOrderbookMetadataWithMarket> metadata;

  const QuerySubaccountOrderMetadataResponse({this.metadata = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
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
  List<Object?> get protoValues => [metadata];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'metadata': metadata.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QuerySubaccountOrderMetadataResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySubaccountOrderMetadataResponse(
      metadata:
          (json.valueEnsureAsList<dynamic>(
                'metadata',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  SubaccountOrderbookMetadataWithMarket,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => SubaccountOrderbookMetadataWithMarket.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QuerySubaccountOrderMetadataResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySubaccountOrderMetadataResponse(
      metadata:
          decode
              .getListOfBytes(1)
              .map((b) => SubaccountOrderbookMetadataWithMarket.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QuerySubaccountOrderMetadataResponse;
}

/// QuerySubaccountTradeNonceResponse is the response type for the
/// Query/SubaccountTradeNonce RPC method.
class QuerySubaccountTradeNonceResponse extends CosmosProtoMessage {
  final int? nonce;

  const QuerySubaccountTradeNonceResponse({this.nonce});

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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'nonce': nonce};
  }

  factory QuerySubaccountTradeNonceResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySubaccountTradeNonceResponse(
      nonce: json.valueAsInt<int?>(
        'nonce',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QuerySubaccountTradeNonceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySubaccountTradeNonceResponse(nonce: decode.getInt<int?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QuerySubaccountTradeNonceResponse;
}

/// QuerySubaccountRiskProfileRequest is the request type for the
/// Query/SubaccountRiskProfile RPC method.
class QuerySubaccountRiskProfileRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySubaccountRiskProfileResponse> {
  /// 32-byte hex string, consistent with existing exchange queries.
  final String? subaccountId;

  const QuerySubaccountRiskProfileRequest({this.subaccountId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/injective/exchange/v2/exchange/subaccount_risk_profile/{subaccount_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [subaccountId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'subaccount_id': subaccountId};
  }

  factory QuerySubaccountRiskProfileRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySubaccountRiskProfileRequest(
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QuerySubaccountRiskProfileRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySubaccountRiskProfileRequest(
      subaccountId: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QuerySubaccountRiskProfileRequest;
  @override
  QuerySubaccountRiskProfileResponse onQueryResponse(List<int> bytes) {
    return QuerySubaccountRiskProfileResponse.deserialize(bytes);
  }

  @override
  QuerySubaccountRiskProfileResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QuerySubaccountRiskProfileResponse.fromJson(json);
  }
}

/// QuerySubaccountRiskProfileResponse is the response type for the
/// Query/SubaccountRiskProfile RPC method.
class QuerySubaccountRiskProfileResponse extends CosmosProtoMessage {
  final injective_exchange_v2_exchange.SubaccountRiskProfile? profile;

  /// True if the profile was not explicitly stored and defaults were returned.
  final bool? isDefault;

  const QuerySubaccountRiskProfileResponse({this.profile, this.isDefault});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1), ProtoFieldConfig.bool(2)],
    );
  }

  @override
  List<Object?> get protoValues => [profile, isDefault];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'profile': config.encodeMessage(profile), 'is_default': isDefault};
  }

  factory QuerySubaccountRiskProfileResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySubaccountRiskProfileResponse(
      profile: json.valueTo<
        injective_exchange_v2_exchange.SubaccountRiskProfile?,
        Object
      >(
        key: 'profile',
        parse:
            (v) =>
                injective_exchange_v2_exchange.SubaccountRiskProfile.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      isDefault: json.valueAsBool<bool?>(
        'is_default',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QuerySubaccountRiskProfileResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySubaccountRiskProfileResponse(
      profile: decode
          .messageTo<injective_exchange_v2_exchange.SubaccountRiskProfile?>(
            1,
            (b) => injective_exchange_v2_exchange
                .SubaccountRiskProfile.deserialize(b),
          ),
      isDefault: decode.getBool<bool?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QuerySubaccountRiskProfileResponse;
}

/// QueryCrossMarginPoolSnapshotRequest is the request type for the
/// Query/CrossMarginPoolSnapshot RPC method.
class QueryCrossMarginPoolSnapshotRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryCrossMarginPoolSnapshotResponse> {
  /// 32-byte hex string identifying the subaccount.
  final String? subaccountId;

  /// The quote denom of the cross-margin pool (e.g., "USDC").
  final String? quoteDenom;

  const QueryCrossMarginPoolSnapshotRequest({
    this.subaccountId,
    this.quoteDenom,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/injective/exchange/v2/exchange/cross_margin_pool_snapshot/{subaccount_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [subaccountId, quoteDenom];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'subaccount_id': subaccountId, 'quote_denom': quoteDenom};
  }

  factory QueryCrossMarginPoolSnapshotRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryCrossMarginPoolSnapshotRequest(
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      quoteDenom: json.valueAsString<String?>(
        'quote_denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryCrossMarginPoolSnapshotRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCrossMarginPoolSnapshotRequest(
      subaccountId: decode.getString<String?>(1),
      quoteDenom: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryCrossMarginPoolSnapshotRequest;
  @override
  QueryCrossMarginPoolSnapshotResponse onQueryResponse(List<int> bytes) {
    return QueryCrossMarginPoolSnapshotResponse.deserialize(bytes);
  }

  @override
  QueryCrossMarginPoolSnapshotResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryCrossMarginPoolSnapshotResponse.fromJson(json);
  }
}

/// QueryCrossMarginPoolSnapshotResponse is the response type for the
/// Query/CrossMarginPoolSnapshot RPC method.
class QueryCrossMarginPoolSnapshotResponse extends CosmosProtoMessage {
  /// The quote denom of the pool.
  final String? quoteDenom;

  /// Available quote balance in the pool (human-readable notional units).
  final String? quoteBalance;

  /// Total margin held in positions.
  final String? positionMarginTotal;

  /// Raw unrealised PnL across all positions in the pool.
  final String? unrealizedPnl;

  /// Effective unrealised PnL after applying positive uPnL haircut.
  final String? unrealizedPnlEffective;

  /// Equity used for order admission checks (quote_balance + position_margin +
  /// uPnL_eff - fees_buffer).
  final String? equityAdmission;

  /// Equity used for liquidation checks (uses raw uPnL, not haircutted).
  final String? equityLiquidation;

  /// Sum of initial margin requirements for existing positions only.
  final String? initialMarginTotal;

  /// Sum of maintenance margin requirements for existing positions.
  final String? maintenanceMarginTotal;

  /// Initial margin using worst-case net exposure (q + B, q - S) across all
  /// markets.
  final String? initialMarginWithOrdersTotal;

  /// Sum of entry losses for all open orders.
  final String? entryLossTotal;

  /// Sum of fee reserves for all open orders.
  final String? feeReserveTotal;

  /// Order Lock Requirement = IM_with_orders + entry_loss + fee_reserve.
  /// Orders may be cancelled if equity_admission &lt; order_lock_requirement.
  final String? orderLockRequirement;

  /// The positive uPnL haircut rate applied (e.g., 0.5 = 50%).
  final String? positiveUpnlHaircutRate;

  /// Health factor = equity_liquidation / maintenance_margin_total.
  /// When &lt; 1, the account is liquidatable. When &lt; 1.5, the account is in a
  /// warning state. Empty if maintenance_margin_total is zero (no positions).
  final String? healthFactor;

  const QueryCrossMarginPoolSnapshotResponse({
    this.quoteDenom,
    this.quoteBalance,
    this.positionMarginTotal,
    this.unrealizedPnl,
    this.unrealizedPnlEffective,
    this.equityAdmission,
    this.equityLiquidation,
    this.initialMarginTotal,
    this.maintenanceMarginTotal,
    this.initialMarginWithOrdersTotal,
    this.entryLossTotal,
    this.feeReserveTotal,
    this.orderLockRequirement,
    this.positiveUpnlHaircutRate,
    this.healthFactor,
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
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(7, options: const []),
        ProtoFieldConfig.string(8, options: const []),
        ProtoFieldConfig.string(9, options: const []),
        ProtoFieldConfig.string(10, options: const []),
        ProtoFieldConfig.string(11, options: const []),
        ProtoFieldConfig.string(12, options: const []),
        ProtoFieldConfig.string(13, options: const []),
        ProtoFieldConfig.string(14, options: const []),
        ProtoFieldConfig.string(15, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    quoteDenom,
    quoteBalance,
    positionMarginTotal,
    unrealizedPnl,
    unrealizedPnlEffective,
    equityAdmission,
    equityLiquidation,
    initialMarginTotal,
    maintenanceMarginTotal,
    initialMarginWithOrdersTotal,
    entryLossTotal,
    feeReserveTotal,
    orderLockRequirement,
    positiveUpnlHaircutRate,
    healthFactor,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'quote_denom': quoteDenom,
      'quote_balance': quoteBalance,
      'position_margin_total': positionMarginTotal,
      'unrealized_pnl': unrealizedPnl,
      'unrealized_pnl_effective': unrealizedPnlEffective,
      'equity_admission': equityAdmission,
      'equity_liquidation': equityLiquidation,
      'initial_margin_total': initialMarginTotal,
      'maintenance_margin_total': maintenanceMarginTotal,
      'initial_margin_with_orders_total': initialMarginWithOrdersTotal,
      'entry_loss_total': entryLossTotal,
      'fee_reserve_total': feeReserveTotal,
      'order_lock_requirement': orderLockRequirement,
      'positive_upnl_haircut_rate': positiveUpnlHaircutRate,
      'health_factor': healthFactor,
    };
  }

  factory QueryCrossMarginPoolSnapshotResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryCrossMarginPoolSnapshotResponse(
      quoteDenom: json.valueAsString<String?>(
        'quote_denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      quoteBalance: json.valueAsString<String?>(
        'quote_balance',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      positionMarginTotal: json.valueAsString<String?>(
        'position_margin_total',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      unrealizedPnl: json.valueAsString<String?>(
        'unrealized_pnl',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      unrealizedPnlEffective: json.valueAsString<String?>(
        'unrealized_pnl_effective',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      equityAdmission: json.valueAsString<String?>(
        'equity_admission',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      equityLiquidation: json.valueAsString<String?>(
        'equity_liquidation',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      initialMarginTotal: json.valueAsString<String?>(
        'initial_margin_total',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      maintenanceMarginTotal: json.valueAsString<String?>(
        'maintenance_margin_total',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      initialMarginWithOrdersTotal: json.valueAsString<String?>(
        'initial_margin_with_orders_total',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      entryLossTotal: json.valueAsString<String?>(
        'entry_loss_total',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      feeReserveTotal: json.valueAsString<String?>(
        'fee_reserve_total',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      orderLockRequirement: json.valueAsString<String?>(
        'order_lock_requirement',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      positiveUpnlHaircutRate: json.valueAsString<String?>(
        'positive_upnl_haircut_rate',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      healthFactor: json.valueAsString<String?>(
        'health_factor',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryCrossMarginPoolSnapshotResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCrossMarginPoolSnapshotResponse(
      quoteDenom: decode.getString<String?>(1),
      quoteBalance: decode.getString<String?>(2),
      positionMarginTotal: decode.getString<String?>(3),
      unrealizedPnl: decode.getString<String?>(4),
      unrealizedPnlEffective: decode.getString<String?>(5),
      equityAdmission: decode.getString<String?>(6),
      equityLiquidation: decode.getString<String?>(7),
      initialMarginTotal: decode.getString<String?>(8),
      maintenanceMarginTotal: decode.getString<String?>(9),
      initialMarginWithOrdersTotal: decode.getString<String?>(10),
      entryLossTotal: decode.getString<String?>(11),
      feeReserveTotal: decode.getString<String?>(12),
      orderLockRequirement: decode.getString<String?>(13),
      positiveUpnlHaircutRate: decode.getString<String?>(14),
      healthFactor: decode.getString<String?>(15),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryCrossMarginPoolSnapshotResponse;
}

/// Field 16 removed: canonical_liquidation_target_market_id is no longer
/// relevant — MsgLiquidateCrossMarginPool closes all positions atomically.
/// QueryModuleStateRequest is the request type for the Query/ExchangeModuleState
/// RPC method.
class QueryModuleStateRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryModuleStateResponse> {
  const QueryModuleStateRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/module_state",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory QueryModuleStateRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryModuleStateRequest();
  }

  factory QueryModuleStateRequest.deserialize(List<int> bytes) {
    return QueryModuleStateRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2QueryModuleStateRequest;
  @override
  QueryModuleStateResponse onQueryResponse(List<int> bytes) {
    return QueryModuleStateResponse.deserialize(bytes);
  }

  @override
  QueryModuleStateResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryModuleStateResponse.fromJson(json);
  }
}

/// QueryModuleStateResponse is the response type for the
/// Query/ExchangeModuleState RPC method.
class QueryModuleStateResponse extends CosmosProtoMessage {
  final injective_exchange_v2_genesis.GenesisState? state;

  const QueryModuleStateResponse({this.state});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [state];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'state': config.encodeMessage(state)};
  }

  factory QueryModuleStateResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryModuleStateResponse(
      state: json.valueTo<injective_exchange_v2_genesis.GenesisState?, Object>(
        key: 'state',
        parse:
            (v) => injective_exchange_v2_genesis.GenesisState.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryModuleStateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryModuleStateResponse(
      state: decode.messageTo<injective_exchange_v2_genesis.GenesisState?>(
        1,
        (b) => injective_exchange_v2_genesis.GenesisState.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2QueryModuleStateResponse;
}

/// QueryPositionsRequest is the request type for the Query/Positions RPC method.
class QueryPositionsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryPositionsResponse> {
  const QueryPositionsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/positions",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory QueryPositionsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPositionsRequest();
  }

  factory QueryPositionsRequest.deserialize(List<int> bytes) {
    return QueryPositionsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2QueryPositionsRequest;
  @override
  QueryPositionsResponse onQueryResponse(List<int> bytes) {
    return QueryPositionsResponse.deserialize(bytes);
  }

  @override
  QueryPositionsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryPositionsResponse.fromJson(json);
  }
}

/// QueryPositionsResponse is the response type for the Query/Positions RPC
/// method.
class QueryPositionsResponse extends CosmosProtoMessage {
  final List<injective_exchange_v2_exchange.DerivativePosition> state;

  const QueryPositionsResponse({this.state = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
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
  List<Object?> get protoValues => [state];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'state': state.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QueryPositionsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPositionsResponse(
      state:
          (json.valueEnsureAsList<dynamic>(
                'state',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_exchange.DerivativePosition,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_exchange
                          .DerivativePosition.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryPositionsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPositionsResponse(
      state:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_exchange_v2_exchange
                    .DerivativePosition.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2QueryPositionsResponse;
}

/// QueryTradeRewardPointsRequest is the request type for the
/// Query/TradeRewardPoints RPC method.
class QueryTradeRewardPointsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTradeRewardPointsResponse> {
  final List<String> accounts;

  final BigInt? pendingPoolTimestamp;

  const QueryTradeRewardPointsRequest({
    this.accounts = const [],
    this.pendingPoolTimestamp,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/trade_reward_points",
        ),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/pending_trade_reward_points",
        ),
      ],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.int64(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [accounts, pendingPoolTimestamp];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'accounts': accounts.map((e) => e).toList(),
      'pending_pool_timestamp': config.encodeBigint(pendingPoolTimestamp),
    };
  }

  factory QueryTradeRewardPointsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTradeRewardPointsRequest(
      accounts:
          (json.valueEnsureAsList<dynamic>(
            'accounts',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      pendingPoolTimestamp: json.valueAsBigInt<BigInt?>(
        'pending_pool_timestamp',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryTradeRewardPointsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTradeRewardPointsRequest(
      accounts: decode.getListOrEmpty<String>(1),
      pendingPoolTimestamp: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryTradeRewardPointsRequest;
  @override
  QueryTradeRewardPointsResponse onQueryResponse(List<int> bytes) {
    return QueryTradeRewardPointsResponse.deserialize(bytes);
  }

  @override
  QueryTradeRewardPointsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryTradeRewardPointsResponse.fromJson(json);
  }
}

/// QueryTradeRewardPointsResponse is the response type for the
/// Query/TradeRewardPoints RPC method.
class QueryTradeRewardPointsResponse extends CosmosProtoMessage {
  final List<String> accountTradeRewardPoints;

  const QueryTradeRewardPointsResponse({
    this.accountTradeRewardPoints = const [],
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
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [accountTradeRewardPoints];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'account_trade_reward_points':
          accountTradeRewardPoints.map((e) => e).toList(),
    };
  }

  factory QueryTradeRewardPointsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTradeRewardPointsResponse(
      accountTradeRewardPoints:
          (json.valueEnsureAsList<dynamic>(
            'account_trade_reward_points',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory QueryTradeRewardPointsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTradeRewardPointsResponse(
      accountTradeRewardPoints: decode.getListOrEmpty<String>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryTradeRewardPointsResponse;
}

/// QueryTradeRewardCampaignRequest is the request type for the
/// Query/TradeRewardCampaign RPC method.
class QueryTradeRewardCampaignRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTradeRewardCampaignResponse> {
  const QueryTradeRewardCampaignRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/trade_reward_campaign",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory QueryTradeRewardCampaignRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTradeRewardCampaignRequest();
  }

  factory QueryTradeRewardCampaignRequest.deserialize(List<int> bytes) {
    return QueryTradeRewardCampaignRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryTradeRewardCampaignRequest;
  @override
  QueryTradeRewardCampaignResponse onQueryResponse(List<int> bytes) {
    return QueryTradeRewardCampaignResponse.deserialize(bytes);
  }

  @override
  QueryTradeRewardCampaignResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryTradeRewardCampaignResponse.fromJson(json);
  }
}

/// QueryTradeRewardCampaignResponse is the response type for the
/// Query/TradeRewardCampaign RPC method.
class QueryTradeRewardCampaignResponse extends CosmosProtoMessage {
  final injective_exchange_v2_exchange.TradingRewardCampaignInfo?
  tradingRewardCampaignInfo;

  final List<injective_exchange_v2_exchange.CampaignRewardPool>
  tradingRewardPoolCampaignSchedule;

  final String? totalTradeRewardPoints;

  final List<injective_exchange_v2_exchange.CampaignRewardPool>
  pendingTradingRewardPoolCampaignSchedule;

  final List<String> pendingTotalTradeRewardPoints;

  const QueryTradeRewardCampaignResponse({
    this.tradingRewardCampaignInfo,
    this.tradingRewardPoolCampaignSchedule = const [],
    this.totalTradeRewardPoints,
    this.pendingTradingRewardPoolCampaignSchedule = const [],
    this.pendingTotalTradeRewardPoints = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    tradingRewardCampaignInfo,
    tradingRewardPoolCampaignSchedule,
    totalTradeRewardPoints,
    pendingTradingRewardPoolCampaignSchedule,
    pendingTotalTradeRewardPoints,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'trading_reward_campaign_info': config.encodeMessage(
        tradingRewardCampaignInfo,
      ),
      'trading_reward_pool_campaign_schedule':
          tradingRewardPoolCampaignSchedule
              .map((e) => config.encodeMessage(e))
              .toList(),
      'total_trade_reward_points': totalTradeRewardPoints,
      'pending_trading_reward_pool_campaign_schedule':
          pendingTradingRewardPoolCampaignSchedule
              .map((e) => config.encodeMessage(e))
              .toList(),
      'pending_total_trade_reward_points':
          pendingTotalTradeRewardPoints.map((e) => e).toList(),
    };
  }

  factory QueryTradeRewardCampaignResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTradeRewardCampaignResponse(
      tradingRewardCampaignInfo: json.valueTo<
        injective_exchange_v2_exchange.TradingRewardCampaignInfo?,
        Object
      >(
        key: 'trading_reward_campaign_info',
        parse:
            (v) => injective_exchange_v2_exchange
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
      totalTradeRewardPoints: json.valueAsString<String?>(
        'total_trade_reward_points',
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
      pendingTotalTradeRewardPoints:
          (json.valueEnsureAsList<dynamic>(
            'pending_total_trade_reward_points',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory QueryTradeRewardCampaignResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTradeRewardCampaignResponse(
      tradingRewardCampaignInfo: decode
          .messageTo<injective_exchange_v2_exchange.TradingRewardCampaignInfo?>(
            1,
            (b) => injective_exchange_v2_exchange
                .TradingRewardCampaignInfo.deserialize(b),
          ),
      tradingRewardPoolCampaignSchedule:
          decode
              .getListOfBytes(2)
              .map(
                (b) => injective_exchange_v2_exchange
                    .CampaignRewardPool.deserialize(b),
              )
              .toList(),
      totalTradeRewardPoints: decode.getString<String?>(3),
      pendingTradingRewardPoolCampaignSchedule:
          decode
              .getListOfBytes(4)
              .map(
                (b) => injective_exchange_v2_exchange
                    .CampaignRewardPool.deserialize(b),
              )
              .toList(),
      pendingTotalTradeRewardPoints: decode.getListOrEmpty<String>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryTradeRewardCampaignResponse;
}

/// QueryIsRegisteredDMMRequest is the request type for the Query/IsRegisteredDMM
/// RPC method.
class QueryIsOptedOutOfRewardsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryIsOptedOutOfRewardsResponse> {
  final String? account;

  const QueryIsOptedOutOfRewardsRequest({this.account});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/is_opted_out_of_rewards/{account}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [account];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'account': account};
  }

  factory QueryIsOptedOutOfRewardsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryIsOptedOutOfRewardsRequest(
      account: json.valueAsString<String?>(
        'account',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryIsOptedOutOfRewardsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryIsOptedOutOfRewardsRequest(
      account: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryIsOptedOutOfRewardsRequest;
  @override
  QueryIsOptedOutOfRewardsResponse onQueryResponse(List<int> bytes) {
    return QueryIsOptedOutOfRewardsResponse.deserialize(bytes);
  }

  @override
  QueryIsOptedOutOfRewardsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryIsOptedOutOfRewardsResponse.fromJson(json);
  }
}

/// QueryIsRegisteredDMMResponse is the response type for the
/// Query/IsRegisteredDMM RPC method.
class QueryIsOptedOutOfRewardsResponse extends CosmosProtoMessage {
  final bool? isOptedOut;

  const QueryIsOptedOutOfRewardsResponse({this.isOptedOut});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bool(1)],
    );
  }

  @override
  List<Object?> get protoValues => [isOptedOut];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'is_opted_out': isOptedOut};
  }

  factory QueryIsOptedOutOfRewardsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryIsOptedOutOfRewardsResponse(
      isOptedOut: json.valueAsBool<bool?>(
        'is_opted_out',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryIsOptedOutOfRewardsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryIsOptedOutOfRewardsResponse(
      isOptedOut: decode.getBool<bool?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryIsOptedOutOfRewardsResponse;
}

/// QueryRegisteredDMMsRequest is the request type for the Query/RegisteredDMMs
/// RPC method.
class QueryOptedOutOfRewardsAccountsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryOptedOutOfRewardsAccountsResponse> {
  const QueryOptedOutOfRewardsAccountsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/opted_out_of_rewards_accounts",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory QueryOptedOutOfRewardsAccountsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryOptedOutOfRewardsAccountsRequest();
  }

  factory QueryOptedOutOfRewardsAccountsRequest.deserialize(List<int> bytes) {
    return QueryOptedOutOfRewardsAccountsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryOptedOutOfRewardsAccountsRequest;
  @override
  QueryOptedOutOfRewardsAccountsResponse onQueryResponse(List<int> bytes) {
    return QueryOptedOutOfRewardsAccountsResponse.deserialize(bytes);
  }

  @override
  QueryOptedOutOfRewardsAccountsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryOptedOutOfRewardsAccountsResponse.fromJson(json);
  }
}

/// QueryRegisteredDMMsResponse is the response type for the Query/RegisteredDMMs
/// RPC method.
class QueryOptedOutOfRewardsAccountsResponse extends CosmosProtoMessage {
  final List<String> accounts;

  const QueryOptedOutOfRewardsAccountsResponse({this.accounts = const []});

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

  factory QueryOptedOutOfRewardsAccountsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryOptedOutOfRewardsAccountsResponse(
      accounts:
          (json.valueEnsureAsList<dynamic>(
            'accounts',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory QueryOptedOutOfRewardsAccountsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryOptedOutOfRewardsAccountsResponse(
      accounts: decode.getListOrEmpty<String>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryOptedOutOfRewardsAccountsResponse;
}

/// QueryFeeDiscountAccountInfoRequest is the request type for the
/// Query/FeeDiscountAccountInfo RPC method.
class QueryFeeDiscountAccountInfoRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryFeeDiscountAccountInfoResponse> {
  final String? account;

  const QueryFeeDiscountAccountInfoRequest({this.account});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/fee_discount_account_info/{account}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [account];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'account': account};
  }

  factory QueryFeeDiscountAccountInfoRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryFeeDiscountAccountInfoRequest(
      account: json.valueAsString<String?>(
        'account',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryFeeDiscountAccountInfoRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryFeeDiscountAccountInfoRequest(
      account: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryFeeDiscountAccountInfoRequest;
  @override
  QueryFeeDiscountAccountInfoResponse onQueryResponse(List<int> bytes) {
    return QueryFeeDiscountAccountInfoResponse.deserialize(bytes);
  }

  @override
  QueryFeeDiscountAccountInfoResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryFeeDiscountAccountInfoResponse.fromJson(json);
  }
}

/// QueryFeeDiscountAccountInfoResponse is the response type for the
/// Query/FeeDiscountAccountInfo RPC method.
class QueryFeeDiscountAccountInfoResponse extends CosmosProtoMessage {
  final BigInt? tierLevel;

  final injective_exchange_v2_exchange.FeeDiscountTierInfo? accountInfo;

  final injective_exchange_v2_exchange.FeeDiscountTierTTL? accountTtl;

  const QueryFeeDiscountAccountInfoResponse({
    this.tierLevel,
    this.accountInfo,
    this.accountTtl,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.message(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [tierLevel, accountInfo, accountTtl];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'tier_level': config.encodeBigint(tierLevel),
      'account_info': config.encodeMessage(accountInfo),
      'account_ttl': config.encodeMessage(accountTtl),
    };
  }

  factory QueryFeeDiscountAccountInfoResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryFeeDiscountAccountInfoResponse(
      tierLevel: json.valueAsBigInt<BigInt?>(
        'tier_level',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      accountInfo: json
          .valueTo<injective_exchange_v2_exchange.FeeDiscountTierInfo?, Object>(
            key: 'account_info',
            parse:
                (v) =>
                    injective_exchange_v2_exchange.FeeDiscountTierInfo.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      accountTtl: json
          .valueTo<injective_exchange_v2_exchange.FeeDiscountTierTTL?, Object>(
            key: 'account_ttl',
            parse:
                (v) =>
                    injective_exchange_v2_exchange.FeeDiscountTierTTL.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory QueryFeeDiscountAccountInfoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryFeeDiscountAccountInfoResponse(
      tierLevel: decode.getBigInt<BigInt?>(1),
      accountInfo: decode
          .messageTo<injective_exchange_v2_exchange.FeeDiscountTierInfo?>(
            2,
            (b) => injective_exchange_v2_exchange
                .FeeDiscountTierInfo.deserialize(b),
          ),
      accountTtl: decode.messageTo<
        injective_exchange_v2_exchange.FeeDiscountTierTTL?
      >(
        3,
        (b) => injective_exchange_v2_exchange.FeeDiscountTierTTL.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryFeeDiscountAccountInfoResponse;
}

/// QueryFeeDiscountScheduleRequest is the request type for the
/// Query/FeeDiscountSchedule RPC method.
class QueryFeeDiscountScheduleRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryFeeDiscountScheduleResponse> {
  const QueryFeeDiscountScheduleRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/fee_discount_schedule",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory QueryFeeDiscountScheduleRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryFeeDiscountScheduleRequest();
  }

  factory QueryFeeDiscountScheduleRequest.deserialize(List<int> bytes) {
    return QueryFeeDiscountScheduleRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryFeeDiscountScheduleRequest;
  @override
  QueryFeeDiscountScheduleResponse onQueryResponse(List<int> bytes) {
    return QueryFeeDiscountScheduleResponse.deserialize(bytes);
  }

  @override
  QueryFeeDiscountScheduleResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryFeeDiscountScheduleResponse.fromJson(json);
  }
}

/// QueryFeeDiscountScheduleResponse is the response type for the
/// Query/FeeDiscountSchedule RPC method.
class QueryFeeDiscountScheduleResponse extends CosmosProtoMessage {
  final injective_exchange_v2_exchange.FeeDiscountSchedule? feeDiscountSchedule;

  const QueryFeeDiscountScheduleResponse({this.feeDiscountSchedule});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [feeDiscountSchedule];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'fee_discount_schedule': config.encodeMessage(feeDiscountSchedule)};
  }

  factory QueryFeeDiscountScheduleResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryFeeDiscountScheduleResponse(
      feeDiscountSchedule: json
          .valueTo<injective_exchange_v2_exchange.FeeDiscountSchedule?, Object>(
            key: 'fee_discount_schedule',
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

  factory QueryFeeDiscountScheduleResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryFeeDiscountScheduleResponse(
      feeDiscountSchedule: decode
          .messageTo<injective_exchange_v2_exchange.FeeDiscountSchedule?>(
            1,
            (b) => injective_exchange_v2_exchange
                .FeeDiscountSchedule.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryFeeDiscountScheduleResponse;
}

/// QueryBalanceMismatchesRequest is the request type for the
/// Query/QueryBalanceMismatches RPC method.
class QueryBalanceMismatchesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryBalanceMismatchesResponse> {
  final BigInt? dustFactor;

  const QueryBalanceMismatchesRequest({this.dustFactor});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/balance_mismatches/{dust_factor}",
        ),
      ],
      fields: [ProtoFieldConfig.int64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [dustFactor];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'dust_factor': config.encodeBigint(dustFactor)};
  }

  factory QueryBalanceMismatchesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryBalanceMismatchesRequest(
      dustFactor: json.valueAsBigInt<BigInt?>(
        'dust_factor',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryBalanceMismatchesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBalanceMismatchesRequest(
      dustFactor: decode.getBigInt<BigInt?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryBalanceMismatchesRequest;
  @override
  QueryBalanceMismatchesResponse onQueryResponse(List<int> bytes) {
    return QueryBalanceMismatchesResponse.deserialize(bytes);
  }

  @override
  QueryBalanceMismatchesResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryBalanceMismatchesResponse.fromJson(json);
  }
}

class BalanceMismatch extends CosmosProtoMessage {
  /// the subaccount ID
  final String? subaccountId;

  /// the denom of the balance
  final String? denom;

  /// the available balance
  final String? available;

  /// the total balance
  final String? total;

  /// the balance hold
  final String? balanceHold;

  /// the expected total balance
  final String? expectedTotal;

  /// the difference between the total balance and the expected total balance
  final String? difference;

  const BalanceMismatch({
    this.subaccountId,
    this.denom,
    this.available,
    this.total,
    this.balanceHold,
    this.expectedTotal,
    this.difference,
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
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(7, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    subaccountId,
    denom,
    available,
    total,
    balanceHold,
    expectedTotal,
    difference,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'subaccountId': subaccountId,
      'denom': denom,
      'available': available,
      'total': total,
      'balance_hold': balanceHold,
      'expected_total': expectedTotal,
      'difference': difference,
    };
  }

  factory BalanceMismatch.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return BalanceMismatch(
      subaccountId: json.valueAsString<String?>(
        'subaccountId',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      denom: json.valueAsString<String?>(
        'denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      available: json.valueAsString<String?>(
        'available',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      total: json.valueAsString<String?>(
        'total',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      balanceHold: json.valueAsString<String?>(
        'balance_hold',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      expectedTotal: json.valueAsString<String?>(
        'expected_total',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      difference: json.valueAsString<String?>(
        'difference',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory BalanceMismatch.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BalanceMismatch(
      subaccountId: decode.getString<String?>(1),
      denom: decode.getString<String?>(2),
      available: decode.getString<String?>(3),
      total: decode.getString<String?>(4),
      balanceHold: decode.getString<String?>(5),
      expectedTotal: decode.getString<String?>(6),
      difference: decode.getString<String?>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2BalanceMismatch;
}

/// QueryBalanceMismatchesResponse is the response type for the
/// Query/QueryBalanceMismatches RPC method.
class QueryBalanceMismatchesResponse extends CosmosProtoMessage {
  final List<BalanceMismatch> balanceMismatches;

  const QueryBalanceMismatchesResponse({this.balanceMismatches = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [balanceMismatches];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'balance_mismatches':
          balanceMismatches.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QueryBalanceMismatchesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryBalanceMismatchesResponse(
      balanceMismatches:
          (json.valueEnsureAsList<dynamic>(
                'balance_mismatches',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<BalanceMismatch, Object>(
                  value: e,
                  parse:
                      (v) => BalanceMismatch.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryBalanceMismatchesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBalanceMismatchesResponse(
      balanceMismatches:
          decode
              .getListOfBytes(1)
              .map((b) => BalanceMismatch.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryBalanceMismatchesResponse;
}

/// QueryBalanceWithBalanceHoldsRequest is the request type for the
/// Query/QueryBalanceWithBalanceHolds RPC method.
class QueryBalanceWithBalanceHoldsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryBalanceWithBalanceHoldsResponse> {
  const QueryBalanceWithBalanceHoldsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/balances_with_balance_holds",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory QueryBalanceWithBalanceHoldsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryBalanceWithBalanceHoldsRequest();
  }

  factory QueryBalanceWithBalanceHoldsRequest.deserialize(List<int> bytes) {
    return QueryBalanceWithBalanceHoldsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryBalanceWithBalanceHoldsRequest;
  @override
  QueryBalanceWithBalanceHoldsResponse onQueryResponse(List<int> bytes) {
    return QueryBalanceWithBalanceHoldsResponse.deserialize(bytes);
  }

  @override
  QueryBalanceWithBalanceHoldsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryBalanceWithBalanceHoldsResponse.fromJson(json);
  }
}

class BalanceWithMarginHold extends CosmosProtoMessage {
  /// the subaccount ID
  final String? subaccountId;

  /// the denom of the balance
  final String? denom;

  /// the available balance
  final String? available;

  /// the total balance
  final String? total;

  /// the balance on hold
  final String? balanceHold;

  const BalanceWithMarginHold({
    this.subaccountId,
    this.denom,
    this.available,
    this.total,
    this.balanceHold,
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
        ProtoFieldConfig.string(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    subaccountId,
    denom,
    available,
    total,
    balanceHold,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'subaccountId': subaccountId,
      'denom': denom,
      'available': available,
      'total': total,
      'balance_hold': balanceHold,
    };
  }

  factory BalanceWithMarginHold.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return BalanceWithMarginHold(
      subaccountId: json.valueAsString<String?>(
        'subaccountId',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      denom: json.valueAsString<String?>(
        'denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      available: json.valueAsString<String?>(
        'available',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      total: json.valueAsString<String?>(
        'total',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      balanceHold: json.valueAsString<String?>(
        'balance_hold',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory BalanceWithMarginHold.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BalanceWithMarginHold(
      subaccountId: decode.getString<String?>(1),
      denom: decode.getString<String?>(2),
      available: decode.getString<String?>(3),
      total: decode.getString<String?>(4),
      balanceHold: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2BalanceWithMarginHold;
}

/// QueryBalanceWithBalanceHoldsResponse is the response type for the
/// Query/QueryBalanceWithBalanceHolds RPC method.
class QueryBalanceWithBalanceHoldsResponse extends CosmosProtoMessage {
  final List<BalanceWithMarginHold> balanceWithBalanceHolds;

  const QueryBalanceWithBalanceHoldsResponse({
    this.balanceWithBalanceHolds = const [],
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
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [balanceWithBalanceHolds];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'balance_with_balance_holds':
          balanceWithBalanceHolds.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QueryBalanceWithBalanceHoldsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryBalanceWithBalanceHoldsResponse(
      balanceWithBalanceHolds:
          (json.valueEnsureAsList<dynamic>(
                'balance_with_balance_holds',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<BalanceWithMarginHold, Object>(
                  value: e,
                  parse:
                      (v) => BalanceWithMarginHold.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryBalanceWithBalanceHoldsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBalanceWithBalanceHoldsResponse(
      balanceWithBalanceHolds:
          decode
              .getListOfBytes(1)
              .map((b) => BalanceWithMarginHold.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryBalanceWithBalanceHoldsResponse;
}

/// QueryFeeDiscountTierStatisticsRequest is the request type for the
/// Query/QueryFeeDiscountTierStatistics RPC method.
class QueryFeeDiscountTierStatisticsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryFeeDiscountTierStatisticsResponse> {
  const QueryFeeDiscountTierStatisticsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/fee_discount_tier_stats",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory QueryFeeDiscountTierStatisticsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryFeeDiscountTierStatisticsRequest();
  }

  factory QueryFeeDiscountTierStatisticsRequest.deserialize(List<int> bytes) {
    return QueryFeeDiscountTierStatisticsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryFeeDiscountTierStatisticsRequest;
  @override
  QueryFeeDiscountTierStatisticsResponse onQueryResponse(List<int> bytes) {
    return QueryFeeDiscountTierStatisticsResponse.deserialize(bytes);
  }

  @override
  QueryFeeDiscountTierStatisticsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryFeeDiscountTierStatisticsResponse.fromJson(json);
  }
}

class TierStatistic extends CosmosProtoMessage {
  final BigInt? tier;

  final BigInt? count;

  const TierStatistic({this.tier, this.count});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint64(1), ProtoFieldConfig.uint64(2)],
    );
  }

  @override
  List<Object?> get protoValues => [tier, count];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'tier': config.encodeBigint(tier),
      'count': config.encodeBigint(count),
    };
  }

  factory TierStatistic.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return TierStatistic(
      tier: json.valueAsBigInt<BigInt?>(
        'tier',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      count: json.valueAsBigInt<BigInt?>(
        'count',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory TierStatistic.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TierStatistic(
      tier: decode.getBigInt<BigInt?>(1),
      count: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2TierStatistic;
}

/// QueryFeeDiscountTierStatisticsResponse is the response type for the
/// Query/QueryFeeDiscountTierStatistics RPC method.
class QueryFeeDiscountTierStatisticsResponse extends CosmosProtoMessage {
  final List<TierStatistic> statistics;

  const QueryFeeDiscountTierStatisticsResponse({this.statistics = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [statistics];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'statistics': statistics.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QueryFeeDiscountTierStatisticsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryFeeDiscountTierStatisticsResponse(
      statistics:
          (json.valueEnsureAsList<dynamic>(
                'statistics',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<TierStatistic, Object>(
                  value: e,
                  parse:
                      (v) => TierStatistic.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryFeeDiscountTierStatisticsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryFeeDiscountTierStatisticsResponse(
      statistics:
          decode
              .getListOfBytes(1)
              .map((b) => TierStatistic.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryFeeDiscountTierStatisticsResponse;
}

/// MitoVaultInfosRequest is the request type for the Query/MitoVaultInfos RPC
/// method.
class MitoVaultInfosRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<MitoVaultInfosResponse> {
  const MitoVaultInfosRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/mito_vault_infos",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory MitoVaultInfosRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MitoVaultInfosRequest();
  }

  factory MitoVaultInfosRequest.deserialize(List<int> bytes) {
    return MitoVaultInfosRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MitoVaultInfosRequest;
  @override
  MitoVaultInfosResponse onQueryResponse(List<int> bytes) {
    return MitoVaultInfosResponse.deserialize(bytes);
  }

  @override
  MitoVaultInfosResponse onQueryResponseJson(Map<String, dynamic> json) {
    return MitoVaultInfosResponse.fromJson(json);
  }
}

/// MitoVaultInfosResponse is the response type for the Query/MitoVaultInfos RPC
/// method.
class MitoVaultInfosResponse extends CosmosProtoMessage {
  /// list of master addresses
  final List<String> masterAddresses;

  /// list of derivative addresses
  final List<String> derivativeAddresses;

  /// list of spot addresses
  final List<String> spotAddresses;

  /// list of cw20 addresses
  final List<String> cw20Addresses;

  const MitoVaultInfosResponse({
    this.masterAddresses = const [],
    this.derivativeAddresses = const [],
    this.spotAddresses = const [],
    this.cw20Addresses = const [],
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
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    masterAddresses,
    derivativeAddresses,
    spotAddresses,
    cw20Addresses,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'master_addresses': masterAddresses.map((e) => e).toList(),
      'derivative_addresses': derivativeAddresses.map((e) => e).toList(),
      'spot_addresses': spotAddresses.map((e) => e).toList(),
      'cw20_addresses': cw20Addresses.map((e) => e).toList(),
    };
  }

  factory MitoVaultInfosResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MitoVaultInfosResponse(
      masterAddresses:
          (json.valueEnsureAsList<dynamic>(
            'master_addresses',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      derivativeAddresses:
          (json.valueEnsureAsList<dynamic>(
            'derivative_addresses',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      spotAddresses:
          (json.valueEnsureAsList<dynamic>(
            'spot_addresses',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      cw20Addresses:
          (json.valueEnsureAsList<dynamic>(
            'cw20_addresses',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory MitoVaultInfosResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MitoVaultInfosResponse(
      masterAddresses: decode.getListOrEmpty<String>(1),
      derivativeAddresses: decode.getListOrEmpty<String>(2),
      spotAddresses: decode.getListOrEmpty<String>(3),
      cw20Addresses: decode.getListOrEmpty<String>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MitoVaultInfosResponse;
}

/// QueryMarketIDFromVaultRequest is the request type for the
/// Query/QueryMarketIDFromVault RPC method.
class QueryMarketIDFromVaultRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryMarketIDFromVaultResponse> {
  final String? vaultAddress;

  const QueryMarketIDFromVaultRequest({this.vaultAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/vault_market_id/{vault_address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [vaultAddress];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'vault_address': vaultAddress};
  }

  factory QueryMarketIDFromVaultRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryMarketIDFromVaultRequest(
      vaultAddress: json.valueAsString<String?>(
        'vault_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryMarketIDFromVaultRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMarketIDFromVaultRequest(
      vaultAddress: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryMarketIDFromVaultRequest;
  @override
  QueryMarketIDFromVaultResponse onQueryResponse(List<int> bytes) {
    return QueryMarketIDFromVaultResponse.deserialize(bytes);
  }

  @override
  QueryMarketIDFromVaultResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryMarketIDFromVaultResponse.fromJson(json);
  }
}

/// QueryMarketIDFromVaultResponse is the response type for the
/// Query/QueryMarketIDFromVault RPC method.
class QueryMarketIDFromVaultResponse extends CosmosProtoMessage {
  final String? marketId;

  const QueryMarketIDFromVaultResponse({this.marketId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [marketId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'market_id': marketId};
  }

  factory QueryMarketIDFromVaultResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryMarketIDFromVaultResponse(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryMarketIDFromVaultResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMarketIDFromVaultResponse(
      marketId: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryMarketIDFromVaultResponse;
}

class QueryHistoricalTradeRecordsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryHistoricalTradeRecordsResponse> {
  final String? marketId;

  const QueryHistoricalTradeRecordsRequest({this.marketId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/historical_trade_records",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [marketId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'market_id': marketId};
  }

  factory QueryHistoricalTradeRecordsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryHistoricalTradeRecordsRequest(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryHistoricalTradeRecordsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryHistoricalTradeRecordsRequest(
      marketId: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryHistoricalTradeRecordsRequest;
  @override
  QueryHistoricalTradeRecordsResponse onQueryResponse(List<int> bytes) {
    return QueryHistoricalTradeRecordsResponse.deserialize(bytes);
  }

  @override
  QueryHistoricalTradeRecordsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryHistoricalTradeRecordsResponse.fromJson(json);
  }
}

class QueryHistoricalTradeRecordsResponse extends CosmosProtoMessage {
  final List<injective_exchange_v2_exchange.TradeRecords> tradeRecords;

  const QueryHistoricalTradeRecordsResponse({this.tradeRecords = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [tradeRecords];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'trade_records':
          tradeRecords.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QueryHistoricalTradeRecordsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryHistoricalTradeRecordsResponse(
      tradeRecords:
          (json.valueEnsureAsList<dynamic>(
                'trade_records',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_exchange.TradeRecords,
                  Object
                >(
                  value: e,
                  parse:
                      (v) =>
                          injective_exchange_v2_exchange.TradeRecords.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                ),
              )
              .toList(),
    );
  }

  factory QueryHistoricalTradeRecordsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryHistoricalTradeRecordsResponse(
      tradeRecords:
          decode
              .getListOfBytes(1)
              .map(
                (b) =>
                    injective_exchange_v2_exchange.TradeRecords.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryHistoricalTradeRecordsResponse;
}

/// TradeHistoryOptions are the optional params for Query/MarketVolatility RPC
/// method.
class TradeHistoryOptions extends CosmosProtoMessage {
  /// TradeGroupingSec of 0 means use the chain's default grouping
  final BigInt? tradeGroupingSec;

  /// MaxAge restricts the trade records oldest age in seconds from the current
  /// block time to consider. A value of 0 means use all the records present on
  /// the chain.
  final BigInt? maxAge;

  /// If IncludeRawHistory is true, the raw underlying data used for the
  /// computation is included in the response
  final bool? includeRawHistory;

  /// If IncludeMetadata is true, metadata on the computation is included in the
  /// response
  final bool? includeMetadata;

  const TradeHistoryOptions({
    this.tradeGroupingSec,
    this.maxAge,
    this.includeRawHistory,
    this.includeMetadata,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.bool(4),
        ProtoFieldConfig.bool(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    tradeGroupingSec,
    maxAge,
    includeRawHistory,
    includeMetadata,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'trade_grouping_sec': config.encodeBigint(tradeGroupingSec),
      'max_age': config.encodeBigint(maxAge),
      'include_raw_history': includeRawHistory,
      'include_metadata': includeMetadata,
    };
  }

  factory TradeHistoryOptions.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return TradeHistoryOptions(
      tradeGroupingSec: json.valueAsBigInt<BigInt?>(
        'trade_grouping_sec',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      maxAge: json.valueAsBigInt<BigInt?>(
        'max_age',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      includeRawHistory: json.valueAsBool<bool?>(
        'include_raw_history',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      includeMetadata: json.valueAsBool<bool?>(
        'include_metadata',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory TradeHistoryOptions.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TradeHistoryOptions(
      tradeGroupingSec: decode.getBigInt<BigInt?>(1),
      maxAge: decode.getBigInt<BigInt?>(2),
      includeRawHistory: decode.getBool<bool?>(4),
      includeMetadata: decode.getBool<bool?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2TradeHistoryOptions;
}

/// QueryMarketVolatilityRequest are the request params for the
/// Query/MarketVolatility RPC method.
class QueryMarketVolatilityRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryMarketVolatilityResponse> {
  /// the market ID to query volatility for
  final String? marketId;

  /// the trade history options
  final TradeHistoryOptions? tradeHistoryOptions;

  const QueryMarketVolatilityRequest({this.marketId, this.tradeHistoryOptions});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/market_volatility/{market_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [marketId, tradeHistoryOptions];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'market_id': marketId,
      'trade_history_options': config.encodeMessage(tradeHistoryOptions),
    };
  }

  factory QueryMarketVolatilityRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryMarketVolatilityRequest(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      tradeHistoryOptions: json.valueTo<TradeHistoryOptions?, Object>(
        key: 'trade_history_options',
        parse:
            (v) => TradeHistoryOptions.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryMarketVolatilityRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMarketVolatilityRequest(
      marketId: decode.getString<String?>(1),
      tradeHistoryOptions: decode.messageTo<TradeHistoryOptions?>(
        2,
        (b) => TradeHistoryOptions.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2QueryMarketVolatilityRequest;
  @override
  QueryMarketVolatilityResponse onQueryResponse(List<int> bytes) {
    return QueryMarketVolatilityResponse.deserialize(bytes);
  }

  @override
  QueryMarketVolatilityResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryMarketVolatilityResponse.fromJson(json);
  }
}

/// QueryMarketVolatilityResponse is the response type for the
/// Query/MarketVolatility RPC method.
class QueryMarketVolatilityResponse extends CosmosProtoMessage {
  final String? volatility;

  final injective_oracle_v1beta1_oracle.MetadataStatistics? historyMetadata;

  final List<injective_exchange_v2_exchange.TradeRecord> rawHistory;

  const QueryMarketVolatilityResponse({
    this.volatility,
    this.historyMetadata,
    this.rawHistory = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [volatility, historyMetadata, rawHistory];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'volatility': volatility,
      'history_metadata': config.encodeMessage(historyMetadata),
      'raw_history': rawHistory.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QueryMarketVolatilityResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryMarketVolatilityResponse(
      volatility: json.valueAsString<String?>(
        'volatility',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      historyMetadata: json
          .valueTo<injective_oracle_v1beta1_oracle.MetadataStatistics?, Object>(
            key: 'history_metadata',
            parse:
                (v) =>
                    injective_oracle_v1beta1_oracle.MetadataStatistics.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      rawHistory:
          (json.valueEnsureAsList<dynamic>(
                'raw_history',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_exchange.TradeRecord,
                  Object
                >(
                  value: e,
                  parse:
                      (v) =>
                          injective_exchange_v2_exchange.TradeRecord.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                ),
              )
              .toList(),
    );
  }

  factory QueryMarketVolatilityResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMarketVolatilityResponse(
      volatility: decode.getString<String?>(1),
      historyMetadata: decode
          .messageTo<injective_oracle_v1beta1_oracle.MetadataStatistics?>(
            2,
            (b) => injective_oracle_v1beta1_oracle
                .MetadataStatistics.deserialize(b),
          ),
      rawHistory:
          decode
              .getListOfBytes(3)
              .map(
                (b) =>
                    injective_exchange_v2_exchange.TradeRecord.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryMarketVolatilityResponse;
}

/// QuerBinaryMarketsRequest is the request type for the Query/BinaryMarkets RPC
/// method.
class QueryBinaryMarketsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryBinaryMarketsResponse> {
  /// Status of the market, for convenience it is set to string - not enum
  final String? status;

  const QueryBinaryMarketsRequest({this.status});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/binary_options/markets",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [status];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'status': status};
  }

  factory QueryBinaryMarketsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryBinaryMarketsRequest(
      status: json.valueAsString<String?>(
        'status',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryBinaryMarketsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBinaryMarketsRequest(status: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2QueryBinaryMarketsRequest;
  @override
  QueryBinaryMarketsResponse onQueryResponse(List<int> bytes) {
    return QueryBinaryMarketsResponse.deserialize(bytes);
  }

  @override
  QueryBinaryMarketsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryBinaryMarketsResponse.fromJson(json);
  }
}

/// QueryBinaryMarketsResponse is the response type for the Query/BinaryMarkets
/// RPC method.
class QueryBinaryMarketsResponse extends CosmosProtoMessage {
  final List<injective_exchange_v2_market.BinaryOptionsMarket> markets;

  const QueryBinaryMarketsResponse({this.markets = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [markets];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'markets': markets.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QueryBinaryMarketsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryBinaryMarketsResponse(
      markets:
          (json.valueEnsureAsList<dynamic>(
                'markets',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_market.BinaryOptionsMarket,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_market
                          .BinaryOptionsMarket.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryBinaryMarketsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBinaryMarketsResponse(
      markets:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_exchange_v2_market
                    .BinaryOptionsMarket.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2QueryBinaryMarketsResponse;
}

/// QueryConditionalOrdersRequest is the request type for the
/// Query/ConditionalOrders RPC method.
class QueryTraderDerivativeConditionalOrdersRequest extends CosmosProtoMessage
    with
        ICosmosProtoQueryMessage<
          QueryTraderDerivativeConditionalOrdersResponse
        > {
  /// the subaccount ID
  final String? subaccountId;

  /// the market ID
  final String? marketId;

  const QueryTraderDerivativeConditionalOrdersRequest({
    this.subaccountId,
    this.marketId,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/injective/exchange/v2/derivative/orders/conditional/{market_id}/{subaccount_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [subaccountId, marketId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'subaccount_id': subaccountId, 'market_id': marketId};
  }

  factory QueryTraderDerivativeConditionalOrdersRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTraderDerivativeConditionalOrdersRequest(
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryTraderDerivativeConditionalOrdersRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTraderDerivativeConditionalOrdersRequest(
      subaccountId: decode.getString<String?>(1),
      marketId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryTraderDerivativeConditionalOrdersRequest;
  @override
  QueryTraderDerivativeConditionalOrdersResponse onQueryResponse(
    List<int> bytes,
  ) {
    return QueryTraderDerivativeConditionalOrdersResponse.deserialize(bytes);
  }

  @override
  QueryTraderDerivativeConditionalOrdersResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryTraderDerivativeConditionalOrdersResponse.fromJson(json);
  }
}

class TrimmedDerivativeConditionalOrder extends CosmosProtoMessage {
  /// price of the order (in human readable format)
  final String? price;

  /// quantity of the order (in human readable format)
  final String? quantity;

  /// margin of the order (in human readable format)
  final String? margin;

  /// price to trigger the order (in human readable format)
  final String? triggerPrice;

  /// true if the order is a buy
  final bool? isBuy;

  /// true if the order is a limit order
  final bool? isLimit;

  /// the order hash
  final String? orderHash;

  /// the client ID
  final String? cid;

  const TrimmedDerivativeConditionalOrder({
    this.price,
    this.quantity,
    this.margin,
    this.triggerPrice,
    this.isBuy,
    this.isLimit,
    this.orderHash,
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
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.bool(5, options: const []),
        ProtoFieldConfig.bool(6, options: const []),
        ProtoFieldConfig.string(7),
        ProtoFieldConfig.string(8),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    price,
    quantity,
    margin,
    triggerPrice,
    isBuy,
    isLimit,
    orderHash,
    cid,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'price': price,
      'quantity': quantity,
      'margin': margin,
      'triggerPrice': triggerPrice,
      'isBuy': isBuy,
      'isLimit': isLimit,
      'order_hash': orderHash,
      'cid': cid,
    };
  }

  factory TrimmedDerivativeConditionalOrder.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return TrimmedDerivativeConditionalOrder(
      price: json.valueAsString<String?>(
        'price',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      quantity: json.valueAsString<String?>(
        'quantity',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      margin: json.valueAsString<String?>(
        'margin',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      triggerPrice: json.valueAsString<String?>(
        'triggerPrice',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      isBuy: json.valueAsBool<bool?>(
        'isBuy',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      isLimit: json.valueAsBool<bool?>(
        'isLimit',
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
    );
  }

  factory TrimmedDerivativeConditionalOrder.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TrimmedDerivativeConditionalOrder(
      price: decode.getString<String?>(1),
      quantity: decode.getString<String?>(2),
      margin: decode.getString<String?>(3),
      triggerPrice: decode.getString<String?>(4),
      isBuy: decode.getBool<bool?>(5),
      isLimit: decode.getBool<bool?>(6),
      orderHash: decode.getString<String?>(7),
      cid: decode.getString<String?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2TrimmedDerivativeConditionalOrder;
}

/// QueryTraderDerivativeOrdersResponse is the response type for the
/// Query/TraderDerivativeOrders RPC method.
class QueryTraderDerivativeConditionalOrdersResponse
    extends CosmosProtoMessage {
  final List<TrimmedDerivativeConditionalOrder> orders;

  const QueryTraderDerivativeConditionalOrdersResponse({
    this.orders = const [],
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
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [orders];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'orders': orders.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QueryTraderDerivativeConditionalOrdersResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTraderDerivativeConditionalOrdersResponse(
      orders:
          (json.valueEnsureAsList<dynamic>(
                'orders',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  TrimmedDerivativeConditionalOrder,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => TrimmedDerivativeConditionalOrder.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryTraderDerivativeConditionalOrdersResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTraderDerivativeConditionalOrdersResponse(
      orders:
          decode
              .getListOfBytes(1)
              .map((b) => TrimmedDerivativeConditionalOrder.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryTraderDerivativeConditionalOrdersResponse;
}

class QueryFullSpotOrderbookRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryFullSpotOrderbookResponse> {
  /// market id
  final String? marketId;

  const QueryFullSpotOrderbookRequest({this.marketId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/spot/L3OrderBook/{market_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [marketId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'market_id': marketId};
  }

  factory QueryFullSpotOrderbookRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryFullSpotOrderbookRequest(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryFullSpotOrderbookRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryFullSpotOrderbookRequest(
      marketId: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryFullSpotOrderbookRequest;
  @override
  QueryFullSpotOrderbookResponse onQueryResponse(List<int> bytes) {
    return QueryFullSpotOrderbookResponse.deserialize(bytes);
  }

  @override
  QueryFullSpotOrderbookResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryFullSpotOrderbookResponse.fromJson(json);
  }
}

class QueryFullSpotOrderbookResponse extends CosmosProtoMessage {
  final List<TrimmedLimitOrder> bids;

  final List<TrimmedLimitOrder> asks;

  /// the current orderbook sequence number
  final BigInt? seq;

  const QueryFullSpotOrderbookResponse({
    this.bids = const [],
    this.asks = const [],
    this.seq,
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
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.uint64(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [bids, asks, seq];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'Bids': bids.map((e) => config.encodeMessage(e)).toList(),
      'Asks': asks.map((e) => config.encodeMessage(e)).toList(),
      'seq': config.encodeBigint(seq),
    };
  }

  factory QueryFullSpotOrderbookResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryFullSpotOrderbookResponse(
      bids:
          (json.valueEnsureAsList<dynamic>(
                'Bids',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<TrimmedLimitOrder, Object>(
                  value: e,
                  parse:
                      (v) => TrimmedLimitOrder.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      asks:
          (json.valueEnsureAsList<dynamic>(
                'Asks',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<TrimmedLimitOrder, Object>(
                  value: e,
                  parse:
                      (v) => TrimmedLimitOrder.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      seq: json.valueAsBigInt<BigInt?>(
        'seq',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryFullSpotOrderbookResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryFullSpotOrderbookResponse(
      bids:
          decode
              .getListOfBytes(1)
              .map((b) => TrimmedLimitOrder.deserialize(b))
              .toList(),
      asks:
          decode
              .getListOfBytes(2)
              .map((b) => TrimmedLimitOrder.deserialize(b))
              .toList(),
      seq: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryFullSpotOrderbookResponse;
}

class QueryFullDerivativeOrderbookRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryFullDerivativeOrderbookResponse> {
  /// market id
  final String? marketId;

  const QueryFullDerivativeOrderbookRequest({this.marketId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/derivative/L3OrderBook/{market_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [marketId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'market_id': marketId};
  }

  factory QueryFullDerivativeOrderbookRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryFullDerivativeOrderbookRequest(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryFullDerivativeOrderbookRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryFullDerivativeOrderbookRequest(
      marketId: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryFullDerivativeOrderbookRequest;
  @override
  QueryFullDerivativeOrderbookResponse onQueryResponse(List<int> bytes) {
    return QueryFullDerivativeOrderbookResponse.deserialize(bytes);
  }

  @override
  QueryFullDerivativeOrderbookResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryFullDerivativeOrderbookResponse.fromJson(json);
  }
}

class QueryFullDerivativeOrderbookResponse extends CosmosProtoMessage {
  final List<TrimmedLimitOrder> bids;

  final List<TrimmedLimitOrder> asks;

  /// the current orderbook sequence number
  final BigInt? seq;

  const QueryFullDerivativeOrderbookResponse({
    this.bids = const [],
    this.asks = const [],
    this.seq,
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
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.uint64(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [bids, asks, seq];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'Bids': bids.map((e) => config.encodeMessage(e)).toList(),
      'Asks': asks.map((e) => config.encodeMessage(e)).toList(),
      'seq': config.encodeBigint(seq),
    };
  }

  factory QueryFullDerivativeOrderbookResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryFullDerivativeOrderbookResponse(
      bids:
          (json.valueEnsureAsList<dynamic>(
                'Bids',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<TrimmedLimitOrder, Object>(
                  value: e,
                  parse:
                      (v) => TrimmedLimitOrder.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      asks:
          (json.valueEnsureAsList<dynamic>(
                'Asks',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<TrimmedLimitOrder, Object>(
                  value: e,
                  parse:
                      (v) => TrimmedLimitOrder.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      seq: json.valueAsBigInt<BigInt?>(
        'seq',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryFullDerivativeOrderbookResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryFullDerivativeOrderbookResponse(
      bids:
          decode
              .getListOfBytes(1)
              .map((b) => TrimmedLimitOrder.deserialize(b))
              .toList(),
      asks:
          decode
              .getListOfBytes(2)
              .map((b) => TrimmedLimitOrder.deserialize(b))
              .toList(),
      seq: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryFullDerivativeOrderbookResponse;
}

class TrimmedLimitOrder extends CosmosProtoMessage {
  /// price of the order (in human readable format)
  final String? price;

  /// quantity of the order (in human readable format)
  final String? quantity;

  /// the order hash
  final String? orderHash;

  /// the subaccount ID
  final String? subaccountId;

  const TrimmedLimitOrder({
    this.price,
    this.quantity,
    this.orderHash,
    this.subaccountId,
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
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [price, quantity, orderHash, subaccountId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'price': price,
      'quantity': quantity,
      'order_hash': orderHash,
      'subaccount_id': subaccountId,
    };
  }

  factory TrimmedLimitOrder.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return TrimmedLimitOrder(
      price: json.valueAsString<String?>(
        'price',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      quantity: json.valueAsString<String?>(
        'quantity',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      orderHash: json.valueAsString<String?>(
        'order_hash',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory TrimmedLimitOrder.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TrimmedLimitOrder(
      price: decode.getString<String?>(1),
      quantity: decode.getString<String?>(2),
      orderHash: decode.getString<String?>(3),
      subaccountId: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2TrimmedLimitOrder;
}

class QueryMarketAtomicExecutionFeeMultiplierRequest extends CosmosProtoMessage
    with
        ICosmosProtoQueryMessage<
          QueryMarketAtomicExecutionFeeMultiplierResponse
        > {
  final String? marketId;

  const QueryMarketAtomicExecutionFeeMultiplierRequest({this.marketId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/atomic_order_fee_multiplier",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [marketId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'market_id': marketId};
  }

  factory QueryMarketAtomicExecutionFeeMultiplierRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryMarketAtomicExecutionFeeMultiplierRequest(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryMarketAtomicExecutionFeeMultiplierRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMarketAtomicExecutionFeeMultiplierRequest(
      marketId: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryMarketAtomicExecutionFeeMultiplierRequest;
  @override
  QueryMarketAtomicExecutionFeeMultiplierResponse onQueryResponse(
    List<int> bytes,
  ) {
    return QueryMarketAtomicExecutionFeeMultiplierResponse.deserialize(bytes);
  }

  @override
  QueryMarketAtomicExecutionFeeMultiplierResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryMarketAtomicExecutionFeeMultiplierResponse.fromJson(json);
  }
}

class QueryMarketAtomicExecutionFeeMultiplierResponse
    extends CosmosProtoMessage {
  final String? multiplier;

  const QueryMarketAtomicExecutionFeeMultiplierResponse({this.multiplier});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [multiplier];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'multiplier': multiplier};
  }

  factory QueryMarketAtomicExecutionFeeMultiplierResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryMarketAtomicExecutionFeeMultiplierResponse(
      multiplier: json.valueAsString<String?>(
        'multiplier',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryMarketAtomicExecutionFeeMultiplierResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMarketAtomicExecutionFeeMultiplierResponse(
      multiplier: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryMarketAtomicExecutionFeeMultiplierResponse;
}

class QueryActiveStakeGrantRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryActiveStakeGrantResponse> {
  final String? grantee;

  const QueryActiveStakeGrantRequest({this.grantee});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/active_stake_grant/{grantee}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [grantee];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'grantee': grantee};
  }

  factory QueryActiveStakeGrantRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryActiveStakeGrantRequest(
      grantee: json.valueAsString<String?>(
        'grantee',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryActiveStakeGrantRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryActiveStakeGrantRequest(grantee: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2QueryActiveStakeGrantRequest;
  @override
  QueryActiveStakeGrantResponse onQueryResponse(List<int> bytes) {
    return QueryActiveStakeGrantResponse.deserialize(bytes);
  }

  @override
  QueryActiveStakeGrantResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryActiveStakeGrantResponse.fromJson(json);
  }
}

class QueryActiveStakeGrantResponse extends CosmosProtoMessage {
  final injective_exchange_v2_exchange.ActiveGrant? grant;

  final injective_exchange_v2_exchange.EffectiveGrant? effectiveGrant;

  const QueryActiveStakeGrantResponse({this.grant, this.effectiveGrant});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [grant, effectiveGrant];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'grant': config.encodeMessage(grant),
      'effective_grant': config.encodeMessage(effectiveGrant),
    };
  }

  factory QueryActiveStakeGrantResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryActiveStakeGrantResponse(
      grant: json.valueTo<injective_exchange_v2_exchange.ActiveGrant?, Object>(
        key: 'grant',
        parse:
            (v) => injective_exchange_v2_exchange.ActiveGrant.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      effectiveGrant: json
          .valueTo<injective_exchange_v2_exchange.EffectiveGrant?, Object>(
            key: 'effective_grant',
            parse:
                (v) => injective_exchange_v2_exchange.EffectiveGrant.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory QueryActiveStakeGrantResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryActiveStakeGrantResponse(
      grant: decode.messageTo<injective_exchange_v2_exchange.ActiveGrant?>(
        1,
        (b) => injective_exchange_v2_exchange.ActiveGrant.deserialize(b),
      ),
      effectiveGrant: decode
          .messageTo<injective_exchange_v2_exchange.EffectiveGrant?>(
            2,
            (b) => injective_exchange_v2_exchange.EffectiveGrant.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryActiveStakeGrantResponse;
}

class QueryGrantAuthorizationRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGrantAuthorizationResponse> {
  final String? granter;

  final String? grantee;

  const QueryGrantAuthorizationRequest({this.granter, this.grantee});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/injective/exchange/v2/grant_authorization/{granter}/{grantee}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [granter, grantee];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'granter': granter, 'grantee': grantee};
  }

  factory QueryGrantAuthorizationRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryGrantAuthorizationRequest(
      granter: json.valueAsString<String?>(
        'granter',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      grantee: json.valueAsString<String?>(
        'grantee',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryGrantAuthorizationRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGrantAuthorizationRequest(
      granter: decode.getString<String?>(1),
      grantee: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryGrantAuthorizationRequest;
  @override
  QueryGrantAuthorizationResponse onQueryResponse(List<int> bytes) {
    return QueryGrantAuthorizationResponse.deserialize(bytes);
  }

  @override
  QueryGrantAuthorizationResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryGrantAuthorizationResponse.fromJson(json);
  }
}

class QueryGrantAuthorizationResponse extends CosmosProtoMessage {
  final String? amount;

  const QueryGrantAuthorizationResponse({this.amount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [amount];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'amount': amount};
  }

  factory QueryGrantAuthorizationResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryGrantAuthorizationResponse(
      amount: json.valueAsString<String?>(
        'amount',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryGrantAuthorizationResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGrantAuthorizationResponse(
      amount: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryGrantAuthorizationResponse;
}

class QueryGrantAuthorizationsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGrantAuthorizationsResponse> {
  final String? granter;

  const QueryGrantAuthorizationsRequest({this.granter});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/grant_authorizations/{granter}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [granter];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'granter': granter};
  }

  factory QueryGrantAuthorizationsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryGrantAuthorizationsRequest(
      granter: json.valueAsString<String?>(
        'granter',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryGrantAuthorizationsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGrantAuthorizationsRequest(
      granter: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryGrantAuthorizationsRequest;
  @override
  QueryGrantAuthorizationsResponse onQueryResponse(List<int> bytes) {
    return QueryGrantAuthorizationsResponse.deserialize(bytes);
  }

  @override
  QueryGrantAuthorizationsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryGrantAuthorizationsResponse.fromJson(json);
  }
}

class QueryGrantAuthorizationsResponse extends CosmosProtoMessage {
  final String? totalGrantAmount;

  final List<injective_exchange_v2_exchange.GrantAuthorization> grants;

  const QueryGrantAuthorizationsResponse({
    this.totalGrantAmount,
    this.grants = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [totalGrantAmount, grants];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'total_grant_amount': totalGrantAmount,
      'grants': grants.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QueryGrantAuthorizationsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryGrantAuthorizationsResponse(
      totalGrantAmount: json.valueAsString<String?>(
        'total_grant_amount',
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
                  injective_exchange_v2_exchange.GrantAuthorization,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_exchange
                          .GrantAuthorization.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryGrantAuthorizationsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGrantAuthorizationsResponse(
      totalGrantAmount: decode.getString<String?>(1),
      grants:
          decode
              .getListOfBytes(2)
              .map(
                (b) => injective_exchange_v2_exchange
                    .GrantAuthorization.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryGrantAuthorizationsResponse;
}

class QueryMarketBalanceRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryMarketBalanceResponse> {
  /// market id
  final String? marketId;

  const QueryMarketBalanceRequest({this.marketId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/market_balance/{market_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [marketId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'market_id': marketId};
  }

  factory QueryMarketBalanceRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryMarketBalanceRequest(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryMarketBalanceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMarketBalanceRequest(marketId: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2QueryMarketBalanceRequest;
  @override
  QueryMarketBalanceResponse onQueryResponse(List<int> bytes) {
    return QueryMarketBalanceResponse.deserialize(bytes);
  }

  @override
  QueryMarketBalanceResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryMarketBalanceResponse.fromJson(json);
  }
}

class QueryMarketBalanceResponse extends CosmosProtoMessage {
  final MarketBalance? balance;

  const QueryMarketBalanceResponse({this.balance});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [balance];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'balance': config.encodeMessage(balance)};
  }

  factory QueryMarketBalanceResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryMarketBalanceResponse(
      balance: json.valueTo<MarketBalance?, Object>(
        key: 'balance',
        parse:
            (v) =>
                MarketBalance.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryMarketBalanceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMarketBalanceResponse(
      balance: decode.messageTo<MarketBalance?>(
        1,
        (b) => MarketBalance.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2QueryMarketBalanceResponse;
}

class QueryMarketBalancesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryMarketBalancesResponse> {
  const QueryMarketBalancesRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/market_balances",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory QueryMarketBalancesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryMarketBalancesRequest();
  }

  factory QueryMarketBalancesRequest.deserialize(List<int> bytes) {
    return QueryMarketBalancesRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2QueryMarketBalancesRequest;
  @override
  QueryMarketBalancesResponse onQueryResponse(List<int> bytes) {
    return QueryMarketBalancesResponse.deserialize(bytes);
  }

  @override
  QueryMarketBalancesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryMarketBalancesResponse.fromJson(json);
  }
}

class QueryMarketBalancesResponse extends CosmosProtoMessage {
  final List<MarketBalance> balances;

  const QueryMarketBalancesResponse({this.balances = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [balances];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'balances': balances.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QueryMarketBalancesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryMarketBalancesResponse(
      balances:
          (json.valueEnsureAsList<dynamic>(
                'balances',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<MarketBalance, Object>(
                  value: e,
                  parse:
                      (v) => MarketBalance.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryMarketBalancesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMarketBalancesResponse(
      balances:
          decode
              .getListOfBytes(1)
              .map((b) => MarketBalance.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2QueryMarketBalancesResponse;
}

class MarketBalance extends CosmosProtoMessage {
  /// the market ID
  final String? marketId;

  /// the current balance of the market
  final String? balance;

  const MarketBalance({this.marketId, this.balance});

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
  List<Object?> get protoValues => [marketId, balance];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'market_id': marketId, 'balance': balance};
  }

  factory MarketBalance.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MarketBalance(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      balance: json.valueAsString<String?>(
        'balance',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MarketBalance.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MarketBalance(
      marketId: decode.getString<String?>(1),
      balance: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MarketBalance;
}

class QueryDenomMinNotionalRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDenomMinNotionalResponse> {
  final String? denom;

  const QueryDenomMinNotionalRequest({this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/denom_min_notional/{denom}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [denom];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'denom': denom};
  }

  factory QueryDenomMinNotionalRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryDenomMinNotionalRequest(
      denom: json.valueAsString<String?>(
        'denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryDenomMinNotionalRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomMinNotionalRequest(denom: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2QueryDenomMinNotionalRequest;
  @override
  QueryDenomMinNotionalResponse onQueryResponse(List<int> bytes) {
    return QueryDenomMinNotionalResponse.deserialize(bytes);
  }

  @override
  QueryDenomMinNotionalResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryDenomMinNotionalResponse.fromJson(json);
  }
}

class QueryDenomMinNotionalResponse extends CosmosProtoMessage {
  /// the minimum notional amount for the denom (in human readable format)
  final String? amount;

  const QueryDenomMinNotionalResponse({this.amount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [amount];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'amount': amount};
  }

  factory QueryDenomMinNotionalResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryDenomMinNotionalResponse(
      amount: json.valueAsString<String?>(
        'amount',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryDenomMinNotionalResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomMinNotionalResponse(amount: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryDenomMinNotionalResponse;
}

class QueryDenomMinNotionalsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDenomMinNotionalsResponse> {
  const QueryDenomMinNotionalsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/denom_min_notionals",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory QueryDenomMinNotionalsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryDenomMinNotionalsRequest();
  }

  factory QueryDenomMinNotionalsRequest.deserialize(List<int> bytes) {
    return QueryDenomMinNotionalsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryDenomMinNotionalsRequest;
  @override
  QueryDenomMinNotionalsResponse onQueryResponse(List<int> bytes) {
    return QueryDenomMinNotionalsResponse.deserialize(bytes);
  }

  @override
  QueryDenomMinNotionalsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryDenomMinNotionalsResponse.fromJson(json);
  }
}

class QueryDenomMinNotionalsResponse extends CosmosProtoMessage {
  final List<injective_exchange_v2_exchange.DenomMinNotional> denomMinNotionals;

  const QueryDenomMinNotionalsResponse({this.denomMinNotionals = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [denomMinNotionals];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'denom_min_notionals':
          denomMinNotionals.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QueryDenomMinNotionalsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryDenomMinNotionalsResponse(
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

  factory QueryDenomMinNotionalsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomMinNotionalsResponse(
      denomMinNotionals:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_exchange_v2_exchange
                    .DenomMinNotional.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2QueryDenomMinNotionalsResponse;
}

class OpenInterest extends CosmosProtoMessage {
  /// the market ID
  final String? marketId;

  /// the open interest of the market
  final String? balance;

  const OpenInterest({this.marketId, this.balance});

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
  List<Object?> get protoValues => [marketId, balance];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'market_id': marketId, 'balance': balance};
  }

  factory OpenInterest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return OpenInterest(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      balance: json.valueAsString<String?>(
        'balance',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory OpenInterest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return OpenInterest(
      marketId: decode.getString<String?>(1),
      balance: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2OpenInterest;
}

class QueryOpenInterestRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryOpenInterestResponse> {
  /// market id
  final String? marketId;

  const QueryOpenInterestRequest({this.marketId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v2/open_interest",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [marketId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'market_id': marketId};
  }

  factory QueryOpenInterestRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryOpenInterestRequest(
      marketId: json.valueAsString<String?>(
        'market_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryOpenInterestRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryOpenInterestRequest(marketId: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2QueryOpenInterestRequest;
  @override
  QueryOpenInterestResponse onQueryResponse(List<int> bytes) {
    return QueryOpenInterestResponse.deserialize(bytes);
  }

  @override
  QueryOpenInterestResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryOpenInterestResponse.fromJson(json);
  }
}

class QueryOpenInterestResponse extends CosmosProtoMessage {
  final OpenInterest? amount;

  const QueryOpenInterestResponse({this.amount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [amount];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'amount': config.encodeMessage(amount)};
  }

  factory QueryOpenInterestResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryOpenInterestResponse(
      amount: json.valueTo<OpenInterest?, Object>(
        key: 'amount',
        parse:
            (v) => OpenInterest.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryOpenInterestResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryOpenInterestResponse(
      amount: decode.messageTo<OpenInterest?>(
        1,
        (b) => OpenInterest.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2QueryOpenInterestResponse;
}
