import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/query/query_delegator_delegations_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// QueryDelegatorDelegationsRequest is request type for the Query/DelegatorDelegations RPC method.
class QueryDelegatorDelegationsRequest extends CosmosMessage
    with QueryMessage<QueryDelegatorDelegationsResponse> {
  /// delegator_addr defines the delegator address to query for
  final BaseAddress? delegatorAddr;

  /// pagination defines an optional pagination for the request.
  final PageRequest? pagination;
  const QueryDelegatorDelegationsRequest({this.delegatorAddr, this.pagination});
  factory QueryDelegatorDelegationsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryDelegatorDelegationsRequest(
        delegatorAddr:
            decode.getResult(1)?.to<BaseAddress, String>((e) => BaseAddress(e)),
        pagination: decode
            .getResult(2)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  String get queryPath => StakingV1beta1Types.queryDelegatorDelegations.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "delegator_addr": delegatorAddr?.address,
      "pagination": pagination?.toJson()
    };
  }

  @override
  String get typeUrl =>
      StakingV1beta1Types.queryDelegatorDelegationsRequest.typeUrl;

  @override
  List get values => [delegatorAddr, pagination];

  @override
  QueryDelegatorDelegationsResponse onResponse(List<int> bytes) {
    return QueryDelegatorDelegationsResponse.deserialize(bytes);
  }
}
