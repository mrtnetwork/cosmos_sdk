import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// MerklePrefix is merkle path prefixed to the key.
/// The constructed key from the Path and the key will
/// be append(Path.KeyPath, append(Path.KeyPrefix, key...))
class IbcCommitmentMerklePrefix extends CosmosMessage {
  final List<int>? keyPrefix;
  factory IbcCommitmentMerklePrefix.fromRpc(Map<String, dynamic> json) {
    return IbcCommitmentMerklePrefix(
        keyPrefix: CosmosUtils.tryToBytes(json["key_prefix"]));
  }
  IbcCommitmentMerklePrefix({List<int>? keyPrefix})
      : keyPrefix = BytesUtils.tryToBytes(keyPrefix, unmodifiable: true);
  factory IbcCommitmentMerklePrefix.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcCommitmentMerklePrefix(keyPrefix: decode.getField(1));
  }
  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"key_prefix": BytesUtils.tryToHexString(keyPrefix)};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.merklePrefix;

  @override
  List get values => [keyPrefix];
}
