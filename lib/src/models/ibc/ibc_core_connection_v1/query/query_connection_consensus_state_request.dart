import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/query/query_connection_consensus_state_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryConnectionConsensusStateRequest is the request type for the Query/ConnectionConsensusState RPC method
class IbcConnectionQueryConnectionConsensusStateRequest extends CosmosMessage
    with QueryMessage<IbcConnectionQueryConnectionConsensusStateResponse> {
  /// connection identifier
  final String connectionId;
  final BigInt revisionNumber;
  final BigInt revisionHeight;
  const IbcConnectionQueryConnectionConsensusStateRequest(
      {required this.connectionId,
      required this.revisionNumber,
      required this.revisionHeight});
  factory IbcConnectionQueryConnectionConsensusStateRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcConnectionQueryConnectionConsensusStateRequest(
        connectionId: decode.getField(1),
        revisionNumber: decode.getField(2),
        revisionHeight: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "connection_id": connectionId,
      "revision_number": revisionNumber.toString(),
      "revision_height": revisionHeight.toString()
    };
  }

  @override
  TypeUrl get typeUrl =>
      IbcTypes.ibcConnectionQueryConnectionConsensusStateRequest;

  @override
  List get values => [connectionId, revisionNumber, revisionHeight];

  @override
  IbcConnectionQueryConnectionConsensusStateResponse onResponse(
      List<int> bytes) {
    return IbcConnectionQueryConnectionConsensusStateResponse.deserialize(
        bytes);
  }

  @override
  IbcConnectionQueryConnectionConsensusStateResponse onJsonResponse(
      Map<String, dynamic> json) {
    return IbcConnectionQueryConnectionConsensusStateResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters =>
      [connectionId, revisionNumber.toString(), revisionHeight.toString()];
}
