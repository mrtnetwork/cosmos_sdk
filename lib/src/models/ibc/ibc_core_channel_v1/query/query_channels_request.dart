import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/query/query_channels_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryChannelsRequest is the request type for the Query/Channels RPC method
class QueryChannelsRequest extends CosmosMessage
    with QueryMessage<QueryChannelsResponse> {
  /// pagination request
  final PageRequest? pagination;
  const QueryChannelsRequest({this.pagination});
  factory QueryChannelsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryChannelsRequest(
        pagination: decode
            .getResult(1)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"pagination": pagination?.toJson()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryChannelsRequest;

  @override
  List get values => [pagination];

  @override
  QueryChannelsResponse onResponse(List<int> bytes) {
    return QueryChannelsResponse.deserialize(bytes);
  }

  @override
  QueryChannelsResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryChannelsResponse.fromRpc(json);
  }

  @override
  Map<String, String?> get queryParameters => pagination?.queryParameters ?? {};
}
