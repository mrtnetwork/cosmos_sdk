import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/permissions/v1beta1/src/params.dart"
    as injective_permissions_v1beta1_params;
import "package:cosmos_sdk/proto_messages/injective/permissions/v1beta1/src/permissions.dart"
    as injective_permissions_v1beta1_permissions;
import "package:cosmos_sdk/proto_messages/injective/common/vouchers/v1/src/vouchers.dart"
    as injective_common_vouchers_v1_vouchers;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/injective/permissions/v1beta1/src/genesis.dart"
    as injective_permissions_v1beta1_genesis;

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
          path: "/injective/permissions/v1beta1/params",
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
      DefaultCosmosProtoTypeUrl.injectivePermissionsV1beta1QueryParamsRequest;
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
  final injective_permissions_v1beta1_params.Params? params;

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
        injective_permissions_v1beta1_params.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse: (v) => injective_permissions_v1beta1_params.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<injective_permissions_v1beta1_params.Params?>(
        1,
        (b) => injective_permissions_v1beta1_params.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePermissionsV1beta1QueryParamsResponse;
}

/// QueryNamespaceDenomsRequest is the request type for the Query/NamespaceDenoms
/// RPC method.
class QueryNamespaceDenomsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryNamespaceDenomsResponse> {
  const QueryNamespaceDenomsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/permissions/v1beta1/namespace_denoms",
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

  factory QueryNamespaceDenomsRequest.fromJson(Map<String, dynamic> json) {
    return QueryNamespaceDenomsRequest();
  }

  factory QueryNamespaceDenomsRequest.deserialize(List<int> bytes) {
    return QueryNamespaceDenomsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePermissionsV1beta1QueryNamespaceDenomsRequest;
  @override
  QueryNamespaceDenomsResponse onQueryResponse(List<int> bytes) {
    return QueryNamespaceDenomsResponse.deserialize(bytes);
  }

  @override
  QueryNamespaceDenomsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryNamespaceDenomsResponse.fromJson(json);
  }
}

/// QueryNamespaceDenomsResponse is the response type for the
/// Query/NamespaceDenoms RPC method.
class QueryNamespaceDenomsResponse extends CosmosProtoMessage {
  /// List of denoms
  final List<String> denoms;

  const QueryNamespaceDenomsResponse({this.denoms = const []});

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

