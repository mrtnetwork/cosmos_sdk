import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/crypto/keypair/private_key.dart';
import 'package:cosmos_sdk/src/crypto/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:cosmos_sdk/src/protobuf/codec/decoder.dart';
import 'public_key.dart';

class CosmosNist256p1PrivateKey extends CosmosPrivateKey {
  final Nist256p1PrivateKey _privateKey;
  const CosmosNist256p1PrivateKey._(this._privateKey);
  factory CosmosNist256p1PrivateKey.fromBytes(List<int> keyBytes) {
    return CosmosNist256p1PrivateKey._(Nist256p1PrivateKey.fromBytes(keyBytes));
  }
  factory CosmosNist256p1PrivateKey.fromHex(String keyHex) {
    return CosmosNist256p1PrivateKey.fromBytes(
        BytesUtils.fromHexString(keyHex));
  }
  factory CosmosNist256p1PrivateKey.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmosNist256p1PrivateKey._(
        Nist256p1PrivateKey.fromBytes(decode.getField(1)));
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
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"key": _privateKey.toHex()};
  }

  @override
  List get values => [toBytes()];

  @override
  TypeUrl get typeUrl => CosmosCryptoKeysTypes.secp256R1Privatekey;
}
