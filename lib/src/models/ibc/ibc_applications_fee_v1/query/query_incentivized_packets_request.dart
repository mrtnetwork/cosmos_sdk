import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_applications_fee_v1/query/query_incentivized_packets_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryIncentivizedPacketsRequest defines the request type for the IncentivizedPackets rpc
class QueryIncentivizedPacketsRequest extends CosmosMessage
    with QueryMessage<QueryIncentivizedPacketsResponse> {
  /// pagination defines an optional pagination for the request
  final PageRequest? pagination;

  /// block height at which to query
  final BigInt? queryHeight;
  const QueryIncentivizedPacketsRequest({this.pagination, this.queryHeight});

  factory QueryIncentivizedPacketsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryIncentivizedPacketsRequest(
        pagination: decode
            .getResult(1)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)),
        queryHeight: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "pagination": pagination?.toJson(),
      "query_height": queryHeight?.toString()
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryIncentivizedPacketsRequest;

  @override
  List get values => [pagination, queryHeight];
  @override
  QueryIncentivizedPacketsResponse onResponse(List<int> bytes) {
    return QueryIncentivizedPacketsResponse.deserialize(bytes);
  }

  @override
  QueryIncentivizedPacketsResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryIncentivizedPacketsResponse.fromJson(json);
  }

  @override
  Map<String, String?> get queryParameters => {
        "query_height": queryHeight?.toString(),
        ...pagination?.queryParameters ?? {}
      };
}
