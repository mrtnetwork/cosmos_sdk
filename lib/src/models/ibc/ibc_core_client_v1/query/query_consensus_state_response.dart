import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryConsensusStateResponse is the response type for the Query/ConsensusState RPC method
class IbcClientQueryConsensusStateResponse extends CosmosMessage {
  /// consensus state associated with the client identifier at the given height
  final Any? consensusState;

  /// merkle proof of existence
  final List<int>? proof;

  /// height at which the proof was retrieved
  final IbcClientHeight proofHeight;
  IbcClientQueryConsensusStateResponse(
      {this.consensusState, List<int>? proof, required this.proofHeight})
      : proof = BytesUtils.tryToBytes(proof, unmodifiable: true);
  factory IbcClientQueryConsensusStateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcClientQueryConsensusStateResponse(
        consensusState:
            decode.getResult(1)?.to<Any, List<int>>((e) => Any.deserialize(e)),
        proof: decode.getField(2),
        proofHeight: IbcClientHeight.deserialize(decode.getField(3)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "consensus_state": consensusState?.toJson(),
      "proof": BytesUtils.tryToHexString(proof),
      "proof_height": proofHeight.toJson()
    };
  }

  @override
  String get typeUrl => IbcTypes.queryConsensusStateResponse.typeUrl;

  @override
  List get values => [consensusState, proof, proofHeight];
}
