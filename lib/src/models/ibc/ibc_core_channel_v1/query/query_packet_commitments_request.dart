import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/query/query_packet_commitments_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryPacketCommitmentsRequest is the request type for the Query/QueryPacketCommitments RPC method
class QueryPacketCommitmentsRequest extends CosmosMessage
    with QueryMessage<QueryPacketCommitmentsResponse> {
  /// port unique identifier
  final String? portId;

  /// channel unique identifier
  final String? channelId;

  /// pagination request
  final PageRequest? pagination;
  const QueryPacketCommitmentsRequest(
      {this.portId, this.channelId, this.pagination});
  factory QueryPacketCommitmentsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryPacketCommitmentsRequest(
        portId: decode.getField(1),
        channelId: decode.getField(2),
        pagination: decode
            .getResult(3)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  String get queryPath => IbcTypes.packetCommitments.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "port_id": portId,
      "channel_id": channelId,
      "pagination": pagination?.toJson()
    };
  }

  @override
  String get typeUrl => IbcTypes.queryPacketCommitmentsRequest.typeUrl;

  @override
  List get values => [portId, channelId, pagination];

  @override
  QueryPacketCommitmentsResponse onResponse(List<int> bytes) {
    return QueryPacketCommitmentsResponse.deserialize(bytes);
  }
}
