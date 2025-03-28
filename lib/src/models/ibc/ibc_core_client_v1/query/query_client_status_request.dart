import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/query/query_client_status_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryClientStatusRequest is the request type for the Query/ClientStatus RPC method
class QueryClientStatusRequest extends CosmosMessage
    with QueryMessage<QueryClientStatusResponse> {
  /// client unique identifier
  final String clientId;
  const QueryClientStatusRequest({required this.clientId});
  factory QueryClientStatusRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryClientStatusRequest(clientId: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"client_id": clientId};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryClientStatusRequest;

  @override
  List get values => [clientId];
  @override
  QueryClientStatusResponse onResponse(List<int> bytes) {
    return QueryClientStatusResponse.deserialize(bytes);
  }

  @override
  QueryClientStatusResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryClientStatusResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [clientId];
}
