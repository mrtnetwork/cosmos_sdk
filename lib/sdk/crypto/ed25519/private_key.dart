import 'package:blockchain_utils/bip/ecc/keys/ed25519_keys.dart';
import 'package:blockchain_utils/proto/proto.dart';
import 'package:blockchain_utils/signer/signer.dart';
import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/crypto/ed25519/public_key.dart';
import 'package:cosmos_sdk/sdk/crypto/keypair/private_key.dart';
import 'package:cosmos_sdk/sdk/exception/exception.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/crypto/ed25519/models.dart'
    show PrivKey;

class CosmosED25519PrivateKey extends CosmosPrivateKey {
  final Ed25519PrivateKey _privateKey;
  const CosmosED25519PrivateKey._(this._privateKey);
  factory CosmosED25519PrivateKey.fromBytes(List<int> keyBytes) {
    return CosmosED25519PrivateKey._(Ed25519PrivateKey.fromBytes(keyBytes));
  }
  factory CosmosED25519PrivateKey.deserialize(List<int> bytes) {
    final decode = PrivKey.deserialize(bytes);
    final keyBytes = decode.key;
    if (keyBytes == null) {
      throw DartCosmosSdkPluginException("Invalid Ed25519 encoded key.");
    }
    return CosmosED25519PrivateKey._(Ed25519PrivateKey.fromBytes(keyBytes));
  }
  factory CosmosED25519PrivateKey.fromHex(String keyHex) {
    return CosmosED25519PrivateKey.fromBytes(BytesUtils.fromHexString(keyHex));
  }

  @override
  CosmosED25519PublicKey toPublicKey() =>
      CosmosED25519PublicKey.fromBytes(_privateKey.publicKey.compressed);

  @override
  List<int> sign(List<int> digest) {
    final signer = Ed25519Signer.fromKeyBytes(toBytes());
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
      DefaultCosmosProtoTypeUrl.cosmosCryptoEd25519PrivKey;
  @override
  ProtoMessageConfig protoConfig() {
    return PrivKey.protoConfigStatic();
  }
}
