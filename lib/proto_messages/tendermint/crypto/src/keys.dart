import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// PublicKey defines the keys available for use with Validators
class PublicKey extends CosmosProtoMessage {
  final List<int>? ed25519;

  final List<int>? secp256k1;

  const PublicKey({this.ed25519, this.secp256k1});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bytes(1), ProtoFieldConfig.bytes(2)],
    );
  }

  @override
  List<Object?> get protoValues => [ed25519, secp256k1];

  @override
  Map<String, dynamic> toJson() {
    return {
      'ed25519': switch (ed25519) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'secp256k1': switch (secp256k1) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory PublicKey.fromJson(Map<String, dynamic> json) {
    return PublicKey(
      ed25519: json.valueAsBytes<List<int>?>(
        'ed25519',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      secp256k1: json.valueAsBytes<List<int>?>(
        'secp256k1',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory PublicKey.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PublicKey(
      ed25519: decode.getBytes<List<int>?>(1),
      secp256k1: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintCryptoPublicKey;
}
