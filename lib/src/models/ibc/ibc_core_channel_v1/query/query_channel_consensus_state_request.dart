import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/query/query_channel_consensus_state_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryChannelConsensusStateRequest is the request type for the Query/ConsensusState RPC method
class QueryChannelConsensusStateRequest extends CosmosMessage
    with QueryMessage<QueryChannelConsensusStateResponse> {
  /// port unique identifier
  final String portId;

  /// channel unique identifier
  final String channelId;

  /// revision number of the consensus state
  final BigInt revisionNumber;

  /// revision height of the consensus state
  final BigInt revisionHeight;
  const QueryChannelConsensusStateRequest(
      {required this.portId,
      required this.channelId,
      required this.revisionHeight,
      required this.revisionNumber});
  factory QueryChannelConsensusStateRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryChannelConsensusStateRequest(
        portId: decode.getField(1),
        channelId: decode.getField(2),
        revisionNumber: decode.getField(3),
        revisionHeight: decode.getField(4));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "port_id": portId,
      "channel_id": channelId,
      "revision_number": revisionNumber.toString(),
      "revision_height": revisionHeight.toString()
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryChannelConsensusStateRequest;

  @override
  List get values => [portId, channelId, revisionNumber, revisionHeight];

  @override
  QueryChannelConsensusStateResponse onResponse(List<int> bytes) {
    return QueryChannelConsensusStateResponse.deserialize(bytes);
  }

  @override
  QueryChannelConsensusStateResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryChannelConsensusStateResponse.fromRpc(json);
  }

  @override
  List<String> get pathParameters =>
      [channelId, portId, revisionNumber.toString(), revisionHeight.toString()];
}
