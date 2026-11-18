import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/crypto/keypair/private_key.dart';
import 'package:cosmos_sdk/sdk/crypto/types/types.dart';
import 'package:cosmos_sdk/proto_messages/ethermint/crypto/v1/ethsecp256k1/models.dart'
    as ethermint;
import 'package:cosmos_sdk/proto_messages/cosmos/evm/crypto/v1/ethsecp256k1/models.dart'
    as cosmos;
import 'package:cosmos_sdk/proto_messages/injective/crypto/v1beta1/ethsecp256k1/models.dart'
    as injective;
import 'package:cosmos_sdk/proto_messages/initia/crypto/v1beta1/ethsecp256k1/models.dart'
    as initia;
import 'package:cosmos_sdk/proto_messages/stratos/crypto/v1/ethsecp256k1/models.dart'
    as stratos;
import 'package:cosmos_sdk/sdk/serialization/src/protobuf.dart';
import 'public_key.dart';

class CosmosETHSecp256K1PrivateKey
    extends CosmosPrivateKey<CosmosETHSecp256K1PublicKey> {
  final Secp256k1PrivateKey privateKey;
  final CosmosKeysAlgs algorithm;
  const CosmosETHSecp256K1PrivateKey._(this.privateKey, this.algorithm);
  factory CosmosETHSecp256K1PrivateKey.from({
    required Secp256k1PrivateKey privateKey,
    required CosmosKeysAlgs algorithm,
  }) {
    switch (algorithm) {
      case CosmosKeysAlgs.ethsecp256k1:
      case CosmosKeysAlgs.injectiveEthsecp256k1:
      case CosmosKeysAlgs.comosEthsecp256k1:
      case CosmosKeysAlgs.stratosEthsecp256k1:
      case CosmosKeysAlgs.intiaEthsecp256k1:
        break;
      default:
        throw BuError(
          DefaultErrorType.invalidArgument,
          "Invalid cosmos eth algorithm for CosmosETHSecp256K1PrivateKey: expected an ethsecp256k1 variant.",
          details: {"algorithm": algorithm.name},
        );
    }
    return CosmosETHSecp256K1PrivateKey._(privateKey, algorithm);
  }
  factory CosmosETHSecp256K1PrivateKey.fromBytes(
    List<int> keyBytes, {
    CosmosKeysAlgs algorithm = CosmosKeysAlgs.ethsecp256k1,
  }) {
    return CosmosETHSecp256K1PrivateKey.from(
      privateKey: Secp256k1PrivateKey.fromBytes(keyBytes),
      algorithm: algorithm,
    );
  }
  factory CosmosETHSecp256K1PrivateKey.fromHex(
    String keyHex, {
    CosmosKeysAlgs algorithm = CosmosKeysAlgs.ethsecp256k1,
  }) {
    final bytes = BytesUtils.fromHexString(keyHex);
    try {
      return CosmosETHSecp256K1PrivateKey.fromBytes(
        bytes,
        algorithm: algorithm,
      );
    } finally {
      bytes.zero();
    }
  }
  factory CosmosETHSecp256K1PrivateKey.deserialize(
    List<int> bytes, {
    CosmosKeysAlgs algorithm = CosmosKeysAlgs.ethsecp256k1,
  }) {
    ethermint.PrivKey innerKey = ethermint.PrivKey.deserialize(bytes);
    List<int>? keyBytes = innerKey.key;
    if (keyBytes == null) {
      throw BuError(
        DefaultErrorType.invalidKeyData,
        "Invalid secp256k1 encoded key.",
      );
    }
    try {
      return CosmosETHSecp256K1PrivateKey.from(
        privateKey: Secp256k1PrivateKey.fromBytes(keyBytes),
        algorithm: algorithm,
      );
    } finally {
      keyBytes.tryZero();
    }
  }
  @override
  CosmosETHSecp256K1PublicKey toPublicKey() => CosmosETHSecp256K1PublicKey.from(
    publicKey: privateKey.publicKey,
    algorithm: algorithm,
  );

  @override
  BuBytes sign(List<int> digest) {
    final signer = ETHSigner(Secp256k1Signer(privateKey));
    return signer
        .sign(digest)
        .signature
        .toBytes(encoding: ECDSASignatureEncoding.suffixRecoveryId);
  }

  @override
  SecretBytes toBytes() {
    return privateKey.toBytes();
  }

  @override
  List<Object?> get protoValues => [toBytes()];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'key': privateKey.takeSecretKey().useValue((k) => config.encodeBinary(k)),
    };
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId => switch (algorithm) {
    CosmosKeysAlgs.ethsecp256k1 =>
      DefaultCosmosProtoTypeUrl.ethermintCryptoV1Ethsecp256k1PrivKey,
    CosmosKeysAlgs.injectiveEthsecp256k1 =>
      DefaultCosmosProtoTypeUrl.injectiveCryptoV1beta1Ethsecp256k1PrivKey,
    CosmosKeysAlgs.comosEthsecp256k1 =>
      DefaultCosmosProtoTypeUrl.cosmosEvmCryptoV1Ethsecp256k1PrivKey,
    CosmosKeysAlgs.stratosEthsecp256k1 =>
      DefaultCosmosProtoTypeUrl.stratosCryptoV1Ethsecp256k1PrivKey,
    CosmosKeysAlgs.intiaEthsecp256k1 =>
      DefaultCosmosProtoTypeUrl.initiaCryptoV1beta1Ethsecp256k1PrivKey,
    _ =>
      throw BuError(
        DefaultErrorType.invalidArgument,
        "Invalid ethereum algorithm.",
      ),
  };

  @override
  ProtoMessageConfig protoConfig() {
    return switch (algorithm) {
      CosmosKeysAlgs.ethsecp256k1 => ethermint.PrivKey.protoConfigStatic(),
      CosmosKeysAlgs.injectiveEthsecp256k1 =>
        injective.PrivKey.protoConfigStatic(),
      CosmosKeysAlgs.comosEthsecp256k1 => cosmos.PrivKey.protoConfigStatic(),
      CosmosKeysAlgs.stratosEthsecp256k1 => stratos.PrivKey.protoConfigStatic(),
      CosmosKeysAlgs.intiaEthsecp256k1 => initia.PrivKey.protoConfigStatic(),
      _ =>
        throw BuError(
          DefaultErrorType.invalidArgument,
          "Invalid ethereum algorithm.",
        ),
    };
  }

  @override
  void dispose() {
    privateKey.dispose();
  }

  @override
  List<dynamic> get variables => [privateKey];
}
