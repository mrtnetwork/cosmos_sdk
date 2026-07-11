import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/crypto/keypair/public_key.dart';
import 'package:cosmos_sdk/sdk/crypto/types/types.dart';
import 'package:cosmos_sdk/sdk/exception/exception.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/crypto/secp256k1/models.dart'
    show PubKey;

class CosmosSecp256K1PublicKey extends CosmosPublicKey {
  final Secp256k1PublicKey publicKey;
  const CosmosSecp256K1PublicKey._(this.publicKey);
  factory CosmosSecp256K1PublicKey.fromBytes(List<int> keyBytes) {
    return CosmosSecp256K1PublicKey._(Secp256k1PublicKey.fromBytes(keyBytes));
  }
  factory CosmosSecp256K1PublicKey.fromHex(String keyHex) {
    return CosmosSecp256K1PublicKey.fromBytes(BytesUtils.fromHexString(keyHex));
  }
  factory CosmosSecp256K1PublicKey.deserialize(List<int> bytes) {
    final decode = PubKey.deserialize(bytes);
    final keyBytes = decode.key;
    if (keyBytes == null) {
      throw DartCosmosSdkPluginException("Invalid secp256k1 encoded key.");
    }
    return CosmosSecp256K1PublicKey._(Secp256k1PublicKey.fromBytes(keyBytes));
  }
  @override
  List<int> toBytes({bool compressed = true}) {
    if (compressed) return publicKey.compressed;
    return publicKey.uncompressed;
  }

  @override
  CosmosKeysAlgs get algorithm => CosmosKeysAlgs.secp256k1;
  @override
  String toString() {
    return publicKey.toHex();
  }

  @override
  List<Object?> get protoValues => [publicKey.compressed];

  @override
  Map<String, dynamic> toJson() {
    return {
      'key': StringUtils.decode(
        publicKey.compressed,
        encoding: StringEncoding.base64,
      ),
    };
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosCryptoSecp256k1PubKey;
  @override
  ProtoMessageConfig protoConfig() {
    return PubKey.protoConfigStatic();
  }
}
