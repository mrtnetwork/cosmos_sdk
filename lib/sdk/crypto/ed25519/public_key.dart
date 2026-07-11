import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/crypto/keypair/public_key.dart';
import 'package:cosmos_sdk/sdk/crypto/types/types.dart';
import 'package:cosmos_sdk/sdk/exception/exception.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/crypto/ed25519/src/keys.dart'
    show PubKey;

class CosmosED25519PublicKey extends CosmosPublicKey {
  final Ed25519PublicKey _publicKey;
  const CosmosED25519PublicKey._(this._publicKey);
  factory CosmosED25519PublicKey.fromBytes(List<int> keyBytes) {
    return CosmosED25519PublicKey._(Ed25519PublicKey.fromBytes(keyBytes));
  }
  factory CosmosED25519PublicKey.fromHex(String keyHex) {
    return CosmosED25519PublicKey.fromBytes(BytesUtils.fromHexString(keyHex));
  }
  factory CosmosED25519PublicKey.deserialize(List<int> bytes) {
    final decode = PubKey.deserialize(bytes);
    final keyBytes = decode.key;
    if (keyBytes == null) {
      throw DartCosmosSdkPluginException("Invalid Ed25519 encoded public key.");
    }
    return CosmosED25519PublicKey._(Ed25519PublicKey.fromBytes(keyBytes));
  }

  @override
  List<int> toBytes() {
    return _publicKey.uncompressed;
  }

  @override
  String toString() {
    return _publicKey.toHex();
  }

  @override
  CosmosKeysAlgs get algorithm => CosmosKeysAlgs.ed25519;

  @override
  List<Object?> get protoValues => [_publicKey.compressed.sublist(1)];

  @override
  Map<String, dynamic> toJson() {
    return {
      'key': StringUtils.decode(
        _publicKey.compressed.sublist(1),
        encoding: StringEncoding.base64,
      ),
    };
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosCryptoEd25519PubKey;
  @override
  ProtoMessageConfig protoConfig() {
    return PubKey.protoConfigStatic();
  }
}
