import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/cosmos/tx/v1beta1/src/tx.dart"
    as cosmos_tx_v1beta1_tx;
import "package:cosmos_sdk/proto_messages/cosmos/base/abci/v1beta1/src/abci.dart"
    as cosmos_base_abci_v1beta1_abci;

/// QueryGasPricesRequest is the request type for the Query/GasPrices RPC method.
class QueryGasPricesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGasPricesResponse> {
  const QueryGasPricesRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/initia/tx/v1/gas_prices",
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

  factory QueryGasPricesRequest.fromJson(Map<String, dynamic> json) {
    return QueryGasPricesRequest();
  }

  factory QueryGasPricesRequest.deserialize(List<int> bytes) {
    return QueryGasPricesRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaTxV1QueryGasPricesRequest;
  @override
  QueryGasPricesResponse onQueryResponse(List<int> bytes) {
    return QueryGasPricesResponse.deserialize(bytes);
  }

  @override
  QueryGasPricesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryGasPricesResponse.fromJson(json);
  }
}

/// QueryGasPricesResponse is the response type for the Query/GasPrices RPC method.
class QueryGasPricesResponse extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.DecCoin> gasPrices;

  const QueryGasPricesResponse({this.gasPrices = const []});

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
  List<Object?> get protoValues => [gasPrices];

  @override
  Map<String, dynamic> toJson() {
    return {'gas_prices': gasPrices.map((e) => e.toJson()).toList()};
  }

  factory QueryGasPricesResponse.fromJson(Map<String, dynamic> json) {
    return QueryGasPricesResponse(
      gasPrices:
          (json.valueEnsureAsList<dynamic>('gas_prices', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.DecCoin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.DecCoin.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryGasPricesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGasPricesResponse(
      gasPrices:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.DecCoin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaTxV1QueryGasPricesResponse;
}

/// QueryGasPriceRequest is the request type for the Query/GasPrice RPC method.
class QueryGasPriceRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGasPriceResponse> {
  /// denom defines the denomination of the gas price to query.
  final String? denom;

  const QueryGasPriceRequest({this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/initia/tx/v1/gas_prices/{denom}",
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

  factory QueryGasPriceRequest.fromJson(Map<String, dynamic> json) {
    return QueryGasPriceRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory QueryGasPriceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGasPriceRequest(denom: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaTxV1QueryGasPriceRequest;
  @override
  QueryGasPriceResponse onQueryResponse(List<int> bytes) {
    return QueryGasPriceResponse.deserialize(bytes);
  }

  @override
  QueryGasPriceResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryGasPriceResponse.fromJson(json);
  }
}

/// QueryGasPriceResponse is the response type for the Query/GasPrice RPC method.
class QueryGasPriceResponse extends CosmosProtoMessage {
  final cosmos_base_v1beta1_coin.DecCoin? gasPrice;

  const QueryGasPriceResponse({this.gasPrice});

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
  List<Object?> get protoValues => [gasPrice];

  @override
  Map<String, dynamic> toJson() {
    return {'gas_price': gasPrice?.toJson()};
  }

  factory QueryGasPriceResponse.fromJson(Map<String, dynamic> json) {
    return QueryGasPriceResponse(
      gasPrice: json
          .valueTo<cosmos_base_v1beta1_coin.DecCoin?, Map<String, dynamic>>(
            key: 'gas_price',
            parse: (v) => cosmos_base_v1beta1_coin.DecCoin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryGasPriceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGasPriceResponse(
      gasPrice: decode.messageTo<cosmos_base_v1beta1_coin.DecCoin?>(
        1,
        (b) => cosmos_base_v1beta1_coin.DecCoin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaTxV1QueryGasPriceResponse;
}

/// TxsByEventsRequest is the request type for the Service.TxsByEvents
/// RPC method.
class TxsByEventsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<TxsByEventsResponse> {
  /// page is the page number to query, starts at 1. If not provided, will
  /// default to first page.
  final BigInt? page;

  /// limit is the total number of results to be returned in the result page.
  /// If left empty it will default to a value to be set by each app.
  final BigInt? limit;

  /// query defines the transaction event query that is proxied to CometBFT's
  /// TxsByEvents RPC method. The query must be valid.
  final String? query;

  const TxsByEventsRequest({this.page, this.limit, this.query});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/initia/tx/v1/txs",
        ),
      ],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [page, limit, query];

  @override
  Map<String, dynamic> toJson() {
    return {
      'page': page?.toString(),
      'limit': limit?.toString(),
      'query': query,
    };
  }

  factory TxsByEventsRequest.fromJson(Map<String, dynamic> json) {
    return TxsByEventsRequest(
      page: json.valueAsBigInt<BigInt?>('page', acceptCamelCase: true),
      limit: json.valueAsBigInt<BigInt?>('limit', acceptCamelCase: true),
      query: json.valueAsString<String?>('query', acceptCamelCase: true),
    );
  }

  factory TxsByEventsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TxsByEventsRequest(
      page: decode.getBigInt<BigInt?>(1),
      limit: decode.getBigInt<BigInt?>(2),
      query: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaTxV1TxsByEventsRequest;
  @override
  TxsByEventsResponse onQueryResponse(List<int> bytes) {
    return TxsByEventsResponse.deserialize(bytes);
  }

  @override
  TxsByEventsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return TxsByEventsResponse.fromJson(json);
  }
}

/// TxsByEventsResponse is the response type for the Service.TxsByEvents
/// RPC method.
class TxsByEventsResponse extends CosmosProtoMessage {
  /// txs is the list of queried transactions.
  final List<cosmos_tx_v1beta1_tx.Tx> txs;

  /// tx_responses is the list of queried TxResponses.
  final List<cosmos_base_abci_v1beta1_abci.TxResponse> txResponses;

  /// total is total number of results available
  final BigInt? total;

  const TxsByEventsResponse({
    this.txs = const [],
    this.txResponses = const [],
    this.total,
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
  List<Object?> get protoValues => [txs, txResponses, total];

  @override
  Map<String, dynamic> toJson() {
    return {
      'txs': txs.map((e) => e.toJson()).toList(),
      'tx_responses': txResponses.map((e) => e.toJson()).toList(),
      'total': total?.toString(),
    };
  }

  factory TxsByEventsResponse.fromJson(Map<String, dynamic> json) {
    return TxsByEventsResponse(
      txs:
          (json.valueEnsureAsList<dynamic>('txs', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_tx_v1beta1_tx.Tx,
                  Map<String, dynamic>
                >(value: e, parse: (v) => cosmos_tx_v1beta1_tx.Tx.fromJson(v)),
              )
              .toList(),
      txResponses:
          (json.valueEnsureAsList<dynamic>(
                'tx_responses',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_abci_v1beta1_abci.TxResponse,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) =>
                          cosmos_base_abci_v1beta1_abci.TxResponse.fromJson(v),
                ),
              )
              .toList(),
      total: json.valueAsBigInt<BigInt?>('total', acceptCamelCase: true),
    );
  }

  factory TxsByEventsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TxsByEventsResponse(
      txs:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_tx_v1beta1_tx.Tx.deserialize(b))
              .toList(),
      txResponses:
          decode
              .getListOfBytes(2)
              .map(
                (b) => cosmos_base_abci_v1beta1_abci.TxResponse.deserialize(b),
              )
              .toList(),
      total: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaTxV1TxsByEventsResponse;
}
