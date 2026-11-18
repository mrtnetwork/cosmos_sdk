import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/stride/interchainquery/v1/src/genesis.dart"
    as stride_interchainquery_v1_genesis;

class QueryPendingQueriesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryPendingQueriesResponse> {
  const QueryPendingQueriesRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/Stride-Labs/stride/interchainquery/pending_queries",
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

  factory QueryPendingQueriesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPendingQueriesRequest();
  }

  factory QueryPendingQueriesRequest.deserialize(List<int> bytes) {
    return QueryPendingQueriesRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .strideInterchainqueryV1QueryPendingQueriesRequest;
  @override
  QueryPendingQueriesResponse onQueryResponse(List<int> bytes) {
    return QueryPendingQueriesResponse.deserialize(bytes);
  }

  @override
  QueryPendingQueriesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryPendingQueriesResponse.fromJson(json);
  }
}

class QueryPendingQueriesResponse extends CosmosProtoMessage {
  final List<stride_interchainquery_v1_genesis.Query> pendingQueries;

  const QueryPendingQueriesResponse({this.pendingQueries = const []});

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
  List<Object?> get protoValues => [pendingQueries];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'pending_queries':
          pendingQueries.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QueryPendingQueriesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPendingQueriesResponse(
      pendingQueries:
          (json.valueEnsureAsList<dynamic>(
                'pending_queries',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  stride_interchainquery_v1_genesis.Query,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => stride_interchainquery_v1_genesis.Query.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryPendingQueriesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPendingQueriesResponse(
      pendingQueries:
          decode
              .getListOfBytes(1)
              .map(
                (b) => stride_interchainquery_v1_genesis.Query.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .strideInterchainqueryV1QueryPendingQueriesResponse;
}
