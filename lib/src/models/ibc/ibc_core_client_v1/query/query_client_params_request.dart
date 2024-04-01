import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/query/query_client_params_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryClientParamsRequest is the request type for the Query/ClientParams RPC method.
class QueryClientParamsRequest extends CosmosMessage
    with QueryMessage<QueryClientParamsResponse> {
  /// This message has no fields.
  const QueryClientParamsRequest();
  @override
  List<int> get fieldIds => [];

  @override
  String get queryPath => IbcTypes.clientParams.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String get typeUrl => IbcTypes.queryClientParamsRequest.typeUrl;

  @override
  List get values => [];

  @override
  QueryClientParamsResponse onResponse(List<int> bytes) {
    return QueryClientParamsResponse.deserialize(bytes);
  }
}
