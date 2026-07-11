import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/ibc/core/channel/v2/src/packet.dart"
    as ibc_core_channel_v2_packet;
import "package:cosmos_sdk/proto_messages/ibc/core/client/v1/src/client.dart"
    as ibc_core_client_v1_client;

/// ResponseResultType defines the possible outcomes of the execution of a message
enum ResponseResultType implements ProtoEnumVariant {
  /// Default zero value enumeration
  responseResultTypeUnspecified(0, 'RESPONSE_RESULT_TYPE_UNSPECIFIED'),

  /// The message did not call the IBC application callbacks (because, for example, the packet had already been relayed)
  responseResultTypeNoop(1, 'RESPONSE_RESULT_TYPE_NOOP'),

  /// The message was executed successfully
  responseResultTypeSuccess(2, 'RESPONSE_RESULT_TYPE_SUCCESS'),

  /// The message was executed unsuccessfully
  responseResultTypeFailure(3, 'RESPONSE_RESULT_TYPE_FAILURE');

  const ResponseResultType(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static ResponseResultType fromValue(int? value) {
    return ResponseResultType.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "ResponseResultType",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static ResponseResultType from(Object? value) {
    return ResponseResultType.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "ResponseResultType",
                value: value,
              ),
    );
  }
}

/// MsgSendPacket sends an outgoing IBC packet.
class MsgSendPacket extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgSendPacketResponse> {
  final String? sourceClient;

  final BigInt? timeoutTimestamp;

  final List<ibc_core_channel_v2_packet.Payload> payloads;

  final String? signer;

  const MsgSendPacket({
    this.sourceClient,
    this.timeoutTimestamp,
    this.payloads = const [],
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
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.string(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sourceClient,
    timeoutTimestamp,
    payloads,
    signer,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'source_client': sourceClient,
      'timeout_timestamp': timeoutTimestamp?.toString(),
      'payloads': payloads.map((e) => e.toJson()).toList(),
      'signer': signer,
    };
  }

  factory MsgSendPacket.fromJson(Map<String, dynamic> json) {
    return MsgSendPacket(
      sourceClient: json.valueAsString<String?>(
        'source_client',
        acceptCamelCase: true,
      ),
      timeoutTimestamp: json.valueAsBigInt<BigInt?>(
        'timeout_timestamp',
        acceptCamelCase: true,
      ),
      payloads:
          (json.valueEnsureAsList<dynamic>('payloads', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  ibc_core_channel_v2_packet.Payload,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => ibc_core_channel_v2_packet.Payload.fromJson(v),
                ),
              )
              .toList(),
      signer: json.valueAsString<String?>('signer', acceptCamelCase: true),
    );
  }

  factory MsgSendPacket.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSendPacket(
      sourceClient: decode.getString<String?>(1),
      timeoutTimestamp: decode.getBigInt<BigInt?>(2),
      payloads:
          decode
              .getListOfBytes(3)
              .map((b) => ibc_core_channel_v2_packet.Payload.deserialize(b))
              .toList(),
      signer: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV2MsgSendPacket;
  @override
  MsgSendPacketResponse onServiceResponse(List<int> bytes) {
    return MsgSendPacketResponse.deserialize(bytes);
  }

  @override
  MsgSendPacketResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgSendPacketResponse.fromJson(json);
  }
}

/// MsgSendPacketResponse defines the Msg/SendPacket response type.
class MsgSendPacketResponse extends CosmosProtoMessage {
  final BigInt? sequence;

  const MsgSendPacketResponse({this.sequence});

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

  factory MsgSendPacketResponse.fromJson(Map<String, dynamic> json) {
    return MsgSendPacketResponse(
      sequence: json.valueAsBigInt<BigInt?>('sequence', acceptCamelCase: true),
    );
  }

  factory MsgSendPacketResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSendPacketResponse(sequence: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV2MsgSendPacketResponse;
}

/// MsgRecvPacket receives an incoming IBC packet.
class MsgRecvPacket extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgRecvPacketResponse> {
  final ibc_core_channel_v2_packet.Packet? packet;

  final List<int>? proofCommitment;

  final ibc_core_client_v1_client.Height? proofHeight;

  final String? signer;

