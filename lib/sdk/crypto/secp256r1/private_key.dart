import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/crypto/keypair/private_key.dart';
import 'package:cosmos_sdk/sdk/serialization/src/protobuf.dart';
import 'public_key.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/crypto/secp256r1/models.dart'
    show PrivKey;

class CosmosSecp256R1PrivateKey
    extends CosmosPrivateKey<CosmosSecp256R1PublicKey> {
  final Secp256r1PrivateKey privateKey;
  const CosmosSecp256R1PrivateKey(this.privateKey);
  factory CosmosSecp256R1PrivateKey.fromBytes(List<int> keyBytes) {
    return CosmosSecp256R1PrivateKey(Secp256r1PrivateKey.fromBytes(keyBytes));
  }
  factory CosmosSecp256R1PrivateKey.fromHex(String keyHex) {
    final bytes = BytesUtils.fromHexString(keyHex);
    try {
      return CosmosSecp256R1PrivateKey.fromBytes(bytes);
    } finally {
      bytes.zero();
    }
  }
  factory CosmosSecp256R1PrivateKey.deserialize(List<int> bytes) {
    final decode = PrivKey.deserialize(bytes);
    final keyBytes = decode.secret;
    if (keyBytes == null) {
      throw BuError(
        DefaultErrorType.invalidKeyData,
        "Invalid secp256r1 encoded key.",
      );
    }
    return CosmosSecp256R1PrivateKey(Secp256r1PrivateKey.fromBytes(keyBytes));
  }
  @override
  CosmosSecp256R1PublicKey toPublicKey() =>
      CosmosSecp256R1PublicKey(privateKey.publicKey);

  @override
  BuBytes sign(List<int> digest) {
    final signer = Secp256r1Signer(privateKey);
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
      'secret': privateKey.takeSecretKey().useValue(
        (k) => config.encodeBinary(k),
      ),
    };
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosCryptoSecp256r1PrivKey;
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
