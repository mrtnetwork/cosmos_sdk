import 'package:blockchain_utils/bip/bip/conf/bip44/bip44_coins.dart';
import 'package:blockchain_utils/bip/bip/conf/core/coin_conf.dart';
import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

enum CosmosKeysAlgs {
  secp256k1,
  ethsecp256k1,
  ed25519,
  secp256r1,
  bn254;

  static const List<CosmosKeysAlgs> supportedAlgs = [
    CosmosKeysAlgs.secp256k1,
    CosmosKeysAlgs.ethsecp256k1,
    CosmosKeysAlgs.ed25519,
    CosmosKeysAlgs.secp256r1
  ];

  Bip44Coins coin(ChainType chain) {
    final coins = switch (this) {
      CosmosKeysAlgs.secp256k1 => [Bip44Coins.cosmos, Bip44Coins.cosmosTestnet],
      CosmosKeysAlgs.ethsecp256k1 => [
          Bip44Coins.cosmosEthSecp256k1,
          Bip44Coins.cosmosTestnetEthSecp256k1
        ],
      CosmosKeysAlgs.ed25519 => [
          Bip44Coins.cosmosEd25519,
          Bip44Coins.cosmosTestnetEd25519
        ],
      CosmosKeysAlgs.secp256r1 => [
          Bip44Coins.cosmosNist256p1,
          Bip44Coins.cosmosTestnetNist256p1
        ],
      _ => throw DartCosmosSdkPluginException("key algorithm not supported.",
          details: {"key": name})
    };
    return coins.firstWhere((e) => e.conf.chainType == chain);
  }

  static CosmosKeysAlgs fromName(String name) {
    return values.firstWhere((element) => element.name == name,
        orElse: () => throw DartCosmosSdkPluginException(
            "unknowmn key algorithm.",
            details: {"name": name}));
  }

  static CosmosKeysAlgs fromSupportedAlgs(String name) {
    return supportedAlgs.firstWhere((element) => element.name == name,
        orElse: () => throw DartCosmosSdkPluginException(
            "Unsuported key algorithm.",
            details: {"name": name}));
  }
}

class CosmosCryptoKeysTypes extends TypeUrl {
  // final String typeUrl;
  final String name;
  const CosmosCryptoKeysTypes._({required String typeUrl, required this.name})
      : super(typeUrl);

  static const CosmosCryptoKeysTypes secp256k1Publickey =
      CosmosCryptoKeysTypes._(
          typeUrl: "/cosmos.crypto.secp256k1.PubKey", name: "secp256k1");
  static const CosmosCryptoKeysTypes secp256k1Privatekey =
      CosmosCryptoKeysTypes._(
          typeUrl: "/cosmos.crypto.secp256k1.PrivKey", name: "secp256k1");

  static const CosmosCryptoKeysTypes ethSecp256k1Publickey =
      CosmosCryptoKeysTypes._(
          typeUrl: "/ethermint.crypto.v1.ethsecp256k1.PubKey",
          name: "ethsecp256k1");
  static const CosmosCryptoKeysTypes ethSecp256k1Privatekey =
      CosmosCryptoKeysTypes._(
          typeUrl: "/ethermint.crypto.v1.ethsecp256k1.PrivKey",
          name: "ethsecp256k1");

  static const CosmosCryptoKeysTypes secp256R1Publickey =
      CosmosCryptoKeysTypes._(
          typeUrl: "/cosmos.crypto.secp256r1.PubKey", name: "sr25519");
  static const CosmosCryptoKeysTypes secp256R1Privatekey =
      CosmosCryptoKeysTypes._(
          typeUrl: "/cosmos.crypto.secp256r1.PrivKey", name: "sr25519");
  static const CosmosCryptoKeysTypes ed25519Publickey = CosmosCryptoKeysTypes._(
      typeUrl: "/cosmos.crypto.ed25519.PubKey", name: "ed25519");
  static const CosmosCryptoKeysTypes ed25519Privatekey =
      CosmosCryptoKeysTypes._(
          typeUrl: "/cosmos.crypto.ed25519.PrivKey", name: "ed25519");

  static const List<CosmosCryptoKeysTypes> values = [
    secp256k1Publickey,
    secp256k1Privatekey,
    secp256R1Publickey,
    secp256R1Privatekey,
    ed25519Publickey,
    ed25519Privatekey,
    ethSecp256k1Publickey,
    ethSecp256k1Privatekey
  ];

  static CosmosCryptoKeysTypes fromType(String type) {
    return values.firstWhere((element) => element.typeUrl == type,
        orElse: () => throw DartCosmosSdkPluginException(
            "Unsuported key algorithm.",
            details: {"type": type}));
  }
}
