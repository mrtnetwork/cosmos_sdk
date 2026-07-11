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
    return ContractCodeHistoryOperationType.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "ContractCodeHistoryOperationType",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static ContractCodeHistoryOperationType from(Object? value) {
    return ContractCodeHistoryOperationType.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "ContractCodeHistoryOperationType",
                value: value,
              ),
    );
  }
}

/// ContractInfo stores a WASM contract instance
class ContractInfo extends CosmosProtoMessage {
  /// CodeID is the reference to the stored Wasm code
  final BigInt? codeId;

  /// Creator address who initially instantiated the contract
  final List<int>? creator;

  /// Label is mandatory metadata to be stored with a contract instance.
  final String? label;

  /// Created Tx position when the contract was instantiated.
  final AbsoluteTxPosition? created;

  final String? ibcPortId;

  /// Admin is an optional address that can execute migrations
  final String? admin;

  /// Proof that enclave executed the instantiate command
  final List<int>? adminProof;

  final bool? requireGovernance;

  const ContractInfo({
    this.codeId,
    this.creator,
    this.label,
    this.created,
    this.ibcPortId,
    this.admin,
    this.adminProof,
    this.requireGovernance,
  });

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
  Map<String, dynamic> toJson() {
    return {
      'code_id': codeId?.toString(),
      'creator': switch (creator) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'label': label,
      'created': created?.toJson(),
      'ibc_port_id': ibcPortId,
      'admin': admin,
      'admin_proof': switch (adminProof) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'require_governance': requireGovernance,
    };
  }

  factory ContractInfo.fromJson(Map<String, dynamic> json) {
    return ContractInfo(
      codeId: json.valueAsBigInt<BigInt?>('code_id', acceptCamelCase: true),
      creator: json.valueAsBytes<List<int>?>(
        'creator',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      label: json.valueAsString<String?>('label', acceptCamelCase: true),
      created: json.valueTo<AbsoluteTxPosition?, Map<String, dynamic>>(
        key: 'created',
        parse: (v) => AbsoluteTxPosition.fromJson(v),
        acceptCamelCase: true,
      ),
      ibcPortId: json.valueAsString<String?>(
        'ibc_port_id',
        acceptCamelCase: true,
      ),
      admin: json.valueAsString<String?>('admin', acceptCamelCase: true),
      adminProof: json.valueAsBytes<List<int>?>(
        'admin_proof',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      requireGovernance: json.valueAsBool<bool?>(
        'require_governance',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {
      'block_height': blockHeight?.toString(),
      'tx_index': txIndex?.toString(),
    };
  }

  factory AbsoluteTxPosition.fromJson(Map<String, dynamic> json) {
    return AbsoluteTxPosition(
      blockHeight: json.valueAsBigInt<BigInt?>(
        'block_height',
        acceptCamelCase: true,
      ),
      txIndex: json.valueAsBigInt<BigInt?>('tx_index', acceptCamelCase: true),
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

  final List<int>? msg;

  const ContractCodeHistoryEntry({
    this.operation,
    this.codeId,
    this.updated,
    this.msg,
  });

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
  Map<String, dynamic> toJson() {
    return {
      'operation': operation?.protoName,
      'code_id': codeId?.toString(),
      'updated': updated?.toJson(),
      'msg': switch (msg) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory ContractCodeHistoryEntry.fromJson(Map<String, dynamic> json) {
    return ContractCodeHistoryEntry(
      operation: json.valueTo<ContractCodeHistoryOperationType?, Object?>(
        key: 'operation',
        parse: (v) => ContractCodeHistoryOperationType.from(v),
      ),
      codeId: json.valueAsBigInt<BigInt?>('code_id', acceptCamelCase: true),
      updated: json.valueTo<AbsoluteTxPosition?, Map<String, dynamic>>(
        key: 'updated',
        parse: (v) => AbsoluteTxPosition.fromJson(v),
        acceptCamelCase: true,
      ),
      msg: json.valueAsBytes<List<int>?>(
        'msg',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
