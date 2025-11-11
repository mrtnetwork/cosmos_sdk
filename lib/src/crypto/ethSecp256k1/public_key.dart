import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/crypto/keypair/public_key.dart';
import 'package:cosmos_sdk/src/crypto/types/types.dart';
import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/codec/decoder.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class CosmosETHSecp256K1PublicKey extends CosmosPublicKey {
  final Secp256k1PublicKey publicKey;
  @override
  final CosmosKeysAlgs algorithm;
  const CosmosETHSecp256K1PublicKey._(this.publicKey, this.algorithm);
  factory CosmosETHSecp256K1PublicKey(
      {required Secp256k1PublicKey publicKey,
      CosmosKeysAlgs algorithm = CosmosKeysAlgs.ethsecp256k1}) {
    switch (algorithm) {
      case CosmosKeysAlgs.ethsecp256k1:
      case CosmosKeysAlgs.comosEthsecp256k1:
      case CosmosKeysAlgs.injectiveEthsecp256k1:
        return CosmosETHSecp256K1PublicKey._(publicKey, algorithm);
      default:
        throw DartCosmosSdkPluginException("Invalid ethereum algorithm.");
    }
  }
  factory CosmosETHSecp256K1PublicKey.fromBytes(List<int> keyBytes,
      {CosmosKeysAlgs algorithm = CosmosKeysAlgs.ethsecp256k1}) {
    return CosmosETHSecp256K1PublicKey(
        publicKey: Secp256k1PublicKey.fromBytes(keyBytes),
        algorithm: algorithm);
  }
  factory CosmosETHSecp256K1PublicKey.fromHex(String keyHex,
      {CosmosKeysAlgs algorithm = CosmosKeysAlgs.ethsecp256k1}) {
    return CosmosETHSecp256K1PublicKey.fromBytes(
        BytesUtils.fromHexString(keyHex),
        algorithm: algorithm);
  }
  factory CosmosETHSecp256K1PublicKey.deserialize(List<int> bytes,
      {CosmosKeysAlgs algorithm = CosmosKeysAlgs.ethsecp256k1}) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmosETHSecp256K1PublicKey(
        publicKey: Secp256k1PublicKey.fromBytes(decode.getField(1)),
        algorithm: algorithm);
  }
  @override
  List<int> toBytes({bool compressed = true}) {
    if (compressed) return publicKey.compressed;
    return publicKey.uncompressed;
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"key": publicKey.toHex()};
  }

  @override
  List get values => [toBytes()];

  @override
  TypeUrl get typeUrl => algorithm.pubKeyTypeUrl;

  @override
  String toString() {
    return publicKey.toHex();
  }
}
