import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/osmosis/tokenfactory/v1beta1/src/params.dart"
    as osmosis_tokenfactory_v1beta1_params;
import "package:cosmos_sdk/proto_messages/osmosis/tokenfactory/v1beta1/src/authority_metadata.dart"
    as osmosis_tokenfactory_v1beta1_authority_metadata;

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
          path: "/osmosis/tokenfactory/v1beta1/params",
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
      DefaultCosmosProtoTypeUrl.osmosisTokenfactoryV1beta1QueryParamsRequest;
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
  final osmosis_tokenfactory_v1beta1_params.Params? params;

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
        osmosis_tokenfactory_v1beta1_params.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse: (v) => osmosis_tokenfactory_v1beta1_params.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<osmosis_tokenfactory_v1beta1_params.Params?>(
        1,
        (b) => osmosis_tokenfactory_v1beta1_params.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisTokenfactoryV1beta1QueryParamsResponse;
}

/// QueryDenomAuthorityMetadataRequest defines the request structure for the
/// DenomAuthorityMetadata gRPC query.
class QueryDenomAuthorityMetadataRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDenomAuthorityMetadataResponse> {
  final String? denom;

  const QueryDenomAuthorityMetadataRequest({this.denom});

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
              "/osmosis/tokenfactory/v1beta1/denoms/{denom}/authority_metadata",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [denom];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom};
  }

  factory QueryDenomAuthorityMetadataRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryDenomAuthorityMetadataRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory QueryDenomAuthorityMetadataRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomAuthorityMetadataRequest(
      denom: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisTokenfactoryV1beta1QueryDenomAuthorityMetadataRequest;
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
  final osmosis_tokenfactory_v1beta1_authority_metadata.DenomAuthorityMetadata?
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
        osmosis_tokenfactory_v1beta1_authority_metadata.DenomAuthorityMetadata?,
        Map<String, dynamic>
      >(
        key: 'authority_metadata',
        parse:
            (v) => osmosis_tokenfactory_v1beta1_authority_metadata
                .DenomAuthorityMetadata.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryDenomAuthorityMetadataResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomAuthorityMetadataResponse(
      authorityMetadata: decode.messageTo<
        osmosis_tokenfactory_v1beta1_authority_metadata.DenomAuthorityMetadata?
      >(
        1,
        (b) => osmosis_tokenfactory_v1beta1_authority_metadata
            .DenomAuthorityMetadata.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisTokenfactoryV1beta1QueryDenomAuthorityMetadataResponse;
}

/// QueryDenomsFromCreatorRequest defines the request structure for the
/// DenomsFromCreator gRPC query.
class QueryDenomsFromCreatorRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDenomsFromCreatorResponse> {
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
          path: "/osmosis/tokenfactory/v1beta1/denoms_from_creator/{creator}",
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
          .osmosisTokenfactoryV1beta1QueryDenomsFromCreatorRequest;
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
          .osmosisTokenfactoryV1beta1QueryDenomsFromCreatorResponse;
}

class QueryBeforeSendHookAddressRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryBeforeSendHookAddressResponse> {
  final String? denom;

  const QueryBeforeSendHookAddressRequest({this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/tokenfactory/v1beta1/denoms/{denom}/before_send_hook",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [denom];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom};
  }

  factory QueryBeforeSendHookAddressRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryBeforeSendHookAddressRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory QueryBeforeSendHookAddressRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBeforeSendHookAddressRequest(
      denom: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisTokenfactoryV1beta1QueryBeforeSendHookAddressRequest;
  @override
  QueryBeforeSendHookAddressResponse onQueryResponse(List<int> bytes) {
    return QueryBeforeSendHookAddressResponse.deserialize(bytes);
  }

  @override
  QueryBeforeSendHookAddressResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryBeforeSendHookAddressResponse.fromJson(json);
  }
}

/// QueryBeforeSendHookAddressResponse defines the response structure for the
/// DenomBeforeSendHook gRPC query.
class QueryBeforeSendHookAddressResponse extends CosmosProtoMessage {
  final String? cosmwasmAddress;

  const QueryBeforeSendHookAddressResponse({this.cosmwasmAddress});

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
  List<Object?> get protoValues => [cosmwasmAddress];

  @override
  Map<String, dynamic> toJson() {
    return {'cosmwasm_address': cosmwasmAddress};
  }

  factory QueryBeforeSendHookAddressResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryBeforeSendHookAddressResponse(
      cosmwasmAddress: json.valueAsString<String?>(
        'cosmwasm_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryBeforeSendHookAddressResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBeforeSendHookAddressResponse(
      cosmwasmAddress: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisTokenfactoryV1beta1QueryBeforeSendHookAddressResponse;
}

class QueryAllBeforeSendHooksAddressesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAllBeforeSendHooksAddressesResponse> {
  const QueryAllBeforeSendHooksAddressesRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/tokenfactory/v1beta1/all_before_send_hooks",
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

  factory QueryAllBeforeSendHooksAddressesRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryAllBeforeSendHooksAddressesRequest();
  }

  factory QueryAllBeforeSendHooksAddressesRequest.deserialize(List<int> bytes) {
    return QueryAllBeforeSendHooksAddressesRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisTokenfactoryV1beta1QueryAllBeforeSendHooksAddressesRequest;
  @override
  QueryAllBeforeSendHooksAddressesResponse onQueryResponse(List<int> bytes) {
    return QueryAllBeforeSendHooksAddressesResponse.deserialize(bytes);
  }

  @override
  QueryAllBeforeSendHooksAddressesResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryAllBeforeSendHooksAddressesResponse.fromJson(json);
  }
}

/// QueryAllBeforeSendHooksAddressesResponse defines the response structure for
/// the AllBeforeSendHooksAddresses gRPC query.
class QueryAllBeforeSendHooksAddressesResponse extends CosmosProtoMessage {
  final List<String> denoms;

  final List<String> beforeSendHookAddresses;

  const QueryAllBeforeSendHooksAddressesResponse({
    this.denoms = const [],
    this.beforeSendHookAddresses = const [],
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
          elementType: ProtoFieldType.string,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [denoms, beforeSendHookAddresses];

  @override
  Map<String, dynamic> toJson() {
    return {
      'denoms': denoms.map((e) => e).toList(),
      'before_send_hook_addresses':
          beforeSendHookAddresses.map((e) => e).toList(),
    };
  }

  factory QueryAllBeforeSendHooksAddressesResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryAllBeforeSendHooksAddressesResponse(
      denoms:
          (json.valueEnsureAsList<dynamic>(
            'denoms',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      beforeSendHookAddresses:
          (json.valueEnsureAsList<dynamic>(
            'before_send_hook_addresses',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory QueryAllBeforeSendHooksAddressesResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllBeforeSendHooksAddressesResponse(
      denoms: decode.getListOrEmpty<String>(1),
      beforeSendHookAddresses: decode.getListOrEmpty<String>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisTokenfactoryV1beta1QueryAllBeforeSendHooksAddressesResponse;
}
