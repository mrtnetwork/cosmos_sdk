import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/tokenfactory/v1beta1/src/params.dart"
    as injective_tokenfactory_v1beta1_params;
import "package:cosmos_sdk/proto_messages/injective/tokenfactory/v1beta1/src/authority_metadata.dart"
    as injective_tokenfactory_v1beta1_authority_metadata;
import "package:cosmos_sdk/proto_messages/injective/tokenfactory/v1beta1/src/genesis.dart"
    as injective_tokenfactory_v1beta1_genesis;

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
          path: "/injective/tokenfactory/v1beta1/params",
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
      DefaultCosmosProtoTypeUrl.injectiveTokenfactoryV1beta1QueryParamsRequest;
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
  final injective_tokenfactory_v1beta1_params.Params? params;

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
  Map<String, dynamic> toJson() {
    return {'params': params?.toJson()};
  }

  factory QueryParamsResponse.fromJson(Map<String, dynamic> json) {
    return QueryParamsResponse(
      params: json.valueTo<
        injective_tokenfactory_v1beta1_params.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse: (v) => injective_tokenfactory_v1beta1_params.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<injective_tokenfactory_v1beta1_params.Params?>(
        1,
        (b) => injective_tokenfactory_v1beta1_params.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveTokenfactoryV1beta1QueryParamsResponse;
}

/// QueryDenomAuthorityMetadataRequest defines the request structure for the
/// DenomAuthorityMetadata gRPC query.
class QueryDenomAuthorityMetadataRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDenomAuthorityMetadataResponse> {
  /// The creator's Injective address
  final String? creator;

  /// The sub-denom
  final String? subDenom;

  const QueryDenomAuthorityMetadataRequest({this.creator, this.subDenom});

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
              "/injective/tokenfactory/v1beta1/denoms/{creator}/{sub_denom}/authority_metadata",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [creator, subDenom];

  @override
  Map<String, dynamic> toJson() {
    return {'creator': creator, 'sub_denom': subDenom};
  }

  factory QueryDenomAuthorityMetadataRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryDenomAuthorityMetadataRequest(
      creator: json.valueAsString<String?>('creator', acceptCamelCase: true),
      subDenom: json.valueAsString<String?>('sub_denom', acceptCamelCase: true),
    );
  }

  factory QueryDenomAuthorityMetadataRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomAuthorityMetadataRequest(
      creator: decode.getString<String?>(1),
      subDenom: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveTokenfactoryV1beta1QueryDenomAuthorityMetadataRequest;
  @override
  QueryDenomAuthorityMetadataResponse onQueryResponse(List<int> bytes) {
    return QueryDenomAuthorityMetadataResponse.deserialize(bytes);
  }

  @override
  QueryDenomAuthorityMetadataResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryDenomAuthorityMetadataResponse.fromJson(json);
  }
}

/// QueryDenomAuthorityMetadataResponse defines the response structure for the
/// DenomAuthorityMetadata gRPC query.
class QueryDenomAuthorityMetadataResponse extends CosmosProtoMessage {
  /// The authority metadata
  final injective_tokenfactory_v1beta1_authority_metadata.DenomAuthorityMetadata?
  authorityMetadata;

  const QueryDenomAuthorityMetadataResponse({this.authorityMetadata});

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
  List<Object?> get protoValues => [authorityMetadata];

  @override
  Map<String, dynamic> toJson() {
    return {'authority_metadata': authorityMetadata?.toJson()};
  }

  factory QueryDenomAuthorityMetadataResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryDenomAuthorityMetadataResponse(
      authorityMetadata: json.valueTo<
        injective_tokenfactory_v1beta1_authority_metadata.DenomAuthorityMetadata?,
        Map<String, dynamic>
      >(
        key: 'authority_metadata',
        parse:
            (v) => injective_tokenfactory_v1beta1_authority_metadata
                .DenomAuthorityMetadata.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryDenomAuthorityMetadataResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomAuthorityMetadataResponse(
      authorityMetadata: decode.messageTo<
        injective_tokenfactory_v1beta1_authority_metadata.DenomAuthorityMetadata?
      >(
        1,
        (b) => injective_tokenfactory_v1beta1_authority_metadata
            .DenomAuthorityMetadata.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveTokenfactoryV1beta1QueryDenomAuthorityMetadataResponse;
}

/// QueryDenomsFromCreatorRequest defines the request structure for the
/// DenomsFromCreator gRPC query.
class QueryDenomsFromCreatorRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDenomsFromCreatorResponse> {
  /// The creator's Injective address
  final String? creator;

  const QueryDenomsFromCreatorRequest({this.creator});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/tokenfactory/v1beta1/denoms_from_creator/{creator}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [creator];

  @override
  Map<String, dynamic> toJson() {
    return {'creator': creator};
  }

  factory QueryDenomsFromCreatorRequest.fromJson(Map<String, dynamic> json) {
    return QueryDenomsFromCreatorRequest(
      creator: json.valueAsString<String?>('creator', acceptCamelCase: true),
    );
  }

  factory QueryDenomsFromCreatorRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomsFromCreatorRequest(creator: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveTokenfactoryV1beta1QueryDenomsFromCreatorRequest;
  @override
  QueryDenomsFromCreatorResponse onQueryResponse(List<int> bytes) {
    return QueryDenomsFromCreatorResponse.deserialize(bytes);
  }

  @override
  QueryDenomsFromCreatorResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryDenomsFromCreatorResponse.fromJson(json);
  }
}

/// QueryDenomsFromCreatorRequest defines the response structure for the
/// DenomsFromCreator gRPC query.
class QueryDenomsFromCreatorResponse extends CosmosProtoMessage {
  /// The list of denoms
  final List<String> denoms;

  const QueryDenomsFromCreatorResponse({this.denoms = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [denoms];

  @override
  Map<String, dynamic> toJson() {
    return {'denoms': denoms.map((e) => e).toList()};
  }

  factory QueryDenomsFromCreatorResponse.fromJson(Map<String, dynamic> json) {
    return QueryDenomsFromCreatorResponse(
      denoms:
          (json.valueEnsureAsList<dynamic>(
            'denoms',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory QueryDenomsFromCreatorResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomsFromCreatorResponse(
      denoms: decode.getListOrEmpty<String>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveTokenfactoryV1beta1QueryDenomsFromCreatorResponse;
}

/// QueryModuleStateRequest is the request type for the
/// Query/TokenfactoryModuleState RPC method.
class QueryModuleStateRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryModuleStateResponse> {
  const QueryModuleStateRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/tokenfactory/v1beta1/module_state",
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

  factory QueryModuleStateRequest.fromJson(Map<String, dynamic> json) {
    return QueryModuleStateRequest();
  }

  factory QueryModuleStateRequest.deserialize(List<int> bytes) {
    return QueryModuleStateRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveTokenfactoryV1beta1QueryModuleStateRequest;
  @override
  QueryModuleStateResponse onQueryResponse(List<int> bytes) {
    return QueryModuleStateResponse.deserialize(bytes);
  }

  @override
  QueryModuleStateResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryModuleStateResponse.fromJson(json);
  }
}

/// QueryModuleStateResponse is the response type for the
/// Query/TokenfactoryModuleState RPC method.
class QueryModuleStateResponse extends CosmosProtoMessage {
  /// The module state
  final injective_tokenfactory_v1beta1_genesis.GenesisState? state;

  const QueryModuleStateResponse({this.state});

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
  List<Object?> get protoValues => [state];

  @override
  Map<String, dynamic> toJson() {
    return {'state': state?.toJson()};
  }

  factory QueryModuleStateResponse.fromJson(Map<String, dynamic> json) {
    return QueryModuleStateResponse(
      state: json.valueTo<
        injective_tokenfactory_v1beta1_genesis.GenesisState?,
        Map<String, dynamic>
      >(
        key: 'state',
        parse:
            (v) =>
                injective_tokenfactory_v1beta1_genesis.GenesisState.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryModuleStateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryModuleStateResponse(
      state: decode
          .messageTo<injective_tokenfactory_v1beta1_genesis.GenesisState?>(
            1,
            (b) => injective_tokenfactory_v1beta1_genesis
                .GenesisState.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveTokenfactoryV1beta1QueryModuleStateResponse;
}
