import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/exchange/v1beta1/src/exchange.dart"
    as injective_exchange_v1beta1_exchange;
import "package:cosmos_sdk/proto_messages/injective/exchange/v1beta1/src/genesis.dart"
    as injective_exchange_v1beta1_genesis;
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
  final String? trader;

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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1Subaccount;
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
          path: "/injective/exchange/v1beta1/orders/{subaccount_id}",
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
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QuerySubaccountOrdersRequest;
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
  final List<injective_exchange_v1beta1_exchange.SubaccountOrderData> buyOrders;

  final List<injective_exchange_v1beta1_exchange.SubaccountOrderData>
  sellOrders;

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
                  injective_exchange_v1beta1_exchange.SubaccountOrderData,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_exchange
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
                  injective_exchange_v1beta1_exchange.SubaccountOrderData,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_exchange
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
                (b) => injective_exchange_v1beta1_exchange
                    .SubaccountOrderData.deserialize(b),
              )
              .toList(),
      sellOrders:
          decode
              .getListOfBytes(2)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .SubaccountOrderData.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QuerySubaccountOrdersResponse;
}

class SubaccountOrderbookMetadataWithMarket extends CosmosProtoMessage {
  /// the subaccount orderbook metadata
  final injective_exchange_v1beta1_exchange.SubaccountOrderbookMetadata?
  metadata;

  /// the market ID
  final String? marketId;

