import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_tendermint_v1beta1/messages/proof_op.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_tendermint_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// ProofOps is Merkle proof defined by the list of ProofOps.
/// Note: This type is a duplicate of the ProofOps proto type defined in Tendermint.
class CosmosProofOps extends CosmosMessage {
  final List<CosmosProofOp> ops;
  CosmosProofOps({required List<CosmosProofOp> ops}) : ops = ops.mutable;
  factory CosmosProofOps.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmosProofOps(
        ops: decode
            .getFileds(1)
            .map((e) => CosmosProofOp.deserialize(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"ops": ops.map((e) => e.toJson()).toList()};
  }

  @override
  String get typeUrl => BaseTendermintV1beta1Types.cosmosProofOps.typeUrl;

  @override
  List get values => [ops];
}
