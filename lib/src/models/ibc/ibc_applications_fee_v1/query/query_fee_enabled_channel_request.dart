import 'package:cosmos_sdk/src/models/ibc/ibc_applications_fee_v1/query/query_fee_enabled_channel_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryFeeEnabledChannelRequest defines the request type for the FeeEnabledChannel rpc
class QueryFeeEnabledChannelRequest extends CosmosMessage
    with QueryMessage<QueryFeeEnabledChannelResponse> {
  /// unique port identifier
  final String portId;

  /// unique channel identifier
  final String channelId;
  const QueryFeeEnabledChannelRequest(
      {required this.portId, required this.channelId});
  factory QueryFeeEnabledChannelRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryFeeEnabledChannelRequest(
        portId: decode.getField(1), channelId: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"port_id": portId, "channel_id": channelId};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryFeeEnabledChannelRequest;

  @override
  List get values => [portId, channelId];

  @override
  QueryFeeEnabledChannelResponse onResponse(List<int> bytes) {
    return QueryFeeEnabledChannelResponse.deserialize(bytes);
  }

  @override
  QueryFeeEnabledChannelResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryFeeEnabledChannelResponse.fromRpc(json);
  }

  @override
  List<String> get pathParameters => [portId, channelId];
}
