import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Packet defines a type that carries data across different chains through IBC
class Packet extends CosmosProtoMessage {
  /// number corresponds to the order of sends and receives, where a Packet
  /// with an earlier sequence number must be sent and received before a Packet
  /// with a later sequence number.
  final BigInt? sequence;

  /// identifies the sending client on the sending chain.
  final String? sourceClient;

  /// identifies the receiving client on the receiving chain.
  final String? destinationClient;

  /// timeout timestamp in seconds after which the packet times out.
  final BigInt? timeoutTimestamp;

  /// a list of payloads, each one for a specific application.
  final List<Payload> payloads;

  const Packet({
    this.sequence,
    this.sourceClient,
    this.destinationClient,
    this.timeoutTimestamp,
    this.payloads = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.uint64(4),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sequence,
    sourceClient,
    destinationClient,
    timeoutTimestamp,
    payloads,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sequence': sequence?.toString(),
      'source_client': sourceClient,
      'destination_client': destinationClient,
      'timeout_timestamp': timeoutTimestamp?.toString(),
      'payloads': payloads.map((e) => e.toJson()).toList(),
    };
  }

  factory Packet.fromJson(Map<String, dynamic> json) {
    return Packet(
      sequence: json.valueAsBigInt<BigInt?>('sequence', acceptCamelCase: true),
      sourceClient: json.valueAsString<String?>(
        'source_client',
        acceptCamelCase: true,
      ),
      destinationClient: json.valueAsString<String?>(
        'destination_client',
        acceptCamelCase: true,
      ),
      timeoutTimestamp: json.valueAsBigInt<BigInt?>(
        'timeout_timestamp',
        acceptCamelCase: true,
      ),
      payloads:
          (json.valueEnsureAsList<dynamic>('payloads', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<Payload, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => Payload.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory Packet.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Packet(
      sequence: decode.getBigInt<BigInt?>(1),
      sourceClient: decode.getString<String?>(2),
      destinationClient: decode.getString<String?>(3),
      timeoutTimestamp: decode.getBigInt<BigInt?>(4),
      payloads:
          decode.getListOfBytes(5).map((b) => Payload.deserialize(b)).toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV2Packet;
}

/// Payload contains the source and destination ports and payload for the application (version, encoding, raw bytes)
class Payload extends CosmosProtoMessage {
  /// specifies the source port of the packet.
  final String? sourcePort;

  /// specifies the destination port of the packet.
  final String? destinationPort;

  /// version of the specified application.
  final String? version;

  /// the encoding used for the provided value.
  final String? encoding;

  /// the raw bytes for the payload.
  final List<int>? value;

  const Payload({
    this.sourcePort,
    this.destinationPort,
    this.version,
    this.encoding,
    this.value,
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
        ProtoFieldConfig.bytes(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sourcePort,
    destinationPort,
    version,
    encoding,
    value,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'source_port': sourcePort,
      'destination_port': destinationPort,
      'version': version,
      'encoding': encoding,
      'value': switch (value) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory Payload.fromJson(Map<String, dynamic> json) {
    return Payload(
      sourcePort: json.valueAsString<String?>(
        'source_port',
        acceptCamelCase: true,
      ),
      destinationPort: json.valueAsString<String?>(
        'destination_port',
        acceptCamelCase: true,
      ),
      version: json.valueAsString<String?>('version', acceptCamelCase: true),
      encoding: json.valueAsString<String?>('encoding', acceptCamelCase: true),
      value: json.valueAsBytes<List<int>?>(
        'value',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory Payload.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Payload(
      sourcePort: decode.getString<String?>(1),
      destinationPort: decode.getString<String?>(2),
      version: decode.getString<String?>(3),
      encoding: decode.getString<String?>(4),
      value: decode.getBytes<List<int>?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV2Payload;
}

/// Acknowledgement contains a list of all ack results associated with a single packet.
/// In the case of a successful receive, the acknowledgement will contain an app acknowledgement
/// for each application that received a payload in the same order that the payloads were sent
/// in the packet.
/// If the receive is not successful, the acknowledgement will contain a single app acknowledgment
/// which will be a constant error acknowledgment as defined by the IBC v2 protocol.
class Acknowledgement extends CosmosProtoMessage {
  final List<List<int>> appAcknowledgements;

  const Acknowledgement({this.appAcknowledgements = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.bytes,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [appAcknowledgements];

  @override
  Map<String, dynamic> toJson() {
    return {
      'app_acknowledgements':
          appAcknowledgements
              .map(
                (e) => StringUtils.decode(e, encoding: StringEncoding.base64),
              )
              .toList(),
    };
  }

  factory Acknowledgement.fromJson(Map<String, dynamic> json) {
    return Acknowledgement(
      appAcknowledgements:
          (json.valueEnsureAsList<dynamic>(
                'app_acknowledgements',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueAsBytes<List<int>>(
                  e,
                  encoding: StringEncoding.base64,
                ),
              )
              .toList(),
    );
  }

  factory Acknowledgement.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Acknowledgement(appAcknowledgements: decode.getListOfBytes(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV2Acknowledgement;
}
