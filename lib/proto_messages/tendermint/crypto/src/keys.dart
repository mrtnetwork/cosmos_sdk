import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// PublicKey defines the keys available for use with Validators
class PublicKey extends CosmosProtoMessage {
  final BuBytes? ed25519;

  final BuBytes? secp256k1;

  PublicKey({List<int>? ed25519, List<int>? secp256k1})
    : ed25519 = ed25519?.asImmutableBytes,
      secp256k1 = secp256k1?.asImmutableBytes;

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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'ed25519': config.encodeBinary(ed25519),
      'secp256k1': config.encodeBinary(secp256k1),
    };
  }

  factory PublicKey.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return PublicKey(
      ed25519: config.decodeBinary<List<int>?>(
        json.valueAs('ed25519', normalizeKeyLookup: config.normalizeKeys),
      ),
      secp256k1: config.decodeBinary<List<int>?>(
        json.valueAs('secp256k1', normalizeKeyLookup: config.normalizeKeys),
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
