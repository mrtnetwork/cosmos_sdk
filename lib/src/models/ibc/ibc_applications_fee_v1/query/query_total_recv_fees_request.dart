import 'package:cosmos_sdk/src/models/ibc/ibc_applications_fee_v1/query/query_total_recv_fees_response.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/packet_id.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryTotalRecvFeesRequest defines the request type for the TotalRecvFees rpc
class QueryTotalRecvFeesRequest extends CosmosMessage
    with QueryMessage<QueryTotalRecvFeesResponse> {
  /// the packet identifier for the associated fees
  final IbcChannelPacketId packetId;
  const QueryTotalRecvFeesRequest({required this.packetId});
  factory QueryTotalRecvFeesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryTotalRecvFeesRequest(
      packetId: IbcChannelPacketId.deserialize(decode.getField(1)),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"packet_id": packetId.toJson()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryTotalRecvFeesRequest;

  @override
  List get values => [packetId];

  @override
  QueryTotalRecvFeesResponse onResponse(List<int> bytes) {
    return QueryTotalRecvFeesResponse.deserialize(bytes);
  }

  @override
  QueryTotalRecvFeesResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryTotalRecvFeesResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [
    packetId.channelId,
    packetId.portId,
    packetId.sequence.toString(),
  ];
}