  const MsgRecvPacket({
    this.packet,
    this.proofCommitment,
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
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.string(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    packet,
    proofCommitment,
    proofHeight,
    signer,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'packet': packet?.toJson(),
      'proof_commitment': switch (proofCommitment) {
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

  factory MsgRecvPacket.fromJson(Map<String, dynamic> json) {
    return MsgRecvPacket(
      packet: json
          .valueTo<ibc_core_channel_v2_packet.Packet?, Map<String, dynamic>>(
            key: 'packet',
            parse: (v) => ibc_core_channel_v2_packet.Packet.fromJson(v),
            acceptCamelCase: true,
          ),
      proofCommitment: json.valueAsBytes<List<int>?>(
        'proof_commitment',
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

  factory MsgRecvPacket.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRecvPacket(
      packet: decode.messageTo<ibc_core_channel_v2_packet.Packet?>(
        1,
        (b) => ibc_core_channel_v2_packet.Packet.deserialize(b),
      ),
      proofCommitment: decode.getBytes<List<int>?>(2),
      proofHeight: decode.messageTo<ibc_core_client_v1_client.Height?>(
        3,
        (b) => ibc_core_client_v1_client.Height.deserialize(b),
      ),
      signer: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV2MsgRecvPacket;
  @override
  MsgRecvPacketResponse onServiceResponse(List<int> bytes) {
    return MsgRecvPacketResponse.deserialize(bytes);
  }

  @override
  MsgRecvPacketResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgRecvPacketResponse.fromJson(json);
  }
}

/// MsgRecvPacketResponse defines the Msg/RecvPacket response type.
class MsgRecvPacketResponse extends CosmosProtoMessage {
  final ResponseResultType? result;

  const MsgRecvPacketResponse({this.result});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.enumType(1)],
    );
  }

  @override
  List<Object?> get protoValues => [result];

  @override
  Map<String, dynamic> toJson() {
    return {'result': result?.protoName};
  }

  factory MsgRecvPacketResponse.fromJson(Map<String, dynamic> json) {
    return MsgRecvPacketResponse(
      result: json.valueTo<ResponseResultType?, Object?>(
        key: 'result',
        parse: (v) => ResponseResultType.from(v),
      ),
    );
  }

  factory MsgRecvPacketResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRecvPacketResponse(
      result: decode.getEnum<ResponseResultType?>(1, ResponseResultType.values),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV2MsgRecvPacketResponse;
}

/// MsgTimeout receives timed-out packet
class MsgTimeout extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgTimeoutResponse> {
  final ibc_core_channel_v2_packet.Packet? packet;

  final List<int>? proofUnreceived;

  final ibc_core_client_v1_client.Height? proofHeight;

  final String? signer;

  const MsgTimeout({
    this.packet,
    this.proofUnreceived,
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
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.string(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    packet,
    proofUnreceived,
    proofHeight,
    signer,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'packet': packet?.toJson(),
      'proof_unreceived': switch (proofUnreceived) {
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

  factory MsgTimeout.fromJson(Map<String, dynamic> json) {
    return MsgTimeout(
      packet: json
          .valueTo<ibc_core_channel_v2_packet.Packet?, Map<String, dynamic>>(
            key: 'packet',
            parse: (v) => ibc_core_channel_v2_packet.Packet.fromJson(v),
            acceptCamelCase: true,
          ),
      proofUnreceived: json.valueAsBytes<List<int>?>(
        'proof_unreceived',
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

  factory MsgTimeout.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgTimeout(
      packet: decode.messageTo<ibc_core_channel_v2_packet.Packet?>(
        1,
        (b) => ibc_core_channel_v2_packet.Packet.deserialize(b),
      ),
      proofUnreceived: decode.getBytes<List<int>?>(2),
      proofHeight: decode.messageTo<ibc_core_client_v1_client.Height?>(
        3,
        (b) => ibc_core_client_v1_client.Height.deserialize(b),
      ),
      signer: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV2MsgTimeout;
  @override
  MsgTimeoutResponse onServiceResponse(List<int> bytes) {
    return MsgTimeoutResponse.deserialize(bytes);
  }

  @override
  MsgTimeoutResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgTimeoutResponse.fromJson(json);
  }
}

/// MsgTimeoutResponse defines the Msg/Timeout response type.
class MsgTimeoutResponse extends CosmosProtoMessage {
  final ResponseResultType? result;

  const MsgTimeoutResponse({this.result});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.enumType(1)],
    );
  }

  @override
  List<Object?> get protoValues => [result];

  @override
  Map<String, dynamic> toJson() {
    return {'result': result?.protoName};
  }

  factory MsgTimeoutResponse.fromJson(Map<String, dynamic> json) {
    return MsgTimeoutResponse(
      result: json.valueTo<ResponseResultType?, Object?>(
        key: 'result',
        parse: (v) => ResponseResultType.from(v),
      ),
    );
  }

  factory MsgTimeoutResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgTimeoutResponse(
      result: decode.getEnum<ResponseResultType?>(1, ResponseResultType.values),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV2MsgTimeoutResponse;
}

/// MsgAcknowledgement receives incoming IBC acknowledgement.
class MsgAcknowledgement extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgAcknowledgementResponse> {
  final ibc_core_channel_v2_packet.Packet? packet;

  final ibc_core_channel_v2_packet.Acknowledgement? acknowledgement;

  final List<int>? proofAcked;

  final ibc_core_client_v1_client.Height? proofHeight;

  final String? signer;

  const MsgAcknowledgement({
    this.packet,
    this.acknowledgement,
    this.proofAcked,
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
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.bytes(3),
        ProtoFieldConfig.message(4, options: const []),
        ProtoFieldConfig.string(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    packet,
    acknowledgement,
    proofAcked,
    proofHeight,
    signer,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'packet': packet?.toJson(),
      'acknowledgement': acknowledgement?.toJson(),
      'proof_acked': switch (proofAcked) {
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

  factory MsgAcknowledgement.fromJson(Map<String, dynamic> json) {
    return MsgAcknowledgement(
      packet: json
          .valueTo<ibc_core_channel_v2_packet.Packet?, Map<String, dynamic>>(
            key: 'packet',
            parse: (v) => ibc_core_channel_v2_packet.Packet.fromJson(v),
            acceptCamelCase: true,
          ),
      acknowledgement: json.valueTo<
        ibc_core_channel_v2_packet.Acknowledgement?,
        Map<String, dynamic>
      >(
        key: 'acknowledgement',
        parse: (v) => ibc_core_channel_v2_packet.Acknowledgement.fromJson(v),
        acceptCamelCase: true,
      ),
      proofAcked: json.valueAsBytes<List<int>?>(
        'proof_acked',
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

  factory MsgAcknowledgement.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgAcknowledgement(
      packet: decode.messageTo<ibc_core_channel_v2_packet.Packet?>(
        1,
        (b) => ibc_core_channel_v2_packet.Packet.deserialize(b),
      ),
      acknowledgement: decode
          .messageTo<ibc_core_channel_v2_packet.Acknowledgement?>(
            2,
            (b) => ibc_core_channel_v2_packet.Acknowledgement.deserialize(b),
          ),
      proofAcked: decode.getBytes<List<int>?>(3),
      proofHeight: decode.messageTo<ibc_core_client_v1_client.Height?>(
        4,
        (b) => ibc_core_client_v1_client.Height.deserialize(b),
      ),
      signer: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV2MsgAcknowledgement;
  @override
  MsgAcknowledgementResponse onServiceResponse(List<int> bytes) {
    return MsgAcknowledgementResponse.deserialize(bytes);
  }

  @override
  MsgAcknowledgementResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgAcknowledgementResponse.fromJson(json);
  }
}

/// MsgAcknowledgementResponse defines the Msg/Acknowledgement response type.
class MsgAcknowledgementResponse extends CosmosProtoMessage {
  final ResponseResultType? result;

  const MsgAcknowledgementResponse({this.result});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.enumType(1)],
    );
  }

  @override
  List<Object?> get protoValues => [result];

  @override
  Map<String, dynamic> toJson() {
    return {'result': result?.protoName};
  }

  factory MsgAcknowledgementResponse.fromJson(Map<String, dynamic> json) {
    return MsgAcknowledgementResponse(
      result: json.valueTo<ResponseResultType?, Object?>(
        key: 'result',
        parse: (v) => ResponseResultType.from(v),
      ),
    );
  }

  factory MsgAcknowledgementResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgAcknowledgementResponse(
      result: decode.getEnum<ResponseResultType?>(1, ResponseResultType.values),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV2MsgAcknowledgementResponse;
}
