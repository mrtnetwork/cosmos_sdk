import 'package:blockchain_utils/signer/cosmos/cosmos_signer.dart';
import 'package:cosmos_sdk/src/crypto/secp256k1/public_key.dart';
import 'package:blockchain_utils/binary/binary.dart';
import 'package:blockchain_utils/bip/ecc/keys/secp256k1_keys_ecdsa.dart';
import 'package:cosmos_sdk/src/crypto/ed25519/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:cosmos_sdk/src/protobuf/codec/decoder.dart';

class CosmosSecp256K1PrivateKey extends CosmosMessage {
  final Secp256k1PrivateKeyEcdsa _privateKey;
  const CosmosSecp256K1PrivateKey._(this._privateKey);
  factory CosmosSecp256K1PrivateKey.fromBytes(List<int> keyBytes) {
    return CosmosSecp256K1PrivateKey._(
        Secp256k1PrivateKeyEcdsa.fromBytes(keyBytes));
  }
  factory CosmosSecp256K1PrivateKey.fromHex(String keyHex) {
    return CosmosSecp256K1PrivateKey.fromBytes(
        BytesUtils.fromHexString(keyHex));
  }
  factory CosmosSecp256K1PrivateKey.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmosSecp256K1PrivateKey._(
        Secp256k1PrivateKeyEcdsa.fromBytes(decode.getField(1)));
  }
  CosmosSecp256K1PublicKey toPublicKey() =>
      CosmosSecp256K1PublicKey.fromBytes(_privateKey.publicKey.compressed);

  List<int> sign(List<int> digest) {
    final signer = CosmosSigner.fromKeyBytes(toBytes());
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
  String get typeUrl => CryptoTypes.secp256k1Privatekey.typeUrl;
}
