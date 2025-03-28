import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/query/query_channel_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryChannelRequest is the request type for the Query/Channel RPC method
class QueryChannelRequest extends CosmosMessage
    with QueryMessage<QueryChannelResponse> {
  /// port unique identifier
  final String portId;

  /// channel unique identifier
  final String channelId;
  factory QueryChannelRequest.fromJson(Map<String, dynamic> json) {
    return QueryChannelRequest(
        channelId: json["channel_id"], portId: json["port_id"]);
  }
  const QueryChannelRequest({required this.portId, required this.channelId});
  factory QueryChannelRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryChannelRequest(
        portId: decode.getField(1), channelId: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"port_id": portId, "channel_id": channelId};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryChannelRequest;

  @override
  List get values => [portId, channelId];

  @override
  QueryChannelResponse onResponse(List<int> bytes) {
    return QueryChannelResponse.deserialize(bytes);
  }

  @override
  QueryChannelResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryChannelResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [channelId, portId];
}
