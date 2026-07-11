import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/opinit/ophost/v1/src/types.dart"
    as opinit_ophost_v1_types;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/duration.dart"
    as google_protobuf_duration;

/// //////////////////////////
/// Batch Submitter Messages
/// MsgRecordBatch is no_op message, which is only for tx indexing.
class MsgRecordBatch extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRecordBatchResponse>,
        ICosmosProtoAminoMessage {
  final String? submitter;

  final BigInt? bridgeId;

  final List<int>? batchBytes;

  const MsgRecordBatch({this.submitter, this.bridgeId, this.batchBytes});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "submitter"),
        ProtoOptionString(name: "amino.name", value: "ophost/MsgRecordBatch"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
        ProtoFieldConfig.bytes(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [submitter, bridgeId, batchBytes];

  @override
  Map<String, dynamic> toJson() {
    return {
      'submitter': submitter,
      'bridge_id': bridgeId?.toString(),
      'batch_bytes': switch (batchBytes) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MsgRecordBatch.fromJson(Map<String, dynamic> json) {
    return MsgRecordBatch(
      submitter: json.valueAsString<String?>(
        'submitter',
        acceptCamelCase: true,
      ),
      bridgeId: json.valueAsBigInt<BigInt?>('bridge_id', acceptCamelCase: true),
      batchBytes: json.valueAsBytes<List<int>?>(
        'batch_bytes',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory MsgRecordBatch.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRecordBatch(
      submitter: decode.getString<String?>(1),
      bridgeId: decode.getBigInt<BigInt?>(2),
      batchBytes: decode.getBytes<List<int>?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgRecordBatch;
  @override
  MsgRecordBatchResponse onServiceResponse(List<int> bytes) {
    return MsgRecordBatchResponse.deserialize(bytes);
  }

  @override
  MsgRecordBatchResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgRecordBatchResponse.fromJson(json);
  }
}

/// MsgRecordBatchResponse returns MsgRecordBatch message result data
class MsgRecordBatchResponse extends CosmosProtoMessage {
  const MsgRecordBatchResponse();

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

  factory MsgRecordBatchResponse.fromJson(Map<String, dynamic> json) {
    return MsgRecordBatchResponse();
  }

  factory MsgRecordBatchResponse.deserialize(List<int> bytes) {
    return MsgRecordBatchResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgRecordBatchResponse;
}

/// //////////////////////////
/// Bridge Creator Messages
/// MsgCreateBridge is a message to register a new bridge with
/// new bridge id.
class MsgCreateBridge extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreateBridgeResponse>,
        ICosmosProtoAminoMessage {
  final String? creator;

  final opinit_ophost_v1_types.BridgeConfig? config;

  const MsgCreateBridge({this.creator, this.config});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "creator"),
        ProtoOptionString(name: "amino.name", value: "ophost/MsgCreateBridge"),
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
  List<Object?> get protoValues => [creator, config];

  @override
  Map<String, dynamic> toJson() {
    return {'creator': creator, 'config': config?.toJson()};
  }

  factory MsgCreateBridge.fromJson(Map<String, dynamic> json) {
    return MsgCreateBridge(
      creator: json.valueAsString<String?>('creator', acceptCamelCase: true),
      config: json
          .valueTo<opinit_ophost_v1_types.BridgeConfig?, Map<String, dynamic>>(
            key: 'config',
            parse: (v) => opinit_ophost_v1_types.BridgeConfig.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgCreateBridge.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateBridge(
      creator: decode.getString<String?>(1),
      config: decode.messageTo<opinit_ophost_v1_types.BridgeConfig?>(
        2,
        (b) => opinit_ophost_v1_types.BridgeConfig.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgCreateBridge;
  @override
  MsgCreateBridgeResponse onServiceResponse(List<int> bytes) {
    return MsgCreateBridgeResponse.deserialize(bytes);
  }

  @override
  MsgCreateBridgeResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgCreateBridgeResponse.fromJson(json);
  }
}

/// MsgCreateBridgeResponse returns MsgCreateBridge message
/// result data
class MsgCreateBridgeResponse extends CosmosProtoMessage {
  final BigInt? bridgeId;

  const MsgCreateBridgeResponse({this.bridgeId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [bridgeId];

  @override
  Map<String, dynamic> toJson() {
    return {'bridge_id': bridgeId?.toString()};
  }

  factory MsgCreateBridgeResponse.fromJson(Map<String, dynamic> json) {
    return MsgCreateBridgeResponse(
      bridgeId: json.valueAsBigInt<BigInt?>('bridge_id', acceptCamelCase: true),
    );
  }

  factory MsgCreateBridgeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateBridgeResponse(bridgeId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgCreateBridgeResponse;
}

/// //////////////////////////
/// Output Proposer Messages
/// MsgProposeOutput is a message to submit l2 block proposal.
class MsgProposeOutput extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgProposeOutputResponse>,
        ICosmosProtoAminoMessage {
  final String? proposer;

  final BigInt? bridgeId;

  final BigInt? outputIndex;

  final BigInt? l2BlockNumber;

  final List<int>? outputRoot;

  const MsgProposeOutput({
    this.proposer,
    this.bridgeId,
    this.outputIndex,
    this.l2BlockNumber,
    this.outputRoot,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "proposer"),
        ProtoOptionString(name: "amino.name", value: "ophost/MsgProposeOutput"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
        ProtoFieldConfig.uint64(3, options: const []),
        ProtoFieldConfig.uint64(4, options: const []),
        ProtoFieldConfig.bytes(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    proposer,
    bridgeId,
    outputIndex,
    l2BlockNumber,
    outputRoot,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'proposer': proposer,
      'bridge_id': bridgeId?.toString(),
      'output_index': outputIndex?.toString(),
      'l2_block_number': l2BlockNumber?.toString(),
      'output_root': switch (outputRoot) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MsgProposeOutput.fromJson(Map<String, dynamic> json) {
    return MsgProposeOutput(
      proposer: json.valueAsString<String?>('proposer', acceptCamelCase: true),
      bridgeId: json.valueAsBigInt<BigInt?>('bridge_id', acceptCamelCase: true),
      outputIndex: json.valueAsBigInt<BigInt?>(
        'output_index',
        acceptCamelCase: true,
      ),
      l2BlockNumber: json.valueAsBigInt<BigInt?>(
        'l2_block_number',
        acceptCamelCase: true,
      ),
      outputRoot: json.valueAsBytes<List<int>?>(
        'output_root',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory MsgProposeOutput.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgProposeOutput(
      proposer: decode.getString<String?>(1),
      bridgeId: decode.getBigInt<BigInt?>(2),
      outputIndex: decode.getBigInt<BigInt?>(3),
      l2BlockNumber: decode.getBigInt<BigInt?>(4),
      outputRoot: decode.getBytes<List<int>?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgProposeOutput;
  @override
  MsgProposeOutputResponse onServiceResponse(List<int> bytes) {
    return MsgProposeOutputResponse.deserialize(bytes);
  }

  @override
  MsgProposeOutputResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgProposeOutputResponse.fromJson(json);
  }
}

/// MsgProposeOutputResponse returns deposit result data
class MsgProposeOutputResponse extends CosmosProtoMessage {
  const MsgProposeOutputResponse();

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

  factory MsgProposeOutputResponse.fromJson(Map<String, dynamic> json) {
    return MsgProposeOutputResponse();
  }

  factory MsgProposeOutputResponse.deserialize(List<int> bytes) {
    return MsgProposeOutputResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgProposeOutputResponse;
}

/// //////////////////////////
/// Challenger Messages
/// MsgDeleteOutput is a message to delete unfinalized l2 output proposals
/// in [outputIndex, nextOutputIndex) range.
class MsgDeleteOutput extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgDeleteOutputResponse>,
        ICosmosProtoAminoMessage {
  final String? challenger;

  final BigInt? bridgeId;

  final BigInt? outputIndex;

  const MsgDeleteOutput({this.challenger, this.bridgeId, this.outputIndex});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "challenger"),
        ProtoOptionString(name: "amino.name", value: "ophost/MsgDeleteOutput"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
        ProtoFieldConfig.uint64(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [challenger, bridgeId, outputIndex];

  @override
  Map<String, dynamic> toJson() {
    return {
      'challenger': challenger,
      'bridge_id': bridgeId?.toString(),
      'output_index': outputIndex?.toString(),
    };
  }

  factory MsgDeleteOutput.fromJson(Map<String, dynamic> json) {
    return MsgDeleteOutput(
      challenger: json.valueAsString<String?>(
        'challenger',
        acceptCamelCase: true,
      ),
      bridgeId: json.valueAsBigInt<BigInt?>('bridge_id', acceptCamelCase: true),
      outputIndex: json.valueAsBigInt<BigInt?>(
        'output_index',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgDeleteOutput.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgDeleteOutput(
      challenger: decode.getString<String?>(1),
      bridgeId: decode.getBigInt<BigInt?>(2),
      outputIndex: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgDeleteOutput;
  @override
  MsgDeleteOutputResponse onServiceResponse(List<int> bytes) {
    return MsgDeleteOutputResponse.deserialize(bytes);
  }

  @override
  MsgDeleteOutputResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgDeleteOutputResponse.fromJson(json);
  }
}

/// MsgDeleteOutputResponse returns a message handle result.
class MsgDeleteOutputResponse extends CosmosProtoMessage {
  const MsgDeleteOutputResponse();

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

  factory MsgDeleteOutputResponse.fromJson(Map<String, dynamic> json) {
    return MsgDeleteOutputResponse();
  }

  factory MsgDeleteOutputResponse.deserialize(List<int> bytes) {
    return MsgDeleteOutputResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgDeleteOutputResponse;
}

/// /////////////////////////
/// Authority Messages
/// MsgInitiateTokenDeposit is a message to deposit a new token from L1 to L2.
class MsgInitiateTokenDeposit extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgInitiateTokenDepositResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final BigInt? bridgeId;

  final String? to;

  final cosmos_base_v1beta1_coin.Coin? amount;

  final List<int>? data;

  const MsgInitiateTokenDeposit({
    this.sender,
    this.bridgeId,
    this.to,
    this.amount,
    this.data,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
        ProtoOptionString(
          name: "amino.name",
          value: "ophost/MsgInitiateTokenDeposit",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.message(
          4,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.bytes(
          5,
          options: [
            ProtoOptionBool(name: "amino.dont_omitempty", value: false),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, bridgeId, to, amount, data];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'bridge_id': bridgeId?.toString(),
      'to': to,
      'amount': amount?.toJson(),
      'data': switch (data) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MsgInitiateTokenDeposit.fromJson(Map<String, dynamic> json) {
    return MsgInitiateTokenDeposit(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      bridgeId: json.valueAsBigInt<BigInt?>('bridge_id', acceptCamelCase: true),
      to: json.valueAsString<String?>('to', acceptCamelCase: true),
      amount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
      data: json.valueAsBytes<List<int>?>(
        'data',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory MsgInitiateTokenDeposit.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgInitiateTokenDeposit(
      sender: decode.getString<String?>(1),
      bridgeId: decode.getBigInt<BigInt?>(2),
      to: decode.getString<String?>(3),
      amount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        4,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      data: decode.getBytes<List<int>?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgInitiateTokenDeposit;
  @override
  MsgInitiateTokenDepositResponse onServiceResponse(List<int> bytes) {
    return MsgInitiateTokenDepositResponse.deserialize(bytes);
  }

  @override
  MsgInitiateTokenDepositResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgInitiateTokenDepositResponse.fromJson(json);
  }
}

/// MsgInitiateTokenDepositResponse returns a message handle result.
class MsgInitiateTokenDepositResponse extends CosmosProtoMessage {
  final BigInt? sequence;

  const MsgInitiateTokenDepositResponse({this.sequence});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [sequence];

  @override
  Map<String, dynamic> toJson() {
    return {'sequence': sequence?.toString()};
  }

  factory MsgInitiateTokenDepositResponse.fromJson(Map<String, dynamic> json) {
    return MsgInitiateTokenDepositResponse(
      sequence: json.valueAsBigInt<BigInt?>('sequence', acceptCamelCase: true),
    );
  }

  factory MsgInitiateTokenDepositResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgInitiateTokenDepositResponse(
      sequence: decode.getBigInt<BigInt?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgInitiateTokenDepositResponse;
}

/// MsgFinalizeTokenWithdrawal is a message finalizing funds withdrawal from L2.
class MsgFinalizeTokenWithdrawal extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgFinalizeTokenWithdrawalResponse>,
        ICosmosProtoAminoMessage {
  /// address of the sender of the transaction
  final String? sender;

  final BigInt? bridgeId;

  final BigInt? outputIndex;

  final List<List<int>> withdrawalProofs;

  /// withdraw tx data
  final String? from;

  final String? to;

  final BigInt? sequence;

  final cosmos_base_v1beta1_coin.Coin? amount;

  /// output root proofs
  /// version of the output root
  final List<int>? version;

  final List<int>? storageRoot;

  final List<int>? lastBlockHash;

  const MsgFinalizeTokenWithdrawal({
    this.sender,
    this.bridgeId,
    this.outputIndex,
    this.withdrawalProofs = const [],
    this.from,
    this.to,
    this.sequence,
    this.amount,
    this.version,
    this.storageRoot,
    this.lastBlockHash,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
        ProtoOptionString(
          name: "amino.name",
          value: "ophost/MsgFinalizeTokenWithdrawal",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
        ProtoFieldConfig.uint64(3, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.bytes,
          options: [
            ProtoOptionBool(name: "amino.dont_omitempty", value: false),
          ],
        ),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.uint64(7, options: const []),
        ProtoFieldConfig.message(
          8,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.bytes(9, options: const []),
        ProtoFieldConfig.bytes(10, options: const []),
        ProtoFieldConfig.bytes(11, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    bridgeId,
    outputIndex,
    withdrawalProofs,
    from,
    to,
    sequence,
    amount,
    version,
    storageRoot,
    lastBlockHash,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'bridge_id': bridgeId?.toString(),
      'output_index': outputIndex?.toString(),
      'withdrawal_proofs':
          withdrawalProofs
              .map(
                (e) => StringUtils.decode(e, encoding: StringEncoding.base64),
              )
              .toList(),
      'from': from,
      'to': to,
      'sequence': sequence?.toString(),
      'amount': amount?.toJson(),
      'version': switch (version) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'storage_root': switch (storageRoot) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'last_block_hash': switch (lastBlockHash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MsgFinalizeTokenWithdrawal.fromJson(Map<String, dynamic> json) {
    return MsgFinalizeTokenWithdrawal(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      bridgeId: json.valueAsBigInt<BigInt?>('bridge_id', acceptCamelCase: true),
      outputIndex: json.valueAsBigInt<BigInt?>(
        'output_index',
        acceptCamelCase: true,
      ),
      withdrawalProofs:
          (json.valueEnsureAsList<dynamic>(
                'withdrawal_proofs',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueAsBytes<List<int>>(
                  e,
                  encoding: StringEncoding.base64,
                ),
              )
              .toList(),
      from: json.valueAsString<String?>('from', acceptCamelCase: true),
      to: json.valueAsString<String?>('to', acceptCamelCase: true),
      sequence: json.valueAsBigInt<BigInt?>('sequence', acceptCamelCase: true),
      amount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
      version: json.valueAsBytes<List<int>?>(
        'version',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      storageRoot: json.valueAsBytes<List<int>?>(
        'storage_root',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      lastBlockHash: json.valueAsBytes<List<int>?>(
        'last_block_hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory MsgFinalizeTokenWithdrawal.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgFinalizeTokenWithdrawal(
      sender: decode.getString<String?>(1),
      bridgeId: decode.getBigInt<BigInt?>(2),
      outputIndex: decode.getBigInt<BigInt?>(3),
      withdrawalProofs: decode.getListOfBytes(4),
      from: decode.getString<String?>(5),
      to: decode.getString<String?>(6),
      sequence: decode.getBigInt<BigInt?>(7),
      amount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        8,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      version: decode.getBytes<List<int>?>(9),
      storageRoot: decode.getBytes<List<int>?>(10),
      lastBlockHash: decode.getBytes<List<int>?>(11),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgFinalizeTokenWithdrawal;
  @override
  MsgFinalizeTokenWithdrawalResponse onServiceResponse(List<int> bytes) {
    return MsgFinalizeTokenWithdrawalResponse.deserialize(bytes);
  }

  @override
  MsgFinalizeTokenWithdrawalResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgFinalizeTokenWithdrawalResponse.fromJson(json);
  }
}

/// MsgFinalizeTokenWithdrawalResponse returns a message handle result.
class MsgFinalizeTokenWithdrawalResponse extends CosmosProtoMessage {
  const MsgFinalizeTokenWithdrawalResponse();

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

  factory MsgFinalizeTokenWithdrawalResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgFinalizeTokenWithdrawalResponse();
  }

  factory MsgFinalizeTokenWithdrawalResponse.deserialize(List<int> bytes) {
    return MsgFinalizeTokenWithdrawalResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .opinitOphostV1MsgFinalizeTokenWithdrawalResponse;
}

/// /////////////////////////
/// Authority Messages
/// MsgUpdateProposer is a message to change a proposer
class MsgUpdateProposer extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateProposerResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten)
  /// or the current proposer address.
  final String? authority;

  final BigInt? bridgeId;

  final String? newProposer;

  const MsgUpdateProposer({this.authority, this.bridgeId, this.newProposer});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "ophost/MsgUpdateProposer",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, bridgeId, newProposer];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'bridge_id': bridgeId?.toString(),
      'new_proposer': newProposer,
    };
  }

  factory MsgUpdateProposer.fromJson(Map<String, dynamic> json) {
    return MsgUpdateProposer(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      bridgeId: json.valueAsBigInt<BigInt?>('bridge_id', acceptCamelCase: true),
      newProposer: json.valueAsString<String?>(
        'new_proposer',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateProposer.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateProposer(
      authority: decode.getString<String?>(1),
      bridgeId: decode.getBigInt<BigInt?>(2),
      newProposer: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgUpdateProposer;
  @override
  MsgUpdateProposerResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateProposerResponse.deserialize(bytes);
  }

  @override
  MsgUpdateProposerResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateProposerResponse.fromJson(json);
  }
}

/// MsgUpdateProposerResponse returns a message handle result.
class MsgUpdateProposerResponse extends CosmosProtoMessage {
  /// last finalized output index
  final BigInt? outputIndex;

  /// last finalized l2 block number
  final BigInt? l2BlockNumber;

  const MsgUpdateProposerResponse({this.outputIndex, this.l2BlockNumber});

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
  List<Object?> get protoValues => [outputIndex, l2BlockNumber];

  @override
  Map<String, dynamic> toJson() {
    return {
      'output_index': outputIndex?.toString(),
      'l2_block_number': l2BlockNumber?.toString(),
    };
  }

  factory MsgUpdateProposerResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateProposerResponse(
      outputIndex: json.valueAsBigInt<BigInt?>(
        'output_index',
        acceptCamelCase: true,
      ),
      l2BlockNumber: json.valueAsBigInt<BigInt?>(
        'l2_block_number',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateProposerResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateProposerResponse(
      outputIndex: decode.getBigInt<BigInt?>(1),
      l2BlockNumber: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgUpdateProposerResponse;
}

/// MsgUpdateChallenger is a message to change a challenger
class MsgUpdateChallenger extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateChallengerResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten)
  /// or the current challenger address.
  ///
  /// If the given authority is a challenger address, it has the ability to replace itself with another address.
  final String? authority;

  final BigInt? bridgeId;

  final String? challenger;

  const MsgUpdateChallenger({this.authority, this.bridgeId, this.challenger});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "ophost/MsgUpdateChallenger",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, bridgeId, challenger];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'bridge_id': bridgeId?.toString(),
      'challenger': challenger,
    };
  }

  factory MsgUpdateChallenger.fromJson(Map<String, dynamic> json) {
    return MsgUpdateChallenger(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      bridgeId: json.valueAsBigInt<BigInt?>('bridge_id', acceptCamelCase: true),
      challenger: json.valueAsString<String?>(
        'challenger',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateChallenger.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateChallenger(
      authority: decode.getString<String?>(1),
      bridgeId: decode.getBigInt<BigInt?>(2),
      challenger: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgUpdateChallenger;
  @override
  MsgUpdateChallengerResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateChallengerResponse.deserialize(bytes);
  }

  @override
  MsgUpdateChallengerResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateChallengerResponse.fromJson(json);
  }
}

/// MsgUpdateChallengerResponse returns a message handle result.
class MsgUpdateChallengerResponse extends CosmosProtoMessage {
  /// last finalized output index
  final BigInt? outputIndex;

  /// last finalized l2 block number
  final BigInt? l2BlockNumber;

  const MsgUpdateChallengerResponse({this.outputIndex, this.l2BlockNumber});

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
  List<Object?> get protoValues => [outputIndex, l2BlockNumber];

  @override
  Map<String, dynamic> toJson() {
    return {
      'output_index': outputIndex?.toString(),
      'l2_block_number': l2BlockNumber?.toString(),
    };
  }

  factory MsgUpdateChallengerResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateChallengerResponse(
      outputIndex: json.valueAsBigInt<BigInt?>(
        'output_index',
        acceptCamelCase: true,
      ),
      l2BlockNumber: json.valueAsBigInt<BigInt?>(
        'l2_block_number',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateChallengerResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateChallengerResponse(
      outputIndex: decode.getBigInt<BigInt?>(1),
      l2BlockNumber: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgUpdateChallengerResponse;
}

/// MsgUpdateBatchInfo is a message to change a batch info
class MsgUpdateBatchInfo extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateBatchInfoResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten)
  /// or the current proposer address.
  final String? authority;

  final BigInt? bridgeId;

  final opinit_ophost_v1_types.BatchInfo? newBatchInfo;

  const MsgUpdateBatchInfo({this.authority, this.bridgeId, this.newBatchInfo});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "ophost/MsgUpdateBatchInfo",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
        ProtoFieldConfig.message(
          3,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, bridgeId, newBatchInfo];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'bridge_id': bridgeId?.toString(),
      'new_batch_info': newBatchInfo?.toJson(),
    };
  }

  factory MsgUpdateBatchInfo.fromJson(Map<String, dynamic> json) {
    return MsgUpdateBatchInfo(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      bridgeId: json.valueAsBigInt<BigInt?>('bridge_id', acceptCamelCase: true),
      newBatchInfo: json
          .valueTo<opinit_ophost_v1_types.BatchInfo?, Map<String, dynamic>>(
            key: 'new_batch_info',
            parse: (v) => opinit_ophost_v1_types.BatchInfo.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgUpdateBatchInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateBatchInfo(
      authority: decode.getString<String?>(1),
      bridgeId: decode.getBigInt<BigInt?>(2),
      newBatchInfo: decode.messageTo<opinit_ophost_v1_types.BatchInfo?>(
        3,
        (b) => opinit_ophost_v1_types.BatchInfo.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgUpdateBatchInfo;
  @override
  MsgUpdateBatchInfoResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateBatchInfoResponse.deserialize(bytes);
  }

  @override
  MsgUpdateBatchInfoResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateBatchInfoResponse.fromJson(json);
  }
}

/// MsgUpdateBatchInfoResponse returns a message handle result.
class MsgUpdateBatchInfoResponse extends CosmosProtoMessage {
  /// last finalized output index
  final BigInt? outputIndex;

  /// last finalized l2 block number
  final BigInt? l2BlockNumber;

  const MsgUpdateBatchInfoResponse({this.outputIndex, this.l2BlockNumber});

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
  List<Object?> get protoValues => [outputIndex, l2BlockNumber];

  @override
  Map<String, dynamic> toJson() {
    return {
      'output_index': outputIndex?.toString(),
      'l2_block_number': l2BlockNumber?.toString(),
    };
  }

  factory MsgUpdateBatchInfoResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateBatchInfoResponse(
      outputIndex: json.valueAsBigInt<BigInt?>(
        'output_index',
        acceptCamelCase: true,
      ),
      l2BlockNumber: json.valueAsBigInt<BigInt?>(
        'l2_block_number',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateBatchInfoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateBatchInfoResponse(
      outputIndex: decode.getBigInt<BigInt?>(1),
      l2BlockNumber: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgUpdateBatchInfoResponse;
}

/// MsgUpdateOracleFlag is a message to change oracle config
class MsgUpdateOracleConfig extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateOracleConfigResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten)
  /// or the current proposer address.
  final String? authority;

  final BigInt? bridgeId;

  final bool? oracleEnabled;

  const MsgUpdateOracleConfig({
    this.authority,
    this.bridgeId,
    this.oracleEnabled,
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
          value: "ophost/MsgUpdateOracleConfig",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
        ProtoFieldConfig.bool(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, bridgeId, oracleEnabled];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'bridge_id': bridgeId?.toString(),
      'oracle_enabled': oracleEnabled,
    };
  }

  factory MsgUpdateOracleConfig.fromJson(Map<String, dynamic> json) {
    return MsgUpdateOracleConfig(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      bridgeId: json.valueAsBigInt<BigInt?>('bridge_id', acceptCamelCase: true),
      oracleEnabled: json.valueAsBool<bool?>(
        'oracle_enabled',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateOracleConfig.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateOracleConfig(
      authority: decode.getString<String?>(1),
      bridgeId: decode.getBigInt<BigInt?>(2),
      oracleEnabled: decode.getBool<bool?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgUpdateOracleConfig;
  @override
  MsgUpdateOracleConfigResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateOracleConfigResponse.deserialize(bytes);
  }

  @override
  MsgUpdateOracleConfigResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateOracleConfigResponse.fromJson(json);
  }
}

/// MsgUpdateOracleFlagResponse returns a message handle result.
class MsgUpdateOracleConfigResponse extends CosmosProtoMessage {
  const MsgUpdateOracleConfigResponse();

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

  factory MsgUpdateOracleConfigResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateOracleConfigResponse();
  }

  factory MsgUpdateOracleConfigResponse.deserialize(List<int> bytes) {
    return MsgUpdateOracleConfigResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgUpdateOracleConfigResponse;
}

/// MsgUpdateChannelId is a message to update the opinit channel ID
class MsgUpdateChannelId extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateChannelIdResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten).
  final String? authority;

  final BigInt? bridgeId;

  final String? channelId;

  const MsgUpdateChannelId({this.authority, this.bridgeId, this.channelId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "ophost/MsgUpdateChannelId",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, bridgeId, channelId];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'bridge_id': bridgeId?.toString(),
      'channel_id': channelId,
    };
  }

  factory MsgUpdateChannelId.fromJson(Map<String, dynamic> json) {
    return MsgUpdateChannelId(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      bridgeId: json.valueAsBigInt<BigInt?>('bridge_id', acceptCamelCase: true),
      channelId: json.valueAsString<String?>(
        'channel_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateChannelId.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateChannelId(
      authority: decode.getString<String?>(1),
      bridgeId: decode.getBigInt<BigInt?>(2),
      channelId: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgUpdateChannelId;
  @override
  MsgUpdateChannelIdResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateChannelIdResponse.deserialize(bytes);
  }

  @override
  MsgUpdateChannelIdResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateChannelIdResponse.fromJson(json);
  }
}

/// MsgUpdateChannelIdResponse returns a message handle result.
class MsgUpdateChannelIdResponse extends CosmosProtoMessage {
  const MsgUpdateChannelIdResponse();

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

  factory MsgUpdateChannelIdResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateChannelIdResponse();
  }

  factory MsgUpdateChannelIdResponse.deserialize(List<int> bytes) {
    return MsgUpdateChannelIdResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgUpdateChannelIdResponse;
}

/// MsgUpdateMetadata is a message to change metadata
class MsgUpdateMetadata extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateMetadataResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten)
  /// or the current challenger address.
  ///
  /// If the given authority is a challenger address, it has the ability to replace oneself to another address or remove
  /// oneself.
  final String? authority;

  final BigInt? bridgeId;

  final List<int>? metadata;

  const MsgUpdateMetadata({this.authority, this.bridgeId, this.metadata});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "ophost/MsgUpdateMetadata",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
        ProtoFieldConfig.bytes(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, bridgeId, metadata];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'bridge_id': bridgeId?.toString(),
      'metadata': switch (metadata) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MsgUpdateMetadata.fromJson(Map<String, dynamic> json) {
    return MsgUpdateMetadata(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      bridgeId: json.valueAsBigInt<BigInt?>('bridge_id', acceptCamelCase: true),
      metadata: json.valueAsBytes<List<int>?>(
        'metadata',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory MsgUpdateMetadata.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateMetadata(
      authority: decode.getString<String?>(1),
      bridgeId: decode.getBigInt<BigInt?>(2),
      metadata: decode.getBytes<List<int>?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgUpdateMetadata;
  @override
  MsgUpdateMetadataResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateMetadataResponse.deserialize(bytes);
  }

  @override
  MsgUpdateMetadataResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateMetadataResponse.fromJson(json);
  }
}

/// MsgUpdateMetadataResponse returns a message handle result.
class MsgUpdateMetadataResponse extends CosmosProtoMessage {
  /// last finalized output index
  final BigInt? outputIndex;

  /// last finalized l2 block number
  final BigInt? l2BlockNumber;

  const MsgUpdateMetadataResponse({this.outputIndex, this.l2BlockNumber});

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
  List<Object?> get protoValues => [outputIndex, l2BlockNumber];

  @override
  Map<String, dynamic> toJson() {
    return {
      'output_index': outputIndex?.toString(),
      'l2_block_number': l2BlockNumber?.toString(),
    };
  }

  factory MsgUpdateMetadataResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateMetadataResponse(
      outputIndex: json.valueAsBigInt<BigInt?>(
        'output_index',
        acceptCamelCase: true,
      ),
      l2BlockNumber: json.valueAsBigInt<BigInt?>(
        'l2_block_number',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateMetadataResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateMetadataResponse(
      outputIndex: decode.getBigInt<BigInt?>(1),
      l2BlockNumber: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgUpdateMetadataResponse;
}

/// MsgUpdateParams is a message to update parameters
class MsgUpdateParams extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateParamsResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module
  /// (defaults to x/gov unless overwritten).
  final String? authority;

  /// params are the arbitrary parameters to be updated.
  final opinit_ophost_v1_types.Params? params;

  const MsgUpdateParams({this.authority, this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(name: "amino.name", value: "ophost/MsgUpdateParams"),
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
      params: json
          .valueTo<opinit_ophost_v1_types.Params?, Map<String, dynamic>>(
            key: 'params',
            parse: (v) => opinit_ophost_v1_types.Params.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      authority: decode.getString<String?>(1),
      params: decode.messageTo<opinit_ophost_v1_types.Params?>(
        2,
        (b) => opinit_ophost_v1_types.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgUpdateParams;
  @override
  MsgUpdateParamsResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateParamsResponse.deserialize(bytes);
  }

  @override
  MsgUpdateParamsResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateParamsResponse.fromJson(json);
  }
}

/// MsgUpdateParamsResponse returns a message handle result.
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
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgUpdateParamsResponse;
}

/// MsgUpdateFinalizationPeriod is a message to update the finalization period
class MsgUpdateFinalizationPeriod extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateFinalizationPeriodResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten)
  final String? authority;

  final BigInt? bridgeId;

  /// The minimum time duration that must elapse before a withdrawal can be finalized.
  final google_protobuf_duration.Duration? finalizationPeriod;

  const MsgUpdateFinalizationPeriod({
    this.authority,
    this.bridgeId,
    this.finalizationPeriod,
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
          value: "ophost/MsgUpdateFinalizationPeriod",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
        ProtoFieldConfig.message(
          3,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, bridgeId, finalizationPeriod];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'bridge_id': bridgeId?.toString(),
      'finalization_period': finalizationPeriod?.encodeString(asNanos: true),
    };
  }

  factory MsgUpdateFinalizationPeriod.fromJson(Map<String, dynamic> json) {
    return MsgUpdateFinalizationPeriod(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      bridgeId: json.valueAsBigInt<BigInt?>('bridge_id', acceptCamelCase: true),
      finalizationPeriod: json
          .valueTo<google_protobuf_duration.Duration?, String>(
            key: 'finalization_period',
            parse: (v) => google_protobuf_duration.Duration.fromString(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgUpdateFinalizationPeriod.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateFinalizationPeriod(
      authority: decode.getString<String?>(1),
      bridgeId: decode.getBigInt<BigInt?>(2),
      finalizationPeriod: decode.messageTo<google_protobuf_duration.Duration?>(
        3,
        (b) => google_protobuf_duration.Duration.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgUpdateFinalizationPeriod;
  @override
  MsgUpdateFinalizationPeriodResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateFinalizationPeriodResponse.deserialize(bytes);
  }

  @override
  MsgUpdateFinalizationPeriodResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateFinalizationPeriodResponse.fromJson(json);
  }
}

/// MsgUpdateFinalizationPeriodResponse returns a message handle result.
class MsgUpdateFinalizationPeriodResponse extends CosmosProtoMessage {
  const MsgUpdateFinalizationPeriodResponse();

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

  factory MsgUpdateFinalizationPeriodResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateFinalizationPeriodResponse();
  }

  factory MsgUpdateFinalizationPeriodResponse.deserialize(List<int> bytes) {
    return MsgUpdateFinalizationPeriodResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .opinitOphostV1MsgUpdateFinalizationPeriodResponse;
}

/// MsgDisableBridge is a message to disable the bridge
class MsgDisableBridge extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgDisableBridgeResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten)
  final String? authority;

  final BigInt? bridgeId;

  const MsgDisableBridge({this.authority, this.bridgeId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(name: "amino.name", value: "ophost/MsgDisableBridge"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, bridgeId];

  @override
  Map<String, dynamic> toJson() {
    return {'authority': authority, 'bridge_id': bridgeId?.toString()};
  }

  factory MsgDisableBridge.fromJson(Map<String, dynamic> json) {
    return MsgDisableBridge(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      bridgeId: json.valueAsBigInt<BigInt?>('bridge_id', acceptCamelCase: true),
    );
  }

  factory MsgDisableBridge.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgDisableBridge(
      authority: decode.getString<String?>(1),
      bridgeId: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgDisableBridge;
  @override
  MsgDisableBridgeResponse onServiceResponse(List<int> bytes) {
    return MsgDisableBridgeResponse.deserialize(bytes);
  }

  @override
  MsgDisableBridgeResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgDisableBridgeResponse.fromJson(json);
  }
}

/// MsgDisableBridgeResponse returns a message handle result.
class MsgDisableBridgeResponse extends CosmosProtoMessage {
  const MsgDisableBridgeResponse();

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

  factory MsgDisableBridgeResponse.fromJson(Map<String, dynamic> json) {
    return MsgDisableBridgeResponse();
  }

  factory MsgDisableBridgeResponse.deserialize(List<int> bytes) {
    return MsgDisableBridgeResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgDisableBridgeResponse;
}

/// //////////////////////////
/// Attestor Messages
/// MsgRegisterAttestorSet is a message to register/replace the entire attestor set
class MsgRegisterAttestorSet extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRegisterAttestorSetResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten)
  final String? authority;

  final BigInt? bridgeId;

  final List<opinit_ophost_v1_types.Attestor> attestorSet;

  const MsgRegisterAttestorSet({
    this.authority,
    this.bridgeId,
    this.attestorSet = const [],
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
          value: "ophost/MsgRegisterAttestorSet",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, bridgeId, attestorSet];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'bridge_id': bridgeId?.toString(),
      'attestor_set': attestorSet.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgRegisterAttestorSet.fromJson(Map<String, dynamic> json) {
    return MsgRegisterAttestorSet(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      bridgeId: json.valueAsBigInt<BigInt?>('bridge_id', acceptCamelCase: true),
      attestorSet:
          (json.valueEnsureAsList<dynamic>(
                'attestor_set',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  opinit_ophost_v1_types.Attestor,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => opinit_ophost_v1_types.Attestor.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory MsgRegisterAttestorSet.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRegisterAttestorSet(
      authority: decode.getString<String?>(1),
      bridgeId: decode.getBigInt<BigInt?>(2),
      attestorSet:
          decode
              .getListOfBytes(3)
              .map((b) => opinit_ophost_v1_types.Attestor.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgRegisterAttestorSet;
  @override
  MsgRegisterAttestorSetResponse onServiceResponse(List<int> bytes) {
    return MsgRegisterAttestorSetResponse.deserialize(bytes);
  }

  @override
  MsgRegisterAttestorSetResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgRegisterAttestorSetResponse.fromJson(json);
  }
}

/// MsgRegisterAttestorSetResponse returns a message handle result.
class MsgRegisterAttestorSetResponse extends CosmosProtoMessage {
  const MsgRegisterAttestorSetResponse();

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

  factory MsgRegisterAttestorSetResponse.fromJson(Map<String, dynamic> json) {
    return MsgRegisterAttestorSetResponse();
  }

  factory MsgRegisterAttestorSetResponse.deserialize(List<int> bytes) {
    return MsgRegisterAttestorSetResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgRegisterAttestorSetResponse;
}

/// MsgAddAttestor is a message to add a single attestor to the set
class MsgAddAttestor extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgAddAttestorResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten)
  final String? authority;

  final BigInt? bridgeId;

  final opinit_ophost_v1_types.Attestor? attestor;

  const MsgAddAttestor({this.authority, this.bridgeId, this.attestor});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(name: "amino.name", value: "ophost/MsgAddAttestor"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
        ProtoFieldConfig.message(
          3,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, bridgeId, attestor];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'bridge_id': bridgeId?.toString(),
      'attestor': attestor?.toJson(),
    };
  }

  factory MsgAddAttestor.fromJson(Map<String, dynamic> json) {
    return MsgAddAttestor(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      bridgeId: json.valueAsBigInt<BigInt?>('bridge_id', acceptCamelCase: true),
      attestor: json
          .valueTo<opinit_ophost_v1_types.Attestor?, Map<String, dynamic>>(
            key: 'attestor',
            parse: (v) => opinit_ophost_v1_types.Attestor.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgAddAttestor.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgAddAttestor(
      authority: decode.getString<String?>(1),
      bridgeId: decode.getBigInt<BigInt?>(2),
      attestor: decode.messageTo<opinit_ophost_v1_types.Attestor?>(
        3,
        (b) => opinit_ophost_v1_types.Attestor.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgAddAttestor;
  @override
  MsgAddAttestorResponse onServiceResponse(List<int> bytes) {
    return MsgAddAttestorResponse.deserialize(bytes);
  }

  @override
  MsgAddAttestorResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgAddAttestorResponse.fromJson(json);
  }
}

/// MsgAddAttestorResponse returns a message handle result.
class MsgAddAttestorResponse extends CosmosProtoMessage {
  const MsgAddAttestorResponse();

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

  factory MsgAddAttestorResponse.fromJson(Map<String, dynamic> json) {
    return MsgAddAttestorResponse();
  }

  factory MsgAddAttestorResponse.deserialize(List<int> bytes) {
    return MsgAddAttestorResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgAddAttestorResponse;
}

/// MsgRemoveAttestor is a message to remove a single attestor from the set
class MsgRemoveAttestor extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRemoveAttestorResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten)
  final String? authority;

  final BigInt? bridgeId;

  final String? operatorAddress;

  const MsgRemoveAttestor({
    this.authority,
    this.bridgeId,
    this.operatorAddress,
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
          value: "ophost/MsgRemoveAttestor",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, bridgeId, operatorAddress];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'bridge_id': bridgeId?.toString(),
      'operator_address': operatorAddress,
    };
  }

  factory MsgRemoveAttestor.fromJson(Map<String, dynamic> json) {
    return MsgRemoveAttestor(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      bridgeId: json.valueAsBigInt<BigInt?>('bridge_id', acceptCamelCase: true),
      operatorAddress: json.valueAsString<String?>(
        'operator_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgRemoveAttestor.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRemoveAttestor(
      authority: decode.getString<String?>(1),
      bridgeId: decode.getBigInt<BigInt?>(2),
      operatorAddress: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgRemoveAttestor;
  @override
  MsgRemoveAttestorResponse onServiceResponse(List<int> bytes) {
    return MsgRemoveAttestorResponse.deserialize(bytes);
  }

  @override
  MsgRemoveAttestorResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgRemoveAttestorResponse.fromJson(json);
  }
}

/// MsgRemoveAttestorResponse returns a message handle result.
class MsgRemoveAttestorResponse extends CosmosProtoMessage {
  const MsgRemoveAttestorResponse();

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

  factory MsgRemoveAttestorResponse.fromJson(Map<String, dynamic> json) {
    return MsgRemoveAttestorResponse();
  }

  factory MsgRemoveAttestorResponse.deserialize(List<int> bytes) {
    return MsgRemoveAttestorResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgRemoveAttestorResponse;
}

/// //////////////////////////
/// Migration Messages
/// MsgRegisterMigrationInfo is a message to register the migration info
class MsgRegisterMigrationInfo extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRegisterMigrationInfoResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten)
  final String? authority;

  final opinit_ophost_v1_types.MigrationInfo? migrationInfo;

  const MsgRegisterMigrationInfo({this.authority, this.migrationInfo});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "ophost/MsgRegisterMigrationInfo",
        ),
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
  List<Object?> get protoValues => [authority, migrationInfo];

  @override
  Map<String, dynamic> toJson() {
    return {'authority': authority, 'migration_info': migrationInfo?.toJson()};
  }

  factory MsgRegisterMigrationInfo.fromJson(Map<String, dynamic> json) {
    return MsgRegisterMigrationInfo(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      migrationInfo: json
          .valueTo<opinit_ophost_v1_types.MigrationInfo?, Map<String, dynamic>>(
            key: 'migration_info',
            parse: (v) => opinit_ophost_v1_types.MigrationInfo.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgRegisterMigrationInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRegisterMigrationInfo(
      authority: decode.getString<String?>(1),
      migrationInfo: decode.messageTo<opinit_ophost_v1_types.MigrationInfo?>(
        2,
        (b) => opinit_ophost_v1_types.MigrationInfo.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgRegisterMigrationInfo;
  @override
  MsgRegisterMigrationInfoResponse onServiceResponse(List<int> bytes) {
    return MsgRegisterMigrationInfoResponse.deserialize(bytes);
  }

  @override
  MsgRegisterMigrationInfoResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgRegisterMigrationInfoResponse.fromJson(json);
  }
}

/// MsgRegisterMigrationInfoResponse returns a message handle result.
class MsgRegisterMigrationInfoResponse extends CosmosProtoMessage {
  const MsgRegisterMigrationInfoResponse();

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

  factory MsgRegisterMigrationInfoResponse.fromJson(Map<String, dynamic> json) {
    return MsgRegisterMigrationInfoResponse();
  }

  factory MsgRegisterMigrationInfoResponse.deserialize(List<int> bytes) {
    return MsgRegisterMigrationInfoResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1MsgRegisterMigrationInfoResponse;
}
