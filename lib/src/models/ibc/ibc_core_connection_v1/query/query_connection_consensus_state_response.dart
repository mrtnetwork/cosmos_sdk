import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryConnectionConsensusStateResponse is the response type for the Query/ConnectionConsensusState RPC method
class IbcConnectionQueryConnectionConsensusStateResponse extends CosmosMessage {
  /// consensus state associated with the channel
  final Any? consensusState;

  /// client ID associated with the consensus state
  final String? clientId;

  /// merkle proof of existence
  final List<int>? proof;

  /// height at which the proof was retrieved
  final IbcClientHeight proofHeight;
  IbcConnectionQueryConnectionConsensusStateResponse(
      {this.consensusState,
      this.clientId,
      List<int>? proof,
      required this.proofHeight})
      : proof = BytesUtils.tryToBytes(proof, unmodifiable: true);
  factory IbcConnectionQueryConnectionConsensusStateResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcConnectionQueryConnectionConsensusStateResponse(
      consensusState:
          decode.getResult(1)?.to<Any, List<int>>((e) => Any.deserialize(e)),
      clientId: decode.getField(2),
      proof: decode.getField(3),
      proofHeight: IbcClientHeight.deserialize(decode.getField(4)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "consensus_state": consensusState?.toJson(),
      "client_id": clientId,
      "proof": BytesUtils.tryToHexString(proof),
      "proof_height": proofHeight.toJson()
    };
  }

  @override
  String get typeUrl =>
      IbcTypes.ibcConnectionQueryConnectionConsensusStateResponse.typeUrl;

  @override
  List get values => [consensusState, clientId, proof, proofHeight];
}
