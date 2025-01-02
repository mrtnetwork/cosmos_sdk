import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';

import 'package:cosmos_sdk/src/models/tendermint/tendermint_crypto/messages/proof.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// TxProof represents a Merkle proof of the presence of a transaction in the Merkle tree.
class TxProof extends CosmosMessage {
  final List<int>? rootHash;
  final List<int>? data;
  final Proof? proof;
  TxProof({List<int>? rootHash, List<int>? data, this.proof})
      : rootHash = BytesUtils.tryToBytes(rootHash),
        data = BytesUtils.tryToBytes(data);
  factory TxProof.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return TxProof(
        rootHash: decode.getField(1),
        data: decode.getField(2),
        proof: decode
            .getResult(3)
            ?.to<Proof, List<int>>((e) => Proof.deserialize(e)));
  }
  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "root_hash": BytesUtils.tryToHexString(rootHash),
      "data": BytesUtils.tryToHexString(data),
      "proof": proof?.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => TendermintTypes.txProof;

  @override
  List get values => [rootHash, data, proof];
}
