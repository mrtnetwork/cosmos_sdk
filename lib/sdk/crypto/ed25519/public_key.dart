import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/crypto/keypair/public_key.dart';
import 'package:cosmos_sdk/sdk/crypto/types/types.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/crypto/ed25519/src/keys.dart'
    show PubKey;
import 'package:cosmos_sdk/sdk/serialization/src/protobuf.dart';

class CosmosED25519PublicKey extends CosmosPublicKey {
  final ED25519PublicKey publicKey;
  const CosmosED25519PublicKey(this.publicKey);
  factory CosmosED25519PublicKey.fromBytes(List<int> keyBytes) {
    return CosmosED25519PublicKey(ED25519PublicKey.fromBytes(keyBytes));
  }
  factory CosmosED25519PublicKey.fromHex(String keyHex) {
    return CosmosED25519PublicKey.fromBytes(BytesUtils.fromHexString(keyHex));
  }
  factory CosmosED25519PublicKey.deserialize(List<int> bytes) {
    final decode = PubKey.deserialize(bytes);
    final keyBytes = decode.key;
    if (keyBytes == null) {
      throw BuError(
        DefaultErrorType.invalidKeyData,
        "Invalid Ed25519 encoded public key.",
      );
    }
    return CosmosED25519PublicKey.fromBytes(keyBytes);
  }

  @override
  BuBytes toBytes() {
    return publicKey.toBytes();
  }

  @override
  String toString() {
    return toBytes().toHex();
  }

  @override
  CosmosKeysAlgs get algorithm => CosmosKeysAlgs.ed25519;

  @override
  List<Object?> get protoValues => [toBytes()];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'key': config.encodeBinary(toBytes())};
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosCryptoEd25519PubKey;
  @override
  ProtoMessageConfig protoConfig() {
    return PubKey.protoConfigStatic();
  }

  @override
  List<dynamic> get variables => [publicKey];
}
