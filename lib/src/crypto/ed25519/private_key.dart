import 'package:blockchain_utils/bip/ecc/keys/ed25519_keys.dart';
import 'package:blockchain_utils/signer/signer.dart';
import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/crypto/keypair/private_key.dart';
import 'package:cosmos_sdk/src/crypto/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:cosmos_sdk/src/protobuf/codec/decoder.dart';
import 'public_key.dart';

class CosmosED25519PrivateKey extends CosmosPrivateKey {
  final Ed25519PrivateKey _privateKey;
  const CosmosED25519PrivateKey._(this._privateKey);
  factory CosmosED25519PrivateKey.fromBytes(List<int> keyBytes) {
    return CosmosED25519PrivateKey._(Ed25519PrivateKey.fromBytes(keyBytes));
  }
  factory CosmosED25519PrivateKey.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmosED25519PrivateKey._(
        Ed25519PrivateKey.fromBytes(decode.getField(1)));
  }
  factory CosmosED25519PrivateKey.fromHex(String keyHex) {
    return CosmosED25519PrivateKey.fromBytes(BytesUtils.fromHexString(keyHex));
  }

  @override
  CosmosED25519PublicKey toPublicKey() =>
      CosmosED25519PublicKey.fromBytes(_privateKey.publicKey.compressed);

  @override
  List<int> sign(List<int> digest) {
    final signer = CosmosED25519Signer.fromKeyBytes(toBytes());
    return signer.sign(digest);
  }

  @override
  List<int> toBytes() {
    return _privateKey.raw;
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"key": _privateKey.toHex()};
  }

  @override
  List get values => [toBytes()];

  @override
  TypeUrl get typeUrl => CosmosCryptoKeysTypes.ed25519Privatekey;
}
