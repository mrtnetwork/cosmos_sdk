import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/params/v1beta1/src/params.dart"
    as cosmos_params_v1beta1_params;

/// QueryParamsRequest is request type for the Query/Params RPC method.
class QueryParamsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryParamsResponse> {
  /// subspace defines the module to query the parameter for.
  final String? subspace;

  /// key defines the key of the parameter in the subspace.
  final String? key;

  const QueryParamsRequest({this.subspace, this.key});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/params/v1beta1/params",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [subspace, key];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'subspace': subspace, 'key': key};
  }

  factory QueryParamsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryParamsRequest(
      subspace: json.valueAsString<String?>(
        'subspace',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      key: json.valueAsString<String?>(
        'key',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryParamsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsRequest(
      subspace: decode.getString<String?>(1),
      key: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosParamsV1beta1QueryParamsRequest;
  @override
  QueryParamsResponse onQueryResponse(List<int> bytes) {
    return QueryParamsResponse.deserialize(bytes);
  }

  @override
  QueryParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryParamsResponse.fromJson(json);
  }
}

/// QueryParamsResponse is response type for the Query/Params RPC method.
class QueryParamsResponse extends CosmosProtoMessage {
  /// param defines the queried parameter.
  final cosmos_params_v1beta1_params.ParamChange? param;

  const QueryParamsResponse({this.param});

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
  List<Object?> get protoValues => [param];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'param': config.encodeMessage(param)};
  }

  factory QueryParamsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryParamsResponse(
      param: json.valueTo<cosmos_params_v1beta1_params.ParamChange?, Object>(
        key: 'param',
        parse:
            (v) => cosmos_params_v1beta1_params.ParamChange.fromJson(
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
      param: decode.messageTo<cosmos_params_v1beta1_params.ParamChange?>(
        1,
        (b) => cosmos_params_v1beta1_params.ParamChange.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosParamsV1beta1QueryParamsResponse;
}

/// QuerySubspacesRequest defines a request type for querying for all registered
/// subspaces and all keys for a subspace.
class QuerySubspacesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySubspacesResponse> {
  const QuerySubspacesRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/params/v1beta1/subspaces",
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

  factory QuerySubspacesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySubspacesRequest();
  }

  factory QuerySubspacesRequest.deserialize(List<int> bytes) {
    return QuerySubspacesRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosParamsV1beta1QuerySubspacesRequest;
  @override
  QuerySubspacesResponse onQueryResponse(List<int> bytes) {
    return QuerySubspacesResponse.deserialize(bytes);
  }

  @override
  QuerySubspacesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QuerySubspacesResponse.fromJson(json);
  }
}

/// QuerySubspacesResponse defines the response types for querying for all
/// registered subspaces and all keys for a subspace.
class QuerySubspacesResponse extends CosmosProtoMessage {
  final List<Subspace> subspaces;

  const QuerySubspacesResponse({this.subspaces = const []});

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
  List<Object?> get protoValues => [subspaces];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'subspaces': subspaces.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QuerySubspacesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySubspacesResponse(
      subspaces:
          (json.valueEnsureAsList<dynamic>(
                'subspaces',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<Subspace, Object>(
                  value: e,
                  parse:
                      (v) => Subspace.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QuerySubspacesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySubspacesResponse(
      subspaces:
          decode.getListOfBytes(1).map((b) => Subspace.deserialize(b)).toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosParamsV1beta1QuerySubspacesResponse;
}

/// Subspace defines a parameter subspace name and all the keys that exist for
/// the subspace.
class Subspace extends CosmosProtoMessage {
  final String? subspace;

  final List<String> keys;

  const Subspace({this.subspace, this.keys = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
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
  List<Object?> get protoValues => [subspace, keys];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'subspace': subspace, 'keys': keys.map((e) => e).toList()};
  }

  factory Subspace.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Subspace(
      subspace: json.valueAsString<String?>(
        'subspace',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      keys:
          (json.valueEnsureAsList<dynamic>(
            'keys',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory Subspace.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Subspace(
      subspace: decode.getString<String?>(1),
      keys: decode.getListOrEmpty<String>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosParamsV1beta1Subspace;
}
