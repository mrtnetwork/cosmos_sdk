import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// MerklePrefix is merkle path prefixed to the key.
/// The constructed key from the Path and the key will be append(Path.KeyPath,
/// append(Path.KeyPrefix, key...))
class MerklePrefix extends CosmosProtoMessage {
  final List<int>? keyPrefix;

  const MerklePrefix({this.keyPrefix});

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
  List<Object?> get protoValues => [keyPrefix];

  @override
  Map<String, dynamic> toJson() {
    return {
      'key_prefix': switch (keyPrefix) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MerklePrefix.fromJson(Map<String, dynamic> json) {
    return MerklePrefix(
      keyPrefix: json.valueAsBytes<List<int>?>(
        'key_prefix',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory MerklePrefix.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MerklePrefix(keyPrefix: decode.getBytes<List<int>?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreCommitmentV1MerklePrefix;
}
