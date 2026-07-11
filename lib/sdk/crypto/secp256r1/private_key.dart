import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/crypto/keypair/private_key.dart';
import 'package:cosmos_sdk/sdk/exception/exception.dart';
import 'public_key.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/crypto/secp256r1/models.dart'
    show PrivKey;

class CosmosSecp256R1PrivateKey extends CosmosPrivateKey {
  final Nist256p1PrivateKey _privateKey;
  const CosmosSecp256R1PrivateKey._(this._privateKey);
  factory CosmosSecp256R1PrivateKey.fromBytes(List<int> keyBytes) {
    return CosmosSecp256R1PrivateKey._(Nist256p1PrivateKey.fromBytes(keyBytes));
  }
  factory CosmosSecp256R1PrivateKey.fromHex(String keyHex) {
    return CosmosSecp256R1PrivateKey.fromBytes(
      BytesUtils.fromHexString(keyHex),
    );
  }
  factory CosmosSecp256R1PrivateKey.deserialize(List<int> bytes) {
    final decode = PrivKey.deserialize(bytes);
    final keyBytes = decode.secret;
    if (keyBytes == null) {
      throw DartCosmosSdkPluginException("Invalid secp256r1 encoded key.");
    }
    return CosmosSecp256R1PrivateKey._(Nist256p1PrivateKey.fromBytes(keyBytes));
  }
  @override
  CosmosSecp256R1PublicKey toPublicKey() =>
      CosmosSecp256R1PublicKey.fromBytes(_privateKey.publicKey.compressed);

  @override
  List<int> sign(List<int> digest) {
    final signer = Nist256p1Signer.fromKeyBytes(toBytes());
    return signer.sign(digest);
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
      'secret': StringUtils.decode(
        _privateKey.raw,
        encoding: StringEncoding.base64,
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
}
