import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/query/query_total_supply_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';

import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryTotalSupplyRequest is the request type for the Query/TotalSupply RPC method.
class QueryTotalSupplyRequest extends CosmosMessage
    with QueryMessage<QueryTotalSupplyResponse> {
  /// pagination defines an optional pagination for the request.
  ///
  /// Since: cosmos-sdk 0.43
  final PageRequest? pagination;
  const QueryTotalSupplyRequest({this.pagination});
  factory QueryTotalSupplyRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryTotalSupplyRequest(
      pagination: decode
          .getResult(1)
          ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"pagination": pagination?.toJson()};
  }

  @override
  TypeUrl get typeUrl => BankV1beta1Types.totalSupplyRequest;

  @override
  List get values => [pagination];

  @override
  QueryTotalSupplyResponse onResponse(List<int> bytes) {
    return QueryTotalSupplyResponse.deserialize(bytes);
  }

  @override
  QueryTotalSupplyResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryTotalSupplyResponse.fromJson(json);
  }

  @override
  Map<String, String?> get queryParameters => {
    ...pagination?.queryParameters ?? {},
  };
}
