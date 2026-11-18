import 'package:blockchain_utils/blockchain_utils.dart';

/// Key algorithms supported for Cosmos addresses and signatures.
enum CosmosKeysAlgs {
  secp256k1(view: "Secp256k1", package: "cosmos.crypto.secp256k1", value: 0),
  ethsecp256k1(
    view: "Etheremint/ethsecp256k1",
    package: "ethermint.crypto.v1.ethsecp256k1",
    value: 1,
  ),
  injectiveEthsecp256k1(
    view: "Injective/ethsecp256k1",
    package: "injective.crypto.v1beta1.ethsecp256k1",
    value: 2,
  ),
  comosEthsecp256k1(
    view: "Cosmos/ethsecp256k1",
    package: "cosmos.evm.crypto.v1.ethsecp256k1",
    value: 3,
  ),
  ed25519(view: "Ed25519", package: "cosmos.crypto.ed25519", value: 4),
  secp256r1(view: "Secp256r1", package: "cosmos.crypto.secp256r1", value: 5),
  stratosEthsecp256k1(
    view: "Stratos/ethsecp256k1",
    package: "stratos.crypto.v1.ethsecp256k1",
    value: 6,
  ),
  intiaEthsecp256k1(
    view: "Initia/ethsecp256k1",
    package: "initia.crypto.v1beta1.ethsecp256k1",
    value: 7,
  );

  final String view;
  final String package;
  final int value;
  const CosmosKeysAlgs({
    required this.view,
    required this.package,
    required this.value,
  });
  String algoName() {
    switch (this) {
      case comosEthsecp256k1:
        return ethsecp256k1.name;
      default:
        return name;
    }
  }

  String getPublicKeyTypeUrl() {
    return "/$package.PubKey";
  }

  bool get isEthereum => switch (this) {
    CosmosKeysAlgs.ethsecp256k1 ||
    CosmosKeysAlgs.injectiveEthsecp256k1 ||
    CosmosKeysAlgs.comosEthsecp256k1 ||
    CosmosKeysAlgs.stratosEthsecp256k1 ||
    CosmosKeysAlgs.intiaEthsecp256k1 => true,
    _ => false,
  };

  static const List<CosmosKeysAlgs> supportedAlgs = [
    CosmosKeysAlgs.secp256k1,
    CosmosKeysAlgs.ethsecp256k1,
    CosmosKeysAlgs.comosEthsecp256k1,
    CosmosKeysAlgs.ed25519,
    CosmosKeysAlgs.secp256r1,
    CosmosKeysAlgs.injectiveEthsecp256k1,
    CosmosKeysAlgs.intiaEthsecp256k1,
    CosmosKeysAlgs.stratosEthsecp256k1,
  ];

  Bip44Coins coin(ChainType chain) {
    final coins = switch (this) {
      CosmosKeysAlgs.secp256k1 => [Bip44Coins.cosmos, Bip44Coins.cosmosTestnet],
      CosmosKeysAlgs.stratosEthsecp256k1 ||
      CosmosKeysAlgs.intiaEthsecp256k1 ||
      CosmosKeysAlgs.ethsecp256k1 ||
      CosmosKeysAlgs.comosEthsecp256k1 ||
      CosmosKeysAlgs.injectiveEthsecp256k1 => [
        Bip44Coins.cosmosEthSecp256k1,
        Bip44Coins.cosmosTestnetEthSecp256k1,
      ],
      CosmosKeysAlgs.ed25519 => [
        Bip44Coins.cosmosEd25519,
        Bip44Coins.cosmosTestnetEd25519,
      ],
      CosmosKeysAlgs.secp256r1 => [
        Bip44Coins.cosmosNist256p1,
        Bip44Coins.cosmosTestnetNist256p1,
      ],
    };
    return coins.firstWhere(
      (e) => e.conf.chainType == chain,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                'No coin for algorithm $name on chain type ${chain.name}.',
              ),
    );
  }

  static CosmosKeysAlgs? fromName(String name) {
    return values.firstWhereNullable((element) => element.name == name);
  }

  static CosmosKeysAlgs fromValue(int? value) {
    return values.firstWhere(
      (element) => element.value == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.invalidArgument,
                'Unknown CosmosKeysAlgs value "$value".',
              ),
    );
  }

  static CosmosKeysAlgs fromSupportedAlgs(String name) {
    return supportedAlgs.firstWhere(
      (element) => element.name == name,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.invalidArgument,
                'Unknown CosmosKeysAlgs name "$name".',
              ),
    );
  }

  static CosmosKeysAlgs fromPackageName(String packageName) {
    return values.firstWhere(
      (element) => element.package == packageName,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.invalidArgument,
                'Unknown CosmosKeysAlgs package "$packageName".',
              ),
    );
  }

  static CosmosKeysAlgs? fromTypeUrl(String typeUrl) {
    if (typeUrl.startsWith("/")) {
      typeUrl = typeUrl.substring(1);
    }
    if (typeUrl.isEmpty) return null;
    return supportedAlgs.firstWhereNullable(
      (element) => typeUrl.startsWith(element.package),
    );
  }
}

/// Which multisig pubkey type a chain handles.
///
/// The Cosmos SDK standard is the amino threshold multisig
/// (`/cosmos.crypto.multisig.LegacyAminoPubKey`). The chain-registry does
/// not publish this, so the builder resolves it from the curated
/// `chain_registery/multisig_supports.dart` cache (override first, then
/// bare chain name) and falls back to [unknown]. Unknown values
/// deserialize leniently to [unknown] so newer snapshots never break
/// older readers.
enum CosmosMultisigSupport {
  legacyAminoThreshold(
    view: "LegacyAmino threshold",
    typeUrl: "cosmos.crypto.multisig.LegacyAminoPubKey",
    value: 0,
  ),
  none(view: "No multisig", typeUrl: "", value: 1),
  unknown(view: "Unknown", typeUrl: "", value: 2);

  final String view;
  final String typeUrl;
  final int value;
  const CosmosMultisigSupport({
    required this.view,
    required this.typeUrl,
    required this.value,
  });

  String getPublicKeyTypeUrl() {
    return typeUrl.isEmpty ? "" : "/$typeUrl";
  }

  static CosmosMultisigSupport fromValue(int? value) {
    return values.firstWhere(
      (element) => element.value == value,
      orElse: () => CosmosMultisigSupport.unknown,
    );
  }

  static CosmosMultisigSupport fromName(String name) {
    return values.firstWhere(
      (element) => element.name == name,
      orElse: () => CosmosMultisigSupport.unknown,
    );
  }
}
