import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/ibc/core/client/v1/src/client.dart"
    as ibc_core_client_v1_client;

/// State defines if a channel is in one of the following states:
/// CLOSED, INIT, TRYOPEN, OPEN, or UNINITIALIZED.
enum State implements ProtoEnumVariant {
  /// Default State
  stateUninitializedUnspecified(0, 'STATE_UNINITIALIZED_UNSPECIFIED'),

  /// A channel has just started the opening handshake.
  stateInit(1, 'STATE_INIT'),

  /// A channel has acknowledged the handshake step on the counterparty chain.
  stateTryopen(2, 'STATE_TRYOPEN'),

  /// A channel has completed the handshake. Open channels are
  /// ready to send and receive packets.
  stateOpen(3, 'STATE_OPEN'),

  /// A channel has been closed and can no longer be used to send or receive
  /// packets.
  stateClosed(4, 'STATE_CLOSED');

  const State(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static State fromValue(int? value) {
    value ??= 0;
    return State.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching State found for the given value. $value",
                details: {"name": "State", "value": value?.toString()},
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static State from(Object? value) {
    value ??= 0;
    return State.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching State found for the given value. $value",
                details: {"name": "State", "value": value?.toString()},
              ),
    );
  }
}

/// Order defines if a channel is ORDERED or UNORDERED
enum Order implements ProtoEnumVariant {
  /// zero-value for channel ordering
  orderNoneUnspecified(0, 'ORDER_NONE_UNSPECIFIED'),

  /// packets can be delivered in any order, which may differ from the order in
  /// which they were sent.
  orderUnordered(1, 'ORDER_UNORDERED'),

  /// packets are delivered exactly in the order which they were sent
  orderOrdered(2, 'ORDER_ORDERED');

  const Order(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static Order fromValue(int? value) {
    value ??= 0;
    return Order.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching Order found for the given value. $value",
                details: {"name": "Order", "value": value?.toString()},
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static Order from(Object? value) {
    value ??= 0;
    return Order.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching Order found for the given value. $value",
                details: {"name": "Order", "value": value?.toString()},
              ),
    );
  }
}

/// Channel defines pipeline for exactly-once packet delivery between specific
/// modules on separate blockchains, which has at least one end capable of
/// sending packets and one end capable of receiving packets.
class Channel extends CosmosProtoMessage {
  /// current state of the channel end
  final State? state;

  /// whether the channel is ordered or unordered
  final Order? ordering;

  /// counterparty channel end
  final Counterparty? counterparty;

  /// list of connection identifiers, in order, along which packets sent on
  /// this channel will travel
  final List<String> connectionHops;

  /// opaque channel version, which is agreed upon during the handshake
  final String? version;

