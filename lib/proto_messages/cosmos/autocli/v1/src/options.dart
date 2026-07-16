import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// ModuleOptions describes the CLI options for a Cosmos SDK module.
class ModuleOptions extends CosmosProtoMessage {
  /// tx describes the tx commands for the module.
  final ServiceCommandDescriptor? tx;

  /// query describes the queries commands for the module.
  final ServiceCommandDescriptor? query;

  const ModuleOptions({this.tx, this.query});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [tx, query];

  @override
  Map<String, dynamic> toJson() {
    return {'tx': tx?.toJson(), 'query': query?.toJson()};
  }

  factory ModuleOptions.fromJson(Map<String, dynamic> json) {
    return ModuleOptions(
      tx: json.valueTo<ServiceCommandDescriptor?, Map<String, dynamic>>(
        key: 'tx',
        parse: (v) => ServiceCommandDescriptor.fromJson(v),
        acceptCamelCase: true,
      ),
      query: json.valueTo<ServiceCommandDescriptor?, Map<String, dynamic>>(
        key: 'query',
        parse: (v) => ServiceCommandDescriptor.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory ModuleOptions.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ModuleOptions(
      tx: decode.messageTo<ServiceCommandDescriptor?>(
        1,
        (b) => ServiceCommandDescriptor.deserialize(b),
      ),
      query: decode.messageTo<ServiceCommandDescriptor?>(
        2,
        (b) => ServiceCommandDescriptor.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAutocliV1ModuleOptions;
}

/// ServiceCommandDescriptor describes a CLI command based on a protobuf service.
class ServiceCommandDescriptor extends CosmosProtoMessage {
  /// service is the fully qualified name of the protobuf service to build
  /// the command from. It can be left empty if sub_commands are used instead
  /// which may be the case if a module provides multiple tx and/or query services.
  final String? service;

  /// rpc_command_options are options for commands generated from rpc methods.
  /// If no options are specified for a given rpc method on the service, a
  /// command will be generated for that method with the default options.
  final List<RpcCommandOptions> rpcCommandOptions;

  /// sub_commands is a map of optional sub-commands for this command based on
  /// different protobuf services. The map key is used as the name of the
  /// sub-command.
  final Map<String, ServiceCommandDescriptor> subCommands;

  /// enhance_custom_commands specifies whether to skip the service when generating commands, if a custom command already
  /// exists, or enhance the existing command. If set to true, the custom command will be enhanced with the services from
  /// gRPC. otherwise when a custom command exists, no commands will be generated for the service.
  final bool? enhanceCustomCommand;

  /// short is an optional parameter used to override the short description of the auto generated command.
  final String? short;

  const ServiceCommandDescriptor({
    this.service,
    this.rpcCommandOptions = const [],
    this.subCommands = const {},
    this.enhanceCustomCommand,
    this.short,
  });

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
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.map(
          fieldNumber: 3,
          keyType: ProtoFieldType.string,
          valueType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.bool(4),
        ProtoFieldConfig.string(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    service,
    rpcCommandOptions,
    subCommands,
    enhanceCustomCommand,
    short,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'service': service,
      'rpc_command_options': rpcCommandOptions.map((e) => e.toJson()).toList(),
      'sub_commands': subCommands.map((k, v) => MapEntry(k, v.toJson())),
      'enhance_custom_command': enhanceCustomCommand,
      'short': short,
    };
  }

  factory ServiceCommandDescriptor.fromJson(Map<String, dynamic> json) {
    return ServiceCommandDescriptor(
      service: json.valueAsString<String?>('service', acceptCamelCase: true),
      rpcCommandOptions:
          (json.valueEnsureAsList<dynamic>(
                'rpc_command_options',
                acceptCamelCase: true,
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<RpcCommandOptions, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => RpcCommandOptions.fromJson(v),
                    ),
              )
              .toList(),
      subCommands: (json.valueAsMap<Map<dynamic, dynamic>>(
        'sub_commands',
        acceptCamelCase: true,
      )).map(
        (k, v) => MapEntry(
          JsonParser.valueAsString<String>(k),
          JsonParser.valueTo<ServiceCommandDescriptor, Map<String, dynamic>>(
            value: v,
            parse: (v) => ServiceCommandDescriptor.fromJson(v),
          ),
        ),
      ),
      enhanceCustomCommand: json.valueAsBool<bool?>(
        'enhance_custom_command',
        acceptCamelCase: true,
      ),
      short: json.valueAsString<String?>('short', acceptCamelCase: true),
    );
  }

  factory ServiceCommandDescriptor.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ServiceCommandDescriptor(
      service: decode.getString<String?>(1),
      rpcCommandOptions:
          decode
              .getListOfBytes(2)
              .map((b) => RpcCommandOptions.deserialize(b))
              .toList(),
      subCommands: decode.getMapField<String, ServiceCommandDescriptor>(
        fieldNumber: 3,
        keyMapper: (v) => JsonParser.valueAs<String>(v),
        valueMapper:
            (v) => ServiceCommandDescriptor.deserialize(
              JsonParser.valueAsBytes<List<int>>(v),
            ),
      ),
      enhanceCustomCommand: decode.getBool<bool?>(4),
      short: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAutocliV1ServiceCommandDescriptor;
}

/// RpcCommandOptions specifies options for commands generated from protobuf
/// rpc methods.
class RpcCommandOptions extends CosmosProtoMessage {
  /// rpc_method is short name of the protobuf rpc method that this command is
  /// generated from.
  final String? rpcMethod;

  /// use is the one-line usage method. It also allows specifying an alternate
  /// name for the command as the first word of the usage text.
  ///
  /// By default the name of an rpc command is the kebab-case short name of the
  /// rpc method.
  final String? use;

  /// long is the long message shown in the 'help &lt;this-command&gt;' output.
  final String? long;

  /// short is the short description shown in the 'help' output.
  final String? short;

  /// example is examples of how to use the command.
  final String? example;

  /// alias is an array of aliases that can be used instead of the first word in Use.
  final List<String> alias;

  /// suggest_for is an array of command names for which this command will be suggested -
  /// similar to aliases but only suggests.
  final List<String> suggestFor;

  /// deprecated defines, if this command is deprecated and should print this string when used.
  final String? deprecated;

  /// version defines the version for this command. If this value is non-empty and the command does not
  /// define a "version" flag, a "version" boolean flag will be added to the command and, if specified,
  /// will print content of the "Version" variable. A shorthand "v" flag will also be added if the
  /// command does not define one.
  final String? version;

  /// flag_options are options for flags generated from rpc request fields.
  /// By default all request fields are configured as flags. They can
  /// also be configured as positional args instead using positional_args.
  final Map<String, FlagOptions> flagOptions;

  /// positional_args specifies positional arguments for the command.
  final List<PositionalArgDescriptor> positionalArgs;

  /// skip specifies whether to skip this rpc method when generating commands.
  final bool? skip;

  /// gov_proposal specifies whether autocli should generate a gov proposal transaction for this rpc method.
  /// Normally autocli generates a transaction containing the message and broadcast it.
  /// However, when true, autocli generates a proposal transaction containing the message and broadcast it.
  /// This option is ineffective for query commands.
  final bool? govProposal;

  const RpcCommandOptions({
    this.rpcMethod,
    this.use,
    this.long,
    this.short,
    this.example,
    this.alias = const [],
    this.suggestFor = const [],
    this.deprecated,
    this.version,
    this.flagOptions = const {},
    this.positionalArgs = const [],
    this.skip,
    this.govProposal,
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
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 7,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.string(8),
        ProtoFieldConfig.string(9),
        ProtoFieldConfig.map(
          fieldNumber: 10,
          keyType: ProtoFieldType.string,
          valueType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 11,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.bool(12),
        ProtoFieldConfig.bool(
          13,
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "client/v2 v2.0.0-beta.2",
            ),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    rpcMethod,
    use,
    long,
    short,
    example,
    alias,
    suggestFor,
    deprecated,
    version,
    flagOptions,
    positionalArgs,
    skip,
    govProposal,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'rpc_method': rpcMethod,
      'use': use,
      'long': long,
      'short': short,
      'example': example,
      'alias': alias.map((e) => e).toList(),
      'suggest_for': suggestFor.map((e) => e).toList(),
      'deprecated': deprecated,
      'version': version,
      'flag_options': flagOptions.map((k, v) => MapEntry(k, v.toJson())),
      'positional_args': positionalArgs.map((e) => e.toJson()).toList(),
      'skip': skip,
      'gov_proposal': govProposal,
    };
  }

  factory RpcCommandOptions.fromJson(Map<String, dynamic> json) {
    return RpcCommandOptions(
      rpcMethod: json.valueAsString<String?>(
        'rpc_method',
        acceptCamelCase: true,
      ),
      use: json.valueAsString<String?>('use', acceptCamelCase: true),
      long: json.valueAsString<String?>('long', acceptCamelCase: true),
      short: json.valueAsString<String?>('short', acceptCamelCase: true),
      example: json.valueAsString<String?>('example', acceptCamelCase: true),
      alias:
          (json.valueEnsureAsList<dynamic>(
            'alias',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      suggestFor:
          (json.valueEnsureAsList<dynamic>(
            'suggest_for',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      deprecated: json.valueAsString<String?>(
        'deprecated',
        acceptCamelCase: true,
      ),
      version: json.valueAsString<String?>('version', acceptCamelCase: true),
      flagOptions: (json.valueAsMap<Map<dynamic, dynamic>>(
        'flag_options',
        acceptCamelCase: true,
      )).map(
        (k, v) => MapEntry(
          JsonParser.valueAsString<String>(k),
          JsonParser.valueTo<FlagOptions, Map<String, dynamic>>(
            value: v,
            parse: (v) => FlagOptions.fromJson(v),
          ),
        ),
      ),
      positionalArgs:
          (json.valueEnsureAsList<dynamic>(
                'positional_args',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  PositionalArgDescriptor,
                  Map<String, dynamic>
                >(value: e, parse: (v) => PositionalArgDescriptor.fromJson(v)),
              )
              .toList(),
      skip: json.valueAsBool<bool?>('skip', acceptCamelCase: true),
      govProposal: json.valueAsBool<bool?>(
        'gov_proposal',
        acceptCamelCase: true,
      ),
    );
  }

  factory RpcCommandOptions.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RpcCommandOptions(
      rpcMethod: decode.getString<String?>(1),
      use: decode.getString<String?>(2),
      long: decode.getString<String?>(3),
      short: decode.getString<String?>(4),
      example: decode.getString<String?>(5),
      alias: decode.getListOrEmpty<String>(6),
      suggestFor: decode.getListOrEmpty<String>(7),
      deprecated: decode.getString<String?>(8),
      version: decode.getString<String?>(9),
      flagOptions: decode.getMapField<String, FlagOptions>(
        fieldNumber: 10,
        keyMapper: (v) => JsonParser.valueAs<String>(v),
        valueMapper:
            (v) =>
                FlagOptions.deserialize(JsonParser.valueAsBytes<List<int>>(v)),
      ),
      positionalArgs:
          decode
              .getListOfBytes(11)
              .map((b) => PositionalArgDescriptor.deserialize(b))
              .toList(),
      skip: decode.getBool<bool?>(12),
      govProposal: decode.getBool<bool?>(13),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAutocliV1RpcCommandOptions;
}

/// FlagOptions are options for flags generated from rpc request fields.
/// By default, all request fields are configured as flags based on the
/// kebab-case name of the field. Fields can be turned into positional arguments
/// instead by using RpcCommandOptions.positional_args.
class FlagOptions extends CosmosProtoMessage {
  /// name is an alternate name to use for the field flag.
  final String? name;

  /// shorthand is a one-letter abbreviated flag.
  final String? shorthand;

  /// usage is the help message.
  final String? usage;

  /// default_value is the default value as text.
  final String? defaultValue;

  /// deprecated is the usage text to show if this flag is deprecated.
  final String? deprecated;

  /// shorthand_deprecated is the usage text to show if the shorthand of this flag is deprecated.
  final String? shorthandDeprecated;

  /// hidden hides the flag from help/usage text
  final bool? hidden;

  const FlagOptions({
    this.name,
    this.shorthand,
    this.usage,
    this.defaultValue,
    this.deprecated,
    this.shorthandDeprecated,
    this.hidden,
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
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(6),
        ProtoFieldConfig.string(7),
        ProtoFieldConfig.bool(8),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    name,
    shorthand,
    usage,
    defaultValue,
    deprecated,
    shorthandDeprecated,
    hidden,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'shorthand': shorthand,
      'usage': usage,
      'default_value': defaultValue,
      'deprecated': deprecated,
      'shorthand_deprecated': shorthandDeprecated,
      'hidden': hidden,
    };
  }

  factory FlagOptions.fromJson(Map<String, dynamic> json) {
    return FlagOptions(
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
      shorthand: json.valueAsString<String?>(
        'shorthand',
        acceptCamelCase: true,
      ),
      usage: json.valueAsString<String?>('usage', acceptCamelCase: true),
      defaultValue: json.valueAsString<String?>(
        'default_value',
        acceptCamelCase: true,
      ),
      deprecated: json.valueAsString<String?>(
        'deprecated',
        acceptCamelCase: true,
      ),
      shorthandDeprecated: json.valueAsString<String?>(
        'shorthand_deprecated',
        acceptCamelCase: true,
      ),
      hidden: json.valueAsBool<bool?>('hidden', acceptCamelCase: true),
    );
  }

  factory FlagOptions.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return FlagOptions(
      name: decode.getString<String?>(1),
      shorthand: decode.getString<String?>(2),
      usage: decode.getString<String?>(3),
      defaultValue: decode.getString<String?>(4),
      deprecated: decode.getString<String?>(6),
      shorthandDeprecated: decode.getString<String?>(7),
      hidden: decode.getBool<bool?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAutocliV1FlagOptions;
}

/// PositionalArgDescriptor describes a positional argument.
class PositionalArgDescriptor extends CosmosProtoMessage {
  /// proto_field specifies the proto field to use as the positional arg. Any
  /// fields used as positional args will not have a flag generated.
  final String? protoField;

  /// varargs makes a positional parameter a varargs parameter. This can only be
  /// applied to last positional parameter and the proto_field must a repeated
  /// field. Note: It is mutually exclusive with optional.
  final bool? varargs;

  /// optional makes the last positional parameter optional.
  /// Note: It is mutually exclusive with varargs.
  final bool? optional;

  const PositionalArgDescriptor({this.protoField, this.varargs, this.optional});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.bool(2),
        ProtoFieldConfig.bool(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [protoField, varargs, optional];

  @override
  Map<String, dynamic> toJson() {
    return {
      'proto_field': protoField,
      'varargs': varargs,
      'optional': optional,
    };
  }

  factory PositionalArgDescriptor.fromJson(Map<String, dynamic> json) {
    return PositionalArgDescriptor(
      protoField: json.valueAsString<String?>(
        'proto_field',
        acceptCamelCase: true,
      ),
      varargs: json.valueAsBool<bool?>('varargs', acceptCamelCase: true),
      optional: json.valueAsBool<bool?>('optional', acceptCamelCase: true),
    );
  }

  factory PositionalArgDescriptor.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PositionalArgDescriptor(
      protoField: decode.getString<String?>(1),
      varargs: decode.getBool<bool?>(2),
      optional: decode.getBool<bool?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAutocliV1PositionalArgDescriptor;
}
