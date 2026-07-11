import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/ibc/core/commitment/v1/src/commitment.dart"
    as ibc_core_commitment_v1_commitment;

/// State defines if a connection is in one of the following states:
/// INIT, TRYOPEN, OPEN or UNINITIALIZED.
enum State implements ProtoEnumVariant {
  /// Default State
  stateUninitializedUnspecified(0, 'STATE_UNINITIALIZED_UNSPECIFIED'),

  /// A connection end has just started the opening handshake.
  stateInit(1, 'STATE_INIT'),

  /// A connection end has acknowledged the handshake step on the counterparty
  /// chain.
  stateTryopen(2, 'STATE_TRYOPEN'),

  /// A connection end has completed the handshake.
  stateOpen(3, 'STATE_OPEN');

  const State(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static State fromValue(int? value) {
    return State.values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw ItemNotFoundException(name: "State", value: value),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static State from(Object? value) {
    return State.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse: () => throw ItemNotFoundException(name: "State", value: value),
    );
  }
}

/// ICS03 - Connection Data Structures as defined in
/// https://github.com/cosmos/ibc/blob/master/spec/core/ics-003-connection-semantics#data-structures
/// ConnectionEnd defines a stateful object on a chain connected to another
/// separate one.
/// NOTE: there must only be 2 defined ConnectionEnds to establish
/// a connection between two chains.
class ConnectionEnd extends CosmosProtoMessage {
  /// client associated with this connection.
  final String? clientId;

  /// IBC version which can be utilised to determine encodings or protocols for
  /// channels or packets utilising this connection.
  final List<Version> versions;

  /// current state of the connection end.
  final State? state;

  /// counterparty chain associated with this connection.
  final Counterparty? counterparty;

  /// delay period that must pass before a consensus state can be used for
  /// packet-verification NOTE: delay period logic is only implemented by some
  /// clients.
  final BigInt? delayPeriod;

