import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/crypto/keypair/public_key.dart';
import 'package:cosmos_sdk/sdk/crypto/types/types.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/crypto/secp256r1/models.dart'
    show PubKey;
import 'package:cosmos_sdk/sdk/serialization/src/protobuf.dart';

class CosmosSecp256R1PublicKey extends CosmosPublicKey {
  final Secp256r1PublicKey publicKey;
  const CosmosSecp256R1PublicKey(this.publicKey);
  factory CosmosSecp256R1PublicKey.fromBytes(List<int> keyBytes) {
    return CosmosSecp256R1PublicKey(Secp256r1PublicKey.fromBytes(keyBytes));
  }
  factory CosmosSecp256R1PublicKey.fromHex(String keyHex) {
    return CosmosSecp256R1PublicKey.fromBytes(BytesUtils.fromHexString(keyHex));
  }
  factory CosmosSecp256R1PublicKey.deserialize(List<int> bytes) {
    final decode = PubKey.deserialize(bytes);
    final keyBytes = decode.key;
    if (keyBytes == null) {
      throw BuError(
        DefaultErrorType.invalidKeyData,
        "Invalid secp256r1 encoded key.",
      );
    }
    return CosmosSecp256R1PublicKey(Secp256r1PublicKey.fromBytes(keyBytes));
  }

  @override
  BuBytes toBytes({CryptoKeyEncoding encoding = CryptoKeyEncoding.base}) {
    return publicKey.toBytes(mode: encoding);
  }

  @override
  String toString() {
    return toBytes().toHex();
  }

  @override
  CosmosKeysAlgs get algorithm => CosmosKeysAlgs.secp256r1;
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
      DefaultCosmosProtoTypeUrl.cosmosCryptoSecp256r1PubKey;
  @override
  ProtoMessageConfig protoConfig() {
    return PubKey.protoConfigStatic();
  }

  @override
  List<dynamic> get variables => [publicKey];
}
