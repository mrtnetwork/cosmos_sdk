import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

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

/// ContractInfo stores a WASM contract instance
class ContractInfo extends CosmosProtoMessage {
  /// CodeID is the reference to the stored Wasm code
  final BigInt? codeId;

  /// Creator address who initially instantiated the contract
  final BuBytes? creator;

  /// Label is mandatory metadata to be stored with a contract instance.
  final String? label;

  /// Created Tx position when the contract was instantiated.
  final AbsoluteTxPosition? created;

  final String? ibcPortId;

  /// Admin is an optional address that can execute migrations
  final String? admin;

  /// Proof that enclave executed the instantiate command
  final BuBytes? adminProof;

  final bool? requireGovernance;

  ContractInfo({
    this.codeId,
    List<int>? creator,
    this.label,
    this.created,
    this.ibcPortId,
    this.admin,
    List<int>? adminProof,
    this.requireGovernance,
  }) : creator = creator?.asImmutableBytes,
       adminProof = adminProof?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.bytes(2, options: const []),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.message(5),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(7),
        ProtoFieldConfig.bytes(8),
        ProtoFieldConfig.bool(9),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    codeId,
    creator,
    label,
    created,
    ibcPortId,
    admin,
    adminProof,
    requireGovernance,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'code_id': config.encodeBigint(codeId),
      'creator': config.encodeBinary(creator),
      'label': label,
      'created': config.encodeMessage(created),
      'ibc_port_id': ibcPortId,
      'admin': admin,
      'admin_proof': config.encodeBinary(adminProof),
      'require_governance': requireGovernance,
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
      creator: config.decodeBinary<List<int>?>(
        json.valueAs('creator', normalizeKeyLookup: config.normalizeKeys),
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
      admin: json.valueAsString<String?>(
        'admin',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      adminProof: config.decodeBinary<List<int>?>(
        json.valueAs('admin_proof', normalizeKeyLookup: config.normalizeKeys),
      ),
      requireGovernance: json.valueAsBool<bool?>(
        'require_governance',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory ContractInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ContractInfo(
      codeId: decode.getBigInt<BigInt?>(1),
      creator: decode.getBytes<List<int>?>(2),
      label: decode.getString<String?>(4),
      created: decode.messageTo<AbsoluteTxPosition?>(
        5,
        (b) => AbsoluteTxPosition.deserialize(b),
      ),
      ibcPortId: decode.getString<String?>(6),
      admin: decode.getString<String?>(7),
      adminProof: decode.getBytes<List<int>?>(8),
      requireGovernance: decode.getBool<bool?>(9),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1ContractInfo;
}

/// AbsoluteTxPosition can be used to sort contracts
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
      fields: [ProtoFieldConfig.int64(1), ProtoFieldConfig.uint64(2)],
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
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1AbsoluteTxPosition;
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
        ProtoFieldConfig.bytes(4),
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
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1ContractCodeHistoryEntry;
}
