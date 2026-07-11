import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;

/// Config represents the configuration for a Cosmos SDK ABCI app.
/// It is intended that all state machine logic including the version of
/// baseapp and tx handlers (and possibly even Tendermint) that an app needs
/// can be described in a config object. For compatibility, the framework should
/// allow a mixture of declarative and imperative app wiring, however, apps
/// that strive for the maximum ease of maintainability should be able to describe
/// their state machine with a config object alone.
class Config extends CosmosProtoMessage {
  /// modules are the module configurations for the app.
  final List<ModuleConfig> modules;

  /// golang_bindings specifies explicit interface to implementation type bindings which
  /// depinject uses to resolve interface inputs to provider functions.  The scope of this
  /// field's configuration is global (not module specific).
  final List<GolangBinding> golangBindings;

  const Config({this.modules = const [], this.golangBindings = const []});

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
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [modules, golangBindings];

  @override
  Map<String, dynamic> toJson() {
    return {
      'modules': modules.map((e) => e.toJson()).toList(),
      'golang_bindings': golangBindings.map((e) => e.toJson()).toList(),
    };
  }

  factory Config.fromJson(Map<String, dynamic> json) {
    return Config(
      modules:
          (json.valueEnsureAsList<dynamic>('modules', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<ModuleConfig, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => ModuleConfig.fromJson(v),
                ),
              )
              .toList(),
      golangBindings:
          (json.valueEnsureAsList<dynamic>(
                'golang_bindings',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<GolangBinding, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => GolangBinding.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory Config.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Config(
      modules:
          decode
              .getListOfBytes(1)
              .map((b) => ModuleConfig.deserialize(b))
              .toList(),
      golangBindings:
          decode
              .getListOfBytes(2)
              .map((b) => GolangBinding.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAppV1alpha1Config;
}

/// ModuleConfig is a module configuration for an app.
class ModuleConfig extends CosmosProtoMessage {
  /// name is the unique name of the module within the app. It should be a name
  /// that persists between different versions of a module so that modules
  /// can be smoothly upgraded to new versions.
  ///
  /// For example, for the module cosmos.bank.module.v1.Module, we may chose
  /// to simply name the module "bank" in the app. When we upgrade to
  /// cosmos.bank.module.v2.Module, the app-specific name "bank" stays the same
  /// and the framework knows that the v2 module should receive all the same state
  /// that the v1 module had. Note: modules should provide info on which versions
  /// they can migrate from in the ModuleDescriptor.can_migrate_from field.
  final String? name;

  /// config is the config object for the module. Module config messages should
  /// define a ModuleDescriptor using the cosmos.app.v1alpha1.is_module extension.
  final google_protobuf_any.Any? config;

  /// golang_bindings specifies explicit interface to implementation type bindings which
  /// depinject uses to resolve interface inputs to provider functions.  The scope of this
  /// field's configuration is module specific.
  final List<GolangBinding> golangBindings;

  const ModuleConfig({this.name, this.config, this.golangBindings = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [name, config, golangBindings];

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'config': config?.toJson(),
      'golang_bindings': golangBindings.map((e) => e.toJson()).toList(),
    };
  }

  factory ModuleConfig.fromJson(Map<String, dynamic> json) {
    return ModuleConfig(
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
      config: json.valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
        key: 'config',
        parse: (v) => google_protobuf_any.Any.fromJson(v),
        acceptCamelCase: true,
      ),
      golangBindings:
          (json.valueEnsureAsList<dynamic>(
                'golang_bindings',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<GolangBinding, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => GolangBinding.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory ModuleConfig.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ModuleConfig(
      name: decode.getString<String?>(1),
      config: decode.messageTo<google_protobuf_any.Any?>(
        2,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
      golangBindings:
          decode
              .getListOfBytes(3)
              .map((b) => GolangBinding.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAppV1alpha1ModuleConfig;
}

/// GolangBinding is an explicit interface type to implementing type binding for dependency injection.
class GolangBinding extends CosmosProtoMessage {
  /// interface_type is the interface type which will be bound to a specific implementation type
  final String? interfaceType;

  /// implementation is the implementing type which will be supplied when an input of type interface is requested
  final String? implementation;

  const GolangBinding({this.interfaceType, this.implementation});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [interfaceType, implementation];

  @override
  Map<String, dynamic> toJson() {
    return {'interface_type': interfaceType, 'implementation': implementation};
  }

  factory GolangBinding.fromJson(Map<String, dynamic> json) {
    return GolangBinding(
      interfaceType: json.valueAsString<String?>(
        'interface_type',
        acceptCamelCase: true,
      ),
      implementation: json.valueAsString<String?>(
        'implementation',
        acceptCamelCase: true,
      ),
    );
  }

  factory GolangBinding.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GolangBinding(
      interfaceType: decode.getString<String?>(1),
      implementation: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAppV1alpha1GolangBinding;
}
