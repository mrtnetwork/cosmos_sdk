import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// PubKey defines a secp256k1 public key
/// Key is the compressed form of the pubkey. The first byte depends is a 0x02 byte
/// if the y-coordinate is the lexicographically largest of the two associated with
/// the x-coordinate. Otherwise the first byte is a 0x03.
/// This prefix is followed with the x-coordinate.
class PubKey extends CosmosProtoMessage {
  /// The Amino encoding is simply the inner bytes field, and not the Amino
  /// encoding of the whole PubKey struct.
  ///
  /// Example (JSON):
  /// s := PubKey{Key: []byte{0x01}}
  /// out := AminoJSONEncoder(s)
  ///
  /// Then we have:
  /// out == `"MQ=="`
  /// out != `{"key":"MQ=="}`
  final BuBytes? key;

  PubKey({List<int>? key}) : key = key?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "tendermint/PubKeySecp256k1",
        ),
        ProtoOptionString(name: "amino.message_encoding", value: "key_field"),
      ],
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
      DefaultCosmosProtoTypeUrl.cosmosCryptoSecp256k1PubKey;
}

/// PrivKey defines a secp256k1 private key.
class PrivKey extends CosmosProtoMessage {
  final BuBytes? key;

  PrivKey({List<int>? key}) : key = key?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "tendermint/PrivKeySecp256k1",
        ),
        ProtoOptionString(name: "amino.message_encoding", value: "key_field"),
      ],
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
      DefaultCosmosProtoTypeUrl.cosmosCryptoSecp256k1PrivKey;
}