  const ConnectionEnd({
    this.clientId,
    this.versions = const [],
    this.state,
    this.counterparty,
    this.delayPeriod,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.enumType(3),
        ProtoFieldConfig.message(4, options: const []),
        ProtoFieldConfig.uint64(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    clientId,
    versions,
    state,
    counterparty,
    delayPeriod,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'client_id': clientId,
      'versions': versions.map((e) => e.toJson()).toList(),
      'state': state?.protoName,
      'counterparty': counterparty?.toJson(),
      'delay_period': delayPeriod?.toString(),
    };
  }

  factory ConnectionEnd.fromJson(Map<String, dynamic> json) {
    return ConnectionEnd(
      clientId: json.valueAsString<String?>('client_id', acceptCamelCase: true),
      versions:
          (json.valueEnsureAsList<dynamic>('versions', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<Version, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => Version.fromJson(v),
                ),
              )
              .toList(),
      state: json.valueTo<State?, Object?>(
        key: 'state',
        parse: (v) => State.from(v),
      ),
      counterparty: json.valueTo<Counterparty?, Map<String, dynamic>>(
        key: 'counterparty',
        parse: (v) => Counterparty.fromJson(v),
        acceptCamelCase: true,
      ),
      delayPeriod: json.valueAsBigInt<BigInt?>(
        'delay_period',
        acceptCamelCase: true,
      ),
    );
  }

  factory ConnectionEnd.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ConnectionEnd(
      clientId: decode.getString<String?>(1),
      versions:
          decode.getListOfBytes(2).map((b) => Version.deserialize(b)).toList(),
      state: decode.getEnum<State?>(3, State.values),
      counterparty: decode.messageTo<Counterparty?>(
        4,
        (b) => Counterparty.deserialize(b),
      ),
      delayPeriod: decode.getBigInt<BigInt?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreConnectionV1ConnectionEnd;
}

/// IdentifiedConnection defines a connection with additional connection
/// identifier field.
class IdentifiedConnection extends CosmosProtoMessage {
  /// connection identifier.
  final String? id;

  /// client associated with this connection.
  final String? clientId;

  /// IBC version which can be utilised to determine encodings or protocols for
  /// channels or packets utilising this connection
  final List<Version> versions;

  /// current state of the connection end.
  final State? state;

  /// counterparty chain associated with this connection.
  final Counterparty? counterparty;

  /// delay period associated with this connection.
  final BigInt? delayPeriod;

  const IdentifiedConnection({
    this.id,
    this.clientId,
    this.versions = const [],
    this.state,
    this.counterparty,
    this.delayPeriod,
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
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.enumType(4),
        ProtoFieldConfig.message(5, options: const []),
        ProtoFieldConfig.uint64(6),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    id,
    clientId,
    versions,
    state,
    counterparty,
    delayPeriod,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'client_id': clientId,
      'versions': versions.map((e) => e.toJson()).toList(),
      'state': state?.protoName,
      'counterparty': counterparty?.toJson(),
      'delay_period': delayPeriod?.toString(),
    };
  }

  factory IdentifiedConnection.fromJson(Map<String, dynamic> json) {
    return IdentifiedConnection(
      id: json.valueAsString<String?>('id', acceptCamelCase: true),
      clientId: json.valueAsString<String?>('client_id', acceptCamelCase: true),
      versions:
          (json.valueEnsureAsList<dynamic>('versions', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<Version, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => Version.fromJson(v),
                ),
              )
              .toList(),
      state: json.valueTo<State?, Object?>(
        key: 'state',
        parse: (v) => State.from(v),
      ),
      counterparty: json.valueTo<Counterparty?, Map<String, dynamic>>(
        key: 'counterparty',
        parse: (v) => Counterparty.fromJson(v),
        acceptCamelCase: true,
      ),
      delayPeriod: json.valueAsBigInt<BigInt?>(
        'delay_period',
        acceptCamelCase: true,
      ),
    );
  }

  factory IdentifiedConnection.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return IdentifiedConnection(
      id: decode.getString<String?>(1),
      clientId: decode.getString<String?>(2),
      versions:
          decode.getListOfBytes(3).map((b) => Version.deserialize(b)).toList(),
      state: decode.getEnum<State?>(4, State.values),
      counterparty: decode.messageTo<Counterparty?>(
        5,
        (b) => Counterparty.deserialize(b),
      ),
      delayPeriod: decode.getBigInt<BigInt?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreConnectionV1IdentifiedConnection;
}

/// Counterparty defines the counterparty chain associated with a connection end.
class Counterparty extends CosmosProtoMessage {
  /// identifies the client on the counterparty chain associated with a given
  /// connection.
  final String? clientId;

  /// identifies the connection end on the counterparty chain associated with a
  /// given connection.
  final String? connectionId;

  /// commitment merkle prefix of the counterparty chain.
  final ibc_core_commitment_v1_commitment.MerklePrefix? prefix;

  const Counterparty({this.clientId, this.connectionId, this.prefix});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [clientId, connectionId, prefix];

  @override
  Map<String, dynamic> toJson() {
    return {
      'client_id': clientId,
      'connection_id': connectionId,
      'prefix': prefix?.toJson(),
    };
  }

  factory Counterparty.fromJson(Map<String, dynamic> json) {
    return Counterparty(
      clientId: json.valueAsString<String?>('client_id', acceptCamelCase: true),
      connectionId: json.valueAsString<String?>(
        'connection_id',
        acceptCamelCase: true,
      ),
      prefix: json.valueTo<
        ibc_core_commitment_v1_commitment.MerklePrefix?,
        Map<String, dynamic>
      >(
        key: 'prefix',
        parse:
            (v) => ibc_core_commitment_v1_commitment.MerklePrefix.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory Counterparty.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Counterparty(
      clientId: decode.getString<String?>(1),
      connectionId: decode.getString<String?>(2),
      prefix: decode.messageTo<ibc_core_commitment_v1_commitment.MerklePrefix?>(
        3,
        (b) => ibc_core_commitment_v1_commitment.MerklePrefix.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreConnectionV1Counterparty;
}

/// Version defines the versioning scheme used to negotiate the IBC version in
/// the connection handshake.
class Version extends CosmosProtoMessage {
  /// unique version identifier
  final String? identifier;

  /// list of features compatible with the specified identifier
  final List<String> features;

  const Version({this.identifier, this.features = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [identifier, features];

  @override
  Map<String, dynamic> toJson() {
    return {
      'identifier': identifier,
      'features': features.map((e) => e).toList(),
    };
  }

  factory Version.fromJson(Map<String, dynamic> json) {
    return Version(
      identifier: json.valueAsString<String?>(
        'identifier',
        acceptCamelCase: true,
      ),
      features:
          (json.valueEnsureAsList<dynamic>(
            'features',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory Version.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Version(
      identifier: decode.getString<String?>(1),
      features: decode.getListOrEmpty<String>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreConnectionV1Version;
}

/// Params defines the set of Connection parameters.
class Params extends CosmosProtoMessage {
  /// maximum expected time per block (in nanoseconds), used to enforce block delay. This parameter should reflect the
  /// largest amount of time that the chain might reasonably take to produce the next block under normal operating
  /// conditions. A safe choice is 3-5x the expected time per block.
  final BigInt? maxExpectedTimePerBlock;

  const Params({this.maxExpectedTimePerBlock});

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
  List<Object?> get protoValues => [maxExpectedTimePerBlock];

  @override
  Map<String, dynamic> toJson() {
    return {'max_expected_time_per_block': maxExpectedTimePerBlock?.toString()};
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      maxExpectedTimePerBlock: json.valueAsBigInt<BigInt?>(
        'max_expected_time_per_block',
        acceptCamelCase: true,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(maxExpectedTimePerBlock: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreConnectionV1Params;
}
