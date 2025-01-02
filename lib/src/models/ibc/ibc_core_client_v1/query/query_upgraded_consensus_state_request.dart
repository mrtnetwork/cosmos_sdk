import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/query/query_upgraded_consensus_state_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryUpgradedConsensusStateRequest is the request type for the Query/UpgradedConsensusState RPC method
class QueryUpgradedConsensusStateRequest extends CosmosMessage
    with QueryMessage<QueryUpgradedConsensusStateResponse> {
  ///  This message has no fields.
  const QueryUpgradedConsensusStateRequest();
  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryUpgradedConsensusStateRequest;

  @override
  List get values => [];

  @override
  QueryUpgradedConsensusStateResponse onResponse(List<int> bytes) {
    return QueryUpgradedConsensusStateResponse.deserialize(bytes);
  }

  @override
  QueryUpgradedConsensusStateResponse onJsonResponse(
      Map<String, dynamic> json) {
    return QueryUpgradedConsensusStateResponse.fromRpc(json);
  }
}
