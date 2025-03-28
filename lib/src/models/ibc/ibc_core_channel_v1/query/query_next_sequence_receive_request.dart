import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/query/query_next_sequence_receive_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryNextSequenceReceiveRequest is the request type for the Query/QueryNextSequenceReceiveRequest RPC method
class QueryNextSequenceReceiveRequest extends CosmosMessage
    with QueryMessage<QueryNextSequenceReceiveResponse> {
  /// port unique identifier
  final String portId;

  /// channel unique identifier
  final String channelId;
  factory QueryNextSequenceReceiveRequest.fromJson(Map<String, dynamic> json) {
    return QueryNextSequenceReceiveRequest(
        portId: json["port_id"], channelId: json["channel_id"]);
  }
  const QueryNextSequenceReceiveRequest(
      {required this.portId, required this.channelId});
  factory QueryNextSequenceReceiveRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryNextSequenceReceiveRequest(
        portId: decode.getField(1), channelId: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"port_id": portId, "channel_id": channelId};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryNextSequenceReceiveRequest;

  @override
  List get values => [portId, channelId];

  @override
  QueryNextSequenceReceiveResponse onResponse(List<int> bytes) {
    return QueryNextSequenceReceiveResponse.deserialize(bytes);
  }

  @override
  QueryNextSequenceReceiveResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryNextSequenceReceiveResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [channelId, portId];
}
