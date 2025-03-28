import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/query/query_connection_channels_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryConnectionChannelsRequest is the request type for the Query/QueryConnectionChannels RPC method
class QueryConnectionChannelsRequest extends CosmosMessage
    with QueryMessage<QueryConnectionChannelsResponse> {
  /// connection unique identifier
  final String connection;

  /// pagination request
  final PageRequest? pagination;
  const QueryConnectionChannelsRequest(
      {required this.connection, this.pagination});
  factory QueryConnectionChannelsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryConnectionChannelsRequest(
        connection: decode.getField(1),
        pagination: decode
            .getResult(2)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"connection": connection, "pagination": pagination?.toJson()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryConnectionChannelsRequest;

  @override
  List get values => [connection, pagination];

  @override
  QueryConnectionChannelsResponse onResponse(List<int> bytes) {
    return QueryConnectionChannelsResponse.deserialize(bytes);
  }

  @override
  QueryConnectionChannelsResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryConnectionChannelsResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [connection];

  @override
  Map<String, String?> get queryParameters => pagination?.queryParameters ?? {};
}
