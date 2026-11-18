import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Copyright Tharsis Labs Ltd.(Evmos)
/// SPDX-License-Identifier:ENCL-1.0(https://github.com/evmos/evmos/blob/main/LICENSE)
/// PubKey defines a type alias for an ecdsa.PublicKey that implements
/// Tendermint's PubKey interface. It represents the 33-byte compressed public
/// key format.
class PubKey extends CosmosProtoMessage {
  /// key is the public key in byte form
  final BuBytes? key;

  PubKey({List<int>? key}) : key = key?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bytes(1)],
    );
  }

  @override
  List<Object?> get protoValues => [key];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'key': config.encodeBinary(key)};
  }

  factory PubKey.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return PubKey(
      key: config.decodeBinary<List<int>?>(
        json.valueAs('key', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory PubKey.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PubKey(key: decode.getBytes<List<int>?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ethermintCryptoV1Ethsecp256k1PubKey;
}

/// PrivKey defines a type alias for an ecdsa.PrivateKey that implements
/// Tendermint's PrivateKey interface.
class PrivKey extends CosmosProtoMessage {
  /// key is the private key in byte form
  final BuBytes? key;

  PrivKey({List<int>? key}) : key = key?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bytes(1)],
    );
  }

  @override
  List<Object?> get protoValues => [key];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'key': config.encodeBinary(key)};
  }

  factory PrivKey.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return PrivKey(
      key: config.decodeBinary<List<int>?>(
        json.valueAs('key', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory PrivKey.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PrivKey(key: decode.getBytes<List<int>?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ethermintCryptoV1Ethsecp256k1PrivKey;
}
