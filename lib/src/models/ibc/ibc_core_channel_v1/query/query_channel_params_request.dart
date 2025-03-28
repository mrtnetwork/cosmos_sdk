import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/query/query_channel_params_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryChannelParamsRequest is the request type for the Query/ChannelParams RPC method.
class QueryChannelParamsRequest extends CosmosMessage
    with QueryMessage<QueryChannelParamsResponse> {
  /// This message has no fields.
  const QueryChannelParamsRequest();
  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryChannelParamsRequest;

  @override
  List get values => [];

  @override
  QueryChannelParamsResponse onResponse(List<int> bytes) {
    return QueryChannelParamsResponse.deserialize(bytes);
  }

  @override
  QueryChannelParamsResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryChannelParamsResponse.fromJson(json);
  }
}
