import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/erc20/v1beta1/src/params.dart"
    as injective_erc20_v1beta1_params;
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;
import "package:cosmos_sdk/proto_messages/injective/erc20/v1beta1/src/erc20.dart"
    as injective_erc20_v1beta1_erc20;

/// QueryParamsRequest is the request type for the Query/Params RPC method.
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
          path: "/injective/erc20/v1beta1/params",
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
      DefaultCosmosProtoTypeUrl.injectiveErc20V1beta1QueryParamsRequest;
  @override
  QueryParamsResponse onQueryResponse(List<int> bytes) {
    return QueryParamsResponse.deserialize(bytes);
  }

  @override
  QueryParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryParamsResponse.fromJson(json);
  }
}

/// QueryParamsResponse is the response type for the Query/Params RPC method.
class QueryParamsResponse extends CosmosProtoMessage {
  /// params defines the parameters of the module.
  final injective_erc20_v1beta1_params.Params? params;

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
      params: json.valueTo<injective_erc20_v1beta1_params.Params?, Object>(
        key: 'params',
        parse:
            (v) => injective_erc20_v1beta1_params.Params.fromJson(
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
      params: decode.messageTo<injective_erc20_v1beta1_params.Params?>(
        1,
        (b) => injective_erc20_v1beta1_params.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveErc20V1beta1QueryParamsResponse;
}

/// QueryAllTokenPairsRequest is the request type for the Query/AllTokenPairs RPC
/// method.
class QueryAllTokenPairsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAllTokenPairsResponse> {
  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryAllTokenPairsRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/erc20/v1beta1/all_token_pairs",
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

  factory QueryAllTokenPairsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAllTokenPairsRequest(
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

  factory QueryAllTokenPairsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllTokenPairsRequest(
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
      DefaultCosmosProtoTypeUrl.injectiveErc20V1beta1QueryAllTokenPairsRequest;
  @override
  QueryAllTokenPairsResponse onQueryResponse(List<int> bytes) {
    return QueryAllTokenPairsResponse.deserialize(bytes);
  }

  @override
  QueryAllTokenPairsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAllTokenPairsResponse.fromJson(json);
  }
}

/// QueryAllTokenPairsResponse is the response type for the Query/AllTokenPairs
/// RPC method.
class QueryAllTokenPairsResponse extends CosmosProtoMessage {
  final List<injective_erc20_v1beta1_erc20.TokenPair> tokenPairs;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryAllTokenPairsResponse({
    this.tokenPairs = const [],
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
        ),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [tokenPairs, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'token_pairs': tokenPairs.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryAllTokenPairsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAllTokenPairsResponse(
      tokenPairs:
          (json.valueEnsureAsList<dynamic>(
                'token_pairs',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_erc20_v1beta1_erc20.TokenPair,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_erc20_v1beta1_erc20.TokenPair.fromJson(
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

  factory QueryAllTokenPairsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllTokenPairsResponse(
      tokenPairs:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_erc20_v1beta1_erc20.TokenPair.deserialize(b),
              )
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
      DefaultCosmosProtoTypeUrl.injectiveErc20V1beta1QueryAllTokenPairsResponse;
}

/// QueryTokenPairByDenomRequest is the request type for the
/// Query/TokenPairByDenom RPC method.
class QueryTokenPairByDenomRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTokenPairByDenomResponse> {
  final String? bankDenom;

  const QueryTokenPairByDenomRequest({this.bankDenom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/erc20/v1beta1/token_pair_by_denom",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [bankDenom];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'bank_denom': bankDenom};
  }

  factory QueryTokenPairByDenomRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTokenPairByDenomRequest(
      bankDenom: json.valueAsString<String?>(
        'bank_denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryTokenPairByDenomRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTokenPairByDenomRequest(
      bankDenom: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveErc20V1beta1QueryTokenPairByDenomRequest;
  @override
  QueryTokenPairByDenomResponse onQueryResponse(List<int> bytes) {
    return QueryTokenPairByDenomResponse.deserialize(bytes);
  }

  @override
  QueryTokenPairByDenomResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryTokenPairByDenomResponse.fromJson(json);
  }
}

/// QueryTokenPairByDenomResponse is the response type for the
/// Query/TokenPairByDenom RPC method.
class QueryTokenPairByDenomResponse extends CosmosProtoMessage {
  final injective_erc20_v1beta1_erc20.TokenPair? tokenPair;

  const QueryTokenPairByDenomResponse({this.tokenPair});

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
  List<Object?> get protoValues => [tokenPair];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'token_pair': config.encodeMessage(tokenPair)};
  }

  factory QueryTokenPairByDenomResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTokenPairByDenomResponse(
      tokenPair: json.valueTo<injective_erc20_v1beta1_erc20.TokenPair?, Object>(
        key: 'token_pair',
        parse:
            (v) => injective_erc20_v1beta1_erc20.TokenPair.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryTokenPairByDenomResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTokenPairByDenomResponse(
      tokenPair: decode.messageTo<injective_erc20_v1beta1_erc20.TokenPair?>(
        1,
        (b) => injective_erc20_v1beta1_erc20.TokenPair.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveErc20V1beta1QueryTokenPairByDenomResponse;
}

class QueryTokenPairByERC20AddressRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTokenPairByERC20AddressResponse> {
  final String? erc20Address;

  const QueryTokenPairByERC20AddressRequest({this.erc20Address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/erc20/v1beta1/token_pair_by_erc20_address",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [erc20Address];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'erc20_address': erc20Address};
  }

  factory QueryTokenPairByERC20AddressRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTokenPairByERC20AddressRequest(
      erc20Address: json.valueAsString<String?>(
        'erc20_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryTokenPairByERC20AddressRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTokenPairByERC20AddressRequest(
      erc20Address: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveErc20V1beta1QueryTokenPairByERC20AddressRequest;
  @override
  QueryTokenPairByERC20AddressResponse onQueryResponse(List<int> bytes) {
    return QueryTokenPairByERC20AddressResponse.deserialize(bytes);
  }

  @override
  QueryTokenPairByERC20AddressResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryTokenPairByERC20AddressResponse.fromJson(json);
  }
}

class QueryTokenPairByERC20AddressResponse extends CosmosProtoMessage {
  final injective_erc20_v1beta1_erc20.TokenPair? tokenPair;

  const QueryTokenPairByERC20AddressResponse({this.tokenPair});

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
  List<Object?> get protoValues => [tokenPair];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'token_pair': config.encodeMessage(tokenPair)};
  }

  factory QueryTokenPairByERC20AddressResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTokenPairByERC20AddressResponse(
      tokenPair: json.valueTo<injective_erc20_v1beta1_erc20.TokenPair?, Object>(
        key: 'token_pair',
        parse:
            (v) => injective_erc20_v1beta1_erc20.TokenPair.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryTokenPairByERC20AddressResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTokenPairByERC20AddressResponse(
      tokenPair: decode.messageTo<injective_erc20_v1beta1_erc20.TokenPair?>(
        1,
        (b) => injective_erc20_v1beta1_erc20.TokenPair.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveErc20V1beta1QueryTokenPairByERC20AddressResponse;
}
