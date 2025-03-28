import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/query/query_delegator_delegations_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// QueryDelegatorDelegationsRequest is request type for the Query/DelegatorDelegations RPC method.
class QueryDelegatorDelegationsRequest extends CosmosMessage
    with QueryMessage<QueryDelegatorDelegationsResponse> {
  /// delegator_addr defines the delegator address to query for
  final CosmosBaseAddress delegatorAddr;

  /// pagination defines an optional pagination for the request.
  final PageRequest? pagination;
  const QueryDelegatorDelegationsRequest(
      {required this.delegatorAddr, this.pagination});

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "delegator_addr": delegatorAddr.address,
      "pagination": pagination?.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => StakingV1beta1Types.queryDelegatorDelegationsRequest;

  @override
  List get values => [delegatorAddr, pagination];

  @override
  QueryDelegatorDelegationsResponse onResponse(List<int> bytes) {
    return QueryDelegatorDelegationsResponse.deserialize(bytes);
  }

  @override
  QueryDelegatorDelegationsResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryDelegatorDelegationsResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [delegatorAddr.address];

  @override
  Map<String, String?> get queryParameters => pagination?.queryParameters ?? {};
}