  factory QueryNamespaceDenomsResponse.fromJson(Map<String, dynamic> json) {
    return QueryNamespaceDenomsResponse(
      denoms:
          (json.valueEnsureAsList<dynamic>(
            'denoms',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory QueryNamespaceDenomsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryNamespaceDenomsResponse(
      denoms: decode.getListOrEmpty<String>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePermissionsV1beta1QueryNamespaceDenomsResponse;
}

/// QueryNamespacesRequest is the request type for the Query/Namespaces RPC
/// method.
class QueryNamespacesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryNamespacesResponse> {
  const QueryNamespacesRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/permissions/v1beta1/namespaces",
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

  factory QueryNamespacesRequest.fromJson(Map<String, dynamic> json) {
    return QueryNamespacesRequest();
  }

  factory QueryNamespacesRequest.deserialize(List<int> bytes) {
    return QueryNamespacesRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePermissionsV1beta1QueryNamespacesRequest;
  @override
  QueryNamespacesResponse onQueryResponse(List<int> bytes) {
    return QueryNamespacesResponse.deserialize(bytes);
  }

  @override
  QueryNamespacesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryNamespacesResponse.fromJson(json);
  }
}

/// QueryNamespacesResponse is the response type for the Query/Namespaces
/// RPC method.
class QueryNamespacesResponse extends CosmosProtoMessage {
  /// List of namespaces
  final List<injective_permissions_v1beta1_permissions.Namespace> namespaces;

  const QueryNamespacesResponse({this.namespaces = const []});

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
  List<Object?> get protoValues => [namespaces];

  @override
  Map<String, dynamic> toJson() {
    return {'namespaces': namespaces.map((e) => e.toJson()).toList()};
  }

  factory QueryNamespacesResponse.fromJson(Map<String, dynamic> json) {
    return QueryNamespacesResponse(
      namespaces:
          (json.valueEnsureAsList<dynamic>('namespaces', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  injective_permissions_v1beta1_permissions.Namespace,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_permissions_v1beta1_permissions
                          .Namespace.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryNamespacesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryNamespacesResponse(
      namespaces:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_permissions_v1beta1_permissions
                    .Namespace.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePermissionsV1beta1QueryNamespacesResponse;
}

/// QueryNamespaceRequest is the request type for the
/// Query/Namespace RPC method.
class QueryNamespaceRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryNamespaceResponse> {
  /// The token denom
  final String? denom;

  const QueryNamespaceRequest({this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/permissions/v1beta1/namespace/{denom}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [denom];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom};
  }

  factory QueryNamespaceRequest.fromJson(Map<String, dynamic> json) {
    return QueryNamespaceRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory QueryNamespaceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryNamespaceRequest(denom: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePermissionsV1beta1QueryNamespaceRequest;
  @override
  QueryNamespaceResponse onQueryResponse(List<int> bytes) {
    return QueryNamespaceResponse.deserialize(bytes);
  }

  @override
  QueryNamespaceResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryNamespaceResponse.fromJson(json);
  }
}

/// QueryNamespaceResponse is the response type for the
/// Query/NamespaceByDenom RPC method.
class QueryNamespaceResponse extends CosmosProtoMessage {
  /// The namespace details
  final injective_permissions_v1beta1_permissions.Namespace? namespace;

  const QueryNamespaceResponse({this.namespace});

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
  List<Object?> get protoValues => [namespace];

  @override
  Map<String, dynamic> toJson() {
    return {'namespace': namespace?.toJson()};
  }

  factory QueryNamespaceResponse.fromJson(Map<String, dynamic> json) {
    return QueryNamespaceResponse(
      namespace: json.valueTo<
        injective_permissions_v1beta1_permissions.Namespace?,
        Map<String, dynamic>
      >(
        key: 'namespace',
        parse:
            (v) =>
                injective_permissions_v1beta1_permissions.Namespace.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryNamespaceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryNamespaceResponse(
      namespace: decode
          .messageTo<injective_permissions_v1beta1_permissions.Namespace?>(
            1,
            (b) => injective_permissions_v1beta1_permissions
                .Namespace.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePermissionsV1beta1QueryNamespaceResponse;
}

/// QueryAddressesByRoleRequest is the request type for the Query/AddressesByRole
/// RPC method.
class QueryActorsByRoleRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryActorsByRoleResponse> {
  /// The token denom
  final String? denom;

  /// The role to query actors for
  final String? role;

  const QueryActorsByRoleRequest({this.denom, this.role});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/permissions/v1beta1/actors_by_role/{denom}/{role}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [denom, role];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom, 'role': role};
  }

  factory QueryActorsByRoleRequest.fromJson(Map<String, dynamic> json) {
    return QueryActorsByRoleRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      role: json.valueAsString<String?>('role', acceptCamelCase: true),
    );
  }

  factory QueryActorsByRoleRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryActorsByRoleRequest(
      denom: decode.getString<String?>(1),
      role: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePermissionsV1beta1QueryActorsByRoleRequest;
  @override
  QueryActorsByRoleResponse onQueryResponse(List<int> bytes) {
    return QueryActorsByRoleResponse.deserialize(bytes);
  }

  @override
  QueryActorsByRoleResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryActorsByRoleResponse.fromJson(json);
  }
}

/// QueryAddressesByRoleResponse is the response type for the
/// Query/AddressesByRole RPC method.
class QueryActorsByRoleResponse extends CosmosProtoMessage {
  /// List of actors' Injective addresses
  final List<String> actors;

  const QueryActorsByRoleResponse({this.actors = const []});

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
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [actors];

  @override
  Map<String, dynamic> toJson() {
    return {'actors': actors.map((e) => e).toList()};
  }

  factory QueryActorsByRoleResponse.fromJson(Map<String, dynamic> json) {
    return QueryActorsByRoleResponse(
      actors:
          (json.valueEnsureAsList<dynamic>(
            'actors',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory QueryActorsByRoleResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryActorsByRoleResponse(actors: decode.getListOrEmpty<String>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePermissionsV1beta1QueryActorsByRoleResponse;
}

/// QueryRolesByActorRequest is the request type for the
/// Query/RolesByActor RPC method.
class QueryRolesByActorRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryRolesByActorResponse> {
  /// The token denom
  final String? denom;

  /// The actor's Injective address
  final String? actor;

  const QueryRolesByActorRequest({this.denom, this.actor});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/permissions/v1beta1/roles_by_actor/{denom}/{actor}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [denom, actor];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom, 'actor': actor};
  }

  factory QueryRolesByActorRequest.fromJson(Map<String, dynamic> json) {
    return QueryRolesByActorRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      actor: json.valueAsString<String?>('actor', acceptCamelCase: true),
    );
  }

  factory QueryRolesByActorRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRolesByActorRequest(
      denom: decode.getString<String?>(1),
      actor: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePermissionsV1beta1QueryRolesByActorRequest;
  @override
  QueryRolesByActorResponse onQueryResponse(List<int> bytes) {
    return QueryRolesByActorResponse.deserialize(bytes);
  }

  @override
  QueryRolesByActorResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryRolesByActorResponse.fromJson(json);
  }
}

/// QueryRolesByActorResponse is the response type for the
/// Query/RolesByActor RPC method.
class QueryRolesByActorResponse extends CosmosProtoMessage {
  /// List of roles
  final List<String> roles;

  const QueryRolesByActorResponse({this.roles = const []});

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
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [roles];

  @override
  Map<String, dynamic> toJson() {
    return {'roles': roles.map((e) => e).toList()};
  }

  factory QueryRolesByActorResponse.fromJson(Map<String, dynamic> json) {
    return QueryRolesByActorResponse(
      roles:
          (json.valueEnsureAsList<dynamic>(
            'roles',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory QueryRolesByActorResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRolesByActorResponse(roles: decode.getListOrEmpty<String>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePermissionsV1beta1QueryRolesByActorResponse;
}

/// QueryRoleManagersRequest is the request type for the Query/RoleManagers
/// RPC method.
class QueryRoleManagersRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryRoleManagersResponse> {
  /// The token denom
  final String? denom;

  const QueryRoleManagersRequest({this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/permissions/v1beta1/role_managers/{denom}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [denom];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom};
  }

  factory QueryRoleManagersRequest.fromJson(Map<String, dynamic> json) {
    return QueryRoleManagersRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory QueryRoleManagersRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRoleManagersRequest(denom: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePermissionsV1beta1QueryRoleManagersRequest;
  @override
  QueryRoleManagersResponse onQueryResponse(List<int> bytes) {
    return QueryRoleManagersResponse.deserialize(bytes);
  }

  @override
  QueryRoleManagersResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryRoleManagersResponse.fromJson(json);
  }
}

/// QueryRoleManagersResponse is the response type for the
/// Query/RoleManagers RPC method.
class QueryRoleManagersResponse extends CosmosProtoMessage {
  /// List of role managers
  final List<injective_permissions_v1beta1_permissions.RoleManager>
  roleManagers;

  const QueryRoleManagersResponse({this.roleManagers = const []});

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
  List<Object?> get protoValues => [roleManagers];

  @override
  Map<String, dynamic> toJson() {
    return {'role_managers': roleManagers.map((e) => e.toJson()).toList()};
  }

  factory QueryRoleManagersResponse.fromJson(Map<String, dynamic> json) {
    return QueryRoleManagersResponse(
      roleManagers:
          (json.valueEnsureAsList<dynamic>(
                'role_managers',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_permissions_v1beta1_permissions.RoleManager,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_permissions_v1beta1_permissions
                          .RoleManager.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryRoleManagersResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRoleManagersResponse(
      roleManagers:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_permissions_v1beta1_permissions
                    .RoleManager.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePermissionsV1beta1QueryRoleManagersResponse;
}

/// QueryRoleManagerRequest is the request type for the Query/RoleManager
/// RPC method.
class QueryRoleManagerRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryRoleManagerResponse> {
  /// The token denom
  final String? denom;

  /// The manager Injective address
  final String? manager;

  const QueryRoleManagerRequest({this.denom, this.manager});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/permissions/v1beta1/role_manager/{denom}/{manager}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [denom, manager];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom, 'manager': manager};
  }

  factory QueryRoleManagerRequest.fromJson(Map<String, dynamic> json) {
    return QueryRoleManagerRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      manager: json.valueAsString<String?>('manager', acceptCamelCase: true),
    );
  }

  factory QueryRoleManagerRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRoleManagerRequest(
      denom: decode.getString<String?>(1),
      manager: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePermissionsV1beta1QueryRoleManagerRequest;
  @override
  QueryRoleManagerResponse onQueryResponse(List<int> bytes) {
    return QueryRoleManagerResponse.deserialize(bytes);
  }

  @override
  QueryRoleManagerResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryRoleManagerResponse.fromJson(json);
  }
}

/// QueryRoleManagerResponse is the response type for the
/// Query/RoleManager RPC method.
class QueryRoleManagerResponse extends CosmosProtoMessage {
  /// The role manager details
  final injective_permissions_v1beta1_permissions.RoleManager? roleManager;

  const QueryRoleManagerResponse({this.roleManager});

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
  List<Object?> get protoValues => [roleManager];

  @override
  Map<String, dynamic> toJson() {
    return {'role_manager': roleManager?.toJson()};
  }

  factory QueryRoleManagerResponse.fromJson(Map<String, dynamic> json) {
    return QueryRoleManagerResponse(
      roleManager: json.valueTo<
        injective_permissions_v1beta1_permissions.RoleManager?,
        Map<String, dynamic>
      >(
        key: 'role_manager',
        parse:
            (v) => injective_permissions_v1beta1_permissions
                .RoleManager.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryRoleManagerResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRoleManagerResponse(
      roleManager: decode
          .messageTo<injective_permissions_v1beta1_permissions.RoleManager?>(
            1,
            (b) => injective_permissions_v1beta1_permissions
                .RoleManager.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePermissionsV1beta1QueryRoleManagerResponse;
}

/// QueryPolicyStatusesRequest is the request type for the Query/PolicyStatuses
/// RPC method.
class QueryPolicyStatusesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryPolicyStatusesResponse> {
  /// The token denom
  final String? denom;

  const QueryPolicyStatusesRequest({this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/permissions/v1beta1/policy_statuses/{denom}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [denom];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom};
  }

  factory QueryPolicyStatusesRequest.fromJson(Map<String, dynamic> json) {
    return QueryPolicyStatusesRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory QueryPolicyStatusesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPolicyStatusesRequest(denom: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePermissionsV1beta1QueryPolicyStatusesRequest;
  @override
  QueryPolicyStatusesResponse onQueryResponse(List<int> bytes) {
    return QueryPolicyStatusesResponse.deserialize(bytes);
  }

  @override
  QueryPolicyStatusesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryPolicyStatusesResponse.fromJson(json);
  }
}

/// QueryRoleManagerResponse is the response type for the
/// Query/RoleManager RPC method.
class QueryPolicyStatusesResponse extends CosmosProtoMessage {
  /// List of policy statuses
  final List<injective_permissions_v1beta1_permissions.PolicyStatus>
  policyStatuses;

  const QueryPolicyStatusesResponse({this.policyStatuses = const []});

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
  List<Object?> get protoValues => [policyStatuses];

  @override
  Map<String, dynamic> toJson() {
    return {'policy_statuses': policyStatuses.map((e) => e.toJson()).toList()};
  }

  factory QueryPolicyStatusesResponse.fromJson(Map<String, dynamic> json) {
    return QueryPolicyStatusesResponse(
      policyStatuses:
          (json.valueEnsureAsList<dynamic>(
                'policy_statuses',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_permissions_v1beta1_permissions.PolicyStatus,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_permissions_v1beta1_permissions
                          .PolicyStatus.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryPolicyStatusesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPolicyStatusesResponse(
      policyStatuses:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_permissions_v1beta1_permissions
                    .PolicyStatus.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePermissionsV1beta1QueryPolicyStatusesResponse;
}

/// QueryPolicyManagerCapabilitiesRequest is the request type for the
/// Query/PolicyManagerCapabilities RPC method.
class QueryPolicyManagerCapabilitiesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryPolicyManagerCapabilitiesResponse> {
  /// The token denom
  final String? denom;

  const QueryPolicyManagerCapabilitiesRequest({this.denom});

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
              "/injective/permissions/v1beta1/policy_manager_capabilities/{denom}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [denom];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom};
  }

  factory QueryPolicyManagerCapabilitiesRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryPolicyManagerCapabilitiesRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory QueryPolicyManagerCapabilitiesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPolicyManagerCapabilitiesRequest(
      denom: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePermissionsV1beta1QueryPolicyManagerCapabilitiesRequest;
  @override
  QueryPolicyManagerCapabilitiesResponse onQueryResponse(List<int> bytes) {
    return QueryPolicyManagerCapabilitiesResponse.deserialize(bytes);
  }

  @override
  QueryPolicyManagerCapabilitiesResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryPolicyManagerCapabilitiesResponse.fromJson(json);
  }
}

/// QueryPolicyManagerCapabilitiesResponse is the response type for the
/// Query/PolicyManagerCapabilities RPC method.
class QueryPolicyManagerCapabilitiesResponse extends CosmosProtoMessage {
  /// List of policy manager capabilities
  final List<injective_permissions_v1beta1_permissions.PolicyManagerCapability>
  policyManagerCapabilities;

  const QueryPolicyManagerCapabilitiesResponse({
    this.policyManagerCapabilities = const [],
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
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [policyManagerCapabilities];

  @override
  Map<String, dynamic> toJson() {
    return {
      'policy_manager_capabilities':
          policyManagerCapabilities.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryPolicyManagerCapabilitiesResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryPolicyManagerCapabilitiesResponse(
      policyManagerCapabilities:
          (json.valueEnsureAsList<dynamic>(
                'policy_manager_capabilities',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_permissions_v1beta1_permissions.PolicyManagerCapability,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_permissions_v1beta1_permissions
                          .PolicyManagerCapability.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryPolicyManagerCapabilitiesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPolicyManagerCapabilitiesResponse(
      policyManagerCapabilities:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_permissions_v1beta1_permissions
                    .PolicyManagerCapability.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePermissionsV1beta1QueryPolicyManagerCapabilitiesResponse;
}

class QueryVouchersRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryVouchersResponse> {
  /// The token denom
  final String? denom;

  const QueryVouchersRequest({this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/permissions/v1beta1/vouchers",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [denom];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom};
  }

  factory QueryVouchersRequest.fromJson(Map<String, dynamic> json) {
    return QueryVouchersRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory QueryVouchersRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryVouchersRequest(denom: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePermissionsV1beta1QueryVouchersRequest;
  @override
  QueryVouchersResponse onQueryResponse(List<int> bytes) {
    return QueryVouchersResponse.deserialize(bytes);
  }

  @override
  QueryVouchersResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryVouchersResponse.fromJson(json);
  }
}

class QueryVouchersResponse extends CosmosProtoMessage {
  /// List of outstanding vouchers matching the request filter.
  final List<injective_common_vouchers_v1_vouchers.AddressVoucher> vouchers;

  const QueryVouchersResponse({this.vouchers = const []});

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
  List<Object?> get protoValues => [vouchers];

  @override
  Map<String, dynamic> toJson() {
    return {'vouchers': vouchers.map((e) => e.toJson()).toList()};
  }

  factory QueryVouchersResponse.fromJson(Map<String, dynamic> json) {
    return QueryVouchersResponse(
      vouchers:
          (json.valueEnsureAsList<dynamic>('vouchers', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  injective_common_vouchers_v1_vouchers.AddressVoucher,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_common_vouchers_v1_vouchers
                          .AddressVoucher.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryVouchersResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryVouchersResponse(
      vouchers:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_common_vouchers_v1_vouchers
                    .AddressVoucher.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePermissionsV1beta1QueryVouchersResponse;
}

class QueryVoucherRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryVoucherResponse> {
  /// The token denom
  final String? denom;

  /// The Injective address of the receiver
  final String? address;

  const QueryVoucherRequest({this.denom, this.address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/permissions/v1beta1/voucher",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [denom, address];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom, 'address': address};
  }

  factory QueryVoucherRequest.fromJson(Map<String, dynamic> json) {
    return QueryVoucherRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
    );
  }

  factory QueryVoucherRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryVoucherRequest(
      denom: decode.getString<String?>(1),
      address: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePermissionsV1beta1QueryVoucherRequest;
  @override
  QueryVoucherResponse onQueryResponse(List<int> bytes) {
    return QueryVoucherResponse.deserialize(bytes);
  }

  @override
  QueryVoucherResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryVoucherResponse.fromJson(json);
  }
}

class QueryVoucherResponse extends CosmosProtoMessage {
  /// The voucher amount
  final cosmos_base_v1beta1_coin.Coin? voucher;

  const QueryVoucherResponse({this.voucher});

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
  List<Object?> get protoValues => [voucher];

  @override
  Map<String, dynamic> toJson() {
    return {'voucher': voucher?.toJson()};
  }

  factory QueryVoucherResponse.fromJson(Map<String, dynamic> json) {
    return QueryVoucherResponse(
      voucher: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'voucher',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryVoucherResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryVoucherResponse(
      voucher: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        1,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePermissionsV1beta1QueryVoucherResponse;
}

/// QueryModuleStateRequest is the request type for the
/// Query/PermissionsModuleState RPC method.
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
          path: "/injective/permissions/v1beta1/module_state",
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
          .injectivePermissionsV1beta1QueryModuleStateRequest;
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
/// Query/PermissionsModuleState RPC method.
class QueryModuleStateResponse extends CosmosProtoMessage {
  /// The module state
  final injective_permissions_v1beta1_genesis.GenesisState? state;

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
        injective_permissions_v1beta1_genesis.GenesisState?,
        Map<String, dynamic>
      >(
        key: 'state',
        parse:
            (v) =>
                injective_permissions_v1beta1_genesis.GenesisState.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryModuleStateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryModuleStateResponse(
      state: decode
          .messageTo<injective_permissions_v1beta1_genesis.GenesisState?>(
            1,
            (b) => injective_permissions_v1beta1_genesis
                .GenesisState.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePermissionsV1beta1QueryModuleStateResponse;
}
