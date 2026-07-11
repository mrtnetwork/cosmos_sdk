import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/ibc/core/connection/v1/src/connection.dart"
    as ibc_core_connection_v1_connection;
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;
import "package:cosmos_sdk/proto_messages/ibc/core/client/v1/src/client.dart"
    as ibc_core_client_v1_client;

/// MsgConnectionOpenInit defines the msg sent by an account on Chain A to
/// initialize a connection with Chain B.
class MsgConnectionOpenInit extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgConnectionOpenInitResponse> {
  final String? clientId;

  final ibc_core_connection_v1_connection.Counterparty? counterparty;

  final ibc_core_connection_v1_connection.Version? version;

  final BigInt? delayPeriod;

  final String? signer;

  const MsgConnectionOpenInit({
    this.clientId,
    this.counterparty,
    this.version,
    this.delayPeriod,
    this.signer,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "signer"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.message(3),
        ProtoFieldConfig.uint64(4),
        ProtoFieldConfig.string(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    clientId,
    counterparty,
    version,
    delayPeriod,
    signer,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'client_id': clientId,
      'counterparty': counterparty?.toJson(),
      'version': version?.toJson(),
      'delay_period': delayPeriod?.toString(),
      'signer': signer,
    };
  }

  factory MsgConnectionOpenInit.fromJson(Map<String, dynamic> json) {
    return MsgConnectionOpenInit(
      clientId: json.valueAsString<String?>('client_id', acceptCamelCase: true),
      counterparty: json.valueTo<
        ibc_core_connection_v1_connection.Counterparty?,
        Map<String, dynamic>
      >(
        key: 'counterparty',
        parse:
            (v) => ibc_core_connection_v1_connection.Counterparty.fromJson(v),
        acceptCamelCase: true,
      ),
      version: json.valueTo<
        ibc_core_connection_v1_connection.Version?,
        Map<String, dynamic>
      >(
        key: 'version',
        parse: (v) => ibc_core_connection_v1_connection.Version.fromJson(v),
        acceptCamelCase: true,
      ),
      delayPeriod: json.valueAsBigInt<BigInt?>(
        'delay_period',
        acceptCamelCase: true,
      ),
      signer: json.valueAsString<String?>('signer', acceptCamelCase: true),
    );
  }

  factory MsgConnectionOpenInit.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgConnectionOpenInit(
      clientId: decode.getString<String?>(1),
      counterparty: decode
          .messageTo<ibc_core_connection_v1_connection.Counterparty?>(
            2,
            (b) =>
                ibc_core_connection_v1_connection.Counterparty.deserialize(b),
          ),
      version: decode.messageTo<ibc_core_connection_v1_connection.Version?>(
        3,
        (b) => ibc_core_connection_v1_connection.Version.deserialize(b),
      ),
      delayPeriod: decode.getBigInt<BigInt?>(4),
      signer: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreConnectionV1MsgConnectionOpenInit;
  @override
  MsgConnectionOpenInitResponse onServiceResponse(List<int> bytes) {
    return MsgConnectionOpenInitResponse.deserialize(bytes);
  }

  @override
  MsgConnectionOpenInitResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgConnectionOpenInitResponse.fromJson(json);
  }
}

/// MsgConnectionOpenInitResponse defines the Msg/ConnectionOpenInit response
/// type.
class MsgConnectionOpenInitResponse extends CosmosProtoMessage {
  const MsgConnectionOpenInitResponse();

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

  factory MsgConnectionOpenInitResponse.fromJson(Map<String, dynamic> json) {
    return MsgConnectionOpenInitResponse();
  }

  factory MsgConnectionOpenInitResponse.deserialize(List<int> bytes) {
    return MsgConnectionOpenInitResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcCoreConnectionV1MsgConnectionOpenInitResponse;
}

/// MsgConnectionOpenTry defines a msg sent by a Relayer to try to open a
/// connection on Chain B.
class MsgConnectionOpenTry extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgConnectionOpenTryResponse> {
  final String? clientId;

  /// Deprecated: this field is unused. Crossing hellos are no longer supported in core IBC.
  final String? previousConnectionId;

  /// Deprecated: this field is unused.
  final google_protobuf_any.Any? clientState;

  final ibc_core_connection_v1_connection.Counterparty? counterparty;

  final BigInt? delayPeriod;

