import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/query/query_client_status_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryClientStatusRequest is the request type for the Query/ClientStatus RPC method
class QueryClientStatusRequest extends CosmosMessage
    with QueryMessage<QueryClientStatusResponse> {
  /// client unique identifier
  final String? clientId;
  const QueryClientStatusRequest({this.clientId});
  factory QueryClientStatusRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryClientStatusRequest(clientId: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  String get queryPath => IbcTypes.clientStatus.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"client_id": clientId};
  }

  @override
  String get typeUrl => IbcTypes.queryClientStatusRequest.typeUrl;

  @override
  List get values => [clientId];
  @override
  QueryClientStatusResponse onResponse(List<int> bytes) {
    return QueryClientStatusResponse.deserialize(bytes);
  }
}
