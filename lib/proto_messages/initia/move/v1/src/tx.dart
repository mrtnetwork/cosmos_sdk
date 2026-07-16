import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/initia/move/v1/src/types.dart"
    as initia_move_v1_types;

/// MsgPublish is the message to store compiled Move module
class MsgPublish extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgPublishResponse>,
        ICosmosProtoAminoMessage {
  /// Sender is the that actor that signed the messages
  final String? sender;

  /// CodeBytes is raw move module bytes code
  final List<List<int>> codeBytes;

  /// UpgradePolicy defines upgrade rules which will be applied
  /// at next publish message.
  /// Upgrades in the direction of enhancing security are permitted.
  /// `ARBITRARY` =&gt; `COMPATIBLE`
  /// `ARBITRARY` =&gt; `IMMUTABLE`
  /// `COMPATIBLE` =&gt; `IMMUTABLE`
  /// but reverse ways are not allowed (ignored).
  final initia_move_v1_types.UpgradePolicy? upgradePolicy;

  const MsgPublish({
    this.sender,
    this.codeBytes = const [],
    this.upgradePolicy,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
        ProtoOptionString(name: "amino.name", value: "move/MsgPublish"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.bytes,
        ),
        ProtoFieldConfig.enumType(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, codeBytes, upgradePolicy];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'code_bytes':
          codeBytes
              .map(
                (e) => StringUtils.decode(e, encoding: StringEncoding.base64),
              )
              .toList(),
      'upgrade_policy': upgradePolicy?.protoName,
    };
  }

  factory MsgPublish.fromJson(Map<String, dynamic> json) {
    return MsgPublish(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      codeBytes:
          (json.valueEnsureAsList<dynamic>('code_bytes', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueAsBytes<List<int>>(
                  e,
                  encoding: StringEncoding.base64,
                ),
              )
              .toList(),
      upgradePolicy: json.valueTo<initia_move_v1_types.UpgradePolicy?, Object?>(
        key: 'upgrade_policy',
        parse: (v) => initia_move_v1_types.UpgradePolicy.from(v),
      ),
    );
  }

  factory MsgPublish.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgPublish(
      sender: decode.getString<String?>(1),
      codeBytes: decode.getListOfBytes(2),
      upgradePolicy: decode.getEnum<initia_move_v1_types.UpgradePolicy?>(
        3,
        initia_move_v1_types.UpgradePolicy.values,
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1MsgPublish;
  @override
  MsgPublishResponse onServiceResponse(List<int> bytes) {
    return MsgPublishResponse.deserialize(bytes);
  }

  @override
  MsgPublishResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgPublishResponse.fromJson(json);
  }
}

/// MsgPublishResponse returns store result data.
class MsgPublishResponse extends CosmosProtoMessage {
  const MsgPublishResponse();

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

  factory MsgPublishResponse.fromJson(Map<String, dynamic> json) {
    return MsgPublishResponse();
  }

  factory MsgPublishResponse.deserialize(List<int> bytes) {
    return MsgPublishResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1MsgPublishResponse;
}

/// MsgExecute is the message to execute the given module function
class MsgExecute extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgExecuteResponse>,
        ICosmosProtoAminoMessage {
  /// Sender is the that actor that signed the messages
  final String? sender;

  /// ModuleAddr is the address of the module deployer
  final String? moduleAddress;

  /// ModuleName is the name of module to execute
  final String? moduleName;

  /// FunctionName is the name of a function to execute
  final String? functionName;

  /// TypeArgs is the type arguments of a function to execute
  /// ex) "0x1::BasicCoin::Initia", "bool", "u8", "u64"
  final List<String> typeArgs;

  /// Args is the arguments of a function to execute
  /// - number: little endian
  /// - string: base64 bytes
  final List<List<int>> args;

  const MsgExecute({
    this.sender,
    this.moduleAddress,
    this.moduleName,
    this.functionName,
    this.typeArgs = const [],
    this.args = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
        ProtoOptionString(name: "amino.name", value: "move/MsgExecute"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.bytes,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    moduleAddress,
    moduleName,
    functionName,
    typeArgs,
    args,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'module_address': moduleAddress,
      'module_name': moduleName,
      'function_name': functionName,
      'type_args': typeArgs.map((e) => e).toList(),
      'args':
          args
              .map(
                (e) => StringUtils.decode(e, encoding: StringEncoding.base64),
              )
              .toList(),
    };
  }

  factory MsgExecute.fromJson(Map<String, dynamic> json) {
    return MsgExecute(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      moduleAddress: json.valueAsString<String?>(
        'module_address',
        acceptCamelCase: true,
      ),
      moduleName: json.valueAsString<String?>(
        'module_name',
        acceptCamelCase: true,
      ),
      functionName: json.valueAsString<String?>(
        'function_name',
        acceptCamelCase: true,
      ),
      typeArgs:
          (json.valueEnsureAsList<dynamic>(
            'type_args',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      args:
          (json.valueEnsureAsList<dynamic>('args', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueAsBytes<List<int>>(
                  e,
                  encoding: StringEncoding.base64,
                ),
              )
              .toList(),
    );
  }

  factory MsgExecute.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgExecute(
      sender: decode.getString<String?>(1),
      moduleAddress: decode.getString<String?>(2),
      moduleName: decode.getString<String?>(3),
      functionName: decode.getString<String?>(4),
      typeArgs: decode.getListOrEmpty<String>(5),
      args: decode.getListOfBytes(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1MsgExecute;
  @override
  MsgExecuteResponse onServiceResponse(List<int> bytes) {
    return MsgExecuteResponse.deserialize(bytes);
  }

  @override
  MsgExecuteResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgExecuteResponse.fromJson(json);
  }
}

/// MsgExecuteResponse returns execution result data.
class MsgExecuteResponse extends CosmosProtoMessage {
  const MsgExecuteResponse();

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

  factory MsgExecuteResponse.fromJson(Map<String, dynamic> json) {
    return MsgExecuteResponse();
  }

  factory MsgExecuteResponse.deserialize(List<int> bytes) {
    return MsgExecuteResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1MsgExecuteResponse;
}

/// MsgExecuteJSON is the message to execute the given module function
class MsgExecuteJSON extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgExecuteJSONResponse>,
        ICosmosProtoAminoMessage {
  /// Sender is the that actor that signed the messages
  final String? sender;

  /// ModuleAddr is the address of the module deployer
  final String? moduleAddress;

  /// ModuleName is the name of module to execute
  final String? moduleName;

  /// FunctionName is the name of a function to execute
  final String? functionName;

  /// TypeArgs is the type arguments of a function to execute
  /// ex) "0x1::BasicCoin::Initia", "bool", "u8", "u64"
  final List<String> typeArgs;

  /// Args is the arguments of a function to execute in json stringify format
  final List<String> args;

  const MsgExecuteJSON({
    this.sender,
    this.moduleAddress,
    this.moduleName,
    this.functionName,
    this.typeArgs = const [],
    this.args = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
        ProtoOptionString(name: "amino.name", value: "move/MsgExecuteJSON"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    moduleAddress,
    moduleName,
    functionName,
    typeArgs,
    args,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'module_address': moduleAddress,
      'module_name': moduleName,
      'function_name': functionName,
      'type_args': typeArgs.map((e) => e).toList(),
      'args': args.map((e) => e).toList(),
    };
  }

  factory MsgExecuteJSON.fromJson(Map<String, dynamic> json) {
    return MsgExecuteJSON(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      moduleAddress: json.valueAsString<String?>(
        'module_address',
        acceptCamelCase: true,
      ),
      moduleName: json.valueAsString<String?>(
        'module_name',
        acceptCamelCase: true,
      ),
      functionName: json.valueAsString<String?>(
        'function_name',
        acceptCamelCase: true,
      ),
      typeArgs:
          (json.valueEnsureAsList<dynamic>(
            'type_args',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      args:
          (json.valueEnsureAsList<dynamic>(
            'args',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory MsgExecuteJSON.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgExecuteJSON(
      sender: decode.getString<String?>(1),
      moduleAddress: decode.getString<String?>(2),
      moduleName: decode.getString<String?>(3),
      functionName: decode.getString<String?>(4),
      typeArgs: decode.getListOrEmpty<String>(5),
      args: decode.getListOrEmpty<String>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1MsgExecuteJSON;
  @override
  MsgExecuteJSONResponse onServiceResponse(List<int> bytes) {
    return MsgExecuteJSONResponse.deserialize(bytes);
  }

  @override
  MsgExecuteJSONResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgExecuteJSONResponse.fromJson(json);
  }
}

/// MsgExecuteJSONResponse returns execution result data.
class MsgExecuteJSONResponse extends CosmosProtoMessage {
  const MsgExecuteJSONResponse();

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

  factory MsgExecuteJSONResponse.fromJson(Map<String, dynamic> json) {
    return MsgExecuteJSONResponse();
  }

  factory MsgExecuteJSONResponse.deserialize(List<int> bytes) {
    return MsgExecuteJSONResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1MsgExecuteJSONResponse;
}

/// MsgScript is the message to execute script code with sender as signer
class MsgScript extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgScriptResponse>,
        ICosmosProtoAminoMessage {
  /// Sender is the that actor that signed the messages
  final String? sender;

  /// CodeBytes is the script bytes code to execute
  final List<int>? codeBytes;

  /// TypeArgs is the type arguments of a function to execute
  /// ex) "0x1::BasicCoin::Initia", "bool", "u8", "u64"
  final List<String> typeArgs;

  /// Args is the arguments of a function to execute
  /// - number: little endian
  /// - string: base64 bytes
  final List<List<int>> args;

  const MsgScript({
    this.sender,
    this.codeBytes,
    this.typeArgs = const [],
    this.args = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
        ProtoOptionString(name: "amino.name", value: "move/MsgScript"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.bytes,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, codeBytes, typeArgs, args];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'code_bytes': switch (codeBytes) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'type_args': typeArgs.map((e) => e).toList(),
      'args':
          args
              .map(
                (e) => StringUtils.decode(e, encoding: StringEncoding.base64),
              )
              .toList(),
    };
  }

  factory MsgScript.fromJson(Map<String, dynamic> json) {
    return MsgScript(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      codeBytes: json.valueAsBytes<List<int>?>(
        'code_bytes',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      typeArgs:
          (json.valueEnsureAsList<dynamic>(
            'type_args',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      args:
          (json.valueEnsureAsList<dynamic>('args', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueAsBytes<List<int>>(
                  e,
                  encoding: StringEncoding.base64,
                ),
              )
              .toList(),
    );
  }

  factory MsgScript.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgScript(
      sender: decode.getString<String?>(1),
      codeBytes: decode.getBytes<List<int>?>(2),
      typeArgs: decode.getListOrEmpty<String>(3),
      args: decode.getListOfBytes(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1MsgScript;
  @override
  MsgScriptResponse onServiceResponse(List<int> bytes) {
    return MsgScriptResponse.deserialize(bytes);
  }

  @override
  MsgScriptResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgScriptResponse.fromJson(json);
  }
}

/// MsgScriptResponse returns execution result data.
class MsgScriptResponse extends CosmosProtoMessage {
  const MsgScriptResponse();

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

  factory MsgScriptResponse.fromJson(Map<String, dynamic> json) {
    return MsgScriptResponse();
  }

  factory MsgScriptResponse.deserialize(List<int> bytes) {
    return MsgScriptResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1MsgScriptResponse;
}

/// MsgScriptJSON is the message to execute script code with sender as signer
class MsgScriptJSON extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgScriptJSONResponse>,
        ICosmosProtoAminoMessage {
  /// Sender is the that actor that signed the messages
  final String? sender;

  /// CodeBytes is the script bytes code to execute
  final List<int>? codeBytes;

  /// TypeArgs is the type arguments of a function to execute
  /// ex) "0x1::BasicCoin::Initia", "bool", "u8", "u64"
  final List<String> typeArgs;

  /// Args is the arguments of a function to execute in json stringify format
  final List<String> args;

  const MsgScriptJSON({
    this.sender,
    this.codeBytes,
    this.typeArgs = const [],
    this.args = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
        ProtoOptionString(name: "amino.name", value: "move/MsgScriptJSON"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, codeBytes, typeArgs, args];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'code_bytes': switch (codeBytes) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'type_args': typeArgs.map((e) => e).toList(),
      'args': args.map((e) => e).toList(),
    };
  }

  factory MsgScriptJSON.fromJson(Map<String, dynamic> json) {
    return MsgScriptJSON(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      codeBytes: json.valueAsBytes<List<int>?>(
        'code_bytes',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      typeArgs:
          (json.valueEnsureAsList<dynamic>(
            'type_args',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      args:
          (json.valueEnsureAsList<dynamic>(
            'args',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory MsgScriptJSON.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgScriptJSON(
      sender: decode.getString<String?>(1),
      codeBytes: decode.getBytes<List<int>?>(2),
      typeArgs: decode.getListOrEmpty<String>(3),
      args: decode.getListOrEmpty<String>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1MsgScriptJSON;
  @override
  MsgScriptJSONResponse onServiceResponse(List<int> bytes) {
    return MsgScriptJSONResponse.deserialize(bytes);
  }

  @override
  MsgScriptJSONResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgScriptJSONResponse.fromJson(json);
  }
}

/// MsgScriptJSONResponse returns execution result data.
class MsgScriptJSONResponse extends CosmosProtoMessage {
  const MsgScriptJSONResponse();

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

  factory MsgScriptJSONResponse.fromJson(Map<String, dynamic> json) {
    return MsgScriptJSONResponse();
  }

  factory MsgScriptJSONResponse.deserialize(List<int> bytes) {
    return MsgScriptJSONResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1MsgScriptJSONResponse;
}

/// //////////////////
/// / Gov Messages ///
/// //////////////////
/// MsgGovPublish is the message to store compiled Move module via gov proposal
class MsgGovPublish extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgGovPublishResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module
  /// (defaults to x/gov unless overwritten).
  final String? authority;

  /// Sender is the that actor that signed the messages
  final String? sender;

  /// CodeBytes is raw move module bytes code
  final List<List<int>> codeBytes;

  /// UpgradePolicy defines upgrade rules which will be applied
  /// at next publish message.
  /// Upgrades in the direction of enhancing security are permitted.
  /// `ARBITRARY` =&gt; `COMPATIBLE`
  /// `ARBITRARY` =&gt; `IMMUTABLE`
  /// `COMPATIBLE` =&gt; `IMMUTABLE`
  /// but reverse ways are not allowed (ignored).
  final initia_move_v1_types.UpgradePolicy? upgradePolicy;

  const MsgGovPublish({
    this.authority,
    this.sender,
    this.codeBytes = const [],
    this.upgradePolicy,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(name: "amino.name", value: "move/MsgGovPublish"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.bytes,
        ),
        ProtoFieldConfig.enumType(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    authority,
    sender,
    codeBytes,
    upgradePolicy,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'sender': sender,
      'code_bytes':
          codeBytes
              .map(
                (e) => StringUtils.decode(e, encoding: StringEncoding.base64),
              )
              .toList(),
      'upgrade_policy': upgradePolicy?.protoName,
    };
  }

  factory MsgGovPublish.fromJson(Map<String, dynamic> json) {
    return MsgGovPublish(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      codeBytes:
          (json.valueEnsureAsList<dynamic>('code_bytes', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueAsBytes<List<int>>(
                  e,
                  encoding: StringEncoding.base64,
                ),
              )
              .toList(),
      upgradePolicy: json.valueTo<initia_move_v1_types.UpgradePolicy?, Object?>(
        key: 'upgrade_policy',
        parse: (v) => initia_move_v1_types.UpgradePolicy.from(v),
      ),
    );
  }

  factory MsgGovPublish.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgGovPublish(
      authority: decode.getString<String?>(1),
      sender: decode.getString<String?>(2),
      codeBytes: decode.getListOfBytes(3),
      upgradePolicy: decode.getEnum<initia_move_v1_types.UpgradePolicy?>(
        4,
        initia_move_v1_types.UpgradePolicy.values,
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1MsgGovPublish;
  @override
  MsgGovPublishResponse onServiceResponse(List<int> bytes) {
    return MsgGovPublishResponse.deserialize(bytes);
  }

  @override
  MsgGovPublishResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgGovPublishResponse.fromJson(json);
  }
}

/// MsgGovPublishResponse returns execution result data.
class MsgGovPublishResponse extends CosmosProtoMessage {
  const MsgGovPublishResponse();

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

  factory MsgGovPublishResponse.fromJson(Map<String, dynamic> json) {
    return MsgGovPublishResponse();
  }

  factory MsgGovPublishResponse.deserialize(List<int> bytes) {
    return MsgGovPublishResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1MsgGovPublishResponse;
}

/// MsgGovExecute is the message to execute the given module
/// function via gov proposal
class MsgGovExecute extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgGovExecuteResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module
  /// (defaults to x/gov unless overwritten).
  final String? authority;

  /// Sender is the that actor that signed the messages
  final String? sender;

  /// ModuleAddr is the address of the module deployer
  final String? moduleAddress;

  /// ModuleName is the name of module to execute
  final String? moduleName;

  /// FunctionName is the name of a function to execute
  final String? functionName;

  /// TypeArgs is the type arguments of a function to execute
  /// ex) "0x1::BasicCoin::Initia", "bool", "u8", "u64"
  final List<String> typeArgs;

  /// Args is the arguments of a function to execute
  /// - number: little endian
  /// - string: base64 bytes
  final List<List<int>> args;

  const MsgGovExecute({
    this.authority,
    this.sender,
    this.moduleAddress,
    this.moduleName,
    this.functionName,
    this.typeArgs = const [],
    this.args = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(name: "amino.name", value: "move/MsgGovExecute"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 7,
          elementType: ProtoFieldType.bytes,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    authority,
    sender,
    moduleAddress,
    moduleName,
    functionName,
    typeArgs,
    args,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'sender': sender,
      'module_address': moduleAddress,
      'module_name': moduleName,
      'function_name': functionName,
      'type_args': typeArgs.map((e) => e).toList(),
      'args':
          args
              .map(
                (e) => StringUtils.decode(e, encoding: StringEncoding.base64),
              )
              .toList(),
    };
  }

  factory MsgGovExecute.fromJson(Map<String, dynamic> json) {
    return MsgGovExecute(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      moduleAddress: json.valueAsString<String?>(
        'module_address',
        acceptCamelCase: true,
      ),
      moduleName: json.valueAsString<String?>(
        'module_name',
        acceptCamelCase: true,
      ),
      functionName: json.valueAsString<String?>(
        'function_name',
        acceptCamelCase: true,
      ),
      typeArgs:
          (json.valueEnsureAsList<dynamic>(
            'type_args',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      args:
          (json.valueEnsureAsList<dynamic>('args', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueAsBytes<List<int>>(
                  e,
                  encoding: StringEncoding.base64,
                ),
              )
              .toList(),
    );
  }

  factory MsgGovExecute.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgGovExecute(
      authority: decode.getString<String?>(1),
      sender: decode.getString<String?>(2),
      moduleAddress: decode.getString<String?>(3),
      moduleName: decode.getString<String?>(4),
      functionName: decode.getString<String?>(5),
      typeArgs: decode.getListOrEmpty<String>(6),
      args: decode.getListOfBytes(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1MsgGovExecute;
  @override
  MsgGovExecuteResponse onServiceResponse(List<int> bytes) {
    return MsgGovExecuteResponse.deserialize(bytes);
  }

  @override
  MsgGovExecuteResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgGovExecuteResponse.fromJson(json);
  }
}

/// MsgGovExecuteResponse returns execution result data.
class MsgGovExecuteResponse extends CosmosProtoMessage {
  const MsgGovExecuteResponse();

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

  factory MsgGovExecuteResponse.fromJson(Map<String, dynamic> json) {
    return MsgGovExecuteResponse();
  }

  factory MsgGovExecuteResponse.deserialize(List<int> bytes) {
    return MsgGovExecuteResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1MsgGovExecuteResponse;
}

/// MsgGovExecuteJSON is the message to execute the given module
/// function via gov proposal
class MsgGovExecuteJSON extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgGovExecuteJSONResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module
  /// (defaults to x/gov unless overwritten).
  final String? authority;

  /// Sender is the that actor that signed the messages
  final String? sender;

  /// ModuleAddr is the address of the module deployer
  final String? moduleAddress;

  /// ModuleName is the name of module to execute
  final String? moduleName;

  /// FunctionName is the name of a function to execute
  final String? functionName;

  /// TypeArgs is the type arguments of a function to execute
  /// ex) "0x1::BasicCoin::Initia", "bool", "u8", "u64"
  final List<String> typeArgs;

  /// Args is the arguments of a function to execute in json stringify format
  final List<String> args;

  const MsgGovExecuteJSON({
    this.authority,
    this.sender,
    this.moduleAddress,
    this.moduleName,
    this.functionName,
    this.typeArgs = const [],
    this.args = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(name: "amino.name", value: "move/MsgGovExecuteJSON"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    authority,
    sender,
    moduleAddress,
    moduleName,
    functionName,
    typeArgs,
    args,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'sender': sender,
      'module_address': moduleAddress,
      'module_name': moduleName,
      'function_name': functionName,
      'type_args': typeArgs.map((e) => e).toList(),
      'args': args.map((e) => e).toList(),
    };
  }

  factory MsgGovExecuteJSON.fromJson(Map<String, dynamic> json) {
    return MsgGovExecuteJSON(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      moduleAddress: json.valueAsString<String?>(
        'module_address',
        acceptCamelCase: true,
      ),
      moduleName: json.valueAsString<String?>(
        'module_name',
        acceptCamelCase: true,
      ),
      functionName: json.valueAsString<String?>(
        'function_name',
        acceptCamelCase: true,
      ),
      typeArgs:
          (json.valueEnsureAsList<dynamic>(
            'type_args',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      args:
          (json.valueEnsureAsList<dynamic>(
            'args',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory MsgGovExecuteJSON.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgGovExecuteJSON(
      authority: decode.getString<String?>(1),
      sender: decode.getString<String?>(2),
      moduleAddress: decode.getString<String?>(3),
      moduleName: decode.getString<String?>(4),
      functionName: decode.getString<String?>(5),
      typeArgs: decode.getListOrEmpty<String>(6),
      args: decode.getListOrEmpty<String>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1MsgGovExecuteJSON;
  @override
  MsgGovExecuteJSONResponse onServiceResponse(List<int> bytes) {
    return MsgGovExecuteJSONResponse.deserialize(bytes);
  }

  @override
  MsgGovExecuteJSONResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgGovExecuteJSONResponse.fromJson(json);
  }
}

/// MsgGovExecuteJSONResponse returns execution result data.
class MsgGovExecuteJSONResponse extends CosmosProtoMessage {
  const MsgGovExecuteJSONResponse();

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

  factory MsgGovExecuteJSONResponse.fromJson(Map<String, dynamic> json) {
    return MsgGovExecuteJSONResponse();
  }

  factory MsgGovExecuteJSONResponse.deserialize(List<int> bytes) {
    return MsgGovExecuteJSONResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1MsgGovExecuteJSONResponse;
}

/// MsgGovScript is the message to execute script code with sender as signer via gov
class MsgGovScript extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgGovScriptResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module
  /// (defaults to x/gov unless overwritten).
  final String? authority;

  /// Sender is the that actor that signed the messages
  final String? sender;

  /// CodeBytes is the script bytes code to execute
  final List<int>? codeBytes;

  /// TypeArgs is the type arguments of a function to execute
  /// ex) "0x1::BasicCoin::Initia", "bool", "u8", "u64"
  final List<String> typeArgs;

  /// Args is the arguments of a function to execute
  /// - number: little endian
  /// - string: base64 bytes
  final List<List<int>> args;

  const MsgGovScript({
    this.authority,
    this.sender,
    this.codeBytes,
    this.typeArgs = const [],
    this.args = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(name: "amino.name", value: "move/MsgGovScript"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.bytes(3),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.bytes,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    authority,
    sender,
    codeBytes,
    typeArgs,
    args,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'sender': sender,
      'code_bytes': switch (codeBytes) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'type_args': typeArgs.map((e) => e).toList(),
      'args':
          args
              .map(
                (e) => StringUtils.decode(e, encoding: StringEncoding.base64),
              )
              .toList(),
    };
  }

  factory MsgGovScript.fromJson(Map<String, dynamic> json) {
    return MsgGovScript(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      codeBytes: json.valueAsBytes<List<int>?>(
        'code_bytes',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      typeArgs:
          (json.valueEnsureAsList<dynamic>(
            'type_args',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      args:
          (json.valueEnsureAsList<dynamic>('args', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueAsBytes<List<int>>(
                  e,
                  encoding: StringEncoding.base64,
                ),
              )
              .toList(),
    );
  }

  factory MsgGovScript.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgGovScript(
      authority: decode.getString<String?>(1),
      sender: decode.getString<String?>(2),
      codeBytes: decode.getBytes<List<int>?>(3),
      typeArgs: decode.getListOrEmpty<String>(4),
      args: decode.getListOfBytes(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1MsgGovScript;
  @override
  MsgGovScriptResponse onServiceResponse(List<int> bytes) {
    return MsgGovScriptResponse.deserialize(bytes);
  }

  @override
  MsgGovScriptResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgGovScriptResponse.fromJson(json);
  }
}

/// MsgGovScriptResponse returns execution result data.
class MsgGovScriptResponse extends CosmosProtoMessage {
  const MsgGovScriptResponse();

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

  factory MsgGovScriptResponse.fromJson(Map<String, dynamic> json) {
    return MsgGovScriptResponse();
  }

  factory MsgGovScriptResponse.deserialize(List<int> bytes) {
    return MsgGovScriptResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1MsgGovScriptResponse;
}

/// MsgGovScriptJSON is the message to execute script code with sender as signer via gov
class MsgGovScriptJSON extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgGovScriptJSONResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module
  /// (defaults to x/gov unless overwritten).
  final String? authority;

  /// Sender is the that actor that signed the messages
  final String? sender;

  /// CodeBytes is the script bytes code to execute
  final List<int>? codeBytes;

  /// TypeArgs is the type arguments of a function to execute
  /// ex) "0x1::BasicCoin::Initia", "bool", "u8", "u64"
  final List<String> typeArgs;

  /// Args is the arguments of a function to execute in json stringify format
  final List<String> args;

  const MsgGovScriptJSON({
    this.authority,
    this.sender,
    this.codeBytes,
    this.typeArgs = const [],
    this.args = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(name: "amino.name", value: "move/MsgGovScriptJSON"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.bytes(3),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    authority,
    sender,
    codeBytes,
    typeArgs,
    args,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'sender': sender,
      'code_bytes': switch (codeBytes) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'type_args': typeArgs.map((e) => e).toList(),
      'args': args.map((e) => e).toList(),
    };
  }

  factory MsgGovScriptJSON.fromJson(Map<String, dynamic> json) {
    return MsgGovScriptJSON(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      codeBytes: json.valueAsBytes<List<int>?>(
        'code_bytes',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      typeArgs:
          (json.valueEnsureAsList<dynamic>(
            'type_args',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      args:
          (json.valueEnsureAsList<dynamic>(
            'args',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory MsgGovScriptJSON.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgGovScriptJSON(
      authority: decode.getString<String?>(1),
      sender: decode.getString<String?>(2),
      codeBytes: decode.getBytes<List<int>?>(3),
      typeArgs: decode.getListOrEmpty<String>(4),
      args: decode.getListOrEmpty<String>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1MsgGovScriptJSON;
  @override
  MsgGovScriptJSONResponse onServiceResponse(List<int> bytes) {
    return MsgGovScriptJSONResponse.deserialize(bytes);
  }

  @override
  MsgGovScriptJSONResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgGovScriptJSONResponse.fromJson(json);
  }
}

/// MsgGovScriptJSONResponse returns execution result data.
class MsgGovScriptJSONResponse extends CosmosProtoMessage {
  const MsgGovScriptJSONResponse();

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

  factory MsgGovScriptJSONResponse.fromJson(Map<String, dynamic> json) {
    return MsgGovScriptJSONResponse();
  }

  factory MsgGovScriptJSONResponse.deserialize(List<int> bytes) {
    return MsgGovScriptJSONResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1MsgGovScriptJSONResponse;
}

/// MsgWhitelistStaking registers a DEX pair in the staking whitelist.
class MsgWhitelistStaking extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgWhitelistStakingResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module
  /// (defaults to x/gov unless overwritten).
  final String? authority;

  /// MetadataLP is the LP metadata address of the DEX pair.
  final String? metadataLp;

  /// RewardWeight is applied to distribution params.
  final String? rewardWeight;

  const MsgWhitelistStaking({
    this.authority,
    this.metadataLp,
    this.rewardWeight,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "move/MsgWhitelistStaking",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(
          3,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, metadataLp, rewardWeight];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'metadata_lp': metadataLp,
      'reward_weight': rewardWeight,
    };
  }

  factory MsgWhitelistStaking.fromJson(Map<String, dynamic> json) {
    return MsgWhitelistStaking(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      metadataLp: json.valueAsString<String?>(
        'metadata_lp',
        acceptCamelCase: true,
      ),
      rewardWeight: json.valueAsString<String?>(
        'reward_weight',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgWhitelistStaking.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgWhitelistStaking(
      authority: decode.getString<String?>(1),
      metadataLp: decode.getString<String?>(2),
      rewardWeight: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1MsgWhitelistStaking;
  @override
  MsgWhitelistStakingResponse onServiceResponse(List<int> bytes) {
    return MsgWhitelistStakingResponse.deserialize(bytes);
  }

  @override
  MsgWhitelistStakingResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgWhitelistStakingResponse.fromJson(json);
  }
}

/// MsgWhitelistStakingResponse returns an empty response.
class MsgWhitelistStakingResponse extends CosmosProtoMessage {
  const MsgWhitelistStakingResponse();

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

  factory MsgWhitelistStakingResponse.fromJson(Map<String, dynamic> json) {
    return MsgWhitelistStakingResponse();
  }

  factory MsgWhitelistStakingResponse.deserialize(List<int> bytes) {
    return MsgWhitelistStakingResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1MsgWhitelistStakingResponse;
}

/// MsgWhitelistGasPrice registers a DEX pair in the gas price whitelist.
/// This allows the counterparty denom to be used as gas fee.
class MsgWhitelistGasPrice extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgWhitelistGasPriceResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module
  /// (defaults to x/gov unless overwritten).
  final String? authority;

  /// MetadataQuote is the metadata address of the token to whitelist as a gas token.
  final String? metadataQuote;

  /// MetadataLP is the LP metadata address of the DEX pair.
  final String? metadataLp;

  const MsgWhitelistGasPrice({
    this.authority,
    this.metadataQuote,
    this.metadataLp,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "move/MsgWhitelistGasPrice",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, metadataQuote, metadataLp];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'metadata_quote': metadataQuote,
      'metadata_lp': metadataLp,
    };
  }

  factory MsgWhitelistGasPrice.fromJson(Map<String, dynamic> json) {
    return MsgWhitelistGasPrice(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      metadataQuote: json.valueAsString<String?>(
        'metadata_quote',
        acceptCamelCase: true,
      ),
      metadataLp: json.valueAsString<String?>(
        'metadata_lp',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgWhitelistGasPrice.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgWhitelistGasPrice(
      authority: decode.getString<String?>(1),
      metadataQuote: decode.getString<String?>(2),
      metadataLp: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1MsgWhitelistGasPrice;
  @override
  MsgWhitelistGasPriceResponse onServiceResponse(List<int> bytes) {
    return MsgWhitelistGasPriceResponse.deserialize(bytes);
  }

  @override
  MsgWhitelistGasPriceResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgWhitelistGasPriceResponse.fromJson(json);
  }
}

/// MsgWhitelistGasPriceResponse returns an empty response.
class MsgWhitelistGasPriceResponse extends CosmosProtoMessage {
  const MsgWhitelistGasPriceResponse();

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

  factory MsgWhitelistGasPriceResponse.fromJson(Map<String, dynamic> json) {
    return MsgWhitelistGasPriceResponse();
  }

  factory MsgWhitelistGasPriceResponse.deserialize(List<int> bytes) {
    return MsgWhitelistGasPriceResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1MsgWhitelistGasPriceResponse;
}

/// MsgDelistStaking removes a DEX pair from the staking whitelist.
class MsgDelistStaking extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgDelistStakingResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module
  /// (defaults to x/gov unless overwritten).
  final String? authority;

  /// MetadataLP is the LP metadata address of the DEX pair.
  final String? metadataLp;

  const MsgDelistStaking({this.authority, this.metadataLp});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(name: "amino.name", value: "move/MsgDelistStaking"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, metadataLp];

  @override
  Map<String, dynamic> toJson() {
    return {'authority': authority, 'metadata_lp': metadataLp};
  }

  factory MsgDelistStaking.fromJson(Map<String, dynamic> json) {
    return MsgDelistStaking(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      metadataLp: json.valueAsString<String?>(
        'metadata_lp',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgDelistStaking.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgDelistStaking(
      authority: decode.getString<String?>(1),
      metadataLp: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1MsgDelistStaking;
  @override
  MsgDelistStakingResponse onServiceResponse(List<int> bytes) {
    return MsgDelistStakingResponse.deserialize(bytes);
  }

  @override
  MsgDelistStakingResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgDelistStakingResponse.fromJson(json);
  }
}

/// MsgDelistStakingResponse returns an empty response.
class MsgDelistStakingResponse extends CosmosProtoMessage {
  const MsgDelistStakingResponse();

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

  factory MsgDelistStakingResponse.fromJson(Map<String, dynamic> json) {
    return MsgDelistStakingResponse();
  }

  factory MsgDelistStakingResponse.deserialize(List<int> bytes) {
    return MsgDelistStakingResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1MsgDelistStakingResponse;
}

/// MsgDelistGasPrice removes a DEX pair from the gas price whitelist.
class MsgDelistGasPrice extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgDelistGasPriceResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module
  /// (defaults to x/gov unless overwritten).
  final String? authority;

  /// MetadataQuote is the metadata address of the token to whitelist as a gas token.
  final String? metadataQuote;

  /// MetadataLP is the LP metadata address of the DEX pair.
  final String? metadataLp;

  const MsgDelistGasPrice({
    this.authority,
    this.metadataQuote,
    this.metadataLp,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(name: "amino.name", value: "move/MsgDelistGasPrice"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, metadataQuote, metadataLp];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'metadata_quote': metadataQuote,
      'metadata_lp': metadataLp,
    };
  }

  factory MsgDelistGasPrice.fromJson(Map<String, dynamic> json) {
    return MsgDelistGasPrice(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      metadataQuote: json.valueAsString<String?>(
        'metadata_quote',
        acceptCamelCase: true,
      ),
      metadataLp: json.valueAsString<String?>(
        'metadata_lp',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgDelistGasPrice.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgDelistGasPrice(
      authority: decode.getString<String?>(1),
      metadataQuote: decode.getString<String?>(2),
      metadataLp: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1MsgDelistGasPrice;
  @override
  MsgDelistGasPriceResponse onServiceResponse(List<int> bytes) {
    return MsgDelistGasPriceResponse.deserialize(bytes);
  }

  @override
  MsgDelistGasPriceResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgDelistGasPriceResponse.fromJson(json);
  }
}

/// MsgDelistGasPriceResponse returns an empty response.
class MsgDelistGasPriceResponse extends CosmosProtoMessage {
  const MsgDelistGasPriceResponse();

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

  factory MsgDelistGasPriceResponse.fromJson(Map<String, dynamic> json) {
    return MsgDelistGasPriceResponse();
  }

  factory MsgDelistGasPriceResponse.deserialize(List<int> bytes) {
    return MsgDelistGasPriceResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1MsgDelistGasPriceResponse;
}

/// MsgUpdateParams is the Msg/UpdateParams request type.
class MsgUpdateParams extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateParamsResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module
  /// (defaults to x/gov unless overwritten).
  final String? authority;

  /// params defines the x/staking parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final initia_move_v1_types.Params? params;

  const MsgUpdateParams({this.authority, this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(name: "amino.name", value: "move/MsgUpdateParams"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(
          2,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
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
      params: json.valueTo<initia_move_v1_types.Params?, Map<String, dynamic>>(
        key: 'params',
        parse: (v) => initia_move_v1_types.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      authority: decode.getString<String?>(1),
      params: decode.messageTo<initia_move_v1_types.Params?>(
        2,
        (b) => initia_move_v1_types.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1MsgUpdateParams;
  @override
  MsgUpdateParamsResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateParamsResponse.deserialize(bytes);
  }

  @override
  MsgUpdateParamsResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateParamsResponse.fromJson(json);
  }
}

/// MsgUpdateParamsResponse defines the response structure for executing a
/// MsgUpdateParams message.
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
      DefaultCosmosProtoTypeUrl.initiaMoveV1MsgUpdateParamsResponse;
}
