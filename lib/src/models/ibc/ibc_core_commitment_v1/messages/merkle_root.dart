import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MerkleRoot defines a merkle root hash. In the Cosmos SDK, the AppHash of a block header becomes the root.
class IbcCommitmentMerkleMerkleRoot extends CosmosMessage {
  final List<int>? hash;
  IbcCommitmentMerkleMerkleRoot({List<int>? hash})
      : hash = BytesUtils.tryToBytes(hash, unmodifiable: true);
  factory IbcCommitmentMerkleMerkleRoot.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcCommitmentMerkleMerkleRoot(hash: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"hash": BytesUtils.tryToHexString(hash)};
  }

  @override
  String get typeUrl => IbcTypes.merkleRoot.typeUrl;

  @override
  List get values => [hash];
}
