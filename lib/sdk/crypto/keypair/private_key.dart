import 'package:cosmos_sdk/sdk/crypto/ed25519/private_key.dart';
import 'package:cosmos_sdk/sdk/crypto/ethSecp256k1/private_key.dart';
import 'package:cosmos_sdk/sdk/crypto/keypair/public_key.dart';
import 'package:cosmos_sdk/sdk/crypto/secp256k1/private_key.dart';
import 'package:cosmos_sdk/sdk/crypto/secp256r1/private_key.dart';
import 'package:cosmos_sdk/sdk/crypto/types/types.dart';
import 'package:cosmos_sdk/sdk/serialization/src/protobuf.dart';

abstract class CosmosPrivateKey extends CosmosProtoMessage {
  const CosmosPrivateKey();
  factory CosmosPrivateKey.fromBytes({
    required List<int> keyBytes,
    required CosmosKeysAlgs algorithm,
  }) {
    switch (algorithm) {
      case CosmosKeysAlgs.secp256k1:
        return CosmosSecp256K1PrivateKey.fromBytes(keyBytes);
      case CosmosKeysAlgs.ethsecp256k1:
      case CosmosKeysAlgs.comosEthsecp256k1:
      case CosmosKeysAlgs.injectiveEthsecp256k1:
      case CosmosKeysAlgs.intiaEthsecp256k1:
      case CosmosKeysAlgs.stratosEthsecp256k1:
        return CosmosETHSecp256K1PrivateKey.fromBytes(
          keyBytes,
          algorithm: algorithm,
        );
      case CosmosKeysAlgs.ed25519:
        return CosmosED25519PrivateKey.fromBytes(keyBytes);
      case CosmosKeysAlgs.secp256r1:
        return CosmosSecp256R1PrivateKey.fromBytes(keyBytes);
    }
  }

  List<int> sign(List<int> digest);
  List<int> toBytes();
  CosmosPublicKey toPublicKey();
}
