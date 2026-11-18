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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'sequence': config.encodeBigint(sequence),
      'source_client': sourceClient,
      'destination_client': destinationClient,
      'timeout_timestamp': config.encodeBigint(timeoutTimestamp),
      'payloads': payloads.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory Packet.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Packet(
      sequence: json.valueAsBigInt<BigInt?>(
        'sequence',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      sourceClient: json.valueAsString<String?>(
        'source_client',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      destinationClient: json.valueAsString<String?>(
        'destination_client',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      timeoutTimestamp: json.valueAsBigInt<BigInt?>(
        'timeout_timestamp',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      payloads:
          (json.valueEnsureAsList<dynamic>(
                'payloads',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<Payload, Object>(
                  value: e,
                  parse:
                      (v) => Payload.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
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
  final BuBytes? value;

  Payload({
    this.sourcePort,
    this.destinationPort,
    this.version,
    this.encoding,
    List<int>? value,
  }) : value = value?.asImmutableBytes;

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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'source_port': sourcePort,
      'destination_port': destinationPort,
      'version': version,
      'encoding': encoding,
      'value': config.encodeBinary(value),
    };
  }

  factory Payload.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Payload(
      sourcePort: json.valueAsString<String?>(
        'source_port',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      destinationPort: json.valueAsString<String?>(
        'destination_port',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      version: json.valueAsString<String?>(
        'version',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      encoding: json.valueAsString<String?>(
        'encoding',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      value: config.decodeBinary<List<int>?>(
        json.valueAs('value', normalizeKeyLookup: config.normalizeKeys),
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
  final List<BuBytes> appAcknowledgements;

  Acknowledgement({List<List<int>> appAcknowledgements = const []})
    : appAcknowledgements =
          appAcknowledgements.map((e) => e.asImmutableBytes).toImutableList;

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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'app_acknowledgements':
          appAcknowledgements.map((e) => config.encodeBinary(e)).toList(),
    };
  }

  factory Acknowledgement.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Acknowledgement(
      appAcknowledgements:
          (json.valueEnsureAsList<dynamic>(
            'app_acknowledgements',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => config.decodeBinary<List<int>>(e)).toList(),
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