  /// true if the order is for buy orders
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
        injective_exchange_v1beta1_exchange.SubaccountOrderbookMetadata?,
        Object
      >(
        key: 'metadata',
        parse:
            (v) => injective_exchange_v1beta1_exchange
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
        injective_exchange_v1beta1_exchange.SubaccountOrderbookMetadata?
      >(
        1,
        (b) => injective_exchange_v1beta1_exchange
            .SubaccountOrderbookMetadata.deserialize(b),
      ),
      marketId: decode.getString<String?>(2),
      isBuy: decode.getBool<bool?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1SubaccountOrderbookMetadataWithMarket;
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
          path: "/injective/exchange/v1beta1/exchangeParams",
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
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryExchangeParamsRequest;
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
  final injective_exchange_v1beta1_exchange.Params? params;

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
      params: json.valueTo<injective_exchange_v1beta1_exchange.Params?, Object>(
        key: 'params',
        parse:
            (v) => injective_exchange_v1beta1_exchange.Params.fromJson(
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
      params: decode.messageTo<injective_exchange_v1beta1_exchange.Params?>(
        1,
        (b) => injective_exchange_v1beta1_exchange.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryExchangeParamsResponse;
}

/// QuerySubaccountDepositsRequest is the request type for the
/// Query/SubaccountDeposits RPC method.
class QuerySubaccountDepositsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySubaccountDepositsResponse> {
  /// the subaccount ID
  final String? subaccountId;

  /// subaccount details
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
          path: "/injective/exchange/v1beta1/exchange/subaccountDeposits",
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
          .injectiveExchangeV1beta1QuerySubaccountDepositsRequest;
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
  final Map<String, injective_exchange_v1beta1_exchange.Deposit> deposits;

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
          JsonParser.valueTo<
            injective_exchange_v1beta1_exchange.Deposit,
            Object
          >(
            value: v,
            parse:
                (v) => injective_exchange_v1beta1_exchange.Deposit.fromJson(
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
          .getMapField<String, injective_exchange_v1beta1_exchange.Deposit>(
            fieldNumber: 1,
            keyMapper: (v) => JsonParser.valueAs<String>(v),
            valueMapper:
                (v) => injective_exchange_v1beta1_exchange.Deposit.deserialize(
                  JsonParser.valueAsBytes<List<int>>(v),
                ),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QuerySubaccountDepositsResponse;
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
          path: "/injective/exchange/v1beta1/exchange/exchangeBalances",
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
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryExchangeBalancesRequest;
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
  final List<injective_exchange_v1beta1_genesis.Balance> balances;

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
                  injective_exchange_v1beta1_genesis.Balance,
                  Object
                >(
                  value: e,
                  parse:
                      (v) =>
                          injective_exchange_v1beta1_genesis.Balance.fromJson(
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
              .map(
                (b) =>
                    injective_exchange_v1beta1_genesis.Balance.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryExchangeBalancesResponse;
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
          path:
              "/injective/exchange/v1beta1/exchange/aggregateVolume/{account}",
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
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryAggregateVolumeRequest;
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
  final List<injective_exchange_v1beta1_exchange.MarketVolume> aggregateVolumes;

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
    );
  }

  factory QueryAggregateVolumeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAggregateVolumeResponse(
      aggregateVolumes:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .MarketVolume.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryAggregateVolumeResponse;
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
          path: "/injective/exchange/v1beta1/exchange/aggregateVolumes",
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
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryAggregateVolumesRequest;
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
  final List<injective_exchange_v1beta1_exchange.AggregateAccountVolumeRecord>
  aggregateAccountVolumes;

  /// the aggregate volumes for the markets specified
  final List<injective_exchange_v1beta1_exchange.MarketVolume>
  aggregateMarketVolumes;

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
                  injective_exchange_v1beta1_exchange.AggregateAccountVolumeRecord,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_exchange
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
    );
  }

  factory QueryAggregateVolumesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAggregateVolumesResponse(
      aggregateAccountVolumes:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .AggregateAccountVolumeRecord.deserialize(b),
              )
              .toList(),
      aggregateMarketVolumes:
          decode
              .getListOfBytes(2)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .MarketVolume.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryAggregateVolumesResponse;
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
              "/injective/exchange/v1beta1/exchange/aggregateMarketVolume/{market_id}",
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
          .injectiveExchangeV1beta1QueryAggregateMarketVolumeRequest;
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
  final injective_exchange_v1beta1_exchange.VolumeRecord? volume;

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
      volume: json
          .valueTo<injective_exchange_v1beta1_exchange.VolumeRecord?, Object>(
            key: 'volume',
            parse:
                (v) =>
                    injective_exchange_v1beta1_exchange.VolumeRecord.fromJson(
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
      volume: decode
          .messageTo<injective_exchange_v1beta1_exchange.VolumeRecord?>(
            1,
            (b) =>
                injective_exchange_v1beta1_exchange.VolumeRecord.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryAggregateMarketVolumeResponse;
}

/// QueryDenomDecimalRequest is the request type for the Query/DenomDecimal RPC
/// method.
class QueryDenomDecimalRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDenomDecimalResponse> {
  final String? denom;

  const QueryDenomDecimalRequest({this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v1beta1/exchange/denom_decimal/{denom}",
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

  factory QueryDenomDecimalRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryDenomDecimalRequest(
      denom: json.valueAsString<String?>(
        'denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryDenomDecimalRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomDecimalRequest(denom: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryDenomDecimalRequest;
  @override
  QueryDenomDecimalResponse onQueryResponse(List<int> bytes) {
    return QueryDenomDecimalResponse.deserialize(bytes);
  }

  @override
  QueryDenomDecimalResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryDenomDecimalResponse.fromJson(json);
  }
}

/// QueryDenomDecimalResponse is the response type for the Query/DenomDecimal RPC
/// method.
class QueryDenomDecimalResponse extends CosmosProtoMessage {
  final BigInt? decimal;

  const QueryDenomDecimalResponse({this.decimal});

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

  factory QueryDenomDecimalResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryDenomDecimalResponse(
      decimal: json.valueAsBigInt<BigInt?>(
        'decimal',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryDenomDecimalResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomDecimalResponse(decimal: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryDenomDecimalResponse;
}

/// QueryDenomDecimalsRequest is the request type for the Query/DenomDecimals RPC
/// method.
class QueryDenomDecimalsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDenomDecimalsResponse> {
  /// denoms can be empty to query all denom decimals
  final List<String> denoms;

  const QueryDenomDecimalsRequest({this.denoms = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v1beta1/exchange/denom_decimals",
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

  factory QueryDenomDecimalsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryDenomDecimalsRequest(
      denoms:
          (json.valueEnsureAsList<dynamic>(
            'denoms',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory QueryDenomDecimalsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomDecimalsRequest(denoms: decode.getListOrEmpty<String>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryDenomDecimalsRequest;
  @override
  QueryDenomDecimalsResponse onQueryResponse(List<int> bytes) {
    return QueryDenomDecimalsResponse.deserialize(bytes);
  }

  @override
  QueryDenomDecimalsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryDenomDecimalsResponse.fromJson(json);
  }
}

/// QueryDenomDecimalsRequest is the response type for the Query/DenomDecimals
/// RPC method.
class QueryDenomDecimalsResponse extends CosmosProtoMessage {
  final List<injective_exchange_v1beta1_exchange.DenomDecimals> denomDecimals;

  const QueryDenomDecimalsResponse({this.denomDecimals = const []});

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

  factory QueryDenomDecimalsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryDenomDecimalsResponse(
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
    );
  }

  factory QueryDenomDecimalsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomDecimalsResponse(
      denomDecimals:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .DenomDecimals.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryDenomDecimalsResponse;
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
          path: "/injective/exchange/v1beta1/exchange/aggregateMarketVolumes",
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
          .injectiveExchangeV1beta1QueryAggregateMarketVolumesRequest;
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
  final List<injective_exchange_v1beta1_exchange.MarketVolume> volumes;

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
    );
  }

  factory QueryAggregateMarketVolumesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAggregateMarketVolumesResponse(
      volumes:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .MarketVolume.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryAggregateMarketVolumesResponse;
}

/// QuerySubaccountDepositsRequest is the request type for the
/// Query/SubaccountDeposits RPC method.
class QuerySubaccountDepositRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySubaccountDepositResponse> {
  /// the subaccount ID
  final String? subaccountId;

  /// the denom of the balance
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
          path: "/injective/exchange/v1beta1/exchange/subaccountDeposit",
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
          .injectiveExchangeV1beta1QuerySubaccountDepositRequest;
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
  final injective_exchange_v1beta1_exchange.Deposit? deposits;

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

  factory QuerySubaccountDepositResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySubaccountDepositResponse(
      deposits: decode.messageTo<injective_exchange_v1beta1_exchange.Deposit?>(
        1,
        (b) => injective_exchange_v1beta1_exchange.Deposit.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QuerySubaccountDepositResponse;
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
          path: "/injective/exchange/v1beta1/spot/markets",
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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1QuerySpotMarketsRequest;
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
  final List<injective_exchange_v1beta1_exchange.SpotMarket> markets;

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
    );
  }

  factory QuerySpotMarketsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySpotMarketsResponse(
      markets:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .SpotMarket.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QuerySpotMarketsResponse;
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
          path: "/injective/exchange/v1beta1/spot/markets/{market_id}",
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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1QuerySpotMarketRequest;
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
  final injective_exchange_v1beta1_exchange.SpotMarket? market;

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
      market: json
          .valueTo<injective_exchange_v1beta1_exchange.SpotMarket?, Object>(
            key: 'market',
            parse:
                (v) => injective_exchange_v1beta1_exchange.SpotMarket.fromJson(
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
      market: decode.messageTo<injective_exchange_v1beta1_exchange.SpotMarket?>(
        1,
        (b) => injective_exchange_v1beta1_exchange.SpotMarket.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1QuerySpotMarketResponse;
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
  /// notional (in chain format)
  final String? limitCumulativeNotional;

  /// limits the number of entries to return per side based on the cumulative
  /// quantity (in chain format)
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
          path: "/injective/exchange/v1beta1/spot/orderbook/{market_id}",
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
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QuerySpotOrderbookRequest;
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
  final List<injective_exchange_v1beta1_exchange.Level> buysPriceLevel;

  final List<injective_exchange_v1beta1_exchange.Level> sellsPriceLevel;

  const QuerySpotOrderbookResponse({
    this.buysPriceLevel = const [],
    this.sellsPriceLevel = const [],
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
  List<Object?> get protoValues => [buysPriceLevel, sellsPriceLevel];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'buys_price_level':
          buysPriceLevel.map((e) => config.encodeMessage(e)).toList(),
      'sells_price_level':
          sellsPriceLevel.map((e) => config.encodeMessage(e)).toList(),
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
                  injective_exchange_v1beta1_exchange.Level,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_exchange.Level.fromJson(
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
                  injective_exchange_v1beta1_exchange.Level,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_exchange.Level.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QuerySpotOrderbookResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySpotOrderbookResponse(
      buysPriceLevel:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_exchange_v1beta1_exchange.Level.deserialize(b),
              )
              .toList(),
      sellsPriceLevel:
          decode
              .getListOfBytes(2)
              .map(
                (b) => injective_exchange_v1beta1_exchange.Level.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QuerySpotOrderbookResponse;
}

class FullSpotMarket extends CosmosProtoMessage {
  final injective_exchange_v1beta1_exchange.SpotMarket? market;

  /// mid_price_and_tob defines the mid price for this market and the best ask
  /// and bid orders
  final injective_exchange_v1beta1_exchange.MidPriceAndTOB? midPriceAndTob;

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
      market: json
          .valueTo<injective_exchange_v1beta1_exchange.SpotMarket?, Object>(
            key: 'market',
            parse:
                (v) => injective_exchange_v1beta1_exchange.SpotMarket.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      midPriceAndTob: json
          .valueTo<injective_exchange_v1beta1_exchange.MidPriceAndTOB?, Object>(
            key: 'mid_price_and_tob',
            parse:
                (v) =>
                    injective_exchange_v1beta1_exchange.MidPriceAndTOB.fromJson(
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
      market: decode.messageTo<injective_exchange_v1beta1_exchange.SpotMarket?>(
        1,
        (b) => injective_exchange_v1beta1_exchange.SpotMarket.deserialize(b),
      ),
      midPriceAndTob: decode
          .messageTo<injective_exchange_v1beta1_exchange.MidPriceAndTOB?>(
            2,
            (b) => injective_exchange_v1beta1_exchange
                .MidPriceAndTOB.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1FullSpotMarket;
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
          path: "/injective/exchange/v1beta1/spot/full_markets",
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
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryFullSpotMarketsRequest;
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
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryFullSpotMarketsResponse;
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
          path: "/injective/exchange/v1beta1/spot/full_market/{market_id}",
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
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryFullSpotMarketRequest;
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
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryFullSpotMarketResponse;
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
              "/injective/exchange/v1beta1/spot/orders_by_hashes/{market_id}/{subaccount_id}",
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
          .injectiveExchangeV1beta1QuerySpotOrdersByHashesRequest;
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
          .injectiveExchangeV1beta1QuerySpotOrdersByHashesResponse;
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
              "/injective/exchange/v1beta1/spot/orders/{market_id}/{subaccount_id}",
        ),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/injective/exchange/v1beta1/spot/transient_orders/{market_id}/{subaccount_id}",
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
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryTraderSpotOrdersRequest;
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
              "/injective/exchange/v1beta1/spot/orders/{market_id}/account/{account_address}",
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
          .injectiveExchangeV1beta1QueryAccountAddressSpotOrdersRequest;
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
  /// price of the order (in chain format)
  final String? price;

  /// quantity of the order (in chain format)
  final String? quantity;

  /// the amount of the quantity remaining fillable (in chain format)
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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1TrimmedSpotLimitOrder;
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
          .injectiveExchangeV1beta1QueryTraderSpotOrdersResponse;
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
          .injectiveExchangeV1beta1QueryAccountAddressSpotOrdersResponse;
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
          path:
              "/injective/exchange/v1beta1/spot/mid_price_and_tob/{market_id}",
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
          .injectiveExchangeV1beta1QuerySpotMidPriceAndTOBRequest;
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
  /// mid price of the market (in chain format)
  final String? midPrice;

  /// best buy price of the market (in chain format)
  final String? bestBuyPrice;

  /// best sell price of the market (in chain format)
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
          .injectiveExchangeV1beta1QuerySpotMidPriceAndTOBResponse;
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
              "/injective/exchange/v1beta1/derivative/mid_price_and_tob/{market_id}",
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
          .injectiveExchangeV1beta1QueryDerivativeMidPriceAndTOBRequest;
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
          .injectiveExchangeV1beta1QueryDerivativeMidPriceAndTOBResponse;
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
          path: "/injective/exchange/v1beta1/derivative/orderbook/{market_id}",
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
          .injectiveExchangeV1beta1QueryDerivativeOrderbookRequest;
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
  final List<injective_exchange_v1beta1_exchange.Level> buysPriceLevel;

  final List<injective_exchange_v1beta1_exchange.Level> sellsPriceLevel;

  const QueryDerivativeOrderbookResponse({
    this.buysPriceLevel = const [],
    this.sellsPriceLevel = const [],
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
  List<Object?> get protoValues => [buysPriceLevel, sellsPriceLevel];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'buys_price_level':
          buysPriceLevel.map((e) => config.encodeMessage(e)).toList(),
      'sells_price_level':
          sellsPriceLevel.map((e) => config.encodeMessage(e)).toList(),
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
                  injective_exchange_v1beta1_exchange.Level,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_exchange.Level.fromJson(
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
                  injective_exchange_v1beta1_exchange.Level,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_exchange.Level.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryDerivativeOrderbookResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDerivativeOrderbookResponse(
      buysPriceLevel:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_exchange_v1beta1_exchange.Level.deserialize(b),
              )
              .toList(),
      sellsPriceLevel:
          decode
              .getListOfBytes(2)
              .map(
                (b) => injective_exchange_v1beta1_exchange.Level.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryDerivativeOrderbookResponse;
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
              "/injective/exchange/v1beta1/derivative/orders/{market_id}/{subaccount_id}",
        ),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/injective/exchange/v1beta1/derivative/transient_orders/{market_id}/{subaccount_id}",
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
          .injectiveExchangeV1beta1QueryTraderDerivativeOrdersRequest;
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
              "/injective/exchange/v1beta1/derivative/orders/{market_id}/account/{account_address}",
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
          .injectiveExchangeV1beta1QueryAccountAddressDerivativeOrdersRequest;
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
  /// price of the order (in chain format)
  final String? price;

  /// quantity of the order (in chain format)
  final String? quantity;

  /// margin of the order (in chain format)
  final String? margin;

  /// the amount of the quantity remaining fillable (in chain format)
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
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1TrimmedDerivativeLimitOrder;
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
          .injectiveExchangeV1beta1QueryTraderDerivativeOrdersResponse;
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
          .injectiveExchangeV1beta1QueryAccountAddressDerivativeOrdersResponse;
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
              "/injective/exchange/v1beta1/derivative/orders_by_hashes/{market_id}/{subaccount_id}",
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
          .injectiveExchangeV1beta1QueryDerivativeOrdersByHashesRequest;
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
          .injectiveExchangeV1beta1QueryDerivativeOrdersByHashesResponse;
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
          path: "/injective/exchange/v1beta1/derivative/markets",
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
          .injectiveExchangeV1beta1QueryDerivativeMarketsRequest;
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
  final injective_exchange_v1beta1_exchange.PerpetualMarketInfo? marketInfo;

  final injective_exchange_v1beta1_exchange.PerpetualMarketFunding? fundingInfo;

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
      marketInfo: json.valueTo<
        injective_exchange_v1beta1_exchange.PerpetualMarketInfo?,
        Object
      >(
        key: 'market_info',
        parse:
            (v) => injective_exchange_v1beta1_exchange
                .PerpetualMarketInfo.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      fundingInfo: json.valueTo<
        injective_exchange_v1beta1_exchange.PerpetualMarketFunding?,
        Object
      >(
        key: 'funding_info',
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

  factory PerpetualMarketState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PerpetualMarketState(
      marketInfo: decode
          .messageTo<injective_exchange_v1beta1_exchange.PerpetualMarketInfo?>(
            1,
            (b) => injective_exchange_v1beta1_exchange
                .PerpetualMarketInfo.deserialize(b),
          ),
      fundingInfo: decode.messageTo<
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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1PerpetualMarketState;
}

class FullDerivativeMarket extends CosmosProtoMessage {
  /// derivative market details
  final injective_exchange_v1beta1_exchange.DerivativeMarket? market;

  /// perpetual market state or expiry futures market state
  /// perpetual market info
  final PerpetualMarketState? perpetualInfo;

  /// expiry futures market info
  final injective_exchange_v1beta1_exchange.ExpiryFuturesMarketInfo?
  futuresInfo;

  /// mark price (in chain format)
  final String? markPrice;

  /// mid_price_and_tob defines the mid price for this market and the best ask
  /// and bid orders
  final injective_exchange_v1beta1_exchange.MidPriceAndTOB? midPriceAndTob;

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
      market: json.valueTo<
        injective_exchange_v1beta1_exchange.DerivativeMarket?,
        Object
      >(
        key: 'market',
        parse:
            (v) =>
                injective_exchange_v1beta1_exchange.DerivativeMarket.fromJson(
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
        injective_exchange_v1beta1_exchange.ExpiryFuturesMarketInfo?,
        Object
      >(
        key: 'futures_info',
        parse:
            (v) => injective_exchange_v1beta1_exchange
                .ExpiryFuturesMarketInfo.fromJson(
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
          .valueTo<injective_exchange_v1beta1_exchange.MidPriceAndTOB?, Object>(
            key: 'mid_price_and_tob',
            parse:
                (v) =>
                    injective_exchange_v1beta1_exchange.MidPriceAndTOB.fromJson(
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
      market: decode
          .messageTo<injective_exchange_v1beta1_exchange.DerivativeMarket?>(
            1,
            (b) => injective_exchange_v1beta1_exchange
                .DerivativeMarket.deserialize(b),
          ),
      perpetualInfo: decode.messageTo<PerpetualMarketState?>(
        2,
        (b) => PerpetualMarketState.deserialize(b),
      ),
      futuresInfo: decode.messageTo<
        injective_exchange_v1beta1_exchange.ExpiryFuturesMarketInfo?
      >(
        3,
        (b) => injective_exchange_v1beta1_exchange
            .ExpiryFuturesMarketInfo.deserialize(b),
      ),
      markPrice: decode.getString<String?>(4),
      midPriceAndTob: decode
          .messageTo<injective_exchange_v1beta1_exchange.MidPriceAndTOB?>(
            5,
            (b) => injective_exchange_v1beta1_exchange
                .MidPriceAndTOB.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1FullDerivativeMarket;
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
          .injectiveExchangeV1beta1QueryDerivativeMarketsResponse;
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
          path: "/injective/exchange/v1beta1/derivative/markets/{market_id}",
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
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryDerivativeMarketRequest;
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
          .injectiveExchangeV1beta1QueryDerivativeMarketResponse;
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
          path:
              "/injective/exchange/v1beta1/derivative/market_address/{market_id}",
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
          .injectiveExchangeV1beta1QueryDerivativeMarketAddressRequest;
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
          .injectiveExchangeV1beta1QueryDerivativeMarketAddressResponse;
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
          path: "/injective/exchange/v1beta1/exchange/{subaccount_id}",
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
          .injectiveExchangeV1beta1QuerySubaccountTradeNonceRequest;
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
          path:
              "/injective/exchange/v1beta1/subaccount_positions/{subaccount_id}",
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
          .injectiveExchangeV1beta1QuerySubaccountPositionsRequest;
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
          path:
              "/injective/exchange/v1beta1/positions/{subaccount_id}/{market_id}",
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
          .injectiveExchangeV1beta1QuerySubaccountPositionInMarketRequest;
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
              "/injective/exchange/v1beta1/effective_positions/{subaccount_id}/{market_id}",
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
          .injectiveExchangeV1beta1QuerySubaccountEffectivePositionInMarketRequest;
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
          path: "/injective/exchange/v1beta1/order_metadata/{subaccount_id}",
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
          .injectiveExchangeV1beta1QuerySubaccountOrderMetadataRequest;
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
  final List<injective_exchange_v1beta1_genesis.DerivativePosition> state;

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
                  injective_exchange_v1beta1_genesis.DerivativePosition,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_genesis
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
                (b) => injective_exchange_v1beta1_genesis
                    .DerivativePosition.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QuerySubaccountPositionsResponse;
}

/// QuerySubaccountPositionInMarketResponse is the response type for the
/// Query/SubaccountPositionInMarket RPC method.
class QuerySubaccountPositionInMarketResponse extends CosmosProtoMessage {
  final injective_exchange_v1beta1_exchange.Position? state;

  const QuerySubaccountPositionInMarketResponse({this.state});

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

  factory QuerySubaccountPositionInMarketResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySubaccountPositionInMarketResponse(
      state: json
          .valueTo<injective_exchange_v1beta1_exchange.Position?, Object>(
            key: 'state',
            parse:
                (v) => injective_exchange_v1beta1_exchange.Position.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory QuerySubaccountPositionInMarketResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySubaccountPositionInMarketResponse(
      state: decode.messageTo<injective_exchange_v1beta1_exchange.Position?>(
        1,
        (b) => injective_exchange_v1beta1_exchange.Position.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QuerySubaccountPositionInMarketResponse;
}

class EffectivePosition extends CosmosProtoMessage {
  /// whether the position is long or short
  final bool? isLong;

  /// the quantity of the position (in chain format)
  final String? quantity;

  /// the entry price of the position (in chain format)
  final String? entryPrice;

  /// the effective margin of the position (in chain format)
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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1EffectivePosition;
}

/// QuerySubaccountEffectivePositionInMarketResponse is the response type for the
/// Query/SubaccountEffectivePositionInMarket RPC method.
class QuerySubaccountEffectivePositionInMarketResponse
    extends CosmosProtoMessage {
  final EffectivePosition? state;

  const QuerySubaccountEffectivePositionInMarketResponse({this.state});

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
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QuerySubaccountEffectivePositionInMarketResponse;
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
          path: "/injective/exchange/v1beta1/perpetual_market_info/{market_id}",
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
          .injectiveExchangeV1beta1QueryPerpetualMarketInfoRequest;
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
  final injective_exchange_v1beta1_exchange.PerpetualMarketInfo? info;

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
      info: json.valueTo<
        injective_exchange_v1beta1_exchange.PerpetualMarketInfo?,
        Object
      >(
        key: 'info',
        parse:
            (v) => injective_exchange_v1beta1_exchange
                .PerpetualMarketInfo.fromJson(
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
      info: decode
          .messageTo<injective_exchange_v1beta1_exchange.PerpetualMarketInfo?>(
            1,
            (b) => injective_exchange_v1beta1_exchange
                .PerpetualMarketInfo.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryPerpetualMarketInfoResponse;
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
          path: "/injective/exchange/v1beta1/expiry_market_info/{market_id}",
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
          .injectiveExchangeV1beta1QueryExpiryFuturesMarketInfoRequest;
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
  final injective_exchange_v1beta1_exchange.ExpiryFuturesMarketInfo? info;

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
        injective_exchange_v1beta1_exchange.ExpiryFuturesMarketInfo?,
        Object
      >(
        key: 'info',
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

  factory QueryExpiryFuturesMarketInfoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryExpiryFuturesMarketInfoResponse(
      info: decode.messageTo<
        injective_exchange_v1beta1_exchange.ExpiryFuturesMarketInfo?
      >(
        1,
        (b) => injective_exchange_v1beta1_exchange
            .ExpiryFuturesMarketInfo.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryExpiryFuturesMarketInfoResponse;
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
          path:
              "/injective/exchange/v1beta1/perpetual_market_funding/{market_id}",
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
          .injectiveExchangeV1beta1QueryPerpetualMarketFundingRequest;
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
  final injective_exchange_v1beta1_exchange.PerpetualMarketFunding? state;

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
        injective_exchange_v1beta1_exchange.PerpetualMarketFunding?,
        Object
      >(
        key: 'state',
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

  factory QueryPerpetualMarketFundingResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPerpetualMarketFundingResponse(
      state: decode.messageTo<
        injective_exchange_v1beta1_exchange.PerpetualMarketFunding?
      >(
        1,
        (b) => injective_exchange_v1beta1_exchange
            .PerpetualMarketFunding.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryPerpetualMarketFundingResponse;
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
          .injectiveExchangeV1beta1QuerySubaccountOrderMetadataResponse;
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
          .injectiveExchangeV1beta1QuerySubaccountTradeNonceResponse;
}

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
          path: "/injective/exchange/v1beta1/module_state",
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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1QueryModuleStateRequest;
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
  final injective_exchange_v1beta1_genesis.GenesisState? state;

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
      state: json
          .valueTo<injective_exchange_v1beta1_genesis.GenesisState?, Object>(
            key: 'state',
            parse:
                (v) => injective_exchange_v1beta1_genesis.GenesisState.fromJson(
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
      state: decode.messageTo<injective_exchange_v1beta1_genesis.GenesisState?>(
        1,
        (b) => injective_exchange_v1beta1_genesis.GenesisState.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryModuleStateResponse;
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
          path: "/injective/exchange/v1beta1/positions",
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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1QueryPositionsRequest;
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
  final List<injective_exchange_v1beta1_genesis.DerivativePosition> state;

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
                  injective_exchange_v1beta1_genesis.DerivativePosition,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_genesis
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
                (b) => injective_exchange_v1beta1_genesis
                    .DerivativePosition.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1QueryPositionsResponse;
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
          path: "/injective/exchange/v1beta1/trade_reward_points",
        ),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/exchange/v1beta1/pending_trade_reward_points",
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
          .injectiveExchangeV1beta1QueryTradeRewardPointsRequest;
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
          .injectiveExchangeV1beta1QueryTradeRewardPointsResponse;
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
          path: "/injective/exchange/v1beta1/trade_reward_campaign",
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
          .injectiveExchangeV1beta1QueryTradeRewardCampaignRequest;
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
  final injective_exchange_v1beta1_exchange.TradingRewardCampaignInfo?
  tradingRewardCampaignInfo;

  final List<injective_exchange_v1beta1_exchange.CampaignRewardPool>
  tradingRewardPoolCampaignSchedule;

  final String? totalTradeRewardPoints;

  final List<injective_exchange_v1beta1_exchange.CampaignRewardPool>
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
      tradingRewardCampaignInfo: decode.messageTo<
        injective_exchange_v1beta1_exchange.TradingRewardCampaignInfo?
      >(
        1,
        (b) => injective_exchange_v1beta1_exchange
            .TradingRewardCampaignInfo.deserialize(b),
      ),
      tradingRewardPoolCampaignSchedule:
          decode
              .getListOfBytes(2)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .CampaignRewardPool.deserialize(b),
              )
              .toList(),
      totalTradeRewardPoints: decode.getString<String?>(3),
      pendingTradingRewardPoolCampaignSchedule:
          decode
              .getListOfBytes(4)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .CampaignRewardPool.deserialize(b),
              )
              .toList(),
      pendingTotalTradeRewardPoints: decode.getListOrEmpty<String>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryTradeRewardCampaignResponse;
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
          path: "/injective/exchange/v1beta1/is_opted_out_of_rewards/{account}",
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
          .injectiveExchangeV1beta1QueryIsOptedOutOfRewardsRequest;
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
          .injectiveExchangeV1beta1QueryIsOptedOutOfRewardsResponse;
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
          path: "/injective/exchange/v1beta1/opted_out_of_rewards_accounts",
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
          .injectiveExchangeV1beta1QueryOptedOutOfRewardsAccountsRequest;
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
          .injectiveExchangeV1beta1QueryOptedOutOfRewardsAccountsResponse;
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
          path:
              "/injective/exchange/v1beta1/fee_discount_account_info/{account}",
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
          .injectiveExchangeV1beta1QueryFeeDiscountAccountInfoRequest;
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

  final injective_exchange_v1beta1_exchange.FeeDiscountTierInfo? accountInfo;

  final injective_exchange_v1beta1_exchange.FeeDiscountTierTTL? accountTtl;

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
      accountInfo: json.valueTo<
        injective_exchange_v1beta1_exchange.FeeDiscountTierInfo?,
        Object
      >(
        key: 'account_info',
        parse:
            (v) => injective_exchange_v1beta1_exchange
                .FeeDiscountTierInfo.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      accountTtl: json.valueTo<
        injective_exchange_v1beta1_exchange.FeeDiscountTierTTL?,
        Object
      >(
        key: 'account_ttl',
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

  factory QueryFeeDiscountAccountInfoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryFeeDiscountAccountInfoResponse(
      tierLevel: decode.getBigInt<BigInt?>(1),
      accountInfo: decode
          .messageTo<injective_exchange_v1beta1_exchange.FeeDiscountTierInfo?>(
            2,
            (b) => injective_exchange_v1beta1_exchange
                .FeeDiscountTierInfo.deserialize(b),
          ),
      accountTtl: decode
          .messageTo<injective_exchange_v1beta1_exchange.FeeDiscountTierTTL?>(
            3,
            (b) => injective_exchange_v1beta1_exchange
                .FeeDiscountTierTTL.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryFeeDiscountAccountInfoResponse;
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
          path: "/injective/exchange/v1beta1/fee_discount_schedule",
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
          .injectiveExchangeV1beta1QueryFeeDiscountScheduleRequest;
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
  final injective_exchange_v1beta1_exchange.FeeDiscountSchedule?
  feeDiscountSchedule;

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
    );
  }

  factory QueryFeeDiscountScheduleResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryFeeDiscountScheduleResponse(
      feeDiscountSchedule: decode
          .messageTo<injective_exchange_v1beta1_exchange.FeeDiscountSchedule?>(
            1,
            (b) => injective_exchange_v1beta1_exchange
                .FeeDiscountSchedule.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryFeeDiscountScheduleResponse;
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
          path: "/injective/exchange/v1beta1/balance_mismatches/{dust_factor}",
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
          .injectiveExchangeV1beta1QueryBalanceMismatchesRequest;
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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1BalanceMismatch;
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
          .injectiveExchangeV1beta1QueryBalanceMismatchesResponse;
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
          path: "/injective/exchange/v1beta1/balances_with_balance_holds",
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
          .injectiveExchangeV1beta1QueryBalanceWithBalanceHoldsRequest;
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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1BalanceWithMarginHold;
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
          .injectiveExchangeV1beta1QueryBalanceWithBalanceHoldsResponse;
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
          path: "/injective/exchange/v1beta1/fee_discount_tier_stats",
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
          .injectiveExchangeV1beta1QueryFeeDiscountTierStatisticsRequest;
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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1TierStatistic;
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
          .injectiveExchangeV1beta1QueryFeeDiscountTierStatisticsResponse;
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
          path: "/injective/exchange/v1beta1/mito_vault_infos",
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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1MitoVaultInfosRequest;
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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1MitoVaultInfosResponse;
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
          path: "/injective/exchange/v1beta1/vault_market_id/{vault_address}",
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
          .injectiveExchangeV1beta1QueryMarketIDFromVaultRequest;
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
          .injectiveExchangeV1beta1QueryMarketIDFromVaultResponse;
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
          path: "/injective/exchange/v1beta1/historical_trade_records",
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
          .injectiveExchangeV1beta1QueryHistoricalTradeRecordsRequest;
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
  final List<injective_exchange_v1beta1_exchange.TradeRecords> tradeRecords;

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
    );
  }

  factory QueryHistoricalTradeRecordsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryHistoricalTradeRecordsResponse(
      tradeRecords:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .TradeRecords.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryHistoricalTradeRecordsResponse;
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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1TradeHistoryOptions;
}

/// QueryMarketVolatilityRequest are the request params for the
/// Query/MarketVolatility RPC method.
class QueryMarketVolatilityRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryMarketVolatilityResponse> {
  final String? marketId;

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
          path: "/injective/exchange/v1beta1/market_volatility/{market_id}",
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
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryMarketVolatilityRequest;
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

  final List<injective_exchange_v1beta1_exchange.TradeRecord> rawHistory;

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
                  injective_exchange_v1beta1_exchange.TradeRecord,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v1beta1_exchange
                          .TradeRecord.fromJson(
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
                (b) => injective_exchange_v1beta1_exchange
                    .TradeRecord.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryMarketVolatilityResponse;
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
          path: "/injective/exchange/v1beta1/binary_options/markets",
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
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryBinaryMarketsRequest;
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
  final List<injective_exchange_v1beta1_exchange.BinaryOptionsMarket> markets;

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
    );
  }

  factory QueryBinaryMarketsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBinaryMarketsResponse(
      markets:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .BinaryOptionsMarket.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryBinaryMarketsResponse;
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
              "/injective/exchange/v1beta1/derivative/orders/conditional/{market_id}/{subaccount_id}",
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
          .injectiveExchangeV1beta1QueryTraderDerivativeConditionalOrdersRequest;
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
  /// price of the order (in chain format)
  final String? price;

  /// quantity of the order (in chain format)
  final String? quantity;

  /// margin of the order (in chain format)
  final String? margin;

  /// price to trigger the order (in chain format)
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
          .injectiveExchangeV1beta1TrimmedDerivativeConditionalOrder;
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
          .injectiveExchangeV1beta1QueryTraderDerivativeConditionalOrdersResponse;
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
          path: "/injective/exchange/v1beta1/spot/L3OrderBook/{market_id}",
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
          .injectiveExchangeV1beta1QueryFullSpotOrderbookRequest;
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

  const QueryFullSpotOrderbookResponse({
    this.bids = const [],
    this.asks = const [],
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
  List<Object?> get protoValues => [bids, asks];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'Bids': bids.map((e) => config.encodeMessage(e)).toList(),
      'Asks': asks.map((e) => config.encodeMessage(e)).toList(),
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
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryFullSpotOrderbookResponse;
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
          path:
              "/injective/exchange/v1beta1/derivative/L3OrderBook/{market_id}",
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
          .injectiveExchangeV1beta1QueryFullDerivativeOrderbookRequest;
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

  const QueryFullDerivativeOrderbookResponse({
    this.bids = const [],
    this.asks = const [],
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
  List<Object?> get protoValues => [bids, asks];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'Bids': bids.map((e) => config.encodeMessage(e)).toList(),
      'Asks': asks.map((e) => config.encodeMessage(e)).toList(),
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
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryFullDerivativeOrderbookResponse;
}

class TrimmedLimitOrder extends CosmosProtoMessage {
  /// the price of the order (in chain format)
  final String? price;

  /// the quantity of the order (in chain format)
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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1TrimmedLimitOrder;
}

class QueryMarketAtomicExecutionFeeMultiplierRequest extends CosmosProtoMessage
    with
        ICosmosProtoQueryMessage<
          QueryMarketAtomicExecutionFeeMultiplierResponse
        > {
  /// the market ID
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
          path: "/injective/exchange/v1beta1/atomic_order_fee_multiplier",
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
          .injectiveExchangeV1beta1QueryMarketAtomicExecutionFeeMultiplierRequest;
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
          .injectiveExchangeV1beta1QueryMarketAtomicExecutionFeeMultiplierResponse;
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
          path: "/injective/exchange/v1beta1/active_stake_grant/{grantee}",
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
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryActiveStakeGrantRequest;
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
  final injective_exchange_v1beta1_exchange.ActiveGrant? grant;

  final injective_exchange_v1beta1_exchange.EffectiveGrant? effectiveGrant;

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
      grant: json
          .valueTo<injective_exchange_v1beta1_exchange.ActiveGrant?, Object>(
            key: 'grant',
            parse:
                (v) => injective_exchange_v1beta1_exchange.ActiveGrant.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      effectiveGrant: json
          .valueTo<injective_exchange_v1beta1_exchange.EffectiveGrant?, Object>(
            key: 'effective_grant',
            parse:
                (v) =>
                    injective_exchange_v1beta1_exchange.EffectiveGrant.fromJson(
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
      grant: decode.messageTo<injective_exchange_v1beta1_exchange.ActiveGrant?>(
        1,
        (b) => injective_exchange_v1beta1_exchange.ActiveGrant.deserialize(b),
      ),
      effectiveGrant: decode
          .messageTo<injective_exchange_v1beta1_exchange.EffectiveGrant?>(
            2,
            (b) => injective_exchange_v1beta1_exchange
                .EffectiveGrant.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryActiveStakeGrantResponse;
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
              "/injective/exchange/v1beta1/grant_authorization/{granter}/{grantee}",
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
          .injectiveExchangeV1beta1QueryGrantAuthorizationRequest;
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
          .injectiveExchangeV1beta1QueryGrantAuthorizationResponse;
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
          path: "/injective/exchange/v1beta1/grant_authorizations/{granter}",
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
          .injectiveExchangeV1beta1QueryGrantAuthorizationsRequest;
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

  final List<injective_exchange_v1beta1_exchange.GrantAuthorization> grants;

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

  factory QueryGrantAuthorizationsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGrantAuthorizationsResponse(
      totalGrantAmount: decode.getString<String?>(1),
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
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryGrantAuthorizationsResponse;
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
          path: "/injective/exchange/v1beta1/market_balance/{market_id}",
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
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryMarketBalanceRequest;
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
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryMarketBalanceResponse;
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
          path: "/injective/exchange/v1beta1/market_balances",
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
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryMarketBalancesRequest;
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
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryMarketBalancesResponse;
}

class MarketBalance extends CosmosProtoMessage {
  final String? marketId;

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
      DefaultCosmosProtoTypeUrl.injectiveExchangeV1beta1MarketBalance;
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
          path: "/injective/exchange/v1beta1/denom_min_notional/{denom}",
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
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryDenomMinNotionalRequest;
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
  /// the minimum notional amount for the denom (in chain format)
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
          .injectiveExchangeV1beta1QueryDenomMinNotionalResponse;
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
          path: "/injective/exchange/v1beta1/denom_min_notionals",
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
          .injectiveExchangeV1beta1QueryDenomMinNotionalsRequest;
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
  final List<injective_exchange_v1beta1_exchange.DenomMinNotional>
  denomMinNotionals;

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

  factory QueryDenomMinNotionalsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomMinNotionalsResponse(
      denomMinNotionals:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_exchange_v1beta1_exchange
                    .DenomMinNotional.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV1beta1QueryDenomMinNotionalsResponse;
}
