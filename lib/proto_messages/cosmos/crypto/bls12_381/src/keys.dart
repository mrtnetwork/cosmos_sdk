import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// PubKey is an bls12_381 public key for handling CometBFT keys in SDK.
/// It's needed for Any serialization and SDK compatibility.
/// It must not be used in a non Tendermint key context because it doesn't implement
/// ADR-28. Nevertheless, you will like to use bls12_381 in app user level
/// then you must create a new proto message and follow ADR-28 for Address construction.
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
  final List<int>? key;

  const PubKey({this.key});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "cometbft/PubKeyBls12_381",
        ),
        ProtoOptionString(name: "amino.message_encoding", value: "key_field"),
      ],
      fields: [ProtoFieldConfig.bytes(1)],
    );
  }

  @override
  List<Object?> get protoValues => [key];

  @override
  Map<String, dynamic> toJson() {
    return {
      'key': switch (key) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory PubKey.fromJson(Map<String, dynamic> json) {
    return PubKey(
      key: json.valueAsBytes<List<int>?>(
        'key',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory PubKey.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PubKey(key: decode.getBytes<List<int>?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosCryptoBls12381PubKey;
}

/// PrivKey defines a bls12_381 private key.
class PrivKey extends CosmosProtoMessage {
  final List<int>? key;

  const PrivKey({this.key});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "cometbft/PrivKeyBls12_381",
        ),
        ProtoOptionString(name: "amino.message_encoding", value: "key_field"),
      ],
      fields: [ProtoFieldConfig.bytes(1)],
    );
  }

  @override
  List<Object?> get protoValues => [key];

  @override
  Map<String, dynamic> toJson() {
    return {
      'key': switch (key) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory PrivKey.fromJson(Map<String, dynamic> json) {
    return PrivKey(
      key: json.valueAsBytes<List<int>?>(
        'key',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory PrivKey.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PrivKey(key: decode.getBytes<List<int>?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosCryptoBls12381PrivKey;
}
