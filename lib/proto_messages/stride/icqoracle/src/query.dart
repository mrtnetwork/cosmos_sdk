import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;
import "package:cosmos_sdk/proto_messages/stride/icqoracle/src/icqoracle.dart"
    as stride_icqoracle_icqoracle;

/// QueryTokenPriceRequest is the request type for the Query/TokenPrice RPC
/// method
class QueryTokenPriceRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<TokenPriceResponse> {
  final String? baseDenom;

  final String? quoteDenom;

  final BigInt? poolId;

  const QueryTokenPriceRequest({this.baseDenom, this.quoteDenom, this.poolId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stride/icqoracle/price",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.uint64(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [baseDenom, quoteDenom, poolId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'base_denom': baseDenom,
      'quote_denom': quoteDenom,
      'pool_id': config.encodeBigint(poolId),
    };
  }

  factory QueryTokenPriceRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTokenPriceRequest(
      baseDenom: json.valueAsString<String?>(
        'base_denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      quoteDenom: json.valueAsString<String?>(
        'quote_denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      poolId: json.valueAsBigInt<BigInt?>(
        'pool_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryTokenPriceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTokenPriceRequest(
      baseDenom: decode.getString<String?>(1),
      quoteDenom: decode.getString<String?>(2),
      poolId: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcqoracleQueryTokenPriceRequest;
  @override
  TokenPriceResponse onQueryResponse(List<int> bytes) {
    return TokenPriceResponse.deserialize(bytes);
  }

  @override
  TokenPriceResponse onQueryResponseJson(Map<String, dynamic> json) {
    return TokenPriceResponse.fromJson(json);
  }
}

/// QueryTokenPricesRequest is the request type for the Query/TokenPrices RPC
/// method
class QueryTokenPricesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTokenPricesResponse> {
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryTokenPricesRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stride/icqoracle/prices",
        ),
      ],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'pagination': config.encodeMessage(pagination)};
  }

  factory QueryTokenPricesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTokenPricesRequest(
      pagination: json
          .valueTo<cosmos_base_query_v1beta1_pagination.PageRequest?, Object>(
            key: 'pagination',
            parse:
                (v) =>
                    cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory QueryTokenPricesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTokenPricesRequest(
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            1,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcqoracleQueryTokenPricesRequest;
  @override
  QueryTokenPricesResponse onQueryResponse(List<int> bytes) {
    return QueryTokenPricesResponse.deserialize(bytes);
  }

  @override
  QueryTokenPricesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryTokenPricesResponse.fromJson(json);
  }
}

/// TokenPriceResponse adds human readable info on to of TokenPrice
class TokenPriceResponse extends CosmosProtoMessage {
  /// If IBC token, base denom unwrapped (e.g. ibc/... -&gt; uatom)
  final String? baseDenomUnwrapped;

  /// If IBC token, Quote denom unwrapped (e.g. ibc/... -&gt; uatom)
  final String? quoteDenomUnwrapped;

  /// The token price object with the remaining price metadata
  final stride_icqoracle_icqoracle.TokenPrice? tokenPrice;

  const TokenPriceResponse({
    this.baseDenomUnwrapped,
    this.quoteDenomUnwrapped,
    this.tokenPrice,
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
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    baseDenomUnwrapped,
    quoteDenomUnwrapped,
    tokenPrice,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'base_denom_unwrapped': baseDenomUnwrapped,
      'quote_denom_unwrapped': quoteDenomUnwrapped,
      'token_price': config.encodeMessage(tokenPrice),
    };
  }

  factory TokenPriceResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return TokenPriceResponse(
      baseDenomUnwrapped: json.valueAsString<String?>(
        'base_denom_unwrapped',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      quoteDenomUnwrapped: json.valueAsString<String?>(
        'quote_denom_unwrapped',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      tokenPrice: json.valueTo<stride_icqoracle_icqoracle.TokenPrice?, Object>(
        key: 'token_price',
        parse:
            (v) => stride_icqoracle_icqoracle.TokenPrice.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory TokenPriceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TokenPriceResponse(
      baseDenomUnwrapped: decode.getString<String?>(1),
      quoteDenomUnwrapped: decode.getString<String?>(2),
      tokenPrice: decode.messageTo<stride_icqoracle_icqoracle.TokenPrice?>(
        3,
        (b) => stride_icqoracle_icqoracle.TokenPrice.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcqoracleTokenPriceResponse;
}

/// QueryTokenPricesResponse is the response type for the Query/TokenPrices RPC
/// method
class QueryTokenPricesResponse extends CosmosProtoMessage {
  final List<TokenPriceResponse> tokenPrices;

  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryTokenPricesResponse({
    this.tokenPrices = const [],
    this.pagination,
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
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [tokenPrices, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'token_prices': tokenPrices.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryTokenPricesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTokenPricesResponse(
      tokenPrices:
          (json.valueEnsureAsList<dynamic>(
                'token_prices',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<TokenPriceResponse, Object>(
                  value: e,
                  parse:
                      (v) => TokenPriceResponse.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      pagination: json
          .valueTo<cosmos_base_query_v1beta1_pagination.PageResponse?, Object>(
            key: 'pagination',
            parse:
                (v) =>
                    cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory QueryTokenPricesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTokenPricesResponse(
      tokenPrices:
          decode
              .getListOfBytes(1)
              .map((b) => TokenPriceResponse.deserialize(b))
              .toList(),
      pagination: decode.messageTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?
      >(
        2,
        (b) => cosmos_base_query_v1beta1_pagination.PageResponse.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcqoracleQueryTokenPricesResponse;
}

/// QueryParamsRequest is the request type for the Query/Params RPC method
class QueryParamsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryParamsResponse> {
  const QueryParamsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stride/icqoracle/params",
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

  factory QueryParamsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryParamsRequest();
  }

  factory QueryParamsRequest.deserialize(List<int> bytes) {
    return QueryParamsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcqoracleQueryParamsRequest;
  @override
  QueryParamsResponse onQueryResponse(List<int> bytes) {
    return QueryParamsResponse.deserialize(bytes);
  }

  @override
  QueryParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryParamsResponse.fromJson(json);
  }
}

/// QueryParamsResponse is the response type for the Query/Params RPC method
class QueryParamsResponse extends CosmosProtoMessage {
  final stride_icqoracle_icqoracle.Params? params;

  const QueryParamsResponse({this.params});

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

  factory QueryParamsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryParamsResponse(
      params: json.valueTo<stride_icqoracle_icqoracle.Params?, Object>(
        key: 'params',
        parse:
            (v) => stride_icqoracle_icqoracle.Params.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<stride_icqoracle_icqoracle.Params?>(
        1,
        (b) => stride_icqoracle_icqoracle.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcqoracleQueryParamsResponse;
}

/// QueryTokenPriceForQuoteDenomRequest is the request type for the
/// Query/TokenPriceForQuoteDenom RPC method
class QueryTokenPriceForQuoteDenomRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTokenPriceForQuoteDenomResponse> {
  final String? baseDenom;

  final String? quoteDenom;

  const QueryTokenPriceForQuoteDenomRequest({this.baseDenom, this.quoteDenom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stride/icqoracle/quote_price",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [baseDenom, quoteDenom];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'base_denom': baseDenom, 'quote_denom': quoteDenom};
  }

  factory QueryTokenPriceForQuoteDenomRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTokenPriceForQuoteDenomRequest(
      baseDenom: json.valueAsString<String?>(
        'base_denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      quoteDenom: json.valueAsString<String?>(
        'quote_denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryTokenPriceForQuoteDenomRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTokenPriceForQuoteDenomRequest(
      baseDenom: decode.getString<String?>(1),
      quoteDenom: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .strideIcqoracleQueryTokenPriceForQuoteDenomRequest;
  @override
  QueryTokenPriceForQuoteDenomResponse onQueryResponse(List<int> bytes) {
    return QueryTokenPriceForQuoteDenomResponse.deserialize(bytes);
  }

  @override
  QueryTokenPriceForQuoteDenomResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryTokenPriceForQuoteDenomResponse.fromJson(json);
  }
}

/// QueryTokenPriceForQuoteDenomResponse is the response type for the
/// Query/TokenPriceForQuoteDenom RPC method
class QueryTokenPriceForQuoteDenomResponse extends CosmosProtoMessage {
  final String? price;

  const QueryTokenPriceForQuoteDenomResponse({this.price});

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
  List<Object?> get protoValues => [price];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'price': price};
  }

  factory QueryTokenPriceForQuoteDenomResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTokenPriceForQuoteDenomResponse(
      price: json.valueAsString<String?>(
        'price',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryTokenPriceForQuoteDenomResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTokenPriceForQuoteDenomResponse(
      price: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .strideIcqoracleQueryTokenPriceForQuoteDenomResponse;
}