  final List<ibc_core_connection_v1_connection.Version> counterpartyVersions;

  final ibc_core_client_v1_client.Height? proofHeight;

  /// proof of the initialization the connection on Chain A: `UNINITIALIZED ->
  /// INIT`
  final List<int>? proofInit;

  /// Deprecated: this field is unused.
  final List<int>? proofClient;

  /// Deprecated: this field is unused.
  final List<int>? proofConsensus;

  /// Deprecated: this field is unused.
  final ibc_core_client_v1_client.Height? consensusHeight;

  final String? signer;

  /// Deprecated: this field is unused.
  final List<int>? hostConsensusStateProof;

  const MsgConnectionOpenTry({
    this.clientId,
    this.previousConnectionId,
    this.clientState,
    this.counterparty,
    this.delayPeriod,
    this.counterpartyVersions = const [],
    this.proofHeight,
    this.proofInit,
    this.proofClient,
    this.proofConsensus,
    this.consensusHeight,
    this.signer,
    this.hostConsensusStateProof,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "signer"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(
          2,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.message(
          3,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.message(4, options: const []),
        ProtoFieldConfig.uint64(5),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.message(7, options: const []),
        ProtoFieldConfig.bytes(8),
        ProtoFieldConfig.bytes(
          9,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.bytes(
          10,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.message(
          11,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.string(12),
        ProtoFieldConfig.bytes(
          13,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    clientId,
    previousConnectionId,
    clientState,
    counterparty,
    delayPeriod,
    counterpartyVersions,
    proofHeight,
    proofInit,
    proofClient,
    proofConsensus,
    consensusHeight,
    signer,
    hostConsensusStateProof,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'client_id': clientId,
      'previous_connection_id': previousConnectionId,
      'client_state': clientState?.toJson(),
      'counterparty': counterparty?.toJson(),
      'delay_period': delayPeriod?.toString(),
      'counterparty_versions':
          counterpartyVersions.map((e) => e.toJson()).toList(),
      'proof_height': proofHeight?.toJson(),
      'proof_init': switch (proofInit) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'proof_client': switch (proofClient) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'proof_consensus': switch (proofConsensus) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'consensus_height': consensusHeight?.toJson(),
      'signer': signer,
      'host_consensus_state_proof': switch (hostConsensusStateProof) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MsgConnectionOpenTry.fromJson(Map<String, dynamic> json) {
    return MsgConnectionOpenTry(
      clientId: json.valueAsString<String?>('client_id', acceptCamelCase: true),
      previousConnectionId: json.valueAsString<String?>(
        'previous_connection_id',
        acceptCamelCase: true,
      ),
      clientState: json.valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
        key: 'client_state',
        parse: (v) => google_protobuf_any.Any.fromJson(v),
        acceptCamelCase: true,
      ),
      counterparty: json.valueTo<
        ibc_core_connection_v1_connection.Counterparty?,
        Map<String, dynamic>
      >(
        key: 'counterparty',
        parse:
            (v) => ibc_core_connection_v1_connection.Counterparty.fromJson(v),
        acceptCamelCase: true,
      ),
      delayPeriod: json.valueAsBigInt<BigInt?>(
        'delay_period',
        acceptCamelCase: true,
      ),
      counterpartyVersions:
          (json.valueEnsureAsList<dynamic>(
                'counterparty_versions',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  ibc_core_connection_v1_connection.Version,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) =>
                          ibc_core_connection_v1_connection.Version.fromJson(v),
                ),
              )
              .toList(),
      proofHeight: json
          .valueTo<ibc_core_client_v1_client.Height?, Map<String, dynamic>>(
            key: 'proof_height',
            parse: (v) => ibc_core_client_v1_client.Height.fromJson(v),
            acceptCamelCase: true,
          ),
      proofInit: json.valueAsBytes<List<int>?>(
        'proof_init',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      proofClient: json.valueAsBytes<List<int>?>(
        'proof_client',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      proofConsensus: json.valueAsBytes<List<int>?>(
        'proof_consensus',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      consensusHeight: json
          .valueTo<ibc_core_client_v1_client.Height?, Map<String, dynamic>>(
            key: 'consensus_height',
            parse: (v) => ibc_core_client_v1_client.Height.fromJson(v),
            acceptCamelCase: true,
          ),
      signer: json.valueAsString<String?>('signer', acceptCamelCase: true),
      hostConsensusStateProof: json.valueAsBytes<List<int>?>(
        'host_consensus_state_proof',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory MsgConnectionOpenTry.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgConnectionOpenTry(
      clientId: decode.getString<String?>(1),
      previousConnectionId: decode.getString<String?>(2),
      clientState: decode.messageTo<google_protobuf_any.Any?>(
        3,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
      counterparty: decode
          .messageTo<ibc_core_connection_v1_connection.Counterparty?>(
            4,
            (b) =>
                ibc_core_connection_v1_connection.Counterparty.deserialize(b),
          ),
      delayPeriod: decode.getBigInt<BigInt?>(5),
      counterpartyVersions:
          decode
              .getListOfBytes(6)
              .map(
                (b) => ibc_core_connection_v1_connection.Version.deserialize(b),
              )
              .toList(),
      proofHeight: decode.messageTo<ibc_core_client_v1_client.Height?>(
        7,
        (b) => ibc_core_client_v1_client.Height.deserialize(b),
      ),
      proofInit: decode.getBytes<List<int>?>(8),
      proofClient: decode.getBytes<List<int>?>(9),
      proofConsensus: decode.getBytes<List<int>?>(10),
      consensusHeight: decode.messageTo<ibc_core_client_v1_client.Height?>(
        11,
        (b) => ibc_core_client_v1_client.Height.deserialize(b),
      ),
      signer: decode.getString<String?>(12),
      hostConsensusStateProof: decode.getBytes<List<int>?>(13),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreConnectionV1MsgConnectionOpenTry;
  @override
  MsgConnectionOpenTryResponse onServiceResponse(List<int> bytes) {
    return MsgConnectionOpenTryResponse.deserialize(bytes);
  }

  @override
  MsgConnectionOpenTryResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgConnectionOpenTryResponse.fromJson(json);
  }
}

/// MsgConnectionOpenTryResponse defines the Msg/ConnectionOpenTry response type.
class MsgConnectionOpenTryResponse extends CosmosProtoMessage {
  const MsgConnectionOpenTryResponse();

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

  factory MsgConnectionOpenTryResponse.fromJson(Map<String, dynamic> json) {
    return MsgConnectionOpenTryResponse();
  }

  factory MsgConnectionOpenTryResponse.deserialize(List<int> bytes) {
    return MsgConnectionOpenTryResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreConnectionV1MsgConnectionOpenTryResponse;
}

/// MsgConnectionOpenAck defines a msg sent by a Relayer to Chain A to
/// acknowledge the change of connection state to TRYOPEN on Chain B.
class MsgConnectionOpenAck extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgConnectionOpenAckResponse> {
  final String? connectionId;

  final String? counterpartyConnectionId;

  final ibc_core_connection_v1_connection.Version? version;

  /// Deprecated: this field is unused.
  final google_protobuf_any.Any? clientState;

  final ibc_core_client_v1_client.Height? proofHeight;

  /// proof of the initialization the connection on Chain B: `UNINITIALIZED ->
  /// TRYOPEN`
  final List<int>? proofTry;

  /// Deprecated: this field is unused.
  final List<int>? proofClient;

  /// Deprecated: this field is unused.
  final List<int>? proofConsensus;

  /// Deprecated: this field is unused.
  final ibc_core_client_v1_client.Height? consensusHeight;

  final String? signer;

  /// Deprecated: this field is unused.
  final List<int>? hostConsensusStateProof;

  const MsgConnectionOpenAck({
    this.connectionId,
    this.counterpartyConnectionId,
    this.version,
    this.clientState,
    this.proofHeight,
    this.proofTry,
    this.proofClient,
    this.proofConsensus,
    this.consensusHeight,
    this.signer,
    this.hostConsensusStateProof,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "signer"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.message(3),
        ProtoFieldConfig.message(
          4,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.message(5, options: const []),
        ProtoFieldConfig.bytes(6),
        ProtoFieldConfig.bytes(
          7,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.bytes(
          8,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.message(
          9,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.string(10),
        ProtoFieldConfig.bytes(
          11,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    connectionId,
    counterpartyConnectionId,
    version,
    clientState,
    proofHeight,
    proofTry,
    proofClient,
    proofConsensus,
    consensusHeight,
    signer,
    hostConsensusStateProof,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'connection_id': connectionId,
      'counterparty_connection_id': counterpartyConnectionId,
      'version': version?.toJson(),
      'client_state': clientState?.toJson(),
      'proof_height': proofHeight?.toJson(),
      'proof_try': switch (proofTry) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'proof_client': switch (proofClient) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'proof_consensus': switch (proofConsensus) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'consensus_height': consensusHeight?.toJson(),
      'signer': signer,
      'host_consensus_state_proof': switch (hostConsensusStateProof) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MsgConnectionOpenAck.fromJson(Map<String, dynamic> json) {
    return MsgConnectionOpenAck(
      connectionId: json.valueAsString<String?>(
        'connection_id',
        acceptCamelCase: true,
      ),
      counterpartyConnectionId: json.valueAsString<String?>(
        'counterparty_connection_id',
        acceptCamelCase: true,
      ),
      version: json.valueTo<
        ibc_core_connection_v1_connection.Version?,
        Map<String, dynamic>
      >(
        key: 'version',
        parse: (v) => ibc_core_connection_v1_connection.Version.fromJson(v),
        acceptCamelCase: true,
      ),
      clientState: json.valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
        key: 'client_state',
        parse: (v) => google_protobuf_any.Any.fromJson(v),
        acceptCamelCase: true,
      ),
      proofHeight: json
          .valueTo<ibc_core_client_v1_client.Height?, Map<String, dynamic>>(
            key: 'proof_height',
            parse: (v) => ibc_core_client_v1_client.Height.fromJson(v),
            acceptCamelCase: true,
          ),
      proofTry: json.valueAsBytes<List<int>?>(
        'proof_try',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      proofClient: json.valueAsBytes<List<int>?>(
        'proof_client',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      proofConsensus: json.valueAsBytes<List<int>?>(
        'proof_consensus',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      consensusHeight: json
          .valueTo<ibc_core_client_v1_client.Height?, Map<String, dynamic>>(
            key: 'consensus_height',
            parse: (v) => ibc_core_client_v1_client.Height.fromJson(v),
            acceptCamelCase: true,
          ),
      signer: json.valueAsString<String?>('signer', acceptCamelCase: true),
      hostConsensusStateProof: json.valueAsBytes<List<int>?>(
        'host_consensus_state_proof',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory MsgConnectionOpenAck.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgConnectionOpenAck(
      connectionId: decode.getString<String?>(1),
      counterpartyConnectionId: decode.getString<String?>(2),
      version: decode.messageTo<ibc_core_connection_v1_connection.Version?>(
        3,
        (b) => ibc_core_connection_v1_connection.Version.deserialize(b),
      ),
      clientState: decode.messageTo<google_protobuf_any.Any?>(
        4,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
      proofHeight: decode.messageTo<ibc_core_client_v1_client.Height?>(
        5,
        (b) => ibc_core_client_v1_client.Height.deserialize(b),
      ),
      proofTry: decode.getBytes<List<int>?>(6),
      proofClient: decode.getBytes<List<int>?>(7),
      proofConsensus: decode.getBytes<List<int>?>(8),
      consensusHeight: decode.messageTo<ibc_core_client_v1_client.Height?>(
        9,
        (b) => ibc_core_client_v1_client.Height.deserialize(b),
      ),
      signer: decode.getString<String?>(10),
      hostConsensusStateProof: decode.getBytes<List<int>?>(11),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreConnectionV1MsgConnectionOpenAck;
  @override
  MsgConnectionOpenAckResponse onServiceResponse(List<int> bytes) {
    return MsgConnectionOpenAckResponse.deserialize(bytes);
  }

  @override
  MsgConnectionOpenAckResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgConnectionOpenAckResponse.fromJson(json);
  }
}

/// MsgConnectionOpenAckResponse defines the Msg/ConnectionOpenAck response type.
class MsgConnectionOpenAckResponse extends CosmosProtoMessage {
  const MsgConnectionOpenAckResponse();

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

  factory MsgConnectionOpenAckResponse.fromJson(Map<String, dynamic> json) {
    return MsgConnectionOpenAckResponse();
  }

  factory MsgConnectionOpenAckResponse.deserialize(List<int> bytes) {
    return MsgConnectionOpenAckResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreConnectionV1MsgConnectionOpenAckResponse;
}

/// MsgConnectionOpenConfirm defines a msg sent by a Relayer to Chain B to
/// acknowledge the change of connection state to OPEN on Chain A.
class MsgConnectionOpenConfirm extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgConnectionOpenConfirmResponse> {
  final String? connectionId;

  /// proof for the change of the connection state on Chain A: `INIT -> OPEN`
  final List<int>? proofAck;

  final ibc_core_client_v1_client.Height? proofHeight;

  final String? signer;

  const MsgConnectionOpenConfirm({
    this.connectionId,
    this.proofAck,
    this.proofHeight,
    this.signer,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "signer"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.string(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    connectionId,
    proofAck,
    proofHeight,
    signer,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'connection_id': connectionId,
      'proof_ack': switch (proofAck) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'proof_height': proofHeight?.toJson(),
      'signer': signer,
    };
  }

  factory MsgConnectionOpenConfirm.fromJson(Map<String, dynamic> json) {
    return MsgConnectionOpenConfirm(
      connectionId: json.valueAsString<String?>(
        'connection_id',
        acceptCamelCase: true,
      ),
      proofAck: json.valueAsBytes<List<int>?>(
        'proof_ack',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      proofHeight: json
          .valueTo<ibc_core_client_v1_client.Height?, Map<String, dynamic>>(
            key: 'proof_height',
            parse: (v) => ibc_core_client_v1_client.Height.fromJson(v),
            acceptCamelCase: true,
          ),
      signer: json.valueAsString<String?>('signer', acceptCamelCase: true),
    );
  }

  factory MsgConnectionOpenConfirm.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgConnectionOpenConfirm(
      connectionId: decode.getString<String?>(1),
      proofAck: decode.getBytes<List<int>?>(2),
      proofHeight: decode.messageTo<ibc_core_client_v1_client.Height?>(
        3,
        (b) => ibc_core_client_v1_client.Height.deserialize(b),
      ),
      signer: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreConnectionV1MsgConnectionOpenConfirm;
  @override
  MsgConnectionOpenConfirmResponse onServiceResponse(List<int> bytes) {
    return MsgConnectionOpenConfirmResponse.deserialize(bytes);
  }

  @override
  MsgConnectionOpenConfirmResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgConnectionOpenConfirmResponse.fromJson(json);
  }
}

/// MsgConnectionOpenConfirmResponse defines the Msg/ConnectionOpenConfirm
/// response type.
class MsgConnectionOpenConfirmResponse extends CosmosProtoMessage {
  const MsgConnectionOpenConfirmResponse();

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

  factory MsgConnectionOpenConfirmResponse.fromJson(Map<String, dynamic> json) {
    return MsgConnectionOpenConfirmResponse();
  }

  factory MsgConnectionOpenConfirmResponse.deserialize(List<int> bytes) {
    return MsgConnectionOpenConfirmResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcCoreConnectionV1MsgConnectionOpenConfirmResponse;
}

/// MsgUpdateParams defines the sdk.Msg type to update the connection parameters.
class MsgUpdateParams extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgUpdateParamsResponse> {
  /// signer address
  final String? signer;

  /// params defines the connection parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final ibc_core_connection_v1_connection.Params? params;

  const MsgUpdateParams({this.signer, this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "signer"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [signer, params];

  @override
  Map<String, dynamic> toJson() {
    return {'signer': signer, 'params': params?.toJson()};
  }

  factory MsgUpdateParams.fromJson(Map<String, dynamic> json) {
    return MsgUpdateParams(
      signer: json.valueAsString<String?>('signer', acceptCamelCase: true),
      params: json.valueTo<
        ibc_core_connection_v1_connection.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse: (v) => ibc_core_connection_v1_connection.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      signer: decode.getString<String?>(1),
      params: decode.messageTo<ibc_core_connection_v1_connection.Params?>(
        2,
        (b) => ibc_core_connection_v1_connection.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreConnectionV1MsgUpdateParams;
  @override
  MsgUpdateParamsResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateParamsResponse.deserialize(bytes);
  }

  @override
  MsgUpdateParamsResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateParamsResponse.fromJson(json);
  }
}

/// MsgUpdateParamsResponse defines the MsgUpdateParams response type.
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
      DefaultCosmosProtoTypeUrl.ibcCoreConnectionV1MsgUpdateParamsResponse;
}
