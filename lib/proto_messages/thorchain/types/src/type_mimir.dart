import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class NodeMimir extends CosmosProtoMessage {
  final String? key;

  final BigInt? value;

  final List<int>? signer;

  const NodeMimir({this.key, this.value, this.signer});

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
  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'value': value?.toString(),
      'signer': switch (signer) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory NodeMimir.fromJson(Map<String, dynamic> json) {
    return NodeMimir(
      key: json.valueAsString<String?>('key', acceptCamelCase: true),
      value: json.valueAsBigInt<BigInt?>('value', acceptCamelCase: true),
      signer: json.valueAsBytes<List<int>?>(
        'signer',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
