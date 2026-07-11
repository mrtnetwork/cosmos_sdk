import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/thorchain/types/src/type_tss_metric.dart"
    as types_type_tss_metric;

class QueryTssKeygenMetricRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTssKeygenMetricResponse> {
  final String? pubKey;

  final String? height;

  const QueryTssKeygenMetricRequest({this.pubKey, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/metric/keygen/{pub_key}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [pubKey, height];

  @override
  Map<String, dynamic> toJson() {
    return {'pub_key': pubKey, 'height': height};
  }

  factory QueryTssKeygenMetricRequest.fromJson(Map<String, dynamic> json) {
    return QueryTssKeygenMetricRequest(
      pubKey: json.valueAsString<String?>('pub_key', acceptCamelCase: true),
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryTssKeygenMetricRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTssKeygenMetricRequest(
      pubKey: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryTssKeygenMetricRequest;
  @override
  QueryTssKeygenMetricResponse onQueryResponse(List<int> bytes) {
    return QueryTssKeygenMetricResponse.deserialize(bytes);
  }

  @override
  QueryTssKeygenMetricResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryTssKeygenMetricResponse.fromJson(json);
  }
}

class QueryTssKeygenMetricResponse extends CosmosProtoMessage {
  final List<types_type_tss_metric.TssKeygenMetric> metrics;

  const QueryTssKeygenMetricResponse({this.metrics = const []});

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
  List<Object?> get protoValues => [metrics];

  @override
  Map<String, dynamic> toJson() {
    return {'metrics': metrics.map((e) => e.toJson()).toList()};
  }

  factory QueryTssKeygenMetricResponse.fromJson(Map<String, dynamic> json) {
    return QueryTssKeygenMetricResponse(
      metrics:
          (json.valueEnsureAsList<dynamic>('metrics', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  types_type_tss_metric.TssKeygenMetric,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => types_type_tss_metric.TssKeygenMetric.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryTssKeygenMetricResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTssKeygenMetricResponse(
      metrics:
          decode
              .getListOfBytes(1)
              .map((b) => types_type_tss_metric.TssKeygenMetric.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryTssKeygenMetricResponse;
}

class QueryTssMetricRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTssMetricResponse> {
  final String? height;

  const QueryTssMetricRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/metrics",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [height];

  @override
  Map<String, dynamic> toJson() {
    return {'height': height};
  }

  factory QueryTssMetricRequest.fromJson(Map<String, dynamic> json) {
    return QueryTssMetricRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryTssMetricRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTssMetricRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryTssMetricRequest;
  @override
  QueryTssMetricResponse onQueryResponse(List<int> bytes) {
    return QueryTssMetricResponse.deserialize(bytes);
  }

  @override
  QueryTssMetricResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryTssMetricResponse.fromJson(json);
  }
}

class QueryTssMetricResponse extends CosmosProtoMessage {
  final List<types_type_tss_metric.TssKeygenMetric> keygen;

  final types_type_tss_metric.TssKeysignMetric? keysign;

  const QueryTssMetricResponse({this.keygen = const [], this.keysign});

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
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [keygen, keysign];

  @override
  Map<String, dynamic> toJson() {
    return {
      'keygen': keygen.map((e) => e.toJson()).toList(),
      'keysign': keysign?.toJson(),
    };
  }

  factory QueryTssMetricResponse.fromJson(Map<String, dynamic> json) {
    return QueryTssMetricResponse(
      keygen:
          (json.valueEnsureAsList<dynamic>('keygen', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  types_type_tss_metric.TssKeygenMetric,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => types_type_tss_metric.TssKeygenMetric.fromJson(v),
                ),
              )
              .toList(),
      keysign: json.valueTo<
        types_type_tss_metric.TssKeysignMetric?,
        Map<String, dynamic>
      >(
        key: 'keysign',
        parse: (v) => types_type_tss_metric.TssKeysignMetric.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryTssMetricResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTssMetricResponse(
      keygen:
          decode
              .getListOfBytes(1)
              .map((b) => types_type_tss_metric.TssKeygenMetric.deserialize(b))
              .toList(),
      keysign: decode.messageTo<types_type_tss_metric.TssKeysignMetric?>(
        2,
        (b) => types_type_tss_metric.TssKeysignMetric.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryTssMetricResponse;
}
