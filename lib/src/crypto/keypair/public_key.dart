import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/address/address/address.dart';
import 'package:cosmos_sdk/src/address/address/address_const.dart';
import 'package:cosmos_sdk/src/crypto/ed25519/public_key.dart';
import 'package:cosmos_sdk/src/crypto/ethSecp256k1/public_key.dart';
import 'package:cosmos_sdk/src/crypto/secp256k1/public_key.dart';
import 'package:cosmos_sdk/src/crypto/secp256r1/public_key.dart';
import 'package:cosmos_sdk/src/crypto/types/types.dart';
import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

abstract class CosmosPublicKey extends CosmosMessage {
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
        return CosmosETHSecp256K1PublicKey.fromBytes(
          keyBytes,
          algorithm: algorithm,
        );
      default:
        throw DartCosmosSdkPluginException(
          "Unsupported key algorithm.",
          details: {"algorithm": algorithm.name},
        );
    }
  }
  factory CosmosPublicKey.fromAnyBytes(List<int> bytes) {
    final any = Any.deserialize(bytes);
    final pubkeyType = CosmosCryptoKeysTypes.fromType(any.typeUrl);
    switch (pubkeyType) {
      case CosmosCryptoKeysTypes.secp256R1Publickey:
        return CosmosSecp256R1PublicKey.deserialize(any.value);
      case CosmosCryptoKeysTypes.secp256k1Publickey:
        return CosmosSecp256K1PublicKey.deserialize(any.value);
      case CosmosCryptoKeysTypes.ethSecp256k1Publickey:
        return CosmosETHSecp256K1PublicKey.deserialize(
          any.value,
          algorithm: CosmosKeysAlgs.ethsecp256k1,
        );
      case CosmosCryptoKeysTypes.cosmosEthSecp256k1Publickey:
        return CosmosETHSecp256K1PublicKey.deserialize(
          any.value,
          algorithm: CosmosKeysAlgs.comosEthsecp256k1,
        );
      case CosmosCryptoKeysTypes.injectiveSecp256k1Publickey:
        return CosmosETHSecp256K1PublicKey.deserialize(
          any.value,
          algorithm: CosmosKeysAlgs.injectiveEthsecp256k1,
        );
      case CosmosCryptoKeysTypes.ed25519Publickey:
        return CosmosED25519PublicKey.deserialize(any.value);

      default:
        throw DartCosmosSdkPluginException(
          "Invalid public type.",
          details: {"type": any.typeUrl},
        );
    }
  }
  factory CosmosPublicKey.fromJson(Map<String, dynamic> json) {
    final pubkeyType = CosmosCryptoKeysTypes.fromType(json["@type"]);
    final List<int> key = StringUtils.encode(
      json["key"],
      type: StringEncoding.base64,
    );
    switch (pubkeyType) {
      case CosmosCryptoKeysTypes.secp256R1Publickey:
        return CosmosSecp256R1PublicKey.fromBytes(key);
      case CosmosCryptoKeysTypes.secp256k1Publickey:
        return CosmosSecp256K1PublicKey.fromBytes(key);
      case CosmosCryptoKeysTypes.ed25519Publickey:
        return CosmosED25519PublicKey.fromBytes(key);
      case CosmosCryptoKeysTypes.ethSecp256k1Publickey:
        return CosmosETHSecp256K1PublicKey.fromBytes(
          key,
          algorithm: CosmosKeysAlgs.ethsecp256k1,
        );
      case CosmosCryptoKeysTypes.cosmosEthSecp256k1Publickey:
        return CosmosETHSecp256K1PublicKey.fromBytes(
          key,
          algorithm: CosmosKeysAlgs.comosEthsecp256k1,
        );
      case CosmosCryptoKeysTypes.injectiveSecp256k1Publickey:
        return CosmosETHSecp256K1PublicKey.fromBytes(
          key,
          algorithm: CosmosKeysAlgs.injectiveEthsecp256k1,
        );
      default:
        throw DartCosmosSdkPluginException(
          "Invalid public type.",
          details: {"type": pubkeyType.typeUrl},
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
