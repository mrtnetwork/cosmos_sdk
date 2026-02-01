import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/global_messages/unknown_message.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// QueryConsensusStateResponse is the response type for the Query/ConsensusState RPC method
class IbcClientQueryConsensusStateResponse extends CosmosMessage {
  /// consensus state associated with the client identifier at the given height
  final AnyMessage? consensusState;

  /// merkle proof of existence
  final List<int>? proof;

  /// height at which the proof was retrieved
  final IbcClientHeight proofHeight;
  factory IbcClientQueryConsensusStateResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return IbcClientQueryConsensusStateResponse(
      consensusState:
          json["consensus_state"] == null
              ? null
              : AnyMessage.fromJson(json["consensus_state"]),
      proofHeight: IbcClientHeight.fromJson(json["proof_height"]),
      proof: CosmosUtils.tryToBytes(json["proof"]),
    );
  }
  IbcClientQueryConsensusStateResponse({
    this.consensusState,
    List<int>? proof,
    required this.proofHeight,
  }) : proof = BytesUtils.tryToBytes(proof, unmodifiable: true);
  factory IbcClientQueryConsensusStateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcClientQueryConsensusStateResponse(
      consensusState: decode
          .getResult(1)
          ?.to<AnyMessage, List<int>>((e) => AnyMessage.deserialize(e)),
      proof: decode.getField(2),
      proofHeight: IbcClientHeight.deserialize(decode.getField(3)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "consensus_state": consensusState?.toJson(),
      "proof": BytesUtils.tryToHexString(proof),
      "proof_height": proofHeight.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryConsensusStateResponse;

  @override
  List get values => [consensusState, proof, proofHeight];
}
