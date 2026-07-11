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
    return OrderSide.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () => throw ItemNotFoundException(name: "OrderSide", value: value),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static OrderSide from(Object? value) {
    return OrderSide.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () => throw ItemNotFoundException(name: "OrderSide", value: value),
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
  Map<String, dynamic> toJson() {
    return {'trader': trader, 'subaccount_nonce': subaccountNonce};
  }

  factory Subaccount.fromJson(Map<String, dynamic> json) {
    return Subaccount(
      trader: json.valueAsString<String?>('trader', acceptCamelCase: true),
      subaccountNonce: json.valueAsInt<int?>(
        'subaccount_nonce',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'subaccount_id': subaccountId, 'market_id': marketId};
  }

  factory QuerySubaccountOrdersRequest.fromJson(Map<String, dynamic> json) {
    return QuerySubaccountOrdersRequest(
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {
      'buy_orders': buyOrders.map((e) => e.toJson()).toList(),
      'sell_orders': sellOrders.map((e) => e.toJson()).toList(),
    };
  }

  factory QuerySubaccountOrdersResponse.fromJson(Map<String, dynamic> json) {
    return QuerySubaccountOrdersResponse(
      buyOrders:
          (json.valueEnsureAsList<dynamic>('buy_orders', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_exchange.SubaccountOrderData,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_exchange
                          .SubaccountOrderData.fromJson(v),
                ),
              )
              .toList(),
      sellOrders:
          (json.valueEnsureAsList<dynamic>(
                'sell_orders',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_exchange.SubaccountOrderData,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_exchange
                          .SubaccountOrderData.fromJson(v),
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
  Map<String, dynamic> toJson() {
    return {
      'metadata': metadata?.toJson(),
      'market_id': marketId,
      'isBuy': isBuy,
    };
  }

  factory SubaccountOrderbookMetadataWithMarket.fromJson(
    Map<String, dynamic> json,
  ) {
    return SubaccountOrderbookMetadataWithMarket(
      metadata: json.valueTo<
        injective_exchange_v2_orderbook.SubaccountOrderbookMetadata?,
        Map<String, dynamic>
      >(
        key: 'metadata',
        parse:
            (v) => injective_exchange_v2_orderbook
                .SubaccountOrderbookMetadata.fromJson(v),
        acceptCamelCase: true,
      ),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      isBuy: json.valueAsBool<bool?>('isBuy', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryExchangeParamsRequest.fromJson(Map<String, dynamic> json) {
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
  Map<String, dynamic> toJson() {
    return {'params': params?.toJson()};
  }

  factory QueryExchangeParamsResponse.fromJson(Map<String, dynamic> json) {
    return QueryExchangeParamsResponse(
      params: json.valueTo<
        injective_exchange_v2_exchange.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse: (v) => injective_exchange_v2_exchange.Params.fromJson(v),
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'subaccount_id': subaccountId, 'subaccount': subaccount?.toJson()};
  }

  factory QuerySubaccountDepositsRequest.fromJson(Map<String, dynamic> json) {
    return QuerySubaccountDepositsRequest(
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      subaccount: json.valueTo<Subaccount?, Map<String, dynamic>>(
        key: 'subaccount',
        parse: (v) => Subaccount.fromJson(v),
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'deposits': deposits.map((k, v) => MapEntry(k, v.toJson()))};
  }

  factory QuerySubaccountDepositsResponse.fromJson(Map<String, dynamic> json) {
    return QuerySubaccountDepositsResponse(
      deposits: (json.valueAsMap<Map<dynamic, dynamic>>(
        'deposits',
        acceptCamelCase: true,
      )).map(
        (k, v) => MapEntry(
          JsonParser.valueAsString<String>(k),
          JsonParser.valueTo<
            injective_exchange_v2_exchange.Deposit,
            Map<String, dynamic>
          >(
            value: v,
            parse: (v) => injective_exchange_v2_exchange.Deposit.fromJson(v),
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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryExchangeBalancesRequest.fromJson(Map<String, dynamic> json) {
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
  Map<String, dynamic> toJson() {
    return {'balances': balances.map((e) => e.toJson()).toList()};
  }

  factory QueryExchangeBalancesResponse.fromJson(Map<String, dynamic> json) {
    return QueryExchangeBalancesResponse(
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
  Map<String, dynamic> toJson() {
    return {'account': account};
  }

  factory QueryAggregateVolumeRequest.fromJson(Map<String, dynamic> json) {
    return QueryAggregateVolumeRequest(
      account: json.valueAsString<String?>('account', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {
      'aggregate_volumes': aggregateVolumes.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryAggregateVolumeResponse.fromJson(Map<String, dynamic> json) {
    return QueryAggregateVolumeResponse(
      aggregateVolumes:
          (json.valueEnsureAsList<dynamic>(
                'aggregate_volumes',
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
  Map<String, dynamic> toJson() {
    return {
      'accounts': accounts.map((e) => e).toList(),
      'market_ids': marketIds.map((e) => e).toList(),
    };
  }

  factory QueryAggregateVolumesRequest.fromJson(Map<String, dynamic> json) {
    return QueryAggregateVolumesRequest(
      accounts:
          (json.valueEnsureAsList<dynamic>(
            'accounts',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      marketIds:
          (json.valueEnsureAsList<dynamic>(
            'market_ids',
            acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {
      'aggregate_account_volumes':
          aggregateAccountVolumes.map((e) => e.toJson()).toList(),
      'aggregate_market_volumes':
          aggregateMarketVolumes.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryAggregateVolumesResponse.fromJson(Map<String, dynamic> json) {
    return QueryAggregateVolumesResponse(
      aggregateAccountVolumes:
          (json.valueEnsureAsList<dynamic>(
                'aggregate_account_volumes',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_exchange.AggregateAccountVolumeRecord,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_exchange
                          .AggregateAccountVolumeRecord.fromJson(v),
                ),
              )
              .toList(),
      aggregateMarketVolumes:
          (json.valueEnsureAsList<dynamic>(
                'aggregate_market_volumes',
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
  Map<String, dynamic> toJson() {
    return {'market_id': marketId};
  }

  factory QueryAggregateMarketVolumeRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryAggregateMarketVolumeRequest(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'volume': volume?.toJson()};
  }

  factory QueryAggregateMarketVolumeResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryAggregateMarketVolumeResponse(
      volume: json.valueTo<
        injective_exchange_v2_market.VolumeRecord?,
        Map<String, dynamic>
      >(
        key: 'volume',
        parse: (v) => injective_exchange_v2_market.VolumeRecord.fromJson(v),
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'denom': denom};
  }

  factory QueryAuctionExchangeTransferDenomDecimalRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryAuctionExchangeTransferDenomDecimalRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'decimal': decimal?.toString()};
  }

  factory QueryAuctionExchangeTransferDenomDecimalResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryAuctionExchangeTransferDenomDecimalResponse(
      decimal: json.valueAsBigInt<BigInt?>('decimal', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'denoms': denoms.map((e) => e).toList()};
  }

  factory QueryAuctionExchangeTransferDenomDecimalsRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryAuctionExchangeTransferDenomDecimalsRequest(
      denoms:
          (json.valueEnsureAsList<dynamic>(
            'denoms',
            acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'denom_decimals': denomDecimals.map((e) => e.toJson()).toList()};
  }

  factory QueryAuctionExchangeTransferDenomDecimalsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryAuctionExchangeTransferDenomDecimalsResponse(
      denomDecimals:
          (json.valueEnsureAsList<dynamic>(
                'denom_decimals',
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
  Map<String, dynamic> toJson() {
    return {'market_ids': marketIds.map((e) => e).toList()};
  }

  factory QueryAggregateMarketVolumesRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryAggregateMarketVolumesRequest(
      marketIds:
          (json.valueEnsureAsList<dynamic>(
            'market_ids',
            acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'volumes': volumes.map((e) => e.toJson()).toList()};
  }

  factory QueryAggregateMarketVolumesResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryAggregateMarketVolumesResponse(
      volumes:
          (json.valueEnsureAsList<dynamic>('volumes', acceptCamelCase: true))
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
  Map<String, dynamic> toJson() {
    return {'subaccount_id': subaccountId, 'denom': denom};
  }

  factory QuerySubaccountDepositRequest.fromJson(Map<String, dynamic> json) {
    return QuerySubaccountDepositRequest(
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'deposits': deposits?.toJson()};
  }

  factory QuerySubaccountDepositResponse.fromJson(Map<String, dynamic> json) {
    return QuerySubaccountDepositResponse(
      deposits: json.valueTo<
        injective_exchange_v2_exchange.Deposit?,
        Map<String, dynamic>
      >(
        key: 'deposits',
        parse: (v) => injective_exchange_v2_exchange.Deposit.fromJson(v),
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'status': status, 'market_ids': marketIds.map((e) => e).toList()};
  }

  factory QuerySpotMarketsRequest.fromJson(Map<String, dynamic> json) {
    return QuerySpotMarketsRequest(
      status: json.valueAsString<String?>('status', acceptCamelCase: true),
      marketIds:
          (json.valueEnsureAsList<dynamic>(
            'market_ids',
            acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'markets': markets.map((e) => e.toJson()).toList()};
  }

  factory QuerySpotMarketsResponse.fromJson(Map<String, dynamic> json) {
    return QuerySpotMarketsResponse(
      markets:
          (json.valueEnsureAsList<dynamic>('markets', acceptCamelCase: true))
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
  Map<String, dynamic> toJson() {
    return {'market_id': marketId};
  }

  factory QuerySpotMarketRequest.fromJson(Map<String, dynamic> json) {
    return QuerySpotMarketRequest(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'market': market?.toJson()};
  }

  factory QuerySpotMarketResponse.fromJson(Map<String, dynamic> json) {
    return QuerySpotMarketResponse(
      market: json.valueTo<
        injective_exchange_v2_market.SpotMarket?,
        Map<String, dynamic>
      >(
        key: 'market',
        parse: (v) => injective_exchange_v2_market.SpotMarket.fromJson(v),
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {
      'market_id': marketId,
      'limit': limit?.toString(),
      'order_side': orderSide?.protoName,
      'limit_cumulative_notional': limitCumulativeNotional,
      'limit_cumulative_quantity': limitCumulativeQuantity,
    };
  }

  factory QuerySpotOrderbookRequest.fromJson(Map<String, dynamic> json) {
    return QuerySpotOrderbookRequest(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      limit: json.valueAsBigInt<BigInt?>('limit', acceptCamelCase: true),
      orderSide: json.valueTo<OrderSide?, Object?>(
        key: 'order_side',
        parse: (v) => OrderSide.from(v),
      ),
      limitCumulativeNotional: json.valueAsString<String?>(
        'limit_cumulative_notional',
        acceptCamelCase: true,
      ),
      limitCumulativeQuantity: json.valueAsString<String?>(
        'limit_cumulative_quantity',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {
      'buys_price_level': buysPriceLevel.map((e) => e.toJson()).toList(),
      'sells_price_level': sellsPriceLevel.map((e) => e.toJson()).toList(),
      'seq': seq?.toString(),
    };
  }

  factory QuerySpotOrderbookResponse.fromJson(Map<String, dynamic> json) {
    return QuerySpotOrderbookResponse(
      buysPriceLevel:
          (json.valueEnsureAsList<dynamic>(
                'buys_price_level',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_exchange.Level,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_exchange.Level.fromJson(v),
                ),
              )
              .toList(),
      sellsPriceLevel:
          (json.valueEnsureAsList<dynamic>(
                'sells_price_level',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_exchange.Level,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_exchange.Level.fromJson(v),
                ),
              )
              .toList(),
      seq: json.valueAsBigInt<BigInt?>('seq', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {
      'market': market?.toJson(),
      'mid_price_and_tob': midPriceAndTob?.toJson(),
    };
  }

  factory FullSpotMarket.fromJson(Map<String, dynamic> json) {
    return FullSpotMarket(
      market: json.valueTo<
        injective_exchange_v2_market.SpotMarket?,
        Map<String, dynamic>
      >(
        key: 'market',
        parse: (v) => injective_exchange_v2_market.SpotMarket.fromJson(v),
        acceptCamelCase: true,
      ),
      midPriceAndTob: json.valueTo<
        injective_exchange_v2_exchange.MidPriceAndTOB?,
        Map<String, dynamic>
      >(
        key: 'mid_price_and_tob',
        parse: (v) => injective_exchange_v2_exchange.MidPriceAndTOB.fromJson(v),
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'market_ids': marketIds.map((e) => e).toList(),
      'with_mid_price_and_tob': withMidPriceAndTob,
    };
  }

  factory QueryFullSpotMarketsRequest.fromJson(Map<String, dynamic> json) {
    return QueryFullSpotMarketsRequest(
      status: json.valueAsString<String?>('status', acceptCamelCase: true),
      marketIds:
          (json.valueEnsureAsList<dynamic>(
            'market_ids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      withMidPriceAndTob: json.valueAsBool<bool?>(
        'with_mid_price_and_tob',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'markets': markets.map((e) => e.toJson()).toList()};
  }

  factory QueryFullSpotMarketsResponse.fromJson(Map<String, dynamic> json) {
    return QueryFullSpotMarketsResponse(
      markets:
          (json.valueEnsureAsList<dynamic>('markets', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<FullSpotMarket, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => FullSpotMarket.fromJson(v),
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
  Map<String, dynamic> toJson() {
    return {
      'market_id': marketId,
      'with_mid_price_and_tob': withMidPriceAndTob,
    };
  }

  factory QueryFullSpotMarketRequest.fromJson(Map<String, dynamic> json) {
    return QueryFullSpotMarketRequest(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      withMidPriceAndTob: json.valueAsBool<bool?>(
        'with_mid_price_and_tob',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'market': market?.toJson()};
  }

  factory QueryFullSpotMarketResponse.fromJson(Map<String, dynamic> json) {
    return QueryFullSpotMarketResponse(
      market: json.valueTo<FullSpotMarket?, Map<String, dynamic>>(
        key: 'market',
        parse: (v) => FullSpotMarket.fromJson(v),
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {
      'market_id': marketId,
      'subaccount_id': subaccountId,
      'order_hashes': orderHashes.map((e) => e).toList(),
    };
  }

  factory QuerySpotOrdersByHashesRequest.fromJson(Map<String, dynamic> json) {
    return QuerySpotOrdersByHashesRequest(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      orderHashes:
          (json.valueEnsureAsList<dynamic>(
            'order_hashes',
            acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'orders': orders.map((e) => e.toJson()).toList()};
  }

  factory QuerySpotOrdersByHashesResponse.fromJson(Map<String, dynamic> json) {
    return QuerySpotOrdersByHashesResponse(
      orders:
          (json.valueEnsureAsList<dynamic>('orders', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  TrimmedSpotLimitOrder,
                  Map<String, dynamic>
                >(value: e, parse: (v) => TrimmedSpotLimitOrder.fromJson(v)),
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
  Map<String, dynamic> toJson() {
    return {'market_id': marketId, 'subaccount_id': subaccountId};
  }

  factory QueryTraderSpotOrdersRequest.fromJson(Map<String, dynamic> json) {
    return QueryTraderSpotOrdersRequest(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'market_id': marketId, 'account_address': accountAddress};
  }

  factory QueryAccountAddressSpotOrdersRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryAccountAddressSpotOrdersRequest(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      accountAddress: json.valueAsString<String?>(
        'account_address',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'quantity': quantity,
      'fillable': fillable,
      'isBuy': isBuy,
      'order_hash': orderHash,
      'cid': cid,
    };
  }

  factory TrimmedSpotLimitOrder.fromJson(Map<String, dynamic> json) {
    return TrimmedSpotLimitOrder(
      price: json.valueAsString<String?>('price', acceptCamelCase: true),
      quantity: json.valueAsString<String?>('quantity', acceptCamelCase: true),
      fillable: json.valueAsString<String?>('fillable', acceptCamelCase: true),
      isBuy: json.valueAsBool<bool?>('isBuy', acceptCamelCase: true),
      orderHash: json.valueAsString<String?>(
        'order_hash',
        acceptCamelCase: true,
      ),
      cid: json.valueAsString<String?>('cid', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'orders': orders.map((e) => e.toJson()).toList()};
  }

  factory QueryTraderSpotOrdersResponse.fromJson(Map<String, dynamic> json) {
    return QueryTraderSpotOrdersResponse(
      orders:
          (json.valueEnsureAsList<dynamic>('orders', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  TrimmedSpotLimitOrder,
                  Map<String, dynamic>
                >(value: e, parse: (v) => TrimmedSpotLimitOrder.fromJson(v)),
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
  Map<String, dynamic> toJson() {
    return {'orders': orders.map((e) => e.toJson()).toList()};
  }

  factory QueryAccountAddressSpotOrdersResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryAccountAddressSpotOrdersResponse(
      orders:
          (json.valueEnsureAsList<dynamic>('orders', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  TrimmedSpotLimitOrder,
                  Map<String, dynamic>
                >(value: e, parse: (v) => TrimmedSpotLimitOrder.fromJson(v)),
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
  Map<String, dynamic> toJson() {
    return {'market_id': marketId};
  }

  factory QuerySpotMidPriceAndTOBRequest.fromJson(Map<String, dynamic> json) {
    return QuerySpotMidPriceAndTOBRequest(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {
      'mid_price': midPrice,
      'best_buy_price': bestBuyPrice,
      'best_sell_price': bestSellPrice,
    };
  }

  factory QuerySpotMidPriceAndTOBResponse.fromJson(Map<String, dynamic> json) {
    return QuerySpotMidPriceAndTOBResponse(
      midPrice: json.valueAsString<String?>('mid_price', acceptCamelCase: true),
      bestBuyPrice: json.valueAsString<String?>(
        'best_buy_price',
        acceptCamelCase: true,
      ),
      bestSellPrice: json.valueAsString<String?>(
        'best_sell_price',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'market_id': marketId};
  }

  factory QueryDerivativeMidPriceAndTOBRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryDerivativeMidPriceAndTOBRequest(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {
      'mid_price': midPrice,
      'best_buy_price': bestBuyPrice,
      'best_sell_price': bestSellPrice,
    };
  }

  factory QueryDerivativeMidPriceAndTOBResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryDerivativeMidPriceAndTOBResponse(
      midPrice: json.valueAsString<String?>('mid_price', acceptCamelCase: true),
      bestBuyPrice: json.valueAsString<String?>(
        'best_buy_price',
        acceptCamelCase: true,
      ),
      bestSellPrice: json.valueAsString<String?>(
        'best_sell_price',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {
      'market_id': marketId,
      'limit': limit?.toString(),
      'limit_cumulative_notional': limitCumulativeNotional,
    };
  }

  factory QueryDerivativeOrderbookRequest.fromJson(Map<String, dynamic> json) {
    return QueryDerivativeOrderbookRequest(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      limit: json.valueAsBigInt<BigInt?>('limit', acceptCamelCase: true),
      limitCumulativeNotional: json.valueAsString<String?>(
        'limit_cumulative_notional',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {
      'buys_price_level': buysPriceLevel.map((e) => e.toJson()).toList(),
      'sells_price_level': sellsPriceLevel.map((e) => e.toJson()).toList(),
      'seq': seq?.toString(),
    };
  }

  factory QueryDerivativeOrderbookResponse.fromJson(Map<String, dynamic> json) {
    return QueryDerivativeOrderbookResponse(
      buysPriceLevel:
          (json.valueEnsureAsList<dynamic>(
                'buys_price_level',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_exchange.Level,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_exchange.Level.fromJson(v),
                ),
              )
              .toList(),
      sellsPriceLevel:
          (json.valueEnsureAsList<dynamic>(
                'sells_price_level',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_exchange.Level,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_exchange.Level.fromJson(v),
                ),
              )
              .toList(),
      seq: json.valueAsBigInt<BigInt?>('seq', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'market_id': marketId, 'subaccount_id': subaccountId};
  }

  factory QueryTraderDerivativeOrdersRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryTraderDerivativeOrdersRequest(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'market_id': marketId, 'account_address': accountAddress};
  }

  factory QueryAccountAddressDerivativeOrdersRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryAccountAddressDerivativeOrdersRequest(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      accountAddress: json.valueAsString<String?>(
        'account_address',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
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

  factory TrimmedDerivativeLimitOrder.fromJson(Map<String, dynamic> json) {
    return TrimmedDerivativeLimitOrder(
      price: json.valueAsString<String?>('price', acceptCamelCase: true),
      quantity: json.valueAsString<String?>('quantity', acceptCamelCase: true),
      margin: json.valueAsString<String?>('margin', acceptCamelCase: true),
      fillable: json.valueAsString<String?>('fillable', acceptCamelCase: true),
      isBuy: json.valueAsBool<bool?>('isBuy', acceptCamelCase: true),
      orderHash: json.valueAsString<String?>(
        'order_hash',
        acceptCamelCase: true,
      ),
      cid: json.valueAsString<String?>('cid', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'orders': orders.map((e) => e.toJson()).toList()};
  }

  factory QueryTraderDerivativeOrdersResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryTraderDerivativeOrdersResponse(
      orders:
          (json.valueEnsureAsList<dynamic>('orders', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  TrimmedDerivativeLimitOrder,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => TrimmedDerivativeLimitOrder.fromJson(v),
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
  Map<String, dynamic> toJson() {
    return {'orders': orders.map((e) => e.toJson()).toList()};
  }

  factory QueryAccountAddressDerivativeOrdersResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryAccountAddressDerivativeOrdersResponse(
      orders:
          (json.valueEnsureAsList<dynamic>('orders', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  TrimmedDerivativeLimitOrder,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => TrimmedDerivativeLimitOrder.fromJson(v),
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
  Map<String, dynamic> toJson() {
    return {
      'market_id': marketId,
      'subaccount_id': subaccountId,
      'order_hashes': orderHashes.map((e) => e).toList(),
    };
  }

  factory QueryDerivativeOrdersByHashesRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryDerivativeOrdersByHashesRequest(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      orderHashes:
          (json.valueEnsureAsList<dynamic>(
            'order_hashes',
            acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'orders': orders.map((e) => e.toJson()).toList()};
  }

  factory QueryDerivativeOrdersByHashesResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryDerivativeOrdersByHashesResponse(
      orders:
          (json.valueEnsureAsList<dynamic>('orders', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  TrimmedDerivativeLimitOrder,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => TrimmedDerivativeLimitOrder.fromJson(v),
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
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'market_ids': marketIds.map((e) => e).toList(),
      'with_mid_price_and_tob': withMidPriceAndTob,
    };
  }

  factory QueryDerivativeMarketsRequest.fromJson(Map<String, dynamic> json) {
    return QueryDerivativeMarketsRequest(
      status: json.valueAsString<String?>('status', acceptCamelCase: true),
      marketIds:
          (json.valueEnsureAsList<dynamic>(
            'market_ids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      withMidPriceAndTob: json.valueAsBool<bool?>(
        'with_mid_price_and_tob',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {
      'market_info': marketInfo?.toJson(),
      'funding_info': fundingInfo?.toJson(),
    };
  }

  factory PerpetualMarketState.fromJson(Map<String, dynamic> json) {
    return PerpetualMarketState(
      marketInfo: json.valueTo<
        injective_exchange_v2_market.PerpetualMarketInfo?,
        Map<String, dynamic>
      >(
        key: 'market_info',
        parse:
            (v) => injective_exchange_v2_market.PerpetualMarketInfo.fromJson(v),
        acceptCamelCase: true,
      ),
      fundingInfo: json.valueTo<
        injective_exchange_v2_market.PerpetualMarketFunding?,
        Map<String, dynamic>
      >(
        key: 'funding_info',
        parse:
            (v) =>
                injective_exchange_v2_market.PerpetualMarketFunding.fromJson(v),
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {
      'market': market?.toJson(),
      'perpetual_info': perpetualInfo?.toJson(),
      'futures_info': futuresInfo?.toJson(),
      'mark_price': markPrice,
      'mid_price_and_tob': midPriceAndTob?.toJson(),
    };
  }

  factory FullDerivativeMarket.fromJson(Map<String, dynamic> json) {
    return FullDerivativeMarket(
      market: json.valueTo<
        injective_exchange_v2_market.DerivativeMarket?,
        Map<String, dynamic>
      >(
        key: 'market',
        parse: (v) => injective_exchange_v2_market.DerivativeMarket.fromJson(v),
        acceptCamelCase: true,
      ),
      perpetualInfo: json.valueTo<PerpetualMarketState?, Map<String, dynamic>>(
        key: 'perpetual_info',
        parse: (v) => PerpetualMarketState.fromJson(v),
        acceptCamelCase: true,
      ),
      futuresInfo: json.valueTo<
        injective_exchange_v2_market.ExpiryFuturesMarketInfo?,
        Map<String, dynamic>
      >(
        key: 'futures_info',
        parse:
            (v) => injective_exchange_v2_market
                .ExpiryFuturesMarketInfo.fromJson(v),
        acceptCamelCase: true,
      ),
      markPrice: json.valueAsString<String?>(
        'mark_price',
        acceptCamelCase: true,
      ),
      midPriceAndTob: json.valueTo<
        injective_exchange_v2_exchange.MidPriceAndTOB?,
        Map<String, dynamic>
      >(
        key: 'mid_price_and_tob',
        parse: (v) => injective_exchange_v2_exchange.MidPriceAndTOB.fromJson(v),
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'markets': markets.map((e) => e.toJson()).toList()};
  }

  factory QueryDerivativeMarketsResponse.fromJson(Map<String, dynamic> json) {
    return QueryDerivativeMarketsResponse(
      markets:
          (json.valueEnsureAsList<dynamic>('markets', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  FullDerivativeMarket,
                  Map<String, dynamic>
                >(value: e, parse: (v) => FullDerivativeMarket.fromJson(v)),
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
  Map<String, dynamic> toJson() {
    return {'market_id': marketId};
  }

  factory QueryDerivativeMarketRequest.fromJson(Map<String, dynamic> json) {
    return QueryDerivativeMarketRequest(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'market': market?.toJson()};
  }

  factory QueryDerivativeMarketResponse.fromJson(Map<String, dynamic> json) {
    return QueryDerivativeMarketResponse(
      market: json.valueTo<FullDerivativeMarket?, Map<String, dynamic>>(
        key: 'market',
        parse: (v) => FullDerivativeMarket.fromJson(v),
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'market_id': marketId};
  }

  factory QueryDerivativeMarketAddressRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryDerivativeMarketAddressRequest(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'address': address, 'subaccount_id': subaccountId};
  }

  factory QueryDerivativeMarketAddressResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryDerivativeMarketAddressResponse(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'subaccount_id': subaccountId};
  }

  factory QuerySubaccountTradeNonceRequest.fromJson(Map<String, dynamic> json) {
    return QuerySubaccountTradeNonceRequest(
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'market_id': marketId};
  }

  factory QueryPositionsInMarketRequest.fromJson(Map<String, dynamic> json) {
    return QueryPositionsInMarketRequest(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'state': state.map((e) => e.toJson()).toList()};
  }

  factory QueryPositionsInMarketResponse.fromJson(Map<String, dynamic> json) {
    return QueryPositionsInMarketResponse(
      state:
          (json.valueEnsureAsList<dynamic>('state', acceptCamelCase: true))
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
  Map<String, dynamic> toJson() {
    return {'subaccount_id': subaccountId};
  }

  factory QuerySubaccountPositionsRequest.fromJson(Map<String, dynamic> json) {
    return QuerySubaccountPositionsRequest(
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'subaccount_id': subaccountId, 'market_id': marketId};
  }

  factory QuerySubaccountPositionInMarketRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QuerySubaccountPositionInMarketRequest(
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'subaccount_id': subaccountId, 'market_id': marketId};
  }

  factory QuerySubaccountEffectivePositionInMarketRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QuerySubaccountEffectivePositionInMarketRequest(
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'subaccount_id': subaccountId};
  }

  factory QuerySubaccountOrderMetadataRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QuerySubaccountOrderMetadataRequest(
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'state': state.map((e) => e.toJson()).toList()};
  }

  factory QuerySubaccountPositionsResponse.fromJson(Map<String, dynamic> json) {
    return QuerySubaccountPositionsResponse(
      state:
          (json.valueEnsureAsList<dynamic>('state', acceptCamelCase: true))
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
  Map<String, dynamic> toJson() {
    return {'state': state?.toJson(), 'risk_mode': riskMode?.protoName};
  }

  factory QuerySubaccountPositionInMarketResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QuerySubaccountPositionInMarketResponse(
      state: json.valueTo<
        injective_exchange_v2_exchange.Position?,
        Map<String, dynamic>
      >(
        key: 'state',
        parse: (v) => injective_exchange_v2_exchange.Position.fromJson(v),
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {
      'is_long': isLong,
      'quantity': quantity,
      'entry_price': entryPrice,
      'effective_margin': effectiveMargin,
    };
  }

  factory EffectivePosition.fromJson(Map<String, dynamic> json) {
    return EffectivePosition(
      isLong: json.valueAsBool<bool?>('is_long', acceptCamelCase: true),
      quantity: json.valueAsString<String?>('quantity', acceptCamelCase: true),
      entryPrice: json.valueAsString<String?>(
        'entry_price',
        acceptCamelCase: true,
      ),
      effectiveMargin: json.valueAsString<String?>(
        'effective_margin',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'state': state?.toJson(), 'risk_mode': riskMode?.protoName};
  }

  factory QuerySubaccountEffectivePositionInMarketResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QuerySubaccountEffectivePositionInMarketResponse(
      state: json.valueTo<EffectivePosition?, Map<String, dynamic>>(
        key: 'state',
        parse: (v) => EffectivePosition.fromJson(v),
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'market_id': marketId};
  }

  factory QueryPerpetualMarketInfoRequest.fromJson(Map<String, dynamic> json) {
    return QueryPerpetualMarketInfoRequest(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'info': info?.toJson()};
  }

  factory QueryPerpetualMarketInfoResponse.fromJson(Map<String, dynamic> json) {
    return QueryPerpetualMarketInfoResponse(
      info: json.valueTo<
        injective_exchange_v2_market.PerpetualMarketInfo?,
        Map<String, dynamic>
      >(
        key: 'info',
        parse:
            (v) => injective_exchange_v2_market.PerpetualMarketInfo.fromJson(v),
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'market_id': marketId};
  }

  factory QueryExpiryFuturesMarketInfoRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryExpiryFuturesMarketInfoRequest(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'info': info?.toJson()};
  }

  factory QueryExpiryFuturesMarketInfoResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryExpiryFuturesMarketInfoResponse(
      info: json.valueTo<
        injective_exchange_v2_market.ExpiryFuturesMarketInfo?,
        Map<String, dynamic>
      >(
        key: 'info',
        parse:
            (v) => injective_exchange_v2_market
                .ExpiryFuturesMarketInfo.fromJson(v),
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'market_id': marketId};
  }

  factory QueryPerpetualMarketFundingRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryPerpetualMarketFundingRequest(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'state': state?.toJson()};
  }

  factory QueryPerpetualMarketFundingResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryPerpetualMarketFundingResponse(
      state: json.valueTo<
        injective_exchange_v2_market.PerpetualMarketFunding?,
        Map<String, dynamic>
      >(
        key: 'state',
        parse:
            (v) =>
                injective_exchange_v2_market.PerpetualMarketFunding.fromJson(v),
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'metadata': metadata.map((e) => e.toJson()).toList()};
  }

  factory QuerySubaccountOrderMetadataResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QuerySubaccountOrderMetadataResponse(
      metadata:
          (json.valueEnsureAsList<dynamic>('metadata', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  SubaccountOrderbookMetadataWithMarket,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => SubaccountOrderbookMetadataWithMarket.fromJson(v),
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
  Map<String, dynamic> toJson() {
    return {'nonce': nonce};
  }

  factory QuerySubaccountTradeNonceResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QuerySubaccountTradeNonceResponse(
      nonce: json.valueAsInt<int?>('nonce', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'subaccount_id': subaccountId};
  }

  factory QuerySubaccountRiskProfileRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QuerySubaccountRiskProfileRequest(
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'profile': profile?.toJson(), 'is_default': isDefault};
  }

  factory QuerySubaccountRiskProfileResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QuerySubaccountRiskProfileResponse(
      profile: json.valueTo<
        injective_exchange_v2_exchange.SubaccountRiskProfile?,
        Map<String, dynamic>
      >(
        key: 'profile',
        parse:
            (v) => injective_exchange_v2_exchange
                .SubaccountRiskProfile.fromJson(v),
        acceptCamelCase: true,
      ),
      isDefault: json.valueAsBool<bool?>('is_default', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'subaccount_id': subaccountId, 'quote_denom': quoteDenom};
  }

  factory QueryCrossMarginPoolSnapshotRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryCrossMarginPoolSnapshotRequest(
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      quoteDenom: json.valueAsString<String?>(
        'quote_denom',
        acceptCamelCase: true,
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
  /// Orders may be cancelled if equity_admission < order_lock_requirement.
  final String? orderLockRequirement;

  /// The positive uPnL haircut rate applied (e.g., 0.5 = 50%).
  final String? positiveUpnlHaircutRate;

  /// Health factor = equity_liquidation / maintenance_margin_total.
  /// When < 1, the account is liquidatable. When < 1.5, the account is in a
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
  Map<String, dynamic> toJson() {
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
    Map<String, dynamic> json,
  ) {
    return QueryCrossMarginPoolSnapshotResponse(
      quoteDenom: json.valueAsString<String?>(
        'quote_denom',
        acceptCamelCase: true,
      ),
      quoteBalance: json.valueAsString<String?>(
        'quote_balance',
        acceptCamelCase: true,
      ),
      positionMarginTotal: json.valueAsString<String?>(
        'position_margin_total',
        acceptCamelCase: true,
      ),
      unrealizedPnl: json.valueAsString<String?>(
        'unrealized_pnl',
        acceptCamelCase: true,
      ),
      unrealizedPnlEffective: json.valueAsString<String?>(
        'unrealized_pnl_effective',
        acceptCamelCase: true,
      ),
      equityAdmission: json.valueAsString<String?>(
        'equity_admission',
        acceptCamelCase: true,
      ),
      equityLiquidation: json.valueAsString<String?>(
        'equity_liquidation',
        acceptCamelCase: true,
      ),
      initialMarginTotal: json.valueAsString<String?>(
        'initial_margin_total',
        acceptCamelCase: true,
      ),
      maintenanceMarginTotal: json.valueAsString<String?>(
        'maintenance_margin_total',
        acceptCamelCase: true,
      ),
      initialMarginWithOrdersTotal: json.valueAsString<String?>(
        'initial_margin_with_orders_total',
        acceptCamelCase: true,
      ),
      entryLossTotal: json.valueAsString<String?>(
        'entry_loss_total',
        acceptCamelCase: true,
      ),
      feeReserveTotal: json.valueAsString<String?>(
        'fee_reserve_total',
        acceptCamelCase: true,
      ),
      orderLockRequirement: json.valueAsString<String?>(
        'order_lock_requirement',
        acceptCamelCase: true,
      ),
      positiveUpnlHaircutRate: json.valueAsString<String?>(
        'positive_upnl_haircut_rate',
        acceptCamelCase: true,
      ),
      healthFactor: json.valueAsString<String?>(
        'health_factor',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryModuleStateRequest.fromJson(Map<String, dynamic> json) {
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
  Map<String, dynamic> toJson() {
    return {'state': state?.toJson()};
  }

  factory QueryModuleStateResponse.fromJson(Map<String, dynamic> json) {
    return QueryModuleStateResponse(
      state: json.valueTo<
        injective_exchange_v2_genesis.GenesisState?,
        Map<String, dynamic>
      >(
        key: 'state',
        parse: (v) => injective_exchange_v2_genesis.GenesisState.fromJson(v),
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryPositionsRequest.fromJson(Map<String, dynamic> json) {
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
  Map<String, dynamic> toJson() {
    return {'state': state.map((e) => e.toJson()).toList()};
  }

  factory QueryPositionsResponse.fromJson(Map<String, dynamic> json) {
    return QueryPositionsResponse(
      state:
          (json.valueEnsureAsList<dynamic>('state', acceptCamelCase: true))
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
  Map<String, dynamic> toJson() {
    return {
      'accounts': accounts.map((e) => e).toList(),
      'pending_pool_timestamp': pendingPoolTimestamp?.toString(),
    };
  }

  factory QueryTradeRewardPointsRequest.fromJson(Map<String, dynamic> json) {
    return QueryTradeRewardPointsRequest(
      accounts:
          (json.valueEnsureAsList<dynamic>(
            'accounts',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      pendingPoolTimestamp: json.valueAsBigInt<BigInt?>(
        'pending_pool_timestamp',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {
      'account_trade_reward_points':
          accountTradeRewardPoints.map((e) => e).toList(),
    };
  }

  factory QueryTradeRewardPointsResponse.fromJson(Map<String, dynamic> json) {
    return QueryTradeRewardPointsResponse(
      accountTradeRewardPoints:
          (json.valueEnsureAsList<dynamic>(
            'account_trade_reward_points',
            acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryTradeRewardCampaignRequest.fromJson(Map<String, dynamic> json) {
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
  Map<String, dynamic> toJson() {
    return {
      'trading_reward_campaign_info': tradingRewardCampaignInfo?.toJson(),
      'trading_reward_pool_campaign_schedule':
          tradingRewardPoolCampaignSchedule.map((e) => e.toJson()).toList(),
      'total_trade_reward_points': totalTradeRewardPoints,
      'pending_trading_reward_pool_campaign_schedule':
          pendingTradingRewardPoolCampaignSchedule
              .map((e) => e.toJson())
              .toList(),
      'pending_total_trade_reward_points':
          pendingTotalTradeRewardPoints.map((e) => e).toList(),
    };
  }

  factory QueryTradeRewardCampaignResponse.fromJson(Map<String, dynamic> json) {
    return QueryTradeRewardCampaignResponse(
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
      totalTradeRewardPoints: json.valueAsString<String?>(
        'total_trade_reward_points',
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
      pendingTotalTradeRewardPoints:
          (json.valueEnsureAsList<dynamic>(
            'pending_total_trade_reward_points',
            acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'account': account};
  }

  factory QueryIsOptedOutOfRewardsRequest.fromJson(Map<String, dynamic> json) {
    return QueryIsOptedOutOfRewardsRequest(
      account: json.valueAsString<String?>('account', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'is_opted_out': isOptedOut};
  }

  factory QueryIsOptedOutOfRewardsResponse.fromJson(Map<String, dynamic> json) {
    return QueryIsOptedOutOfRewardsResponse(
      isOptedOut: json.valueAsBool<bool?>(
        'is_opted_out',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryOptedOutOfRewardsAccountsRequest.fromJson(
    Map<String, dynamic> json,
  ) {
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
  Map<String, dynamic> toJson() {
    return {'accounts': accounts.map((e) => e).toList()};
  }

  factory QueryOptedOutOfRewardsAccountsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryOptedOutOfRewardsAccountsResponse(
      accounts:
          (json.valueEnsureAsList<dynamic>(
            'accounts',
            acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'account': account};
  }

  factory QueryFeeDiscountAccountInfoRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryFeeDiscountAccountInfoRequest(
      account: json.valueAsString<String?>('account', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {
      'tier_level': tierLevel?.toString(),
      'account_info': accountInfo?.toJson(),
      'account_ttl': accountTtl?.toJson(),
    };
  }

  factory QueryFeeDiscountAccountInfoResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryFeeDiscountAccountInfoResponse(
      tierLevel: json.valueAsBigInt<BigInt?>(
        'tier_level',
        acceptCamelCase: true,
      ),
      accountInfo: json.valueTo<
        injective_exchange_v2_exchange.FeeDiscountTierInfo?,
        Map<String, dynamic>
      >(
        key: 'account_info',
        parse:
            (v) =>
                injective_exchange_v2_exchange.FeeDiscountTierInfo.fromJson(v),
        acceptCamelCase: true,
      ),
      accountTtl: json.valueTo<
        injective_exchange_v2_exchange.FeeDiscountTierTTL?,
        Map<String, dynamic>
      >(
        key: 'account_ttl',
        parse:
            (v) =>
                injective_exchange_v2_exchange.FeeDiscountTierTTL.fromJson(v),
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryFeeDiscountScheduleRequest.fromJson(Map<String, dynamic> json) {
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
  Map<String, dynamic> toJson() {
    return {'fee_discount_schedule': feeDiscountSchedule?.toJson()};
  }

  factory QueryFeeDiscountScheduleResponse.fromJson(Map<String, dynamic> json) {
    return QueryFeeDiscountScheduleResponse(
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
  Map<String, dynamic> toJson() {
    return {'dust_factor': dustFactor?.toString()};
  }

  factory QueryBalanceMismatchesRequest.fromJson(Map<String, dynamic> json) {
    return QueryBalanceMismatchesRequest(
      dustFactor: json.valueAsBigInt<BigInt?>(
        'dust_factor',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
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

  factory BalanceMismatch.fromJson(Map<String, dynamic> json) {
    return BalanceMismatch(
      subaccountId: json.valueAsString<String?>(
        'subaccountId',
        acceptCamelCase: true,
      ),
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      available: json.valueAsString<String?>(
        'available',
        acceptCamelCase: true,
      ),
      total: json.valueAsString<String?>('total', acceptCamelCase: true),
      balanceHold: json.valueAsString<String?>(
        'balance_hold',
        acceptCamelCase: true,
      ),
      expectedTotal: json.valueAsString<String?>(
        'expected_total',
        acceptCamelCase: true,
      ),
      difference: json.valueAsString<String?>(
        'difference',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {
      'balance_mismatches': balanceMismatches.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryBalanceMismatchesResponse.fromJson(Map<String, dynamic> json) {
    return QueryBalanceMismatchesResponse(
      balanceMismatches:
          (json.valueEnsureAsList<dynamic>(
                'balance_mismatches',
                acceptCamelCase: true,
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<BalanceMismatch, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => BalanceMismatch.fromJson(v),
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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryBalanceWithBalanceHoldsRequest.fromJson(
    Map<String, dynamic> json,
  ) {
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
  Map<String, dynamic> toJson() {
    return {
      'subaccountId': subaccountId,
      'denom': denom,
      'available': available,
      'total': total,
      'balance_hold': balanceHold,
    };
  }

  factory BalanceWithMarginHold.fromJson(Map<String, dynamic> json) {
    return BalanceWithMarginHold(
      subaccountId: json.valueAsString<String?>(
        'subaccountId',
        acceptCamelCase: true,
      ),
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      available: json.valueAsString<String?>(
        'available',
        acceptCamelCase: true,
      ),
      total: json.valueAsString<String?>('total', acceptCamelCase: true),
      balanceHold: json.valueAsString<String?>(
        'balance_hold',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {
      'balance_with_balance_holds':
          balanceWithBalanceHolds.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryBalanceWithBalanceHoldsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryBalanceWithBalanceHoldsResponse(
      balanceWithBalanceHolds:
          (json.valueEnsureAsList<dynamic>(
                'balance_with_balance_holds',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  BalanceWithMarginHold,
                  Map<String, dynamic>
                >(value: e, parse: (v) => BalanceWithMarginHold.fromJson(v)),
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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryFeeDiscountTierStatisticsRequest.fromJson(
    Map<String, dynamic> json,
  ) {
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
  Map<String, dynamic> toJson() {
    return {'tier': tier?.toString(), 'count': count?.toString()};
  }

  factory TierStatistic.fromJson(Map<String, dynamic> json) {
    return TierStatistic(
      tier: json.valueAsBigInt<BigInt?>('tier', acceptCamelCase: true),
      count: json.valueAsBigInt<BigInt?>('count', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'statistics': statistics.map((e) => e.toJson()).toList()};
  }

  factory QueryFeeDiscountTierStatisticsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryFeeDiscountTierStatisticsResponse(
      statistics:
          (json.valueEnsureAsList<dynamic>('statistics', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<TierStatistic, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => TierStatistic.fromJson(v),
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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MitoVaultInfosRequest.fromJson(Map<String, dynamic> json) {
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
  Map<String, dynamic> toJson() {
    return {
      'master_addresses': masterAddresses.map((e) => e).toList(),
      'derivative_addresses': derivativeAddresses.map((e) => e).toList(),
      'spot_addresses': spotAddresses.map((e) => e).toList(),
      'cw20_addresses': cw20Addresses.map((e) => e).toList(),
    };
  }

  factory MitoVaultInfosResponse.fromJson(Map<String, dynamic> json) {
    return MitoVaultInfosResponse(
      masterAddresses:
          (json.valueEnsureAsList<dynamic>(
            'master_addresses',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      derivativeAddresses:
          (json.valueEnsureAsList<dynamic>(
            'derivative_addresses',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      spotAddresses:
          (json.valueEnsureAsList<dynamic>(
            'spot_addresses',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      cw20Addresses:
          (json.valueEnsureAsList<dynamic>(
            'cw20_addresses',
            acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'vault_address': vaultAddress};
  }

  factory QueryMarketIDFromVaultRequest.fromJson(Map<String, dynamic> json) {
    return QueryMarketIDFromVaultRequest(
      vaultAddress: json.valueAsString<String?>(
        'vault_address',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'market_id': marketId};
  }

  factory QueryMarketIDFromVaultResponse.fromJson(Map<String, dynamic> json) {
    return QueryMarketIDFromVaultResponse(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'market_id': marketId};
  }

  factory QueryHistoricalTradeRecordsRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryHistoricalTradeRecordsRequest(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'trade_records': tradeRecords.map((e) => e.toJson()).toList()};
  }

  factory QueryHistoricalTradeRecordsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryHistoricalTradeRecordsResponse(
      tradeRecords:
          (json.valueEnsureAsList<dynamic>(
                'trade_records',
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
  Map<String, dynamic> toJson() {
    return {
      'trade_grouping_sec': tradeGroupingSec?.toString(),
      'max_age': maxAge?.toString(),
      'include_raw_history': includeRawHistory,
      'include_metadata': includeMetadata,
    };
  }

  factory TradeHistoryOptions.fromJson(Map<String, dynamic> json) {
    return TradeHistoryOptions(
      tradeGroupingSec: json.valueAsBigInt<BigInt?>(
        'trade_grouping_sec',
        acceptCamelCase: true,
      ),
      maxAge: json.valueAsBigInt<BigInt?>('max_age', acceptCamelCase: true),
      includeRawHistory: json.valueAsBool<bool?>(
        'include_raw_history',
        acceptCamelCase: true,
      ),
      includeMetadata: json.valueAsBool<bool?>(
        'include_metadata',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {
      'market_id': marketId,
      'trade_history_options': tradeHistoryOptions?.toJson(),
    };
  }

  factory QueryMarketVolatilityRequest.fromJson(Map<String, dynamic> json) {
    return QueryMarketVolatilityRequest(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      tradeHistoryOptions: json
          .valueTo<TradeHistoryOptions?, Map<String, dynamic>>(
            key: 'trade_history_options',
            parse: (v) => TradeHistoryOptions.fromJson(v),
            acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {
      'volatility': volatility,
      'history_metadata': historyMetadata?.toJson(),
      'raw_history': rawHistory.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryMarketVolatilityResponse.fromJson(Map<String, dynamic> json) {
    return QueryMarketVolatilityResponse(
      volatility: json.valueAsString<String?>(
        'volatility',
        acceptCamelCase: true,
      ),
      historyMetadata: json.valueTo<
        injective_oracle_v1beta1_oracle.MetadataStatistics?,
        Map<String, dynamic>
      >(
        key: 'history_metadata',
        parse:
            (v) =>
                injective_oracle_v1beta1_oracle.MetadataStatistics.fromJson(v),
        acceptCamelCase: true,
      ),
      rawHistory:
          (json.valueEnsureAsList<dynamic>(
                'raw_history',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_exchange.TradeRecord,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_exchange
                          .TradeRecord.fromJson(v),
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
  Map<String, dynamic> toJson() {
    return {'status': status};
  }

  factory QueryBinaryMarketsRequest.fromJson(Map<String, dynamic> json) {
    return QueryBinaryMarketsRequest(
      status: json.valueAsString<String?>('status', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'markets': markets.map((e) => e.toJson()).toList()};
  }

  factory QueryBinaryMarketsResponse.fromJson(Map<String, dynamic> json) {
    return QueryBinaryMarketsResponse(
      markets:
          (json.valueEnsureAsList<dynamic>('markets', acceptCamelCase: true))
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
  Map<String, dynamic> toJson() {
    return {'subaccount_id': subaccountId, 'market_id': marketId};
  }

  factory QueryTraderDerivativeConditionalOrdersRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryTraderDerivativeConditionalOrdersRequest(
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
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
    Map<String, dynamic> json,
  ) {
    return TrimmedDerivativeConditionalOrder(
      price: json.valueAsString<String?>('price', acceptCamelCase: true),
      quantity: json.valueAsString<String?>('quantity', acceptCamelCase: true),
      margin: json.valueAsString<String?>('margin', acceptCamelCase: true),
      triggerPrice: json.valueAsString<String?>(
        'triggerPrice',
        acceptCamelCase: true,
      ),
      isBuy: json.valueAsBool<bool?>('isBuy', acceptCamelCase: true),
      isLimit: json.valueAsBool<bool?>('isLimit', acceptCamelCase: true),
      orderHash: json.valueAsString<String?>(
        'order_hash',
        acceptCamelCase: true,
      ),
      cid: json.valueAsString<String?>('cid', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'orders': orders.map((e) => e.toJson()).toList()};
  }

  factory QueryTraderDerivativeConditionalOrdersResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryTraderDerivativeConditionalOrdersResponse(
      orders:
          (json.valueEnsureAsList<dynamic>('orders', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  TrimmedDerivativeConditionalOrder,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => TrimmedDerivativeConditionalOrder.fromJson(v),
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
  Map<String, dynamic> toJson() {
    return {'market_id': marketId};
  }

  factory QueryFullSpotOrderbookRequest.fromJson(Map<String, dynamic> json) {
    return QueryFullSpotOrderbookRequest(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {
      'Bids': bids.map((e) => e.toJson()).toList(),
      'Asks': asks.map((e) => e.toJson()).toList(),
      'seq': seq?.toString(),
    };
  }

  factory QueryFullSpotOrderbookResponse.fromJson(Map<String, dynamic> json) {
    return QueryFullSpotOrderbookResponse(
      bids:
          (json.valueEnsureAsList<dynamic>('Bids', acceptCamelCase: true))
              .map(
                (e) =>
                    JsonParser.valueTo<TrimmedLimitOrder, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => TrimmedLimitOrder.fromJson(v),
                    ),
              )
              .toList(),
      asks:
          (json.valueEnsureAsList<dynamic>('Asks', acceptCamelCase: true))
              .map(
                (e) =>
                    JsonParser.valueTo<TrimmedLimitOrder, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => TrimmedLimitOrder.fromJson(v),
                    ),
              )
              .toList(),
      seq: json.valueAsBigInt<BigInt?>('seq', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'market_id': marketId};
  }

  factory QueryFullDerivativeOrderbookRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryFullDerivativeOrderbookRequest(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {
      'Bids': bids.map((e) => e.toJson()).toList(),
      'Asks': asks.map((e) => e.toJson()).toList(),
      'seq': seq?.toString(),
    };
  }

  factory QueryFullDerivativeOrderbookResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryFullDerivativeOrderbookResponse(
      bids:
          (json.valueEnsureAsList<dynamic>('Bids', acceptCamelCase: true))
              .map(
                (e) =>
                    JsonParser.valueTo<TrimmedLimitOrder, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => TrimmedLimitOrder.fromJson(v),
                    ),
              )
              .toList(),
      asks:
          (json.valueEnsureAsList<dynamic>('Asks', acceptCamelCase: true))
              .map(
                (e) =>
                    JsonParser.valueTo<TrimmedLimitOrder, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => TrimmedLimitOrder.fromJson(v),
                    ),
              )
              .toList(),
      seq: json.valueAsBigInt<BigInt?>('seq', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'quantity': quantity,
      'order_hash': orderHash,
      'subaccount_id': subaccountId,
    };
  }

  factory TrimmedLimitOrder.fromJson(Map<String, dynamic> json) {
    return TrimmedLimitOrder(
      price: json.valueAsString<String?>('price', acceptCamelCase: true),
      quantity: json.valueAsString<String?>('quantity', acceptCamelCase: true),
      orderHash: json.valueAsString<String?>(
        'order_hash',
        acceptCamelCase: true,
      ),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'market_id': marketId};
  }

  factory QueryMarketAtomicExecutionFeeMultiplierRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryMarketAtomicExecutionFeeMultiplierRequest(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'multiplier': multiplier};
  }

  factory QueryMarketAtomicExecutionFeeMultiplierResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryMarketAtomicExecutionFeeMultiplierResponse(
      multiplier: json.valueAsString<String?>(
        'multiplier',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'grantee': grantee};
  }

  factory QueryActiveStakeGrantRequest.fromJson(Map<String, dynamic> json) {
    return QueryActiveStakeGrantRequest(
      grantee: json.valueAsString<String?>('grantee', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {
      'grant': grant?.toJson(),
      'effective_grant': effectiveGrant?.toJson(),
    };
  }

  factory QueryActiveStakeGrantResponse.fromJson(Map<String, dynamic> json) {
    return QueryActiveStakeGrantResponse(
      grant: json.valueTo<
        injective_exchange_v2_exchange.ActiveGrant?,
        Map<String, dynamic>
      >(
        key: 'grant',
        parse: (v) => injective_exchange_v2_exchange.ActiveGrant.fromJson(v),
        acceptCamelCase: true,
      ),
      effectiveGrant: json.valueTo<
        injective_exchange_v2_exchange.EffectiveGrant?,
        Map<String, dynamic>
      >(
        key: 'effective_grant',
        parse: (v) => injective_exchange_v2_exchange.EffectiveGrant.fromJson(v),
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'granter': granter, 'grantee': grantee};
  }

  factory QueryGrantAuthorizationRequest.fromJson(Map<String, dynamic> json) {
    return QueryGrantAuthorizationRequest(
      granter: json.valueAsString<String?>('granter', acceptCamelCase: true),
      grantee: json.valueAsString<String?>('grantee', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'amount': amount};
  }

  factory QueryGrantAuthorizationResponse.fromJson(Map<String, dynamic> json) {
    return QueryGrantAuthorizationResponse(
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'granter': granter};
  }

  factory QueryGrantAuthorizationsRequest.fromJson(Map<String, dynamic> json) {
    return QueryGrantAuthorizationsRequest(
      granter: json.valueAsString<String?>('granter', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {
      'total_grant_amount': totalGrantAmount,
      'grants': grants.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryGrantAuthorizationsResponse.fromJson(Map<String, dynamic> json) {
    return QueryGrantAuthorizationsResponse(
      totalGrantAmount: json.valueAsString<String?>(
        'total_grant_amount',
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
  Map<String, dynamic> toJson() {
    return {'market_id': marketId};
  }

  factory QueryMarketBalanceRequest.fromJson(Map<String, dynamic> json) {
    return QueryMarketBalanceRequest(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'balance': balance?.toJson()};
  }

  factory QueryMarketBalanceResponse.fromJson(Map<String, dynamic> json) {
    return QueryMarketBalanceResponse(
      balance: json.valueTo<MarketBalance?, Map<String, dynamic>>(
        key: 'balance',
        parse: (v) => MarketBalance.fromJson(v),
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryMarketBalancesRequest.fromJson(Map<String, dynamic> json) {
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
  Map<String, dynamic> toJson() {
    return {'balances': balances.map((e) => e.toJson()).toList()};
  }

  factory QueryMarketBalancesResponse.fromJson(Map<String, dynamic> json) {
    return QueryMarketBalancesResponse(
      balances:
          (json.valueEnsureAsList<dynamic>('balances', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<MarketBalance, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => MarketBalance.fromJson(v),
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
  Map<String, dynamic> toJson() {
    return {'market_id': marketId, 'balance': balance};
  }

  factory MarketBalance.fromJson(Map<String, dynamic> json) {
    return MarketBalance(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      balance: json.valueAsString<String?>('balance', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'denom': denom};
  }

  factory QueryDenomMinNotionalRequest.fromJson(Map<String, dynamic> json) {
    return QueryDenomMinNotionalRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'amount': amount};
  }

  factory QueryDenomMinNotionalResponse.fromJson(Map<String, dynamic> json) {
    return QueryDenomMinNotionalResponse(
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryDenomMinNotionalsRequest.fromJson(Map<String, dynamic> json) {
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
  Map<String, dynamic> toJson() {
    return {
      'denom_min_notionals': denomMinNotionals.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryDenomMinNotionalsResponse.fromJson(Map<String, dynamic> json) {
    return QueryDenomMinNotionalsResponse(
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
  Map<String, dynamic> toJson() {
    return {'market_id': marketId, 'balance': balance};
  }

  factory OpenInterest.fromJson(Map<String, dynamic> json) {
    return OpenInterest(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      balance: json.valueAsString<String?>('balance', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'market_id': marketId};
  }

  factory QueryOpenInterestRequest.fromJson(Map<String, dynamic> json) {
    return QueryOpenInterestRequest(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'amount': amount?.toJson()};
  }

  factory QueryOpenInterestResponse.fromJson(Map<String, dynamic> json) {
    return QueryOpenInterestResponse(
      amount: json.valueTo<OpenInterest?, Map<String, dynamic>>(
        key: 'amount',
        parse: (v) => OpenInterest.fromJson(v),
        acceptCamelCase: true,
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
