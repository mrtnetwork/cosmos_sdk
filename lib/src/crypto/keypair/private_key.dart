import 'package:cosmos_sdk/src/crypto/ed25519/private_key.dart';
import 'package:cosmos_sdk/src/crypto/ethSecp256k1/private_key.dart';
import 'package:cosmos_sdk/src/crypto/keypair/public_key.dart';
import 'package:cosmos_sdk/src/crypto/secp256k1/private_key.dart';
import 'package:cosmos_sdk/src/crypto/types/types.dart';
import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

abstract class CosmosPrivateKey extends CosmosMessage {
  const CosmosPrivateKey();
  factory CosmosPrivateKey.fromBytes(
      {required List<int> keyBytes, required CosmosKeysAlgs algorithm}) {
    switch (algorithm) {
      case CosmosKeysAlgs.secp256k1:
        return CosmosSecp256K1PrivateKey.fromBytes(keyBytes);
      case CosmosKeysAlgs.ethsecp256k1:
        return CosmosETHSecp256K1PrivateKey.fromBytes(keyBytes);
      case CosmosKeysAlgs.ed25519:
        return CosmosED25519PrivateKey.fromBytes(keyBytes);
      case CosmosKeysAlgs.secp256r1:
        return CosmosSecp256K1PrivateKey.fromBytes(keyBytes);
      default:
        throw DartCosmosSdkPluginException("Unsuported cosmos key algorithm");
    }
  }

  List<int> sign(List<int> digest);
  List<int> toBytes();
  CosmosPublicKey toPublicKey();
}
