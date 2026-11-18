import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/mint/v1beta1/src/mint.dart"
    as cosmos_mint_v1beta1_mint;

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
          path: "/cosmos/mint/v1beta1/params",
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
      DefaultCosmosProtoTypeUrl.cosmosMintV1beta1QueryParamsRequest;
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
  final cosmos_mint_v1beta1_mint.Params? params;

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
      params: json.valueTo<cosmos_mint_v1beta1_mint.Params?, Object>(
        key: 'params',
        parse:
            (v) => cosmos_mint_v1beta1_mint.Params.fromJson(
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
      params: decode.messageTo<cosmos_mint_v1beta1_mint.Params?>(
        1,
        (b) => cosmos_mint_v1beta1_mint.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosMintV1beta1QueryParamsResponse;
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
          path: "/cosmos/mint/v1beta1/inflation",
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
      DefaultCosmosProtoTypeUrl.cosmosMintV1beta1QueryInflationRequest;
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
      fields: [
        ProtoFieldConfig.bytes(
          1,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
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
      DefaultCosmosProtoTypeUrl.cosmosMintV1beta1QueryInflationResponse;
}

/// QueryAnnualProvisionsRequest is the request type for the
/// Query/AnnualProvisions RPC method.
class QueryAnnualProvisionsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAnnualProvisionsResponse> {
  const QueryAnnualProvisionsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/mint/v1beta1/annual_provisions",
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

  factory QueryAnnualProvisionsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAnnualProvisionsRequest();
  }

  factory QueryAnnualProvisionsRequest.deserialize(List<int> bytes) {
    return QueryAnnualProvisionsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosMintV1beta1QueryAnnualProvisionsRequest;
  @override
  QueryAnnualProvisionsResponse onQueryResponse(List<int> bytes) {
    return QueryAnnualProvisionsResponse.deserialize(bytes);
  }

  @override
  QueryAnnualProvisionsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAnnualProvisionsResponse.fromJson(json);
  }
}

/// QueryAnnualProvisionsResponse is the response type for the
/// Query/AnnualProvisions RPC method.
class QueryAnnualProvisionsResponse extends CosmosProtoMessage {
  /// annual_provisions is the current minting annual provisions value.
  final BuBytes? annualProvisions;

  QueryAnnualProvisionsResponse({List<int>? annualProvisions})
    : annualProvisions = annualProvisions?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bytes(
          1,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [annualProvisions];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'annual_provisions': config.encodeBinary(annualProvisions)};
  }

  factory QueryAnnualProvisionsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAnnualProvisionsResponse(
      annualProvisions: config.decodeBinary<List<int>?>(
        json.valueAs(
          'annual_provisions',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
    );
  }

  factory QueryAnnualProvisionsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAnnualProvisionsResponse(
      annualProvisions: decode.getBytes<List<int>?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosMintV1beta1QueryAnnualProvisionsResponse;
}
