import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/crypto/keypair/private_key.dart';
import 'package:cosmos_sdk/sdk/crypto/secp256k1/public_key.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/crypto/secp256k1/models.dart'
    show PrivKey;
import 'package:cosmos_sdk/sdk/serialization/src/protobuf.dart';

class CosmosSecp256K1PrivateKey
    extends CosmosPrivateKey<CosmosSecp256K1PublicKey> {
  final Secp256k1PrivateKey privateKey;
  const CosmosSecp256K1PrivateKey(this.privateKey);
  factory CosmosSecp256K1PrivateKey.fromBytes(List<int> keyBytes) {
    return CosmosSecp256K1PrivateKey(Secp256k1PrivateKey.fromBytes(keyBytes));
  }
  factory CosmosSecp256K1PrivateKey.fromHex(String keyHex) {
    final bytes = BytesUtils.fromHexString(keyHex);
    try {
      return CosmosSecp256K1PrivateKey.fromBytes(bytes);
    } finally {
      bytes.zero();
    }
  }
  factory CosmosSecp256K1PrivateKey.deserialize(List<int> bytes) {
    final decode = PrivKey.deserialize(bytes);
    final keyBytes = decode.key;
    if (keyBytes == null) {
      throw BuError(
        DefaultErrorType.invalidKeyData,
        "Invalid secp256k1 encoded key.",
      );
    }
    return CosmosSecp256K1PrivateKey(Secp256k1PrivateKey.fromBytes(keyBytes));
  }
  @override
  CosmosSecp256K1PublicKey toPublicKey() =>
      CosmosSecp256K1PublicKey(privateKey.publicKey);

  @override
  BuBytes sign(List<int> digest) {
    final signer = Secp256k1Signer(privateKey);
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
      DefaultCosmosProtoTypeUrl.cosmosCryptoSecp256k1PrivKey;
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
