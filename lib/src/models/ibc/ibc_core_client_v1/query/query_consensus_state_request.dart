import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/query/query_consensus_state_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryConsensusStateRequest is the request type for the Query/ConsensusState RPC method. Besides the consensus state,
/// it includes a proof and the height from which the proof was retrieved.
class IbcClientQueryConsensusStateRequest extends CosmosMessage
    with QueryMessage<IbcClientQueryConsensusStateResponse> {
  /// client identifier
  final String? clientId;

  /// consensus state revision number
  final BigInt? revisionNumber;

  /// consensus state revision height
  final BigInt? revisionHeight;

  /// latest_height overrides the height field and queries the latest stored
  /// ConsensusState
  final bool? latestHeight;
  const IbcClientQueryConsensusStateRequest(
      {this.clientId,
      this.revisionHeight,
      this.revisionNumber,
      this.latestHeight});
  factory IbcClientQueryConsensusStateRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcClientQueryConsensusStateRequest(
        clientId: decode.getField(1),
        revisionNumber: decode.getField(2),
        revisionHeight: decode.getField(3),
        latestHeight: decode.getField(4));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  String get queryPath => IbcTypes.consensusState.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "client_id": clientId,
      "revision_number": revisionNumber?.toString(),
      "revision_height": revisionHeight?.toString(),
      "latest_height": latestHeight
    };
  }

  @override
  String get typeUrl => IbcTypes.queryConsensusStateRequest.typeUrl;

  @override
  List get values => [clientId, revisionNumber, revisionHeight, latestHeight];

  @override
  IbcClientQueryConsensusStateResponse onResponse(List<int> bytes) {
    return IbcClientQueryConsensusStateResponse.deserialize(bytes);
  }
}
