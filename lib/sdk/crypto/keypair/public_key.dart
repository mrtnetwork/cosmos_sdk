import 'package:cosmos_sdk/sdk/address/address/address.dart';
import 'package:cosmos_sdk/sdk/address/address/address_const.dart';
import 'package:cosmos_sdk/sdk/crypto/ed25519/public_key.dart';
import 'package:cosmos_sdk/sdk/crypto/ethSecp256k1/public_key.dart';
import 'package:cosmos_sdk/sdk/crypto/secp256k1/public_key.dart';
import 'package:cosmos_sdk/sdk/crypto/secp256r1/public_key.dart';
import 'package:cosmos_sdk/sdk/crypto/types/types.dart';
import 'package:cosmos_sdk/sdk/serialization/src/protobuf.dart';

abstract class CosmosPublicKey extends CosmosProtoMessage {
  const CosmosPublicKey();

  factory CosmosPublicKey.fromBytes({
    required List<int> keyBytes,
    required CosmosKeysAlgs algorithm,
  }) {
    switch (algorithm) {
      case CosmosKeysAlgs.secp256r1:
        return CosmosSecp256R1PublicKey.fromBytes(keyBytes);
      case CosmosKeysAlgs.secp256k1:
        return CosmosSecp256K1PublicKey.fromBytes(keyBytes);
      case CosmosKeysAlgs.ed25519:
        return CosmosED25519PublicKey.fromBytes(keyBytes);
      case CosmosKeysAlgs.ethsecp256k1:
      case CosmosKeysAlgs.comosEthsecp256k1:
      case CosmosKeysAlgs.injectiveEthsecp256k1:
      case CosmosKeysAlgs.intiaEthsecp256k1:
      case CosmosKeysAlgs.stratosEthsecp256k1:
        return CosmosETHSecp256K1PublicKey.fromBytes(
          keyBytes,
          algorithm: algorithm,
        );
    }
  }

  CosmosBaseAddress toAddress({String hrp = CosmosAddrConst.accHRP}) {
    return CosmosBaseAddress.fromPublicKey(
      pubkeyBytes: toBytes(),
      algorithm: algorithm,
      hrp: hrp,
    );
  }

  List<int> toBytes();
  CosmosKeysAlgs get algorithm;
}
