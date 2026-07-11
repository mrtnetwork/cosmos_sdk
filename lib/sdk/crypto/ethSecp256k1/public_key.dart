import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/crypto/keypair/public_key.dart';
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

class CosmosETHSecp256K1PublicKey extends CosmosPublicKey {
  final Secp256k1PublicKey publicKey;
  @override
  final CosmosKeysAlgs algorithm;
  const CosmosETHSecp256K1PublicKey._(this.publicKey, this.algorithm);
  factory CosmosETHSecp256K1PublicKey({
    required Secp256k1PublicKey publicKey,
    CosmosKeysAlgs algorithm = CosmosKeysAlgs.ethsecp256k1,
  }) {
    return CosmosETHSecp256K1PublicKey._(publicKey, algorithm);
  }
  factory CosmosETHSecp256K1PublicKey.fromBytes(
    List<int> keyBytes, {
    CosmosKeysAlgs algorithm = CosmosKeysAlgs.ethsecp256k1,
  }) {
    return CosmosETHSecp256K1PublicKey(
      publicKey: Secp256k1PublicKey.fromBytes(keyBytes),
      algorithm: algorithm,
    );
  }
  factory CosmosETHSecp256K1PublicKey.fromHex(
    String keyHex, {
    CosmosKeysAlgs algorithm = CosmosKeysAlgs.ethsecp256k1,
  }) {
    return CosmosETHSecp256K1PublicKey.fromBytes(
      BytesUtils.fromHexString(keyHex),
      algorithm: algorithm,
    );
  }
  factory CosmosETHSecp256K1PublicKey.deserialize(
    List<int> bytes, {
    CosmosKeysAlgs algorithm = CosmosKeysAlgs.ethsecp256k1,
  }) {
    ethermint.PubKey innerKey = ethermint.PubKey.deserialize(bytes);
    List<int>? keyBytes = innerKey.key;
    if (keyBytes == null) {
      throw DartCosmosSdkPluginException("Invalid secp256k1 encoded key.");
    }
    return CosmosETHSecp256K1PublicKey._(
      Secp256k1PublicKey.fromBytes(keyBytes),
      algorithm,
    );
  }
  @override
  List<int> toBytes({bool compressed = true}) {
    if (compressed) return publicKey.compressed;
    return publicKey.uncompressed;
  }

  @override
  String toString() {
    return publicKey.toHex();
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'key': StringUtils.decode(
        publicKey.compressed,
        encoding: StringEncoding.base64,
      ),
    };
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId => switch (algorithm) {
    CosmosKeysAlgs.ethsecp256k1 =>
      DefaultCosmosProtoTypeUrl.ethermintCryptoV1Ethsecp256k1PubKey,
    CosmosKeysAlgs.injectiveEthsecp256k1 =>
      DefaultCosmosProtoTypeUrl.injectiveCryptoV1beta1Ethsecp256k1PubKey,
    CosmosKeysAlgs.comosEthsecp256k1 =>
      DefaultCosmosProtoTypeUrl.cosmosEvmCryptoV1Ethsecp256k1PubKey,
    CosmosKeysAlgs.stratosEthsecp256k1 =>
      DefaultCosmosProtoTypeUrl.stratosCryptoV1Ethsecp256k1PubKey,
    CosmosKeysAlgs.intiaEthsecp256k1 =>
      DefaultCosmosProtoTypeUrl.initiaCryptoV1beta1Ethsecp256k1PubKey,
    _ => throw DartCosmosSdkPluginException("Invalid ethereum algorithm."),
  };

  @override
  ProtoMessageConfig protoConfig() {
    return switch (algorithm) {
      CosmosKeysAlgs.ethsecp256k1 => ethermint.PubKey.protoConfigStatic(),
      CosmosKeysAlgs.injectiveEthsecp256k1 =>
        injective.PubKey.protoConfigStatic(),
      CosmosKeysAlgs.comosEthsecp256k1 => cosmos.PubKey.protoConfigStatic(),
      CosmosKeysAlgs.stratosEthsecp256k1 => stratos.PubKey.protoConfigStatic(),
      CosmosKeysAlgs.intiaEthsecp256k1 => initia.PubKey.protoConfigStatic(),
      _ => throw DartCosmosSdkPluginException("Invalid ethereum algorithm."),
    };
  }

  String toEthAddress() {
    return EthAddrEncoder().encodeKey(publicKey.uncompressed);
  }

  @override
  List<Object?> get protoValues => [publicKey.compressed];
}
