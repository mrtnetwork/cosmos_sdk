import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;

/// IdentifiedClientState defines a client state with an additional client
/// identifier field.
class IdentifiedClientState extends CosmosProtoMessage {
  /// client identifier
  final String? clientId;

  /// client state
  final google_protobuf_any.Any? clientState;

  const IdentifiedClientState({this.clientId, this.clientState});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [clientId, clientState];

  @override
  Map<String, dynamic> toJson() {
    return {'client_id': clientId, 'client_state': clientState?.toJson()};
  }

  factory IdentifiedClientState.fromJson(Map<String, dynamic> json) {
    return IdentifiedClientState(
      clientId: json.valueAsString<String?>('client_id', acceptCamelCase: true),
      clientState: json.valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
        key: 'client_state',
        parse: (v) => google_protobuf_any.Any.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory IdentifiedClientState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return IdentifiedClientState(
      clientId: decode.getString<String?>(1),
      clientState: decode.messageTo<google_protobuf_any.Any?>(
        2,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1IdentifiedClientState;
}

/// ConsensusStateWithHeight defines a consensus state with an additional height
/// field.
class ConsensusStateWithHeight extends CosmosProtoMessage {
  /// consensus state height
  final Height? height;

  /// consensus state
  final google_protobuf_any.Any? consensusState;

  const ConsensusStateWithHeight({this.height, this.consensusState});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [height, consensusState];

  @override
  Map<String, dynamic> toJson() {
    return {
      'height': height?.toJson(),
      'consensus_state': consensusState?.toJson(),
    };
  }

  factory ConsensusStateWithHeight.fromJson(Map<String, dynamic> json) {
    return ConsensusStateWithHeight(
      height: json.valueTo<Height?, Map<String, dynamic>>(
        key: 'height',
        parse: (v) => Height.fromJson(v),
        acceptCamelCase: true,
      ),
      consensusState: json
          .valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
            key: 'consensus_state',
            parse: (v) => google_protobuf_any.Any.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory ConsensusStateWithHeight.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ConsensusStateWithHeight(
      height: decode.messageTo<Height?>(1, (b) => Height.deserialize(b)),
      consensusState: decode.messageTo<google_protobuf_any.Any?>(
        2,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1ConsensusStateWithHeight;
}

/// Height is a monotonically increasing data type
/// that can be compared against another Height for the purposes of updating and
/// freezing clients
///
/// Normally the RevisionHeight is incremented at each height while keeping
/// RevisionNumber the same. However some consensus algorithms may choose to
/// reset the height in certain conditions e.g. hard forks, state-machine
/// breaking changes In these cases, the RevisionNumber is incremented so that
/// height continues to be monitonically increasing even as the RevisionHeight
/// gets reset
///
/// Please note that json tags for generated Go code are overridden to explicitly exclude the omitempty jsontag.
/// This enforces the Go json marshaller to always emit zero values for both revision_number and revision_height.
class Height extends CosmosProtoMessage {
  /// the revision that the client is currently on
  final BigInt? revisionNumber;

  /// the height within the given revision
  final BigInt? revisionHeight;

  const Height({this.revisionNumber, this.revisionHeight});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [revisionNumber, revisionHeight];

  @override
  Map<String, dynamic> toJson() {
    return {
      'revision_number': revisionNumber?.toString(),
      'revision_height': revisionHeight?.toString(),
    };
  }

  factory Height.fromJson(Map<String, dynamic> json) {
    return Height(
      revisionNumber: json.valueAsBigInt<BigInt?>(
        'revision_number',
        acceptCamelCase: true,
      ),
      revisionHeight: json.valueAsBigInt<BigInt?>(
        'revision_height',
        acceptCamelCase: true,
      ),
    );
  }

  factory Height.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Height(
      revisionNumber: decode.getBigInt<BigInt?>(1),
      revisionHeight: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1Height;
}

/// Params defines the set of IBC light client parameters.
class Params extends CosmosProtoMessage {
  /// allowed_clients defines the list of allowed client state types which can be created
  /// and interacted with. If a client type is removed from the allowed clients list, usage
  /// of this client will be disabled until it is added again to the list.
  final List<String> allowedClients;

  const Params({this.allowedClients = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [allowedClients];

  @override
  Map<String, dynamic> toJson() {
    return {'allowed_clients': allowedClients.map((e) => e).toList()};
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      allowedClients:
          (json.valueEnsureAsList<dynamic>(
            'allowed_clients',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(allowedClients: decode.getListOrEmpty<String>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1Params;
}
