import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/osmosis/gamm/v1beta1/src/params.dart"
    as osmosis_gamm_v1beta1_params;
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/osmosis/poolmanager/v1beta1/src/swap_route.dart"
    as osmosis_poolmanager_v1beta1_swap_route;
import "package:cosmos_sdk/proto_messages/osmosis/gamm/v1beta1/src/shared.dart"
    as osmosis_gamm_v1beta1_shared;

/// =============================== Params
class ParamsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<ParamsResponse> {
  const ParamsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/gamm/v1beta1/params",
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

  factory ParamsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ParamsRequest();
  }

  factory ParamsRequest.deserialize(List<int> bytes) {
    return ParamsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisGammV1beta1ParamsRequest;
  @override
  ParamsResponse onQueryResponse(List<int> bytes) {
    return ParamsResponse.deserialize(bytes);
  }

  @override
  ParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return ParamsResponse.fromJson(json);
  }
}

class ParamsResponse extends CosmosProtoMessage {
  final osmosis_gamm_v1beta1_params.Params? params;

  const ParamsResponse({this.params});

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

  factory ParamsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ParamsResponse(
      params: json.valueTo<osmosis_gamm_v1beta1_params.Params?, Object>(
        key: 'params',
        parse:
            (v) => osmosis_gamm_v1beta1_params.Params.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory ParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ParamsResponse(
      params: decode.messageTo<osmosis_gamm_v1beta1_params.Params?>(
        1,
        (b) => osmosis_gamm_v1beta1_params.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisGammV1beta1ParamsResponse;
}

/// =============================== Pool
/// Deprecated: please use the alternative in x/poolmanager
class QueryPoolRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryPoolResponse> {
  final BigInt? poolId;

  const QueryPoolRequest({this.poolId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionBool(name: "deprecated", value: true),
        ProtoOptionBool(name: "deprecated", value: true),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/gamm/v1beta1/pools/{pool_id}",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [poolId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'pool_id': config.encodeBigint(poolId)};
  }

  factory QueryPoolRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPoolRequest(
      poolId: json.valueAsBigInt<BigInt?>(
        'pool_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryPoolRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPoolRequest(poolId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisGammV1beta1QueryPoolRequest;
  @override
  QueryPoolResponse onQueryResponse(List<int> bytes) {
    return QueryPoolResponse.deserialize(bytes);
  }

  @override
  QueryPoolResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryPoolResponse.fromJson(json);
  }
}

/// Deprecated: please use the alternative in x/poolmanager
class QueryPoolResponse extends CosmosProtoMessage {
  final google_protobuf_any.Any? pool;

  const QueryPoolResponse({this.pool});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [ProtoOptionBool(name: "deprecated", value: true)],
      fields: [ProtoFieldConfig.message(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [pool];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'pool': config.encodeMessage(pool)};
  }

  factory QueryPoolResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPoolResponse(
      pool: json.valueTo<google_protobuf_any.Any?, Object>(
        key: 'pool',
        parse:
            (v) => google_protobuf_any.Any.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryPoolResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPoolResponse(
      pool: decode.messageTo<google_protobuf_any.Any?>(
        1,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisGammV1beta1QueryPoolResponse;
}

/// =============================== Pools
class QueryPoolsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryPoolsResponse> {
  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryPoolsRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/gamm/v1beta1/pools",
        ),
      ],
      fields: [ProtoFieldConfig.message(2)],
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

  factory QueryPoolsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPoolsRequest(
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

  factory QueryPoolsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPoolsRequest(
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            2,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisGammV1beta1QueryPoolsRequest;
  @override
  QueryPoolsResponse onQueryResponse(List<int> bytes) {
    return QueryPoolsResponse.deserialize(bytes);
  }

  @override
  QueryPoolsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryPoolsResponse.fromJson(json);
  }
}

class QueryPoolsResponse extends CosmosProtoMessage {
  final List<google_protobuf_any.Any> pools;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryPoolsResponse({this.pools = const [], this.pagination});

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
  List<Object?> get protoValues => [pools, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'pools': pools.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryPoolsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPoolsResponse(
      pools:
          (json.valueEnsureAsList<dynamic>(
                'pools',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<google_protobuf_any.Any, Object>(
                  value: e,
                  parse:
                      (v) => google_protobuf_any.Any.fromJson(
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

  factory QueryPoolsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPoolsResponse(
      pools:
          decode
              .getListOfBytes(1)
              .map((b) => google_protobuf_any.Any.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.osmosisGammV1beta1QueryPoolsResponse;
}

/// =============================== NumPools
class QueryNumPoolsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryNumPoolsResponse> {
  const QueryNumPoolsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionBool(name: "deprecated", value: true),
        ProtoOptionBool(name: "deprecated", value: true),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/gamm/v1beta1/num_pools",
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

  factory QueryNumPoolsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryNumPoolsRequest();
  }

  factory QueryNumPoolsRequest.deserialize(List<int> bytes) {
    return QueryNumPoolsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisGammV1beta1QueryNumPoolsRequest;
  @override
  QueryNumPoolsResponse onQueryResponse(List<int> bytes) {
    return QueryNumPoolsResponse.deserialize(bytes);
  }

  @override
  QueryNumPoolsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryNumPoolsResponse.fromJson(json);
  }
}

class QueryNumPoolsResponse extends CosmosProtoMessage {
  final BigInt? numPools;

  const QueryNumPoolsResponse({this.numPools});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [ProtoOptionBool(name: "deprecated", value: true)],
      fields: [ProtoFieldConfig.uint64(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [numPools];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'num_pools': config.encodeBigint(numPools)};
  }

  factory QueryNumPoolsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryNumPoolsResponse(
      numPools: json.valueAsBigInt<BigInt?>(
        'num_pools',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryNumPoolsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryNumPoolsResponse(numPools: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisGammV1beta1QueryNumPoolsResponse;
}

/// =============================== PoolType
class QueryPoolTypeRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryPoolTypeResponse> {
  final BigInt? poolId;

  const QueryPoolTypeRequest({this.poolId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/gamm/v1beta1/pool_type/{pool_id}",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [poolId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'pool_id': config.encodeBigint(poolId)};
  }

  factory QueryPoolTypeRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPoolTypeRequest(
      poolId: json.valueAsBigInt<BigInt?>(
        'pool_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryPoolTypeRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPoolTypeRequest(poolId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisGammV1beta1QueryPoolTypeRequest;
  @override
  QueryPoolTypeResponse onQueryResponse(List<int> bytes) {
    return QueryPoolTypeResponse.deserialize(bytes);
  }

  @override
  QueryPoolTypeResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryPoolTypeResponse.fromJson(json);
  }
}

class QueryPoolTypeResponse extends CosmosProtoMessage {
  final String? poolType;

  const QueryPoolTypeResponse({this.poolType});

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
  List<Object?> get protoValues => [poolType];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'pool_type': poolType};
  }

  factory QueryPoolTypeResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPoolTypeResponse(
      poolType: json.valueAsString<String?>(
        'pool_type',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryPoolTypeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPoolTypeResponse(poolType: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisGammV1beta1QueryPoolTypeResponse;
}

/// =============================== CalcJoinPoolShares
class QueryCalcJoinPoolSharesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryCalcJoinPoolSharesResponse> {
  final BigInt? poolId;

  final List<cosmos_base_v1beta1_coin.Coin> tokensIn;

  const QueryCalcJoinPoolSharesRequest({this.poolId, this.tokensIn = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/gamm/v1beta1/pools/{pool_id}/join_swap_exact_in",
        ),
      ],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [poolId, tokensIn];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'pool_id': config.encodeBigint(poolId),
      'tokens_in': tokensIn.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QueryCalcJoinPoolSharesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryCalcJoinPoolSharesRequest(
      poolId: json.valueAsBigInt<BigInt?>(
        'pool_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      tokensIn:
          (json.valueEnsureAsList<dynamic>(
                'tokens_in',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<cosmos_base_v1beta1_coin.Coin, Object>(
                      value: e,
                      parse:
                          (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
    );
  }

  factory QueryCalcJoinPoolSharesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCalcJoinPoolSharesRequest(
      poolId: decode.getBigInt<BigInt?>(1),
      tokensIn:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisGammV1beta1QueryCalcJoinPoolSharesRequest;
  @override
  QueryCalcJoinPoolSharesResponse onQueryResponse(List<int> bytes) {
    return QueryCalcJoinPoolSharesResponse.deserialize(bytes);
  }

  @override
  QueryCalcJoinPoolSharesResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryCalcJoinPoolSharesResponse.fromJson(json);
  }
}

class QueryCalcJoinPoolSharesResponse extends CosmosProtoMessage {
  final String? shareOutAmount;

  final List<cosmos_base_v1beta1_coin.Coin> tokensOut;

  const QueryCalcJoinPoolSharesResponse({
    this.shareOutAmount,
    this.tokensOut = const [],
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
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [shareOutAmount, tokensOut];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'share_out_amount': shareOutAmount,
      'tokens_out': tokensOut.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QueryCalcJoinPoolSharesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryCalcJoinPoolSharesResponse(
      shareOutAmount: json.valueAsString<String?>(
        'share_out_amount',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      tokensOut:
          (json.valueEnsureAsList<dynamic>(
                'tokens_out',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<cosmos_base_v1beta1_coin.Coin, Object>(
                      value: e,
                      parse:
                          (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
    );
  }

  factory QueryCalcJoinPoolSharesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCalcJoinPoolSharesResponse(
      shareOutAmount: decode.getString<String?>(1),
      tokensOut:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisGammV1beta1QueryCalcJoinPoolSharesResponse;
}

/// =============================== CalcExitPoolCoinsFromShares
class QueryCalcExitPoolCoinsFromSharesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryCalcExitPoolCoinsFromSharesResponse> {
  final BigInt? poolId;

  final String? shareInAmount;

  const QueryCalcExitPoolCoinsFromSharesRequest({
    this.poolId,
    this.shareInAmount,
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
              "/osmosis/gamm/v1beta1/pools/{pool_id}/exit_swap_share_amount_in",
        ),
      ],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [poolId, shareInAmount];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'pool_id': config.encodeBigint(poolId),
      'share_in_amount': shareInAmount,
    };
  }

  factory QueryCalcExitPoolCoinsFromSharesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryCalcExitPoolCoinsFromSharesRequest(
      poolId: json.valueAsBigInt<BigInt?>(
        'pool_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      shareInAmount: json.valueAsString<String?>(
        'share_in_amount',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryCalcExitPoolCoinsFromSharesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCalcExitPoolCoinsFromSharesRequest(
      poolId: decode.getBigInt<BigInt?>(1),
      shareInAmount: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisGammV1beta1QueryCalcExitPoolCoinsFromSharesRequest;
  @override
  QueryCalcExitPoolCoinsFromSharesResponse onQueryResponse(List<int> bytes) {
    return QueryCalcExitPoolCoinsFromSharesResponse.deserialize(bytes);
  }

  @override
  QueryCalcExitPoolCoinsFromSharesResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryCalcExitPoolCoinsFromSharesResponse.fromJson(json);
  }
}

class QueryCalcExitPoolCoinsFromSharesResponse extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> tokensOut;

  const QueryCalcExitPoolCoinsFromSharesResponse({this.tokensOut = const []});

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
  List<Object?> get protoValues => [tokensOut];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'tokens_out': tokensOut.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QueryCalcExitPoolCoinsFromSharesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryCalcExitPoolCoinsFromSharesResponse(
      tokensOut:
          (json.valueEnsureAsList<dynamic>(
                'tokens_out',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<cosmos_base_v1beta1_coin.Coin, Object>(
                      value: e,
                      parse:
                          (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
    );
  }

  factory QueryCalcExitPoolCoinsFromSharesResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCalcExitPoolCoinsFromSharesResponse(
      tokensOut:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisGammV1beta1QueryCalcExitPoolCoinsFromSharesResponse;
}

/// =============================== PoolParams
class QueryPoolParamsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryPoolParamsResponse> {
  final BigInt? poolId;

  const QueryPoolParamsRequest({this.poolId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/gamm/v1beta1/pools/{pool_id}/params",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [poolId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'pool_id': config.encodeBigint(poolId)};
  }

  factory QueryPoolParamsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPoolParamsRequest(
      poolId: json.valueAsBigInt<BigInt?>(
        'pool_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryPoolParamsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPoolParamsRequest(poolId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisGammV1beta1QueryPoolParamsRequest;
  @override
  QueryPoolParamsResponse onQueryResponse(List<int> bytes) {
    return QueryPoolParamsResponse.deserialize(bytes);
  }

  @override
  QueryPoolParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryPoolParamsResponse.fromJson(json);
  }
}

class QueryPoolParamsResponse extends CosmosProtoMessage {
  final google_protobuf_any.Any? params;

  const QueryPoolParamsResponse({this.params});

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
  List<Object?> get protoValues => [params];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'params': config.encodeMessage(params)};
  }

  factory QueryPoolParamsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPoolParamsResponse(
      params: json.valueTo<google_protobuf_any.Any?, Object>(
        key: 'params',
        parse:
            (v) => google_protobuf_any.Any.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryPoolParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPoolParamsResponse(
      params: decode.messageTo<google_protobuf_any.Any?>(
        1,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisGammV1beta1QueryPoolParamsResponse;
}

/// =============================== PoolLiquidity
/// Deprecated: please use the alternative in x/poolmanager
class QueryTotalPoolLiquidityRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTotalPoolLiquidityResponse> {
  final BigInt? poolId;

  const QueryTotalPoolLiquidityRequest({this.poolId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionBool(name: "deprecated", value: true),
        ProtoOptionBool(name: "deprecated", value: true),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/gamm/v1beta1/pools/{pool_id}/total_pool_liquidity",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [poolId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'pool_id': config.encodeBigint(poolId)};
  }

  factory QueryTotalPoolLiquidityRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTotalPoolLiquidityRequest(
      poolId: json.valueAsBigInt<BigInt?>(
        'pool_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryTotalPoolLiquidityRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTotalPoolLiquidityRequest(poolId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisGammV1beta1QueryTotalPoolLiquidityRequest;
  @override
  QueryTotalPoolLiquidityResponse onQueryResponse(List<int> bytes) {
    return QueryTotalPoolLiquidityResponse.deserialize(bytes);
  }

  @override
  QueryTotalPoolLiquidityResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryTotalPoolLiquidityResponse.fromJson(json);
  }
}

/// Deprecated: please use the alternative in x/poolmanager
class QueryTotalPoolLiquidityResponse extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> liquidity;

  const QueryTotalPoolLiquidityResponse({this.liquidity = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [ProtoOptionBool(name: "deprecated", value: true)],
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
  List<Object?> get protoValues => [liquidity];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'liquidity': liquidity.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QueryTotalPoolLiquidityResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTotalPoolLiquidityResponse(
      liquidity:
          (json.valueEnsureAsList<dynamic>(
                'liquidity',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<cosmos_base_v1beta1_coin.Coin, Object>(
                      value: e,
                      parse:
                          (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
    );
  }

  factory QueryTotalPoolLiquidityResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTotalPoolLiquidityResponse(
      liquidity:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisGammV1beta1QueryTotalPoolLiquidityResponse;
}

/// =============================== TotalShares
class QueryTotalSharesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTotalSharesResponse> {
  final BigInt? poolId;

  const QueryTotalSharesRequest({this.poolId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/gamm/v1beta1/pools/{pool_id}/total_shares",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [poolId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'pool_id': config.encodeBigint(poolId)};
  }

  factory QueryTotalSharesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTotalSharesRequest(
      poolId: json.valueAsBigInt<BigInt?>(
        'pool_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryTotalSharesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTotalSharesRequest(poolId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisGammV1beta1QueryTotalSharesRequest;
  @override
  QueryTotalSharesResponse onQueryResponse(List<int> bytes) {
    return QueryTotalSharesResponse.deserialize(bytes);
  }

  @override
  QueryTotalSharesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryTotalSharesResponse.fromJson(json);
  }
}

class QueryTotalSharesResponse extends CosmosProtoMessage {
  final cosmos_base_v1beta1_coin.Coin? totalShares;

  const QueryTotalSharesResponse({this.totalShares});

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
  List<Object?> get protoValues => [totalShares];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'total_shares': config.encodeMessage(totalShares)};
  }

  factory QueryTotalSharesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTotalSharesResponse(
      totalShares: json.valueTo<cosmos_base_v1beta1_coin.Coin?, Object>(
        key: 'total_shares',
        parse:
            (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryTotalSharesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTotalSharesResponse(
      totalShares: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        1,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisGammV1beta1QueryTotalSharesResponse;
}

/// =============================== CalcJoinPoolNoSwapShares
class QueryCalcJoinPoolNoSwapSharesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryCalcJoinPoolNoSwapSharesResponse> {
  final BigInt? poolId;

  final List<cosmos_base_v1beta1_coin.Coin> tokensIn;

  const QueryCalcJoinPoolNoSwapSharesRequest({
    this.poolId,
    this.tokensIn = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [poolId, tokensIn];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'pool_id': config.encodeBigint(poolId),
      'tokens_in': tokensIn.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QueryCalcJoinPoolNoSwapSharesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryCalcJoinPoolNoSwapSharesRequest(
      poolId: json.valueAsBigInt<BigInt?>(
        'pool_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      tokensIn:
          (json.valueEnsureAsList<dynamic>(
                'tokens_in',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<cosmos_base_v1beta1_coin.Coin, Object>(
                      value: e,
                      parse:
                          (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
    );
  }

  factory QueryCalcJoinPoolNoSwapSharesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCalcJoinPoolNoSwapSharesRequest(
      poolId: decode.getBigInt<BigInt?>(1),
      tokensIn:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisGammV1beta1QueryCalcJoinPoolNoSwapSharesRequest;
  @override
  QueryCalcJoinPoolNoSwapSharesResponse onQueryResponse(List<int> bytes) {
    return QueryCalcJoinPoolNoSwapSharesResponse.deserialize(bytes);
  }

  @override
  QueryCalcJoinPoolNoSwapSharesResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryCalcJoinPoolNoSwapSharesResponse.fromJson(json);
  }
}

class QueryCalcJoinPoolNoSwapSharesResponse extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> tokensOut;

  final String? sharesOut;

  const QueryCalcJoinPoolNoSwapSharesResponse({
    this.tokensOut = const [],
    this.sharesOut,
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
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [tokensOut, sharesOut];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'tokens_out': tokensOut.map((e) => config.encodeMessage(e)).toList(),
      'shares_out': sharesOut,
    };
  }

  factory QueryCalcJoinPoolNoSwapSharesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryCalcJoinPoolNoSwapSharesResponse(
      tokensOut:
          (json.valueEnsureAsList<dynamic>(
                'tokens_out',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<cosmos_base_v1beta1_coin.Coin, Object>(
                      value: e,
                      parse:
                          (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
      sharesOut: json.valueAsString<String?>(
        'shares_out',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryCalcJoinPoolNoSwapSharesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCalcJoinPoolNoSwapSharesResponse(
      tokensOut:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      sharesOut: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisGammV1beta1QueryCalcJoinPoolNoSwapSharesResponse;
}

/// QuerySpotPriceRequest defines the gRPC request structure for a SpotPrice
/// query.
class QuerySpotPriceRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySpotPriceResponse> {
  final BigInt? poolId;

  final String? baseAssetDenom;

  final String? quoteAssetDenom;

  /// DEPRECATED
  final bool? withSwapFee;

  const QuerySpotPriceRequest({
    this.poolId,
    this.baseAssetDenom,
    this.quoteAssetDenom,
    this.withSwapFee,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionBool(name: "deprecated", value: true),
        ProtoOptionBool(name: "deprecated", value: true),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/gamm/v1beta1/pools/{pool_id}/prices",
        ),
      ],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.bool(
          4,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    poolId,
    baseAssetDenom,
    quoteAssetDenom,
    withSwapFee,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'pool_id': config.encodeBigint(poolId),
      'base_asset_denom': baseAssetDenom,
      'quote_asset_denom': quoteAssetDenom,
      'withSwapFee': withSwapFee,
    };
  }

  factory QuerySpotPriceRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySpotPriceRequest(
      poolId: json.valueAsBigInt<BigInt?>(
        'pool_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      baseAssetDenom: json.valueAsString<String?>(
        'base_asset_denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      quoteAssetDenom: json.valueAsString<String?>(
        'quote_asset_denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      withSwapFee: json.valueAsBool<bool?>(
        'withSwapFee',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QuerySpotPriceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySpotPriceRequest(
      poolId: decode.getBigInt<BigInt?>(1),
      baseAssetDenom: decode.getString<String?>(2),
      quoteAssetDenom: decode.getString<String?>(3),
      withSwapFee: decode.getBool<bool?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisGammV1beta1QuerySpotPriceRequest;
  @override
  QuerySpotPriceResponse onQueryResponse(List<int> bytes) {
    return QuerySpotPriceResponse.deserialize(bytes);
  }

  @override
  QuerySpotPriceResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QuerySpotPriceResponse.fromJson(json);
  }
}

/// =============================== PoolsWithFilter
class QueryPoolsWithFilterRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryPoolsWithFilterResponse> {
  /// String of the coins in single string separated by comma. Ex)
  /// 10uatom,100uosmo
  final String? minLiquidity;

  final String? poolType;

  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryPoolsWithFilterRequest({
    this.minLiquidity,
    this.poolType,
    this.pagination,
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
          path: "/osmosis/gamm/v1beta1/filtered_pools",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.message(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [minLiquidity, poolType, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'min_liquidity': minLiquidity,
      'pool_type': poolType,
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryPoolsWithFilterRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPoolsWithFilterRequest(
      minLiquidity: json.valueAsString<String?>(
        'min_liquidity',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      poolType: json.valueAsString<String?>(
        'pool_type',
        normalizeKeyLookup: config.normalizeKeys,
      ),
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

  factory QueryPoolsWithFilterRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPoolsWithFilterRequest(
      minLiquidity: decode.getString<String?>(1),
      poolType: decode.getString<String?>(2),
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            3,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisGammV1beta1QueryPoolsWithFilterRequest;
  @override
  QueryPoolsWithFilterResponse onQueryResponse(List<int> bytes) {
    return QueryPoolsWithFilterResponse.deserialize(bytes);
  }

  @override
  QueryPoolsWithFilterResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryPoolsWithFilterResponse.fromJson(json);
  }
}

class QueryPoolsWithFilterResponse extends CosmosProtoMessage {
  final List<google_protobuf_any.Any> pools;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryPoolsWithFilterResponse({this.pools = const [], this.pagination});

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
  List<Object?> get protoValues => [pools, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'pools': pools.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryPoolsWithFilterResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPoolsWithFilterResponse(
      pools:
          (json.valueEnsureAsList<dynamic>(
                'pools',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<google_protobuf_any.Any, Object>(
                  value: e,
                  parse:
                      (v) => google_protobuf_any.Any.fromJson(
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

  factory QueryPoolsWithFilterResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPoolsWithFilterResponse(
      pools:
          decode
              .getListOfBytes(1)
              .map((b) => google_protobuf_any.Any.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.osmosisGammV1beta1QueryPoolsWithFilterResponse;
}

/// QuerySpotPriceResponse defines the gRPC response structure for a SpotPrice
/// query.
class QuerySpotPriceResponse extends CosmosProtoMessage {
  /// String of the Dec. Ex) 10.203uatom
  final String? spotPrice;

  const QuerySpotPriceResponse({this.spotPrice});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [ProtoOptionBool(name: "deprecated", value: true)],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [spotPrice];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'spot_price': spotPrice};
  }

  factory QuerySpotPriceResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySpotPriceResponse(
      spotPrice: json.valueAsString<String?>(
        'spot_price',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QuerySpotPriceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySpotPriceResponse(spotPrice: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisGammV1beta1QuerySpotPriceResponse;
}

/// =============================== EstimateSwapExactAmountIn
class QuerySwapExactAmountInRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySwapExactAmountInResponse> {
  final String? sender;

  final BigInt? poolId;

  final String? tokenIn;

  final List<osmosis_poolmanager_v1beta1_swap_route.SwapAmountInRoute> routes;

  const QuerySwapExactAmountInRequest({
    this.sender,
    this.poolId,
    this.tokenIn,
    this.routes = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionBool(name: "deprecated", value: true),
        ProtoOptionBool(name: "deprecated", value: true),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/gamm/v1beta1/{pool_id}/estimate/swap_exact_amount_in",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, poolId, tokenIn, routes];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'sender': sender,
      'pool_id': config.encodeBigint(poolId),
      'token_in': tokenIn,
      'routes': routes.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QuerySwapExactAmountInRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySwapExactAmountInRequest(
      sender: json.valueAsString<String?>(
        'sender',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      poolId: json.valueAsBigInt<BigInt?>(
        'pool_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      tokenIn: json.valueAsString<String?>(
        'token_in',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      routes:
          (json.valueEnsureAsList<dynamic>(
                'routes',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_poolmanager_v1beta1_swap_route.SwapAmountInRoute,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => osmosis_poolmanager_v1beta1_swap_route
                          .SwapAmountInRoute.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QuerySwapExactAmountInRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySwapExactAmountInRequest(
      sender: decode.getString<String?>(1),
      poolId: decode.getBigInt<BigInt?>(2),
      tokenIn: decode.getString<String?>(3),
      routes:
          decode
              .getListOfBytes(4)
              .map(
                (b) => osmosis_poolmanager_v1beta1_swap_route
                    .SwapAmountInRoute.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisGammV1beta1QuerySwapExactAmountInRequest;
  @override
  QuerySwapExactAmountInResponse onQueryResponse(List<int> bytes) {
    return QuerySwapExactAmountInResponse.deserialize(bytes);
  }

  @override
  QuerySwapExactAmountInResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QuerySwapExactAmountInResponse.fromJson(json);
  }
}

class QuerySwapExactAmountInResponse extends CosmosProtoMessage {
  final String? tokenOutAmount;

  const QuerySwapExactAmountInResponse({this.tokenOutAmount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [ProtoOptionBool(name: "deprecated", value: true)],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [tokenOutAmount];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'token_out_amount': tokenOutAmount};
  }

  factory QuerySwapExactAmountInResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySwapExactAmountInResponse(
      tokenOutAmount: json.valueAsString<String?>(
        'token_out_amount',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QuerySwapExactAmountInResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySwapExactAmountInResponse(
      tokenOutAmount: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisGammV1beta1QuerySwapExactAmountInResponse;
}

/// =============================== EstimateSwapExactAmountOut
class QuerySwapExactAmountOutRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySwapExactAmountOutResponse> {
  final String? sender;

  final BigInt? poolId;

  final List<osmosis_poolmanager_v1beta1_swap_route.SwapAmountOutRoute> routes;

  final String? tokenOut;

  const QuerySwapExactAmountOutRequest({
    this.sender,
    this.poolId,
    this.routes = const [],
    this.tokenOut,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionBool(name: "deprecated", value: true),
        ProtoOptionBool(name: "deprecated", value: true),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/osmosis/gamm/v1beta1/{pool_id}/estimate/swap_exact_amount_out",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.string(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, poolId, routes, tokenOut];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'sender': sender,
      'pool_id': config.encodeBigint(poolId),
      'routes': routes.map((e) => config.encodeMessage(e)).toList(),
      'token_out': tokenOut,
    };
  }

  factory QuerySwapExactAmountOutRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySwapExactAmountOutRequest(
      sender: json.valueAsString<String?>(
        'sender',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      poolId: json.valueAsBigInt<BigInt?>(
        'pool_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      routes:
          (json.valueEnsureAsList<dynamic>(
                'routes',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_poolmanager_v1beta1_swap_route.SwapAmountOutRoute,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => osmosis_poolmanager_v1beta1_swap_route
                          .SwapAmountOutRoute.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      tokenOut: json.valueAsString<String?>(
        'token_out',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QuerySwapExactAmountOutRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySwapExactAmountOutRequest(
      sender: decode.getString<String?>(1),
      poolId: decode.getBigInt<BigInt?>(2),
      routes:
          decode
              .getListOfBytes(3)
              .map(
                (b) => osmosis_poolmanager_v1beta1_swap_route
                    .SwapAmountOutRoute.deserialize(b),
              )
              .toList(),
      tokenOut: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisGammV1beta1QuerySwapExactAmountOutRequest;
  @override
  QuerySwapExactAmountOutResponse onQueryResponse(List<int> bytes) {
    return QuerySwapExactAmountOutResponse.deserialize(bytes);
  }

  @override
  QuerySwapExactAmountOutResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QuerySwapExactAmountOutResponse.fromJson(json);
  }
}

class QuerySwapExactAmountOutResponse extends CosmosProtoMessage {
  final String? tokenInAmount;

  const QuerySwapExactAmountOutResponse({this.tokenInAmount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [ProtoOptionBool(name: "deprecated", value: true)],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [tokenInAmount];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'token_in_amount': tokenInAmount};
  }

  factory QuerySwapExactAmountOutResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySwapExactAmountOutResponse(
      tokenInAmount: json.valueAsString<String?>(
        'token_in_amount',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QuerySwapExactAmountOutResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySwapExactAmountOutResponse(
      tokenInAmount: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisGammV1beta1QuerySwapExactAmountOutResponse;
}

class QueryTotalLiquidityRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTotalLiquidityResponse> {
  const QueryTotalLiquidityRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/gamm/v1beta1/total_liquidity",
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

  factory QueryTotalLiquidityRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTotalLiquidityRequest();
  }

  factory QueryTotalLiquidityRequest.deserialize(List<int> bytes) {
    return QueryTotalLiquidityRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisGammV1beta1QueryTotalLiquidityRequest;
  @override
  QueryTotalLiquidityResponse onQueryResponse(List<int> bytes) {
    return QueryTotalLiquidityResponse.deserialize(bytes);
  }

  @override
  QueryTotalLiquidityResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryTotalLiquidityResponse.fromJson(json);
  }
}

class QueryTotalLiquidityResponse extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> liquidity;

  const QueryTotalLiquidityResponse({this.liquidity = const []});

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
  List<Object?> get protoValues => [liquidity];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'liquidity': liquidity.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QueryTotalLiquidityResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTotalLiquidityResponse(
      liquidity:
          (json.valueEnsureAsList<dynamic>(
                'liquidity',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<cosmos_base_v1beta1_coin.Coin, Object>(
                      value: e,
                      parse:
                          (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
    );
  }

  factory QueryTotalLiquidityResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTotalLiquidityResponse(
      liquidity:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisGammV1beta1QueryTotalLiquidityResponse;
}

/// =============================== QueryConcentratedPoolIdLinkFromCFMM
class QueryConcentratedPoolIdLinkFromCFMMRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryConcentratedPoolIdLinkFromCFMMResponse> {
  final BigInt? cfmmPoolId;

  const QueryConcentratedPoolIdLinkFromCFMMRequest({this.cfmmPoolId});

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
              "/osmosis/gamm/v1beta1/concentrated_pool_id_link_from_cfmm/{cfmm_pool_id}",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [cfmmPoolId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'cfmm_pool_id': config.encodeBigint(cfmmPoolId)};
  }

  factory QueryConcentratedPoolIdLinkFromCFMMRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryConcentratedPoolIdLinkFromCFMMRequest(
      cfmmPoolId: json.valueAsBigInt<BigInt?>(
        'cfmm_pool_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryConcentratedPoolIdLinkFromCFMMRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryConcentratedPoolIdLinkFromCFMMRequest(
      cfmmPoolId: decode.getBigInt<BigInt?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisGammV1beta1QueryConcentratedPoolIdLinkFromCFMMRequest;
  @override
  QueryConcentratedPoolIdLinkFromCFMMResponse onQueryResponse(List<int> bytes) {
    return QueryConcentratedPoolIdLinkFromCFMMResponse.deserialize(bytes);
  }

  @override
  QueryConcentratedPoolIdLinkFromCFMMResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryConcentratedPoolIdLinkFromCFMMResponse.fromJson(json);
  }
}

class QueryConcentratedPoolIdLinkFromCFMMResponse extends CosmosProtoMessage {
  final BigInt? concentratedPoolId;

  const QueryConcentratedPoolIdLinkFromCFMMResponse({this.concentratedPoolId});

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
  List<Object?> get protoValues => [concentratedPoolId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'concentrated_pool_id': config.encodeBigint(concentratedPoolId)};
  }

  factory QueryConcentratedPoolIdLinkFromCFMMResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryConcentratedPoolIdLinkFromCFMMResponse(
      concentratedPoolId: json.valueAsBigInt<BigInt?>(
        'concentrated_pool_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryConcentratedPoolIdLinkFromCFMMResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryConcentratedPoolIdLinkFromCFMMResponse(
      concentratedPoolId: decode.getBigInt<BigInt?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisGammV1beta1QueryConcentratedPoolIdLinkFromCFMMResponse;
}

/// =============================== QueryCFMMConcentratedPoolLinks
class QueryCFMMConcentratedPoolLinksRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryCFMMConcentratedPoolLinksResponse> {
  const QueryCFMMConcentratedPoolLinksRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/gamm/v1beta1/cfmm_concentrated_pool_links",
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

  factory QueryCFMMConcentratedPoolLinksRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryCFMMConcentratedPoolLinksRequest();
  }

  factory QueryCFMMConcentratedPoolLinksRequest.deserialize(List<int> bytes) {
    return QueryCFMMConcentratedPoolLinksRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisGammV1beta1QueryCFMMConcentratedPoolLinksRequest;
  @override
  QueryCFMMConcentratedPoolLinksResponse onQueryResponse(List<int> bytes) {
    return QueryCFMMConcentratedPoolLinksResponse.deserialize(bytes);
  }

  @override
  QueryCFMMConcentratedPoolLinksResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryCFMMConcentratedPoolLinksResponse.fromJson(json);
  }
}

class QueryCFMMConcentratedPoolLinksResponse extends CosmosProtoMessage {
  final osmosis_gamm_v1beta1_shared.MigrationRecords? migrationRecords;

  const QueryCFMMConcentratedPoolLinksResponse({this.migrationRecords});

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
  List<Object?> get protoValues => [migrationRecords];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'migration_records': config.encodeMessage(migrationRecords)};
  }

  factory QueryCFMMConcentratedPoolLinksResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryCFMMConcentratedPoolLinksResponse(
      migrationRecords: json
          .valueTo<osmosis_gamm_v1beta1_shared.MigrationRecords?, Object>(
            key: 'migration_records',
            parse:
                (v) => osmosis_gamm_v1beta1_shared.MigrationRecords.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory QueryCFMMConcentratedPoolLinksResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCFMMConcentratedPoolLinksResponse(
      migrationRecords: decode
          .messageTo<osmosis_gamm_v1beta1_shared.MigrationRecords?>(
            1,
            (b) => osmosis_gamm_v1beta1_shared.MigrationRecords.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisGammV1beta1QueryCFMMConcentratedPoolLinksResponse;
}
