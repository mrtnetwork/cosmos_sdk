import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class Node extends CosmosProtoMessage {
  final String? pubkey;

  final List<int>? blameData;

  final List<int>? blameSignature;

  const Node({this.pubkey, this.blameData, this.blameSignature});

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
  Map<String, dynamic> toJson() {
    return {
      'pubkey': pubkey,
      'blame_data': switch (blameData) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'blame_signature': switch (blameSignature) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory Node.fromJson(Map<String, dynamic> json) {
    return Node(
      pubkey: json.valueAsString<String?>('pubkey', acceptCamelCase: true),
      blameData: json.valueAsBytes<List<int>?>(
        'blame_data',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      blameSignature: json.valueAsBytes<List<int>?>(
        'blame_signature',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
  Map<String, dynamic> toJson() {
    return {
      'fail_reason': failReason,
      'is_unicast': isUnicast,
      'blame_nodes': blameNodes.map((e) => e.toJson()).toList(),
      'round': round,
    };
  }

  factory Blame.fromJson(Map<String, dynamic> json) {
    return Blame(
      failReason: json.valueAsString<String?>(
        'fail_reason',
        acceptCamelCase: true,
      ),
      isUnicast: json.valueAsBool<bool?>('is_unicast', acceptCamelCase: true),
      blameNodes:
          (json.valueEnsureAsList<dynamic>(
                'blame_nodes',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<Node, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => Node.fromJson(v),
                ),
              )
              .toList(),
      round: json.valueAsString<String?>('round', acceptCamelCase: true),
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
