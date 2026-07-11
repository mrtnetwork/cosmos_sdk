import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/crypto/keypair/public_key.dart';
import 'package:cosmos_sdk/sdk/crypto/types/types.dart';
import 'package:cosmos_sdk/sdk/exception/exception.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/crypto/secp256r1/models.dart'
    show PubKey;

class CosmosSecp256R1PublicKey extends CosmosPublicKey {
  final Nist256p1PublicKey publicKey;
  const CosmosSecp256R1PublicKey._(this.publicKey);
  factory CosmosSecp256R1PublicKey.fromBytes(List<int> keyBytes) {
    return CosmosSecp256R1PublicKey._(Nist256p1PublicKey.fromBytes(keyBytes));
  }
  factory CosmosSecp256R1PublicKey.fromHex(String keyHex) {
    return CosmosSecp256R1PublicKey.fromBytes(BytesUtils.fromHexString(keyHex));
  }
  factory CosmosSecp256R1PublicKey.deserialize(List<int> bytes) {
    final decode = PubKey.deserialize(bytes);
    final keyBytes = decode.key;
    if (keyBytes == null) {
      throw DartCosmosSdkPluginException("Invalid secp256r1 encoded key.");
    }
    return CosmosSecp256R1PublicKey._(Nist256p1PublicKey.fromBytes(keyBytes));
  }

  @override
  List<int> toBytes({bool compressed = true}) {
    if (compressed) return publicKey.compressed;
    return publicKey.uncompressed;
  }

  @override
  String toString() {
    return publicKey.toHex();
  }

  @override
  CosmosKeysAlgs get algorithm => CosmosKeysAlgs.secp256r1;
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
      DefaultCosmosProtoTypeUrl.cosmosCryptoSecp256r1PubKey;
  @override
  ProtoMessageConfig protoConfig() {
    return PubKey.protoConfigStatic();
  }
}
