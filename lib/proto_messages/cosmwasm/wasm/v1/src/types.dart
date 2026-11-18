import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;

/// AccessType permission types
enum AccessType implements ProtoEnumVariant {
  /// AccessTypeUnspecified placeholder for empty value
  accessTypeUnspecified(0, 'ACCESS_TYPE_UNSPECIFIED'),

  /// AccessTypeNobody forbidden
  accessTypeNobody(1, 'ACCESS_TYPE_NOBODY'),

  /// was AccessTypeOnlyAddress
  /// AccessTypeEverybody unrestricted
  accessTypeEverybody(3, 'ACCESS_TYPE_EVERYBODY'),

  /// AccessTypeAnyOfAddresses allow any of the addresses
  accessTypeAnyOfAddresses(4, 'ACCESS_TYPE_ANY_OF_ADDRESSES');

  const AccessType(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static AccessType fromValue(int? value) {
    value ??= 0;
    return AccessType.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching AccessType found for the given value. $value",
                details: {"name": "AccessType", "value": value?.toString()},
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static AccessType from(Object? value) {
    value ??= 0;
    return AccessType.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching AccessType found for the given value. $value",
                details: {"name": "AccessType", "value": value?.toString()},
              ),
    );
  }
}

/// ContractCodeHistoryOperationType actions that caused a code change
enum ContractCodeHistoryOperationType implements ProtoEnumVariant {
  /// ContractCodeHistoryOperationTypeUnspecified placeholder for empty value
  contractCodeHistoryOperationTypeUnspecified(
    0,
    'CONTRACT_CODE_HISTORY_OPERATION_TYPE_UNSPECIFIED',
  ),

  /// ContractCodeHistoryOperationTypeInit on chain contract instantiation
  contractCodeHistoryOperationTypeInit(
    1,
    'CONTRACT_CODE_HISTORY_OPERATION_TYPE_INIT',
  ),

  /// ContractCodeHistoryOperationTypeMigrate code migration
  contractCodeHistoryOperationTypeMigrate(
    2,
    'CONTRACT_CODE_HISTORY_OPERATION_TYPE_MIGRATE',
  ),

  /// ContractCodeHistoryOperationTypeGenesis based on genesis data
  contractCodeHistoryOperationTypeGenesis(
    3,
    'CONTRACT_CODE_HISTORY_OPERATION_TYPE_GENESIS',
  );

  const ContractCodeHistoryOperationType(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static ContractCodeHistoryOperationType fromValue(int? value) {
    value ??= 0;
    return ContractCodeHistoryOperationType.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching ContractCodeHistoryOperationType found for the given value. $value",
                details: {
                  "name": "ContractCodeHistoryOperationType",
                  "value": value?.toString(),
                },
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static ContractCodeHistoryOperationType from(Object? value) {
    value ??= 0;
    return ContractCodeHistoryOperationType.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching ContractCodeHistoryOperationType found for the given value. $value",
                details: {
                  "name": "ContractCodeHistoryOperationType",
                  "value": value?.toString(),
                },
              ),
    );
  }
}

/// AccessConfig access control type.
class AccessConfig extends CosmosProtoMessage {
  final AccessType? permission;

  /// was address
  final List<String> addresses;

