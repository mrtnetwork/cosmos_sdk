import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';

import 'package:cosmos_sdk/src/models/tendermint/tendermint_crypto/messages/proof_op.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// ProofOps is Merkle proof defined by the list of ProofOps
class ProofOps extends CosmosMessage {
  final List<TendermintCryptoProofOp> ops;
  ProofOps({required List<TendermintCryptoProofOp> ops}) : ops = ops.immutable;
  factory ProofOps.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ProofOps(
        ops: decode
            .getFields(1)
            .map((e) => TendermintCryptoProofOp.deserialize(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"ops": ops.map((e) => e.toJson()).toList()};
  }

  @override
  String get typeUrl => TendermintTypes.proofOps.typeUrl;

  @override
  List get values => [ops];
}
