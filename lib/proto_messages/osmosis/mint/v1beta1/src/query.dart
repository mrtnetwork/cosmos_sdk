import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/osmosis/mint/v1beta1/src/mint.dart"
    as osmosis_mint_v1beta1_mint;

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
          path: "/osmosis/mint/v1beta1/params",
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
      DefaultCosmosProtoTypeUrl.osmosisMintV1beta1QueryParamsRequest;
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
  final osmosis_mint_v1beta1_mint.Params? params;

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
      params: json.valueTo<osmosis_mint_v1beta1_mint.Params?, Object>(
        key: 'params',
        parse:
            (v) => osmosis_mint_v1beta1_mint.Params.fromJson(
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
      params: decode.messageTo<osmosis_mint_v1beta1_mint.Params?>(
        1,
        (b) => osmosis_mint_v1beta1_mint.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisMintV1beta1QueryParamsResponse;
}

/// QueryEpochProvisionsRequest is the request type for the
/// Query/EpochProvisions RPC method.
class QueryEpochProvisionsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryEpochProvisionsResponse> {
  const QueryEpochProvisionsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/mint/v1beta1/epoch_provisions",
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

  factory QueryEpochProvisionsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryEpochProvisionsRequest();
  }

  factory QueryEpochProvisionsRequest.deserialize(List<int> bytes) {
    return QueryEpochProvisionsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisMintV1beta1QueryEpochProvisionsRequest;
  @override
  QueryEpochProvisionsResponse onQueryResponse(List<int> bytes) {
    return QueryEpochProvisionsResponse.deserialize(bytes);
  }

  @override
  QueryEpochProvisionsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryEpochProvisionsResponse.fromJson(json);
  }
}

/// QueryEpochProvisionsResponse is the response type for the
/// Query/EpochProvisions RPC method.
class QueryEpochProvisionsResponse extends CosmosProtoMessage {
  /// epoch_provisions is the current minting per epoch provisions value.
  final BuBytes? epochProvisions;

  QueryEpochProvisionsResponse({List<int>? epochProvisions})
    : epochProvisions = epochProvisions?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bytes(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [epochProvisions];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'epoch_provisions': config.encodeBinary(epochProvisions)};
  }

  factory QueryEpochProvisionsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryEpochProvisionsResponse(
      epochProvisions: config.decodeBinary<List<int>?>(
        json.valueAs(
          'epoch_provisions',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
    );
  }

  factory QueryEpochProvisionsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryEpochProvisionsResponse(
      epochProvisions: decode.getBytes<List<int>?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisMintV1beta1QueryEpochProvisionsResponse;
}

/// QueryInflationRequest is the request type for the Query/Inflation RPC method.
class QueryInflationRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryInflationResponse> {
  const QueryInflationRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/mint/v1beta1/inflation",
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

  factory QueryInflationRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryInflationRequest();
  }

  factory QueryInflationRequest.deserialize(List<int> bytes) {
    return QueryInflationRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisMintV1beta1QueryInflationRequest;
  @override
  QueryInflationResponse onQueryResponse(List<int> bytes) {
    return QueryInflationResponse.deserialize(bytes);
  }

  @override
  QueryInflationResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryInflationResponse.fromJson(json);
  }
}

/// QueryInflationResponse is the response type for the Query/Inflation RPC
/// method.
class QueryInflationResponse extends CosmosProtoMessage {
  /// inflation is the current minting inflation value.
  final BuBytes? inflation;

  QueryInflationResponse({List<int>? inflation})
    : inflation = inflation?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bytes(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [inflation];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'inflation': config.encodeBinary(inflation)};
  }

  factory QueryInflationResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryInflationResponse(
      inflation: config.decodeBinary<List<int>?>(
        json.valueAs('inflation', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory QueryInflationResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryInflationResponse(inflation: decode.getBytes<List<int>?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisMintV1beta1QueryInflationResponse;
}
