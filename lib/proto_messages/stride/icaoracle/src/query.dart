import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/stride/icaoracle/src/icaoracle.dart"
    as stride_icaoracle_icaoracle;

/// Query's a specific oracle
class QueryOracleRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryOracleResponse> {
  final String? chainId;

  const QueryOracleRequest({this.chainId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/Stride-Labs/stride/icaoracle/oracle/{chain_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [chainId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'chain_id': chainId};
  }

  factory QueryOracleRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryOracleRequest(
      chainId: json.valueAsString<String?>(
        'chain_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryOracleRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryOracleRequest(chainId: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcaoracleQueryOracleRequest;
  @override
  QueryOracleResponse onQueryResponse(List<int> bytes) {
    return QueryOracleResponse.deserialize(bytes);
  }

  @override
  QueryOracleResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryOracleResponse.fromJson(json);
  }
}

class QueryOracleResponse extends CosmosProtoMessage {
  final stride_icaoracle_icaoracle.Oracle? oracle;

  const QueryOracleResponse({this.oracle});

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
  List<Object?> get protoValues => [oracle];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'oracle': config.encodeMessage(oracle)};
  }

  factory QueryOracleResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryOracleResponse(
      oracle: json.valueTo<stride_icaoracle_icaoracle.Oracle?, Object>(
        key: 'oracle',
        parse:
            (v) => stride_icaoracle_icaoracle.Oracle.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryOracleResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryOracleResponse(
      oracle: decode.messageTo<stride_icaoracle_icaoracle.Oracle?>(
        1,
        (b) => stride_icaoracle_icaoracle.Oracle.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcaoracleQueryOracleResponse;
}

/// Query's all oracle's
class QueryAllOraclesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAllOraclesResponse> {
  const QueryAllOraclesRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/Stride-Labs/stride/icaoracle/oracles",
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

  factory QueryAllOraclesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAllOraclesRequest();
  }

  factory QueryAllOraclesRequest.deserialize(List<int> bytes) {
    return QueryAllOraclesRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcaoracleQueryAllOraclesRequest;
  @override
  QueryAllOraclesResponse onQueryResponse(List<int> bytes) {
    return QueryAllOraclesResponse.deserialize(bytes);
  }

  @override
  QueryAllOraclesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAllOraclesResponse.fromJson(json);
  }
}

class QueryAllOraclesResponse extends CosmosProtoMessage {
  final List<stride_icaoracle_icaoracle.Oracle> oracles;

  const QueryAllOraclesResponse({this.oracles = const []});

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
  List<Object?> get protoValues => [oracles];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'oracles': oracles.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QueryAllOraclesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAllOraclesResponse(
      oracles:
          (json.valueEnsureAsList<dynamic>(
                'oracles',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  stride_icaoracle_icaoracle.Oracle,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => stride_icaoracle_icaoracle.Oracle.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryAllOraclesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllOraclesResponse(
      oracles:
          decode
              .getListOfBytes(1)
              .map((b) => stride_icaoracle_icaoracle.Oracle.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcaoracleQueryAllOraclesResponse;
}

/// Query's all oracle with a filter for whether they're active
class QueryActiveOraclesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryActiveOraclesResponse> {
  final bool? active;

  const QueryActiveOraclesRequest({this.active});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/Stride-Labs/stride/icaoracle/oracles/by_active",
        ),
      ],
      fields: [ProtoFieldConfig.bool(1)],
    );
  }

  @override
  List<Object?> get protoValues => [active];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'active': active};
  }

  factory QueryActiveOraclesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryActiveOraclesRequest(
      active: json.valueAsBool<bool?>(
        'active',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryActiveOraclesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryActiveOraclesRequest(active: decode.getBool<bool?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcaoracleQueryActiveOraclesRequest;
  @override
  QueryActiveOraclesResponse onQueryResponse(List<int> bytes) {
    return QueryActiveOraclesResponse.deserialize(bytes);
  }

  @override
  QueryActiveOraclesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryActiveOraclesResponse.fromJson(json);
  }
}

class QueryActiveOraclesResponse extends CosmosProtoMessage {
  final List<stride_icaoracle_icaoracle.Oracle> oracles;

  const QueryActiveOraclesResponse({this.oracles = const []});

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
  List<Object?> get protoValues => [oracles];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'oracles': oracles.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QueryActiveOraclesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryActiveOraclesResponse(
      oracles:
          (json.valueEnsureAsList<dynamic>(
                'oracles',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  stride_icaoracle_icaoracle.Oracle,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => stride_icaoracle_icaoracle.Oracle.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryActiveOraclesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryActiveOraclesResponse(
      oracles:
          decode
              .getListOfBytes(1)
              .map((b) => stride_icaoracle_icaoracle.Oracle.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcaoracleQueryActiveOraclesResponse;
}

/// Query's metric's with optional filters
class QueryMetricsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryMetricsResponse> {
  final String? metricKey;

  final String? oracleChainId;

  const QueryMetricsRequest({this.metricKey, this.oracleChainId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/Stride-Labs/stride/icaoracle/metrics",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [metricKey, oracleChainId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'metric_key': metricKey, 'oracle_chain_id': oracleChainId};
  }

  factory QueryMetricsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryMetricsRequest(
      metricKey: json.valueAsString<String?>(
        'metric_key',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      oracleChainId: json.valueAsString<String?>(
        'oracle_chain_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryMetricsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMetricsRequest(
      metricKey: decode.getString<String?>(1),
      oracleChainId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcaoracleQueryMetricsRequest;
  @override
  QueryMetricsResponse onQueryResponse(List<int> bytes) {
    return QueryMetricsResponse.deserialize(bytes);
  }

  @override
  QueryMetricsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryMetricsResponse.fromJson(json);
  }
}

class QueryMetricsResponse extends CosmosProtoMessage {
  final List<stride_icaoracle_icaoracle.Metric> metrics;

  const QueryMetricsResponse({this.metrics = const []});

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
  List<Object?> get protoValues => [metrics];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'metrics': metrics.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QueryMetricsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryMetricsResponse(
      metrics:
          (json.valueEnsureAsList<dynamic>(
                'metrics',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  stride_icaoracle_icaoracle.Metric,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => stride_icaoracle_icaoracle.Metric.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryMetricsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMetricsResponse(
      metrics:
          decode
              .getListOfBytes(1)
              .map((b) => stride_icaoracle_icaoracle.Metric.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcaoracleQueryMetricsResponse;
}
