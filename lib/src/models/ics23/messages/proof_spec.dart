import 'package:cosmos_sdk/src/models/ics23/messages/inner_spec.dart';
import 'package:cosmos_sdk/src/models/ics23/messages/leaf_op.dart';
import 'package:cosmos_sdk/src/models/ics23/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ProofSpec defines what the expected parameters are for a given proof type.
/// This can be stored in the client and used to validate any incoming proofs.
/// verify(ProofSpec, Proof) -> Proof | Error
/// As demonstrated in tests, if we don't fix the algorithm used to calculate
/// the LeafHash for a given tree, there are many possible key-value pairs that can generate a given hash (by interpretting the preimage differently). We need this for proper security, requires client knows a priori what tree format server uses. But not in code, rather a configuration object.
class Ics23ProofSpec extends CosmosMessage {
  /// any field in the ExistenceProof must be the same as in this spec.
  /// except Prefix, which is just the first bytes of prefix (spec can be longer)
  final Ics23LeafOp? leafSpec;
  final Ics23InnerSpec? innerSpec;

  /// max_depth (if > 0) is the maximum number of InnerOps allowed (mainly for fixed-depth tries)
  final int? maxDepth;

  /// min_depth (if > 0) is the minimum number of InnerOps allowed (mainly for fixed-depth tries)
  final int? minDepth;
  const Ics23ProofSpec(
      {this.leafSpec, this.innerSpec, this.maxDepth, this.minDepth});
  factory Ics23ProofSpec.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Ics23ProofSpec(
        leafSpec: Ics23LeafOp.deserialize(decode.getField(1)),
        innerSpec: Ics23InnerSpec.deserialize(decode.getField(2)),
        maxDepth: decode.getField(3),
        minDepth: decode.getField(4));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "leaf_spec": leafSpec?.toJson(),
      "inner_spec": innerSpec?.toJson(),
      "max_depth": maxDepth,
      "min_depth": minDepth
    };
  }

  @override
  TypeUrl get typeUrl => Ics23Types.proofSpec;

  @override
  List get values => [leafSpec, innerSpec, maxDepth, minDepth];
}
