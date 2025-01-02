import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/messages/order_by.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/query/get_txs_event_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// GetTxsEventRequest is the request type for the Service.TxsByEvents RPC method.
class GetTxsEventRequest extends CosmosMessage
    with QueryMessage<GetTxsEventResponse> {
  /// events is the list of transaction event type.
  /// Deprecated: post v0.47.x use query instead, which should contain a valid
  /// events query.
  final List<String>? events;

  /// pagination defines a pagination for the request.
  /// Deprecated: post v0.46.x use page and limit instead.
  final PageRequest? pagination;

  final OrderBy? orderBy;

  /// page is the page number to query, starts at 1. If not provided, will
  /// default to first page.
  final BigInt? page;

  /// limit is the total number of results to be returned in the result page.
  /// If left empty it will default to a value to be set by each app.
  final BigInt? limit;

  /// query defines the transaction event query that is proxied to Tendermint's
  /// TxSearch RPC method. The query must be valid.
  ///
  /// Since cosmos-sdk 0.50
  final String? query;

  GetTxsEventRequest(
      {List<String>? events,
      this.pagination,
      this.orderBy,
      this.page,
      this.limit,
      this.query})
      : events = events?.immutable;
  factory GetTxsEventRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GetTxsEventRequest(
        events: decode.getFields<String>(1),
        pagination: decode
            .getResult(2)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)),
        limit: decode.getField(5),
        orderBy:
            decode.getResult(3)?.to<OrderBy, int>((e) => OrderBy.fromValue(e)),
        page: decode.getField(4),
        query: decode.getField(6));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  Map<String, dynamic> toJson() {
    return {
      "events": events,
      "pagination": pagination?.toJson(),
      "order_by": orderBy?.value,
      "page": page?.toString(),
      "limit": limit?.toString(),
      "query": query
    };
  }

  @override
  TypeUrl get typeUrl => TxV1beta1Types.getTxsEventRequest;

  @override
  List get values => [events, pagination, orderBy, page, limit, query];

  @override
  GetTxsEventResponse onResponse(List<int> bytes) {
    return GetTxsEventResponse.deserialize(bytes);
  }

  @override
  GetTxsEventResponse onJsonResponse(Map<String, dynamic> json) {
    return GetTxsEventResponse.fromRpc(json);
  }

  @override
  Map<String, String?> get queryParameters => {
        "events": events?.join(","),
        "order_by": orderBy?.value.toString(),
        "page": page?.toString(),
        "limit": limit?.toString(),
        "query": query,
        ...pagination?.queryParameters ?? {}
      };
}
