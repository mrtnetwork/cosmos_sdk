import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// each Action enum value should be a power of two
enum Action implements ProtoEnumVariant {
  /// 0 is reserved for ACTION_UNSPECIFIED
  unspecified(0, 'UNSPECIFIED'),

  /// 1 is reserved for MINT
  mint(1, 'MINT'),

  /// 2 is reserved for RECEIVE
  receive(2, 'RECEIVE'),

  /// 4 is reserved for BURN
  burn(4, 'BURN'),

  /// 8 is reserved for SEND
  send(8, 'SEND'),

  /// 16 is reserved for SUPER_BURN
  superBurn(16, 'SUPER_BURN'),

  ///
  /// MANAGER ACTIONS BELOW
  ///
  /// 2^27 is reserved for MODIFY_POLICY_MANAGERS
  modifyPolicyManagers(134217728, 'MODIFY_POLICY_MANAGERS'),

  /// 2^27 or 134217728
  /// 2^28 is reserved for MODIFY_CONTRACT_HOOK
  modifyContractHook(268435456, 'MODIFY_CONTRACT_HOOK'),

  /// 2^28 or 268435456
  /// 2^29 is reserved for MODIFY_ROLE_PERMISSIONS
  modifyRolePermissions(536870912, 'MODIFY_ROLE_PERMISSIONS'),

  /// 2^29 or 536870912
  /// 2^30 is reserved for MODIFY_ROLE_MANAGERS
  modifyRoleManagers(1073741824, 'MODIFY_ROLE_MANAGERS');

  const Action(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static Action fromValue(int? value) {
    return Action.values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw ItemNotFoundException(name: "Action", value: value),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static Action from(Object? value) {
    return Action.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse: () => throw ItemNotFoundException(name: "Action", value: value),
    );
  }
}

/// Namespace defines a permissions namespace
class Namespace extends CosmosProtoMessage {
  /// The tokenfactory denom to which this namespace applies to
  final String? denom;

  /// The address of cosmwasm contract to apply code-based restrictions
  final String? wasmHook;

  /// permissions for each role
  final List<Role> rolePermissions;

  /// roles for each actor
  final List<ActorRoles> actorRoles;

  /// managers for each role
  final List<RoleManager> roleManagers;

  /// status for each policy
  final List<PolicyStatus> policyStatuses;

  /// capabilities for each manager for each policy
  final List<PolicyManagerCapability> policyManagerCapabilities;

  /// The address of the EVM contract to map code-based permissions
  final String? evmHook;

  const Namespace({
    this.denom,
    this.wasmHook,
    this.rolePermissions = const [],
    this.actorRoles = const [],
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
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
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
        ProtoFieldConfig.string(8),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    denom,
    wasmHook,
    rolePermissions,
    actorRoles,
    roleManagers,
    policyStatuses,
    policyManagerCapabilities,
    evmHook,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'denom': denom,
      'wasm_hook': wasmHook,
      'role_permissions': rolePermissions.map((e) => e.toJson()).toList(),
      'actor_roles': actorRoles.map((e) => e.toJson()).toList(),
      'role_managers': roleManagers.map((e) => e.toJson()).toList(),
      'policy_statuses': policyStatuses.map((e) => e.toJson()).toList(),
      'policy_manager_capabilities':
          policyManagerCapabilities.map((e) => e.toJson()).toList(),
      'evm_hook': evmHook,
    };
  }

