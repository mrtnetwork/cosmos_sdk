import 'package:blockchain_utils/bip/ecc/keys/ed25519_keys.dart';
import 'package:blockchain_utils/signer/solana/solana_signer.dart';
import 'package:blockchain_utils/binary/binary.dart';
import 'package:cosmos_sdk/src/crypto/ed25519/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:cosmos_sdk/src/protobuf/codec/decoder.dart';
import 'public_key.dart';

class CosmosED25519PrivateKey extends CosmosMessage {
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

  CosmosED25519PublicKey toPublicKey() =>
      CosmosED25519PublicKey.fromBytes(_privateKey.publicKey.compressed);

  List<int> sign(List<int> digest) {
    final signer = SolanaSigner.fromKeyBytes(toBytes());
    return signer.sign(digest);
  }

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
  String get typeUrl => CryptoTypes.ed25519Privatekey.typeUrl;
}
