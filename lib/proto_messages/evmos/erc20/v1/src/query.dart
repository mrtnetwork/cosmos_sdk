import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;
import "package:cosmos_sdk/proto_messages/evmos/erc20/v1/src/erc20.dart"
    as evmos_erc20_v1_erc20;
import "package:cosmos_sdk/proto_messages/evmos/erc20/v1/src/genesis.dart"
    as evmos_erc20_v1_genesis;

/// QueryTokenPairsRequest is the request type for the Query/TokenPairs RPC
/// method.
class QueryTokenPairsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTokenPairsResponse> {
  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryTokenPairsRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/evmos/erc20/v1/token_pairs",
        ),
      ],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [pagination];

  @override
  Map<String, dynamic> toJson() {
    return {'pagination': pagination?.toJson()};
  }

  factory QueryTokenPairsRequest.fromJson(Map<String, dynamic> json) {
    return QueryTokenPairsRequest(
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageRequest?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) => cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryTokenPairsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTokenPairsRequest(
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
      DefaultCosmosProtoTypeUrl.evmosErc20V1QueryTokenPairsRequest;
  @override
  QueryTokenPairsResponse onQueryResponse(List<int> bytes) {
    return QueryTokenPairsResponse.deserialize(bytes);
  }

  @override
  QueryTokenPairsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryTokenPairsResponse.fromJson(json);
  }
}

/// QueryTokenPairsResponse is the response type for the Query/TokenPairs RPC
/// method.
class QueryTokenPairsResponse extends CosmosProtoMessage {
  /// token_pairs is a slice of registered token pairs for the erc20 module
  final List<evmos_erc20_v1_erc20.TokenPair> tokenPairs;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryTokenPairsResponse({this.tokenPairs = const [], this.pagination});

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
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [tokenPairs, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'token_pairs': tokenPairs.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryTokenPairsResponse.fromJson(Map<String, dynamic> json) {
    return QueryTokenPairsResponse(
      tokenPairs:
          (json.valueEnsureAsList<dynamic>(
                'token_pairs',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  evmos_erc20_v1_erc20.TokenPair,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => evmos_erc20_v1_erc20.TokenPair.fromJson(v),
                ),
              )
              .toList(),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) =>
                cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryTokenPairsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTokenPairsResponse(
      tokenPairs:
          decode
              .getListOfBytes(1)
              .map((b) => evmos_erc20_v1_erc20.TokenPair.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.evmosErc20V1QueryTokenPairsResponse;
}

/// QueryTokenPairRequest is the request type for the Query/TokenPair RPC method.
class QueryTokenPairRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTokenPairResponse> {
  /// token identifier can be either the hex contract address of the ERC20 or the
  /// Cosmos base denomination
  final String? token;

  const QueryTokenPairRequest({this.token});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/evmos/erc20/v1/token_pairs/{token}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [token];

  @override
  Map<String, dynamic> toJson() {
    return {'token': token};
  }

  factory QueryTokenPairRequest.fromJson(Map<String, dynamic> json) {
    return QueryTokenPairRequest(
      token: json.valueAsString<String?>('token', acceptCamelCase: true),
    );
  }

  factory QueryTokenPairRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTokenPairRequest(token: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosErc20V1QueryTokenPairRequest;
  @override
  QueryTokenPairResponse onQueryResponse(List<int> bytes) {
    return QueryTokenPairResponse.deserialize(bytes);
  }

  @override
  QueryTokenPairResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryTokenPairResponse.fromJson(json);
  }
}

/// QueryTokenPairResponse is the response type for the Query/TokenPair RPC
/// method.
class QueryTokenPairResponse extends CosmosProtoMessage {
  /// token_pairs returns the info about a registered token pair for the erc20 module
  final evmos_erc20_v1_erc20.TokenPair? tokenPair;

  const QueryTokenPairResponse({this.tokenPair});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(
          1,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [tokenPair];

  @override
  Map<String, dynamic> toJson() {
    return {'token_pair': tokenPair?.toJson()};
  }

  factory QueryTokenPairResponse.fromJson(Map<String, dynamic> json) {
    return QueryTokenPairResponse(
      tokenPair: json
          .valueTo<evmos_erc20_v1_erc20.TokenPair?, Map<String, dynamic>>(
            key: 'token_pair',
            parse: (v) => evmos_erc20_v1_erc20.TokenPair.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryTokenPairResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTokenPairResponse(
      tokenPair: decode.messageTo<evmos_erc20_v1_erc20.TokenPair?>(
        1,
        (b) => evmos_erc20_v1_erc20.TokenPair.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosErc20V1QueryTokenPairResponse;
}

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
          path: "/evmos/erc20/v1/params",
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

  factory QueryParamsRequest.fromJson(Map<String, dynamic> json) {
    return QueryParamsRequest();
  }

  factory QueryParamsRequest.deserialize(List<int> bytes) {
    return QueryParamsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosErc20V1QueryParamsRequest;
  @override
  QueryParamsResponse onQueryResponse(List<int> bytes) {
    return QueryParamsResponse.deserialize(bytes);
  }

  @override
  QueryParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryParamsResponse.fromJson(json);
  }
}

/// QueryParamsResponse is the response type for the Query/Params RPC
/// method.
class QueryParamsResponse extends CosmosProtoMessage {
  /// params are the erc20 module parameters
  final evmos_erc20_v1_genesis.Params? params;

  const QueryParamsResponse({this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(
          1,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [params];

  @override
  Map<String, dynamic> toJson() {
    return {'params': params?.toJson()};
  }

  factory QueryParamsResponse.fromJson(Map<String, dynamic> json) {
    return QueryParamsResponse(
      params: json
          .valueTo<evmos_erc20_v1_genesis.Params?, Map<String, dynamic>>(
            key: 'params',
            parse: (v) => evmos_erc20_v1_genesis.Params.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<evmos_erc20_v1_genesis.Params?>(
        1,
        (b) => evmos_erc20_v1_genesis.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosErc20V1QueryParamsResponse;
}
