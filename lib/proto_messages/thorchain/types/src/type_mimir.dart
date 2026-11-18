import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class NodeMimir extends CosmosProtoMessage {
  final String? key;

  final BigInt? value;

  final BuBytes? signer;

  NodeMimir({this.key, this.value, List<int>? signer})
    : signer = signer?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.int64(2),
        ProtoFieldConfig.bytes(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [key, value, signer];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'key': key,
      'value': config.encodeBigint(value),
      'signer': config.encodeBinary(signer),
    };
  }

  factory NodeMimir.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return NodeMimir(
      key: json.valueAsString<String?>(
        'key',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      value: json.valueAsBigInt<BigInt?>(
        'value',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      signer: config.decodeBinary<List<int>?>(
        json.valueAs('signer', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory NodeMimir.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return NodeMimir(
      key: decode.getString<String?>(1),
      value: decode.getBigInt<BigInt?>(2),
      signer: decode.getBytes<List<int>?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesNodeMimir;
}
