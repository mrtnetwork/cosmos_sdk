import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_applications_fee_v1/query/query_incentivized_packets_for_channel_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryIncentivizedPacketsForChannelRequest defines the request type for querying for all incentivized packets for a specific channel
class QueryIncentivizedPacketsForChannelRequest extends CosmosMessage
    with QueryMessage<QueryIncentivizedPacketsForChannelResponse> {
  /// pagination defines an optional pagination for the request
  final PageRequest? pagination;
  final String portId;
  final String channelId;

  /// Height to query at
  final BigInt? queryHeight;
  const QueryIncentivizedPacketsForChannelRequest({
    this.pagination,
    required this.portId,
    required this.channelId,
    this.queryHeight,
  });
  factory QueryIncentivizedPacketsForChannelRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryIncentivizedPacketsForChannelRequest(
      pagination: decode
          .getResult(1)
          ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)),
      portId: decode.getField(2),
      channelId: decode.getField(3),
      queryHeight: decode.getField(4),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "pagination": pagination?.toJson(),
      "port_id": portId,
      "channel_id": channelId,
      "query_height": queryHeight?.toString(),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryIncentivizedPacketsForChannelRequest;

  @override
  List get values => [pagination, portId, channelId, queryHeight];

  @override
  QueryIncentivizedPacketsForChannelResponse onResponse(List<int> bytes) {
    return QueryIncentivizedPacketsForChannelResponse.deserialize(bytes);
  }

  @override
  QueryIncentivizedPacketsForChannelResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return QueryIncentivizedPacketsForChannelResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [channelId, portId];
  @override
  Map<String, String?> get queryParameters => {
    "query_height": queryHeight?.toString(),
    ...pagination?.queryParameters ?? {},
  };
}