  factory Namespace.fromJson(Map<String, dynamic> json) {
    return Namespace(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      wasmHook: json.valueAsString<String?>('wasm_hook', acceptCamelCase: true),
      rolePermissions:
          (json.valueEnsureAsList<dynamic>(
                'role_permissions',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<Role, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => Role.fromJson(v),
                ),
              )
              .toList(),
      actorRoles:
          (json.valueEnsureAsList<dynamic>(
                'actor_roles',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<ActorRoles, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => ActorRoles.fromJson(v),
                ),
              )
              .toList(),
      roleManagers:
          (json.valueEnsureAsList<dynamic>(
                'role_managers',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<RoleManager, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => RoleManager.fromJson(v),
                ),
              )
              .toList(),
      policyStatuses:
          (json.valueEnsureAsList<dynamic>(
                'policy_statuses',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<PolicyStatus, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => PolicyStatus.fromJson(v),
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
                  PolicyManagerCapability,
                  Map<String, dynamic>
                >(value: e, parse: (v) => PolicyManagerCapability.fromJson(v)),
              )
              .toList(),
      evmHook: json.valueAsString<String?>('evm_hook', acceptCamelCase: true),
    );
  }

  factory Namespace.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Namespace(
      denom: decode.getString<String?>(1),
      wasmHook: decode.getString<String?>(2),
      rolePermissions:
          decode.getListOfBytes(3).map((b) => Role.deserialize(b)).toList(),
      actorRoles:
          decode
              .getListOfBytes(4)
              .map((b) => ActorRoles.deserialize(b))
              .toList(),
      roleManagers:
          decode
              .getListOfBytes(5)
              .map((b) => RoleManager.deserialize(b))
              .toList(),
      policyStatuses:
          decode
              .getListOfBytes(6)
              .map((b) => PolicyStatus.deserialize(b))
              .toList(),
      policyManagerCapabilities:
          decode
              .getListOfBytes(7)
              .map((b) => PolicyManagerCapability.deserialize(b))
              .toList(),
      evmHook: decode.getString<String?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePermissionsV1beta1Namespace;
}

/// AddressRoles defines roles for an actor
class ActorRoles extends CosmosProtoMessage {
  /// The actor name
  final String? actor;

  /// The roles for the actor
  final List<String> roles;

  const ActorRoles({this.actor, this.roles = const []});

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
  List<Object?> get protoValues => [actor, roles];

  @override
  Map<String, dynamic> toJson() {
    return {'actor': actor, 'roles': roles.map((e) => e).toList()};
  }

  factory ActorRoles.fromJson(Map<String, dynamic> json) {
    return ActorRoles(
      actor: json.valueAsString<String?>('actor', acceptCamelCase: true),
      roles:
          (json.valueEnsureAsList<dynamic>(
            'roles',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory ActorRoles.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ActorRoles(
      actor: decode.getString<String?>(1),
      roles: decode.getListOrEmpty<String>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePermissionsV1beta1ActorRoles;
}

/// RoleActors defines actors for a role
class RoleActors extends CosmosProtoMessage {
  /// The role name
  final String? role;

  /// List of actor names associated with the role
  final List<String> actors;

  const RoleActors({this.role, this.actors = const []});

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
  List<Object?> get protoValues => [role, actors];

  @override
  Map<String, dynamic> toJson() {
    return {'role': role, 'actors': actors.map((e) => e).toList()};
  }

  factory RoleActors.fromJson(Map<String, dynamic> json) {
    return RoleActors(
      role: json.valueAsString<String?>('role', acceptCamelCase: true),
      actors:
          (json.valueEnsureAsList<dynamic>(
            'actors',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory RoleActors.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RoleActors(
      role: decode.getString<String?>(1),
      actors: decode.getListOrEmpty<String>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePermissionsV1beta1RoleActors;
}

/// RoleManager defines roles for a manager address
class RoleManager extends CosmosProtoMessage {
  /// The manager name
  final String? manager;

  /// List of roles associated with the manager
  final List<String> roles;

  const RoleManager({this.manager, this.roles = const []});

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
  List<Object?> get protoValues => [manager, roles];

  @override
  Map<String, dynamic> toJson() {
    return {'manager': manager, 'roles': roles.map((e) => e).toList()};
  }

  factory RoleManager.fromJson(Map<String, dynamic> json) {
    return RoleManager(
      manager: json.valueAsString<String?>('manager', acceptCamelCase: true),
      roles:
          (json.valueEnsureAsList<dynamic>(
            'roles',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory RoleManager.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RoleManager(
      manager: decode.getString<String?>(1),
      roles: decode.getListOrEmpty<String>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePermissionsV1beta1RoleManager;
}

/// 2^30 or 1073741824
/// PolicyStatus defines the status of a policy
class PolicyStatus extends CosmosProtoMessage {
  /// The action code number
  final Action? action;

  /// Whether the policy is disabled
  final bool? isDisabled;

  /// Whether the policy is sealed
  final bool? isSealed;

  const PolicyStatus({this.action, this.isDisabled, this.isSealed});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.enumType(1),
        ProtoFieldConfig.bool(2),
        ProtoFieldConfig.bool(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [action, isDisabled, isSealed];

  @override
  Map<String, dynamic> toJson() {
    return {
      'action': action?.protoName,
      'is_disabled': isDisabled,
      'is_sealed': isSealed,
    };
  }

  factory PolicyStatus.fromJson(Map<String, dynamic> json) {
    return PolicyStatus(
      action: json.valueTo<Action?, Object?>(
        key: 'action',
        parse: (v) => Action.from(v),
      ),
      isDisabled: json.valueAsBool<bool?>('is_disabled', acceptCamelCase: true),
      isSealed: json.valueAsBool<bool?>('is_sealed', acceptCamelCase: true),
    );
  }

  factory PolicyStatus.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PolicyStatus(
      action: decode.getEnum<Action?>(1, Action.values),
      isDisabled: decode.getBool<bool?>(2),
      isSealed: decode.getBool<bool?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePermissionsV1beta1PolicyStatus;
}

/// Role is only used for storage
class Role extends CosmosProtoMessage {
  /// The role name
  final String? name;

  /// The role ID
  final int? roleId;

  /// Integer representing the bitwise combination of all actions assigned to the
  /// role
  final int? permissions;

  const Role({this.name, this.roleId, this.permissions});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.uint32(2),
        ProtoFieldConfig.uint32(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [name, roleId, permissions];

  @override
  Map<String, dynamic> toJson() {
    return {'name': name, 'role_id': roleId, 'permissions': permissions};
  }

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
      roleId: json.valueAsInt<int?>('role_id', acceptCamelCase: true),
      permissions: json.valueAsInt<int?>('permissions', acceptCamelCase: true),
    );
  }

  factory Role.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Role(
      name: decode.getString<String?>(1),
      roleId: decode.getInt<int?>(2),
      permissions: decode.getInt<int?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePermissionsV1beta1Role;
}

/// PolicyManagerCapability defines the capabilities of a manager for a policy
class PolicyManagerCapability extends CosmosProtoMessage {
  /// The manager name
  final String? manager;

  /// The action code number
  final Action? action;

  /// Whether the manager can disable the policy
  final bool? canDisable;

  /// Whether the manager can seal the policy
  final bool? canSeal;

  const PolicyManagerCapability({
    this.manager,
    this.action,
    this.canDisable,
    this.canSeal,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.enumType(2),
        ProtoFieldConfig.bool(3),
        ProtoFieldConfig.bool(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [manager, action, canDisable, canSeal];

  @override
  Map<String, dynamic> toJson() {
    return {
      'manager': manager,
      'action': action?.protoName,
      'can_disable': canDisable,
      'can_seal': canSeal,
    };
  }

  factory PolicyManagerCapability.fromJson(Map<String, dynamic> json) {
    return PolicyManagerCapability(
      manager: json.valueAsString<String?>('manager', acceptCamelCase: true),
      action: json.valueTo<Action?, Object?>(
        key: 'action',
        parse: (v) => Action.from(v),
      ),
      canDisable: json.valueAsBool<bool?>('can_disable', acceptCamelCase: true),
      canSeal: json.valueAsBool<bool?>('can_seal', acceptCamelCase: true),
    );
  }

  factory PolicyManagerCapability.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PolicyManagerCapability(
      manager: decode.getString<String?>(1),
      action: decode.getEnum<Action?>(2, Action.values),
      canDisable: decode.getBool<bool?>(3),
      canSeal: decode.getBool<bool?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePermissionsV1beta1PolicyManagerCapability;
}
