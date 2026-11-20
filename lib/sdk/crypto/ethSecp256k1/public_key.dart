import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/crypto/keypair/public_key.dart';
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

class CosmosETHSecp256K1PublicKey extends CosmosPublicKey {
  final Secp256k1PublicKey publicKey;
  @override
  final CosmosKeysAlgs algorithm;
  const CosmosETHSecp256K1PublicKey._(this.publicKey, this.algorithm);
  factory CosmosETHSecp256K1PublicKey.from({
    required Secp256k1PublicKey publicKey,
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
          "Invalid cosmos eth algorithm for CosmosETHSecp256K1PublicKey: expected an ethsecp256k1 variant.",
          details: {"algorithm": algorithm.name},
        );
    }
    return CosmosETHSecp256K1PublicKey._(publicKey, algorithm);
  }
  factory CosmosETHSecp256K1PublicKey.fromBytes(
    List<int> keyBytes, {
    CosmosKeysAlgs algorithm = CosmosKeysAlgs.ethsecp256k1,
  }) {
    return CosmosETHSecp256K1PublicKey.from(
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
      throw BuError(
        DefaultErrorType.invalidKeyData,
        "Invalid secp256k1 encoded key.",
      );
    }
    return CosmosETHSecp256K1PublicKey.from(
      publicKey: Secp256k1PublicKey.fromBytes(keyBytes),
      algorithm: algorithm,
    );
  }
  @override
  BuBytes toBytes({CryptoKeyEncoding encoding = CryptoKeyEncoding.base}) {
    return publicKey.toBytes(mode: encoding);
  }

  @override
  String toString() {
    return toBytes().toHex();
  }

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'key': config.encodeBinary(toBytes())};
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
    _ =>
      throw BuError(
        DefaultErrorType.invalidArgument,
        "Invalid ethereum algorithm.",
      ),
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
      _ =>
        throw BuError(
          DefaultErrorType.invalidArgument,
          "Invalid ethereum algorithm.",
        ),
    };
  }

  String toEthAddress() {
    return EthAddrEncoder().encodeKey(
      toBytes(encoding: CryptoKeyEncoding.uncompressed),
    );
  }

  @override
  List<Object?> get protoValues => [toBytes()];

  @override
  List<dynamic> get variables => [publicKey];
}