  const AccessConfig({this.permission, this.addresses = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.enumType(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [permission, addresses];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'permission': config.encodeEnum(permission),
      'addresses': addresses.map((e) => e).toList(),
    };
  }

  factory AccessConfig.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return AccessConfig(
      permission: json.valueTo<AccessType?, Object?>(
        key: 'permission',
        parse: (v) => AccessType.from(v),
      ),
      addresses:
          (json.valueEnsureAsList<dynamic>(
            'addresses',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory AccessConfig.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AccessConfig(
      permission: decode.getEnum<AccessType?>(1, AccessType.values),
      addresses: decode.getListOrEmpty<String>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1AccessConfig;
}

/// Params defines the set of wasm parameters.
class Params extends CosmosProtoMessage {
  final AccessConfig? codeUploadAccess;

  final AccessType? instantiateDefaultPermission;

  const Params({this.codeUploadAccess, this.instantiateDefaultPermission});

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
        ProtoFieldConfig.enumType(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    codeUploadAccess,
    instantiateDefaultPermission,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'code_upload_access': config.encodeMessage(codeUploadAccess),
      'instantiate_default_permission': config.encodeEnum(
        instantiateDefaultPermission,
      ),
    };
  }

  factory Params.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Params(
      codeUploadAccess: json.valueTo<AccessConfig?, Object>(
        key: 'code_upload_access',
        parse:
            (v) => AccessConfig.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      instantiateDefaultPermission: json.valueTo<AccessType?, Object?>(
        key: 'instantiate_default_permission',
        parse: (v) => AccessType.from(v),
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      codeUploadAccess: decode.messageTo<AccessConfig?>(
        1,
        (b) => AccessConfig.deserialize(b),
      ),
      instantiateDefaultPermission: decode.getEnum<AccessType?>(
        2,
        AccessType.values,
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1Params;
}

/// ContractInfo stores a WASM contract instance
class ContractInfo extends CosmosProtoMessage {
  /// CodeID is the reference to the stored Wasm code
  final BigInt? codeId;

  /// Creator address who initially instantiated the contract
  final String? creator;

  /// Admin is an optional address that can execute migrations
  final String? admin;

  /// Label is optional metadata to be stored with a contract instance.
  final String? label;

  /// Created Tx position when the contract was instantiated.
  final AbsoluteTxPosition? created;

  final String? ibcPortId;

  /// Extension is an extension point to store custom metadata within the
  /// persistence model.
  final google_protobuf_any.Any? extension_;

  final String? ibc2PortId;

  const ContractInfo({
    this.codeId,
    this.creator,
    this.admin,
    this.label,
    this.created,
    this.ibcPortId,
    this.extension_,
    this.ibc2PortId,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.message(5),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.message(7, options: const []),
        ProtoFieldConfig.string(8, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    codeId,
    creator,
    admin,
    label,
    created,
    ibcPortId,
    extension_,
    ibc2PortId,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'code_id': config.encodeBigint(codeId),
      'creator': creator,
      'admin': admin,
      'label': label,
      'created': config.encodeMessage(created),
      'ibc_port_id': ibcPortId,
      'extension': config.encodeMessage(extension_),
      'ibc2_port_id': ibc2PortId,
    };
  }

  factory ContractInfo.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ContractInfo(
      codeId: json.valueAsBigInt<BigInt?>(
        'code_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      creator: json.valueAsString<String?>(
        'creator',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      admin: json.valueAsString<String?>(
        'admin',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      label: json.valueAsString<String?>(
        'label',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      created: json.valueTo<AbsoluteTxPosition?, Object>(
        key: 'created',
        parse:
            (v) => AbsoluteTxPosition.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      ibcPortId: json.valueAsString<String?>(
        'ibc_port_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      extension_: json.valueTo<google_protobuf_any.Any?, Object>(
        key: 'extension',
        parse:
            (v) => google_protobuf_any.Any.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      ibc2PortId: json.valueAsString<String?>(
        'ibc2_port_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory ContractInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ContractInfo(
      codeId: decode.getBigInt<BigInt?>(1),
      creator: decode.getString<String?>(2),
      admin: decode.getString<String?>(3),
      label: decode.getString<String?>(4),
      created: decode.messageTo<AbsoluteTxPosition?>(
        5,
        (b) => AbsoluteTxPosition.deserialize(b),
      ),
      ibcPortId: decode.getString<String?>(6),
      extension_: decode.messageTo<google_protobuf_any.Any?>(
        7,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
      ibc2PortId: decode.getString<String?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1ContractInfo;
}

/// ContractCodeHistoryEntry metadata to a contract.
class ContractCodeHistoryEntry extends CosmosProtoMessage {
  final ContractCodeHistoryOperationType? operation;

  /// CodeID is the reference to the stored WASM code
  final BigInt? codeId;

  /// Updated Tx position when the operation was executed.
  final AbsoluteTxPosition? updated;

  final BuBytes? msg;

  ContractCodeHistoryEntry({
    this.operation,
    this.codeId,
    this.updated,
    List<int>? msg,
  }) : msg = msg?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.enumType(1),
        ProtoFieldConfig.uint64(2, options: const []),
        ProtoFieldConfig.message(3),
        ProtoFieldConfig.bytes(
          4,
          options: [
            ProtoOptionString(name: "amino.encoding", value: "inline_json"),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [operation, codeId, updated, msg];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'operation': config.encodeEnum(operation),
      'code_id': config.encodeBigint(codeId),
      'updated': config.encodeMessage(updated),
      'msg': config.encodeBinary(msg),
    };
  }

  factory ContractCodeHistoryEntry.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ContractCodeHistoryEntry(
      operation: json.valueTo<ContractCodeHistoryOperationType?, Object?>(
        key: 'operation',
        parse: (v) => ContractCodeHistoryOperationType.from(v),
      ),
      codeId: json.valueAsBigInt<BigInt?>(
        'code_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      updated: json.valueTo<AbsoluteTxPosition?, Object>(
        key: 'updated',
        parse:
            (v) => AbsoluteTxPosition.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      msg: config.decodeBinary<List<int>?>(
        json.valueAs('msg', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory ContractCodeHistoryEntry.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ContractCodeHistoryEntry(
      operation: decode.getEnum<ContractCodeHistoryOperationType?>(
        1,
        ContractCodeHistoryOperationType.values,
      ),
      codeId: decode.getBigInt<BigInt?>(2),
      updated: decode.messageTo<AbsoluteTxPosition?>(
        3,
        (b) => AbsoluteTxPosition.deserialize(b),
      ),
      msg: decode.getBytes<List<int>?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1ContractCodeHistoryEntry;
}

/// AbsoluteTxPosition is a unique transaction position that allows for global
/// ordering of transactions.
class AbsoluteTxPosition extends CosmosProtoMessage {
  /// BlockHeight is the block the contract was created at
  final BigInt? blockHeight;

  /// TxIndex is a monotonic counter within the block (actual transaction index,
  /// or gas consumed)
  final BigInt? txIndex;

  const AbsoluteTxPosition({this.blockHeight, this.txIndex});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint64(1), ProtoFieldConfig.uint64(2)],
    );
  }

  @override
  List<Object?> get protoValues => [blockHeight, txIndex];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'block_height': config.encodeBigint(blockHeight),
      'tx_index': config.encodeBigint(txIndex),
    };
  }

  factory AbsoluteTxPosition.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return AbsoluteTxPosition(
      blockHeight: json.valueAsBigInt<BigInt?>(
        'block_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      txIndex: json.valueAsBigInt<BigInt?>(
        'tx_index',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory AbsoluteTxPosition.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AbsoluteTxPosition(
      blockHeight: decode.getBigInt<BigInt?>(1),
      txIndex: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1AbsoluteTxPosition;
}

/// Model is a struct that holds a KV pair
class Model extends CosmosProtoMessage {
  /// hex-encode key to read it better (this is often ascii)
  final BuBytes? key;

  /// base64-encode raw value
  final BuBytes? value;

  Model({List<int>? key, List<int>? value})
    : key = key?.asImmutableBytes,
      value = value?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bytes(1, options: const []),
        ProtoFieldConfig.bytes(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [key, value];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'key': config.encodeBinary(key),
      'value': config.encodeBinary(value),
    };
  }

  factory Model.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Model(
      key: config.decodeBinary<List<int>?>(
        json.valueAs('key', normalizeKeyLookup: config.normalizeKeys),
      ),
      value: config.decodeBinary<List<int>?>(
        json.valueAs('value', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory Model.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Model(
      key: decode.getBytes<List<int>?>(1),
      value: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1Model;
}
