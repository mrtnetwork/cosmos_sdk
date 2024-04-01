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
  String get queryPath => IbcTypes.upgradedConsensusState.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String get typeUrl => IbcTypes.queryUpgradedConsensusStateRequest.typeUrl;

  @override
  List get values => [];

  @override
  QueryUpgradedConsensusStateResponse onResponse(List<int> bytes) {
    return QueryUpgradedConsensusStateResponse.deserialize(bytes);
  }
}
