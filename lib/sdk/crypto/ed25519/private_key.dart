import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/crypto/ed25519/public_key.dart';
import 'package:cosmos_sdk/sdk/crypto/keypair/private_key.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/crypto/ed25519/models.dart'
    show PrivKey;
import 'package:cosmos_sdk/sdk/serialization/src/protobuf.dart';

class CosmosED25519PrivateKey extends CosmosPrivateKey<CosmosED25519PublicKey> {
  final ED25519PrivateKey privateKey;
  const CosmosED25519PrivateKey(this.privateKey);
  factory CosmosED25519PrivateKey.fromBytes(List<int> keyBytes) {
    return CosmosED25519PrivateKey(ED25519PrivateKey.fromBytes(keyBytes));
  }
  factory CosmosED25519PrivateKey.deserialize(List<int> bytes) {
    final decode = PrivKey.deserialize(bytes);
    final keyBytes = decode.key;
    if (keyBytes == null) {
      throw BuError(
        DefaultErrorType.invalidKeyData,
        "Invalid Ed25519 encoded key.",
      );
    }
    return CosmosED25519PrivateKey.fromBytes(keyBytes);
  }
  factory CosmosED25519PrivateKey.fromHex(String keyHex) {
    final bytes = BytesUtils.fromHexString(keyHex);
    try {
      return CosmosED25519PrivateKey.fromBytes(bytes);
    } finally {
      bytes.zero();
    }
  }

  @override
  CosmosED25519PublicKey toPublicKey() =>
      CosmosED25519PublicKey(privateKey.publicKey);

  @override
  BuBytes sign(List<int> digest) {
    final signer = ED25519Signer(privateKey);
    return signer.sign(digest).encoded;
  }

  @override
  SecretBytes toBytes() {
    return privateKey.toBytes();
  }

  @override
  List<Object?> get protoValues => [toBytes()];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'key': privateKey.takeSecretKey().useValue((k) => config.encodeBinary(k)),
    };
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosCryptoEd25519PrivKey;
  @override
  ProtoMessageConfig protoConfig() {
    return PrivKey.protoConfigStatic();
  }

  @override
  void dispose() {
    privateKey.dispose();
  }

  @override
  List<dynamic> get variables => [privateKey];
}