  const Channel({
    this.state,
    this.ordering,
    this.counterparty,
    this.connectionHops = const [],
    this.version,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.enumType(1),
        ProtoFieldConfig.enumType(2),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.string(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    state,
    ordering,
    counterparty,
    connectionHops,
    version,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'state': config.encodeEnum(state),
      'ordering': config.encodeEnum(ordering),
      'counterparty': config.encodeMessage(counterparty),
      'connection_hops': connectionHops.map((e) => e).toList(),
      'version': version,
    };
  }

  factory Channel.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Channel(
      state: json.valueTo<State?, Object?>(
        key: 'state',
        parse: (v) => State.from(v),
      ),
      ordering: json.valueTo<Order?, Object?>(
        key: 'ordering',
        parse: (v) => Order.from(v),
      ),
      counterparty: json.valueTo<Counterparty?, Object>(
        key: 'counterparty',
        parse:
            (v) => Counterparty.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      connectionHops:
          (json.valueEnsureAsList<dynamic>(
            'connection_hops',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      version: json.valueAsString<String?>(
        'version',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Channel.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Channel(
      state: decode.getEnum<State?>(1, State.values),
      ordering: decode.getEnum<Order?>(2, Order.values),
      counterparty: decode.messageTo<Counterparty?>(
        3,
        (b) => Counterparty.deserialize(b),
      ),
      connectionHops: decode.getListOrEmpty<String>(4),
      version: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1Channel;
}

/// IdentifiedChannel defines a channel with additional port and channel
/// identifier fields.
class IdentifiedChannel extends CosmosProtoMessage {
  /// current state of the channel end
  final State? state;

  /// whether the channel is ordered or unordered
  final Order? ordering;

  /// counterparty channel end
  final Counterparty? counterparty;

  /// list of connection identifiers, in order, along which packets sent on
  /// this channel will travel
  final List<String> connectionHops;

  /// opaque channel version, which is agreed upon during the handshake
  final String? version;

  /// port identifier
  final String? portId;

  /// channel identifier
  final String? channelId;

  const IdentifiedChannel({
    this.state,
    this.ordering,
    this.counterparty,
    this.connectionHops = const [],
    this.version,
    this.portId,
    this.channelId,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.enumType(1),
        ProtoFieldConfig.enumType(2),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.string(6),
        ProtoFieldConfig.string(7),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    state,
    ordering,
    counterparty,
    connectionHops,
    version,
    portId,
    channelId,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'state': config.encodeEnum(state),
      'ordering': config.encodeEnum(ordering),
      'counterparty': config.encodeMessage(counterparty),
      'connection_hops': connectionHops.map((e) => e).toList(),
      'version': version,
      'port_id': portId,
      'channel_id': channelId,
    };
  }

  factory IdentifiedChannel.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return IdentifiedChannel(
      state: json.valueTo<State?, Object?>(
        key: 'state',
        parse: (v) => State.from(v),
      ),
      ordering: json.valueTo<Order?, Object?>(
        key: 'ordering',
        parse: (v) => Order.from(v),
      ),
      counterparty: json.valueTo<Counterparty?, Object>(
        key: 'counterparty',
        parse:
            (v) => Counterparty.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      connectionHops:
          (json.valueEnsureAsList<dynamic>(
            'connection_hops',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      version: json.valueAsString<String?>(
        'version',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      portId: json.valueAsString<String?>(
        'port_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      channelId: json.valueAsString<String?>(
        'channel_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory IdentifiedChannel.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return IdentifiedChannel(
      state: decode.getEnum<State?>(1, State.values),
      ordering: decode.getEnum<Order?>(2, Order.values),
      counterparty: decode.messageTo<Counterparty?>(
        3,
        (b) => Counterparty.deserialize(b),
      ),
      connectionHops: decode.getListOrEmpty<String>(4),
      version: decode.getString<String?>(5),
      portId: decode.getString<String?>(6),
      channelId: decode.getString<String?>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1IdentifiedChannel;
}

/// Counterparty defines a channel end counterparty
class Counterparty extends CosmosProtoMessage {
  /// port on the counterparty chain which owns the other end of the channel.
  final String? portId;

  /// channel end on the counterparty chain
  final String? channelId;

  const Counterparty({this.portId, this.channelId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [portId, channelId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'port_id': portId, 'channel_id': channelId};
  }

  factory Counterparty.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Counterparty(
      portId: json.valueAsString<String?>(
        'port_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      channelId: json.valueAsString<String?>(
        'channel_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Counterparty.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Counterparty(
      portId: decode.getString<String?>(1),
      channelId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1Counterparty;
}

/// Packet defines a type that carries data across different chains through IBC
class Packet extends CosmosProtoMessage {
  /// number corresponds to the order of sends and receives, where a Packet
  /// with an earlier sequence number must be sent and received before a Packet
  /// with a later sequence number.
  final BigInt? sequence;

  /// identifies the port on the sending chain.
  final String? sourcePort;

  /// identifies the channel end on the sending chain.
  final String? sourceChannel;

  /// identifies the port on the receiving chain.
  final String? destinationPort;

  /// identifies the channel end on the receiving chain.
  final String? destinationChannel;

  /// actual opaque bytes transferred directly to the application module
  final BuBytes? data;

  /// block height after which the packet times out
  final ibc_core_client_v1_client.Height? timeoutHeight;

  /// block timestamp (in nanoseconds) after which the packet times out
  final BigInt? timeoutTimestamp;

  Packet({
    this.sequence,
    this.sourcePort,
    this.sourceChannel,
    this.destinationPort,
    this.destinationChannel,
    List<int>? data,
    this.timeoutHeight,
    this.timeoutTimestamp,
  }) : data = data?.asImmutableBytes;

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
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.bytes(6),
        ProtoFieldConfig.message(7, options: const []),
        ProtoFieldConfig.uint64(8),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sequence,
    sourcePort,
    sourceChannel,
    destinationPort,
    destinationChannel,
    data,
    timeoutHeight,
    timeoutTimestamp,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'sequence': config.encodeBigint(sequence),
      'source_port': sourcePort,
      'source_channel': sourceChannel,
      'destination_port': destinationPort,
      'destination_channel': destinationChannel,
      'data': config.encodeBinary(data),
      'timeout_height': config.encodeMessage(timeoutHeight),
      'timeout_timestamp': config.encodeBigint(timeoutTimestamp),
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
      sourcePort: json.valueAsString<String?>(
        'source_port',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      sourceChannel: json.valueAsString<String?>(
        'source_channel',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      destinationPort: json.valueAsString<String?>(
        'destination_port',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      destinationChannel: json.valueAsString<String?>(
        'destination_channel',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      data: config.decodeBinary<List<int>?>(
        json.valueAs('data', normalizeKeyLookup: config.normalizeKeys),
      ),
      timeoutHeight: json.valueTo<ibc_core_client_v1_client.Height?, Object>(
        key: 'timeout_height',
        parse:
            (v) => ibc_core_client_v1_client.Height.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      timeoutTimestamp: json.valueAsBigInt<BigInt?>(
        'timeout_timestamp',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Packet.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Packet(
      sequence: decode.getBigInt<BigInt?>(1),
      sourcePort: decode.getString<String?>(2),
      sourceChannel: decode.getString<String?>(3),
      destinationPort: decode.getString<String?>(4),
      destinationChannel: decode.getString<String?>(5),
      data: decode.getBytes<List<int>?>(6),
      timeoutHeight: decode.messageTo<ibc_core_client_v1_client.Height?>(
        7,
        (b) => ibc_core_client_v1_client.Height.deserialize(b),
      ),
      timeoutTimestamp: decode.getBigInt<BigInt?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1Packet;
}

/// PacketState defines the generic type necessary to retrieve and store
/// packet commitments, acknowledgements, and receipts.
/// Caller is responsible for knowing the context necessary to interpret this
/// state as a commitment, acknowledgement, or a receipt.
class PacketState extends CosmosProtoMessage {
  /// channel port identifier.
  final String? portId;

  /// channel unique identifier.
  final String? channelId;

  /// packet sequence.
  final BigInt? sequence;

  /// embedded data that represents packet state.
  final BuBytes? data;

  PacketState({this.portId, this.channelId, this.sequence, List<int>? data})
    : data = data?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.bytes(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [portId, channelId, sequence, data];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'port_id': portId,
      'channel_id': channelId,
      'sequence': config.encodeBigint(sequence),
      'data': config.encodeBinary(data),
    };
  }

  factory PacketState.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return PacketState(
      portId: json.valueAsString<String?>(
        'port_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      channelId: json.valueAsString<String?>(
        'channel_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      sequence: json.valueAsBigInt<BigInt?>(
        'sequence',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      data: config.decodeBinary<List<int>?>(
        json.valueAs('data', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory PacketState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PacketState(
      portId: decode.getString<String?>(1),
      channelId: decode.getString<String?>(2),
      sequence: decode.getBigInt<BigInt?>(3),
      data: decode.getBytes<List<int>?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1PacketState;
}
