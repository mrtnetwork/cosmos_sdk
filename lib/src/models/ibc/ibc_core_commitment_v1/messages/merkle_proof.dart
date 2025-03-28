import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/ics23/messages/proof/commitment_proof.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// MerkleProof is a wrapper type over a chain of CommitmentProofs.
/// It demonstrates membership or non-membership for an element or
/// set of elements, verifiable in conjunction with a known commitment root.
/// Proofs should be succinct. MerkleProofs are ordered from leaf-to-root
class IbcCommitmentMerkleProof extends CosmosMessage {
  final List<Ics23CommitmentProof>? proofs;
  IbcCommitmentMerkleProof({List<Ics23CommitmentProof>? proofs})
      : proofs = proofs?.emptyAsNull?.immutable;
  factory IbcCommitmentMerkleProof.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcCommitmentMerkleProof(
        proofs: decode
            .getFields<List<int>>(1)
            .map((e) => Ics23CommitmentProof.deserialize(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"proofs": proofs?.map((e) => e.toJson()).toList()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.merkleProof;

  @override
  List get values => [proofs];
}
