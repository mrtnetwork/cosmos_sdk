import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/query/query_upgraded_client_state_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryUpgradedClientStateRequest is the request type for the Query/UpgradedClientState RPC method
class QueryUpgradedClientStateRequest extends CosmosMessage
    with QueryMessage<QueryUpgradedClientStateResponse> {
  /// This message has no fields.
  const QueryUpgradedClientStateRequest();
  @override
  List<int> get fieldIds => [];

  @override
  String get queryPath => IbcTypes.upgradedClientState.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String get typeUrl => IbcTypes.queryUpgradedClientStateRequest.typeUrl;

  @override
  List get values => [];

  @override
  QueryUpgradedClientStateResponse onResponse(List<int> bytes) {
    return QueryUpgradedClientStateResponse.deserialize(bytes);
  }
}
