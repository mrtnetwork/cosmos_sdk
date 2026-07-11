import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/crypto/keypair/private_key.dart';
import 'package:cosmos_sdk/sdk/crypto/secp256k1/public_key.dart';
import 'package:cosmos_sdk/sdk/exception/exception.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/crypto/secp256k1/models.dart'
    show PrivKey;

class CosmosSecp256K1PrivateKey extends CosmosPrivateKey {
  final Secp256k1PrivateKey _privateKey;
  const CosmosSecp256K1PrivateKey._(this._privateKey);
  factory CosmosSecp256K1PrivateKey.fromBytes(List<int> keyBytes) {
    return CosmosSecp256K1PrivateKey._(Secp256k1PrivateKey.fromBytes(keyBytes));
  }
  factory CosmosSecp256K1PrivateKey.fromHex(String keyHex) {
    return CosmosSecp256K1PrivateKey.fromBytes(
      BytesUtils.fromHexString(keyHex),
    );
  }
  factory CosmosSecp256K1PrivateKey.deserialize(List<int> bytes) {
    final decode = PrivKey.deserialize(bytes);
    final keyBytes = decode.key;
    if (keyBytes == null) {
      throw DartCosmosSdkPluginException("Invalid secp256k1 encoded key.");
    }
    return CosmosSecp256K1PrivateKey._(Secp256k1PrivateKey.fromBytes(keyBytes));
  }
  @override
  CosmosSecp256K1PublicKey toPublicKey() =>
      CosmosSecp256K1PublicKey.fromBytes(_privateKey.publicKey.compressed);

  @override
  List<int> sign(List<int> digest) {
    final signer = Secp256k1Signer.fromKeyBytes(toBytes());
    return signer.signConst(digest);
  }

  @override
  List<int> toBytes() {
    return _privateKey.raw;
  }

  @override
  List<Object?> get protoValues => [_privateKey.raw];

  @override
  Map<String, dynamic> toJson() {
    return {
      'key': StringUtils.decode(
        _privateKey.raw,
        encoding: StringEncoding.base64,
      ),
    };
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosCryptoSecp256k1PrivKey;
  @override
  ProtoMessageConfig protoConfig() {
    return PrivKey.protoConfigStatic();
  }
}
