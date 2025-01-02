import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/crypto/keypair/public_key.dart';
import 'package:cosmos_sdk/src/crypto/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:cosmos_sdk/src/protobuf/codec/decoder.dart';

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
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmosED25519PublicKey._(
        Ed25519PublicKey.fromBytes(decode.getField(1)));
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
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"key": _publicKey.toHex()};
  }

  @override
  List get values => [_publicKey.compressed.sublist(1)];

  @override
  TypeUrl get typeUrl => CosmosCryptoKeysTypes.ed25519Publickey;

  @override
  CosmosKeysAlgs get algorithm => CosmosKeysAlgs.ed25519;
}
