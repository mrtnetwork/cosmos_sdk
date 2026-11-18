import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// PubKey defines a secp256r1 ECDSA public key.
class PubKey extends CosmosProtoMessage {
  /// Point on secp256r1 curve in a compressed representation as specified in section
  /// 4.3.6 of ANSI X9.62: https://webstore.ansi.org/standards/ascx9/ansix9621998
  final BuBytes? key;

  PubKey({List<int>? key}) : key = key?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bytes(1, options: const [])],
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
      DefaultCosmosProtoTypeUrl.cosmosCryptoSecp256r1PubKey;
}

/// PrivKey defines a secp256r1 ECDSA private key.
class PrivKey extends CosmosProtoMessage {
  /// secret number serialized using big-endian encoding
  final BuBytes? secret;

  PrivKey({List<int>? secret}) : secret = secret?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bytes(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [secret];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'secret': config.encodeBinary(secret)};
  }

  factory PrivKey.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return PrivKey(
      secret: config.decodeBinary<List<int>?>(
        json.valueAs('secret', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory PrivKey.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PrivKey(secret: decode.getBytes<List<int>?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosCryptoSecp256r1PrivKey;
}
