import 'package:cosmos_sdk/src/models/ibc/ibc_applications_fee_v1/query/query_total_timeout_fees_response.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/packet_id.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryTotalTimeoutFeesRequest defines the request type for the TotalTimeoutFees rpc
class QueryTotalTimeoutFeesRequest extends CosmosMessage
    with QueryMessage<QueryTotalTimeoutFeesResponse> {
  /// the packet identifier for the associated fees
  final IbcChannelPacketId packetId;
  const QueryTotalTimeoutFeesRequest({required this.packetId});
  factory QueryTotalTimeoutFeesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryTotalTimeoutFeesRequest(
        packetId: IbcChannelPacketId.deserialize(decode.getField(1)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  String get queryPath => IbcTypes.totalTimeoutFees.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"packet_id": packetId.toJson()};
  }

  @override
  String get typeUrl => IbcTypes.queryTotalTimeoutFeesRequest.typeUrl;

  @override
  List get values => [packetId];

  @override
  QueryTotalTimeoutFeesResponse onResponse(List<int> bytes) {
    return QueryTotalTimeoutFeesResponse.deserialize(bytes);
  }
}
