import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/crypto/keypair/public_key.dart';
import 'package:cosmos_sdk/src/crypto/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:cosmos_sdk/src/protobuf/codec/decoder.dart';

class CosmosSecp256K1PublicKey extends CosmosPublicKey {
  final Secp256k1PublicKeyEcdsa _publicKey;
  const CosmosSecp256K1PublicKey._(this._publicKey);
  factory CosmosSecp256K1PublicKey.fromBytes(List<int> keyBytes) {
    return CosmosSecp256K1PublicKey._(
        Secp256k1PublicKeyEcdsa.fromBytes(keyBytes));
  }
  factory CosmosSecp256K1PublicKey.fromHex(String keyHex) {
    return CosmosSecp256K1PublicKey.fromBytes(BytesUtils.fromHexString(keyHex));
  }
  factory CosmosSecp256K1PublicKey.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmosSecp256K1PublicKey._(
        Secp256k1PublicKeyEcdsa.fromBytes(decode.getField(1)));
  }
  @override
  List<int> toBytes({bool compressed = true}) {
    if (compressed) return _publicKey.compressed;
    return _publicKey.uncompressed;
  }

  @override
  List<int> get fieldIds => [1];
  @override
  List get values => [toBytes()];
  @override
  Map<String, dynamic> toJson() {
    return {"key": _publicKey.toHex()};
  }

  @override
  TypeUrl get typeUrl => CosmosCryptoKeysTypes.secp256k1Publickey;

  @override
  CosmosKeysAlgs get algorithm => CosmosKeysAlgs.secp256k1;
  @override
  String toString() {
    return _publicKey.toHex();
  }
}
