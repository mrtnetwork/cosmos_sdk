import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class Node extends CosmosProtoMessage {
  final String? pubkey;

  final BuBytes? blameData;

  final BuBytes? blameSignature;

  Node({this.pubkey, List<int>? blameData, List<int>? blameSignature})
    : blameData = blameData?.asImmutableBytes,
      blameSignature = blameSignature?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.bytes(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [pubkey, blameData, blameSignature];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'pubkey': pubkey,
      'blame_data': config.encodeBinary(blameData),
      'blame_signature': config.encodeBinary(blameSignature),
    };
  }

  factory Node.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Node(
      pubkey: json.valueAsString<String?>(
        'pubkey',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      blameData: config.decodeBinary<List<int>?>(
        json.valueAs('blame_data', normalizeKeyLookup: config.normalizeKeys),
      ),
      blameSignature: config.decodeBinary<List<int>?>(
        json.valueAs(
          'blame_signature',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
    );
  }

  factory Node.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Node(
      pubkey: decode.getString<String?>(1),
      blameData: decode.getBytes<List<int>?>(2),
      blameSignature: decode.getBytes<List<int>?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesNode;
}

class Blame extends CosmosProtoMessage {
  final String? failReason;

  final bool? isUnicast;

  final List<Node> blameNodes;

  final String? round;

  const Blame({
    this.failReason,
    this.isUnicast,
    this.blameNodes = const [],
    this.round,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.bool(2),
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
  List<Object?> get protoValues => [failReason, isUnicast, blameNodes, round];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'fail_reason': failReason,
      'is_unicast': isUnicast,
      'blame_nodes': blameNodes.map((e) => config.encodeMessage(e)).toList(),
      'round': round,
    };
  }

  factory Blame.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Blame(
      failReason: json.valueAsString<String?>(
        'fail_reason',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      isUnicast: json.valueAsBool<bool?>(
        'is_unicast',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      blameNodes:
          (json.valueEnsureAsList<dynamic>(
                'blame_nodes',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<Node, Object>(
                  value: e,
                  parse:
                      (v) =>
                          Node.fromJson(JsonParser.valueAs(v), config: config),
                ),
              )
              .toList(),
      round: json.valueAsString<String?>(
        'round',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Blame.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Blame(
      failReason: decode.getString<String?>(1),
      isUnicast: decode.getBool<bool?>(2),
      blameNodes:
          decode.getListOfBytes(3).map((b) => Node.deserialize(b)).toList(),
      round: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesBlame;
}
