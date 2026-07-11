import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/permissions/v1beta1/src/params.dart"
    as injective_permissions_v1beta1_params;
import "package:cosmos_sdk/proto_messages/injective/permissions/v1beta1/src/permissions.dart"
    as injective_permissions_v1beta1_permissions;

/// rpc DeleteNamespace(MsgDeleteNamespace) returns
/// (MsgDeleteNamespaceResponse);
class MsgUpdateParams extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateParamsResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address of the governance account.
  final String? authority;

  /// params defines the permissions parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final injective_permissions_v1beta1_params.Params? params;

  const MsgUpdateParams({this.authority, this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "permissions/MsgUpdateParams",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, params];

  @override
  Map<String, dynamic> toJson() {
    return {'authority': authority, 'params': params?.toJson()};
  }

  factory MsgUpdateParams.fromJson(Map<String, dynamic> json) {
    return MsgUpdateParams(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
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

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      authority: decode.getString<String?>(1),
      params: decode.messageTo<injective_permissions_v1beta1_params.Params?>(
        2,
        (b) => injective_permissions_v1beta1_params.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePermissionsV1beta1MsgUpdateParams;
  @override
  MsgUpdateParamsResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateParamsResponse.deserialize(bytes);
  }

  @override
  MsgUpdateParamsResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateParamsResponse.fromJson(json);
  }
}

class MsgUpdateParamsResponse extends CosmosProtoMessage {
  const MsgUpdateParamsResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgUpdateParamsResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateParamsResponse();
  }

  factory MsgUpdateParamsResponse.deserialize(List<int> bytes) {
    return MsgUpdateParamsResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePermissionsV1beta1MsgUpdateParamsResponse;
}

class MsgCreateNamespace extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreateNamespaceResponse>,
        ICosmosProtoAminoMessage {
  /// The sender's Injective address
  final String? sender;

  /// The namespace information
  final injective_permissions_v1beta1_permissions.Namespace? namespace;

  const MsgCreateNamespace({this.sender, this.namespace});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "permissions/MsgCreateNamespace",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, namespace];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'namespace': namespace?.toJson()};
  }

  factory MsgCreateNamespace.fromJson(Map<String, dynamic> json) {
    return MsgCreateNamespace(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
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

  factory MsgCreateNamespace.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateNamespace(
      sender: decode.getString<String?>(1),
      namespace: decode
          .messageTo<injective_permissions_v1beta1_permissions.Namespace?>(
            2,
            (b) => injective_permissions_v1beta1_permissions
                .Namespace.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePermissionsV1beta1MsgCreateNamespace;
  @override
  MsgCreateNamespaceResponse onServiceResponse(List<int> bytes) {
    return MsgCreateNamespaceResponse.deserialize(bytes);
  }

  @override
  MsgCreateNamespaceResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgCreateNamespaceResponse.fromJson(json);
  }
}

class MsgCreateNamespaceResponse extends CosmosProtoMessage {
  const MsgCreateNamespaceResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgCreateNamespaceResponse.fromJson(Map<String, dynamic> json) {
    return MsgCreateNamespaceResponse();
  }

  factory MsgCreateNamespaceResponse.deserialize(List<int> bytes) {
    return MsgCreateNamespaceResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePermissionsV1beta1MsgCreateNamespaceResponse;
}

class MsgUpdateNamespace extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateNamespaceResponse>,
        ICosmosProtoAminoMessage {
  /// The sender's Injective address
  final String? sender;

  /// denom whose namespace updates are to be applied
  final String? denom;

  /// address of wasm smart contract to apply code-based restrictions
  final MsgUpdateNamespaceSetContractHook? wasmHook;

  /// role permissions to update
  final List<injective_permissions_v1beta1_permissions.Role> rolePermissions;

  /// role managers to update
  final List<injective_permissions_v1beta1_permissions.RoleManager>
  roleManagers;

  /// policy statuses to update
  final List<injective_permissions_v1beta1_permissions.PolicyStatus>
  policyStatuses;

  /// policy manager capabilities to update
  final List<injective_permissions_v1beta1_permissions.PolicyManagerCapability>
  policyManagerCapabilities;

  /// address of EVM smart contract to apply code-based restrictions
  final MsgUpdateNamespaceSetContractHook? evmHook;

  const MsgUpdateNamespace({
    this.sender,
    this.denom,
    this.wasmHook,
    this.rolePermissions = const [],
    this.roleManagers = const [],
    this.policyStatuses = const [],
    this.policyManagerCapabilities = const [],
    this.evmHook,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "permissions/MsgUpdateNamespace",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.message(3),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 7,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.message(8),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    denom,
    wasmHook,
    rolePermissions,
    roleManagers,
    policyStatuses,
    policyManagerCapabilities,
    evmHook,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'denom': denom,
      'wasm_hook': wasmHook?.toJson(),
      'role_permissions': rolePermissions.map((e) => e.toJson()).toList(),
      'role_managers': roleManagers.map((e) => e.toJson()).toList(),
      'policy_statuses': policyStatuses.map((e) => e.toJson()).toList(),
      'policy_manager_capabilities':
          policyManagerCapabilities.map((e) => e.toJson()).toList(),
      'evm_hook': evmHook?.toJson(),
    };
  }

  factory MsgUpdateNamespace.fromJson(Map<String, dynamic> json) {
    return MsgUpdateNamespace(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      wasmHook: json
          .valueTo<MsgUpdateNamespaceSetContractHook?, Map<String, dynamic>>(
            key: 'wasm_hook',
            parse: (v) => MsgUpdateNamespaceSetContractHook.fromJson(v),
            acceptCamelCase: true,
          ),
      rolePermissions:
          (json.valueEnsureAsList<dynamic>(
                'role_permissions',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_permissions_v1beta1_permissions.Role,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_permissions_v1beta1_permissions
                          .Role.fromJson(v),
                ),
              )
              .toList(),
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
      evmHook: json
          .valueTo<MsgUpdateNamespaceSetContractHook?, Map<String, dynamic>>(
            key: 'evm_hook',
            parse: (v) => MsgUpdateNamespaceSetContractHook.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgUpdateNamespace.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateNamespace(
      sender: decode.getString<String?>(1),
      denom: decode.getString<String?>(2),
      wasmHook: decode.messageTo<MsgUpdateNamespaceSetContractHook?>(
        3,
        (b) => MsgUpdateNamespaceSetContractHook.deserialize(b),
      ),
      rolePermissions:
          decode
              .getListOfBytes(4)
              .map(
                (b) => injective_permissions_v1beta1_permissions
                    .Role.deserialize(b),
              )
              .toList(),
      roleManagers:
          decode
              .getListOfBytes(5)
              .map(
                (b) => injective_permissions_v1beta1_permissions
                    .RoleManager.deserialize(b),
              )
              .toList(),
      policyStatuses:
          decode
              .getListOfBytes(6)
              .map(
                (b) => injective_permissions_v1beta1_permissions
                    .PolicyStatus.deserialize(b),
              )
              .toList(),
      policyManagerCapabilities:
          decode
              .getListOfBytes(7)
              .map(
                (b) => injective_permissions_v1beta1_permissions
                    .PolicyManagerCapability.deserialize(b),
              )
              .toList(),
      evmHook: decode.messageTo<MsgUpdateNamespaceSetContractHook?>(
        8,
        (b) => MsgUpdateNamespaceSetContractHook.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePermissionsV1beta1MsgUpdateNamespace;
  @override
  MsgUpdateNamespaceResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateNamespaceResponse.deserialize(bytes);
  }

  @override
  MsgUpdateNamespaceResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateNamespaceResponse.fromJson(json);
  }
}

class MsgUpdateNamespaceSetContractHook extends CosmosProtoMessage {
  final String? newValue;

  const MsgUpdateNamespaceSetContractHook({this.newValue});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [newValue];

  @override
  Map<String, dynamic> toJson() {
    return {'new_value': newValue};
  }

  factory MsgUpdateNamespaceSetContractHook.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateNamespaceSetContractHook(
      newValue: json.valueAsString<String?>('new_value', acceptCamelCase: true),
    );
  }

  factory MsgUpdateNamespaceSetContractHook.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateNamespaceSetContractHook(
      newValue: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePermissionsV1beta1MsgUpdateNamespaceSetContractHook;
}

class MsgUpdateNamespaceResponse extends CosmosProtoMessage {
  const MsgUpdateNamespaceResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgUpdateNamespaceResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateNamespaceResponse();
  }

  factory MsgUpdateNamespaceResponse.deserialize(List<int> bytes) {
    return MsgUpdateNamespaceResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePermissionsV1beta1MsgUpdateNamespaceResponse;
}

class MsgUpdateActorRoles extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateActorRolesResponse>,
        ICosmosProtoAminoMessage {
  /// The sender's Injective address
  final String? sender;

  /// The namespace denom to which this updates are applied
  final String? denom;

  /// The roles to add for given actors
  final List<injective_permissions_v1beta1_permissions.RoleActors>
  roleActorsToAdd;

  /// The roles to revoke from given actors
  final List<injective_permissions_v1beta1_permissions.RoleActors>
  roleActorsToRevoke;

  const MsgUpdateActorRoles({
    this.sender,
    this.denom,
    this.roleActorsToAdd = const [],
    this.roleActorsToRevoke = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "permissions/MsgUpdateActorRoles",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    denom,
    roleActorsToAdd,
    roleActorsToRevoke,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'denom': denom,
      'role_actors_to_add': roleActorsToAdd.map((e) => e.toJson()).toList(),
      'role_actors_to_revoke':
          roleActorsToRevoke.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgUpdateActorRoles.fromJson(Map<String, dynamic> json) {
    return MsgUpdateActorRoles(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      roleActorsToAdd:
          (json.valueEnsureAsList<dynamic>(
                'role_actors_to_add',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_permissions_v1beta1_permissions.RoleActors,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_permissions_v1beta1_permissions
                          .RoleActors.fromJson(v),
                ),
              )
              .toList(),
      roleActorsToRevoke:
          (json.valueEnsureAsList<dynamic>(
                'role_actors_to_revoke',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_permissions_v1beta1_permissions.RoleActors,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_permissions_v1beta1_permissions
                          .RoleActors.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory MsgUpdateActorRoles.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateActorRoles(
      sender: decode.getString<String?>(1),
      denom: decode.getString<String?>(2),
      roleActorsToAdd:
          decode
              .getListOfBytes(3)
              .map(
                (b) => injective_permissions_v1beta1_permissions
                    .RoleActors.deserialize(b),
              )
              .toList(),
      roleActorsToRevoke:
          decode
              .getListOfBytes(5)
              .map(
                (b) => injective_permissions_v1beta1_permissions
                    .RoleActors.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePermissionsV1beta1MsgUpdateActorRoles;
  @override
  MsgUpdateActorRolesResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateActorRolesResponse.deserialize(bytes);
  }

  @override
  MsgUpdateActorRolesResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateActorRolesResponse.fromJson(json);
  }
}

class MsgUpdateActorRolesResponse extends CosmosProtoMessage {
  const MsgUpdateActorRolesResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgUpdateActorRolesResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateActorRolesResponse();
  }

  factory MsgUpdateActorRolesResponse.deserialize(List<int> bytes) {
    return MsgUpdateActorRolesResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePermissionsV1beta1MsgUpdateActorRolesResponse;
}

class MsgClaimVoucher extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgClaimVoucherResponse>,
        ICosmosProtoAminoMessage {
  /// The sender's Injective address
  final String? sender;

  /// The token denom of the voucher to claim
  final String? denom;

  const MsgClaimVoucher({this.sender, this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "permissions/MsgClaimVoucher",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, denom];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'denom': denom};
  }

  factory MsgClaimVoucher.fromJson(Map<String, dynamic> json) {
    return MsgClaimVoucher(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory MsgClaimVoucher.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgClaimVoucher(
      sender: decode.getString<String?>(1),
      denom: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePermissionsV1beta1MsgClaimVoucher;
  @override
  MsgClaimVoucherResponse onServiceResponse(List<int> bytes) {
    return MsgClaimVoucherResponse.deserialize(bytes);
  }

  @override
  MsgClaimVoucherResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgClaimVoucherResponse.fromJson(json);
  }
}

class MsgClaimVoucherResponse extends CosmosProtoMessage {
  const MsgClaimVoucherResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgClaimVoucherResponse.fromJson(Map<String, dynamic> json) {
    return MsgClaimVoucherResponse();
  }

  factory MsgClaimVoucherResponse.deserialize(List<int> bytes) {
    return MsgClaimVoucherResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePermissionsV1beta1MsgClaimVoucherResponse;
}
