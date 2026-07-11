import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/crypto/keypair/private_key.dart';
import 'package:cosmos_sdk/sdk/crypto/types/types.dart';
import 'package:cosmos_sdk/sdk/exception/exception.dart';
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
import 'public_key.dart';

class CosmosETHSecp256K1PrivateKey extends CosmosPrivateKey {
  final Secp256k1PrivateKey privateKey;
  final CosmosKeysAlgs algorithm;
  const CosmosETHSecp256K1PrivateKey._(this.privateKey, this.algorithm);
  factory CosmosETHSecp256K1PrivateKey({
    required Secp256k1PrivateKey privateKey,
    CosmosKeysAlgs algorithm = CosmosKeysAlgs.ethsecp256k1,
  }) {
    return CosmosETHSecp256K1PrivateKey._(privateKey, algorithm);
  }
  factory CosmosETHSecp256K1PrivateKey.fromBytes(
    List<int> keyBytes, {
    CosmosKeysAlgs algorithm = CosmosKeysAlgs.ethsecp256k1,
  }) {
    return CosmosETHSecp256K1PrivateKey(
      privateKey: Secp256k1PrivateKey.fromBytes(keyBytes),
      algorithm: algorithm,
    );
  }
  factory CosmosETHSecp256K1PrivateKey.fromHex(
    String keyHex, {
    CosmosKeysAlgs algorithm = CosmosKeysAlgs.ethsecp256k1,
  }) {
    return CosmosETHSecp256K1PrivateKey.fromBytes(
      BytesUtils.fromHexString(keyHex),
      algorithm: algorithm,
    );
  }
  factory CosmosETHSecp256K1PrivateKey.deserialize(
    List<int> bytes, {
    CosmosKeysAlgs algorithm = CosmosKeysAlgs.ethsecp256k1,
  }) {
    ethermint.PrivKey innerKey = ethermint.PrivKey.deserialize(bytes);
    List<int>? keyBytes = innerKey.key;
    if (keyBytes == null) {
      throw DartCosmosSdkPluginException("Invalid secp256k1 encoded key.");
    }
    return CosmosETHSecp256K1PrivateKey._(
      Secp256k1PrivateKey.fromBytes(keyBytes),
      algorithm,
    );
  }
  @override
  CosmosETHSecp256K1PublicKey toPublicKey() =>
      CosmosETHSecp256K1PublicKey.fromBytes(
        privateKey.publicKey.compressed,
        algorithm: algorithm,
      );

  @override
  List<int> sign(List<int> digest) {
    final signer = ETHSigner.fromKeyBytes(toBytes());
    return signer.signConst(digest).toBytes(false);
  }

  @override
  List<int> toBytes() {
    return privateKey.raw;
  }

  @override
  List<Object?> get protoValues => [privateKey.raw];

  @override
  Map<String, dynamic> toJson() {
    return {
      'key': StringUtils.decode(
        privateKey.raw,
        encoding: StringEncoding.base64,
      ),
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
    _ => throw DartCosmosSdkPluginException("Invalid ethereum algorithm."),
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
      _ => throw DartCosmosSdkPluginException("Invalid ethereum algorithm."),
    };
  }
}
