import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/query/query_delegator_validators_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// QueryDelegatorValidatorsRequest is request type for the Query/DelegatorValidators RPC method.
class QueryDelegatorValidatorsRequest extends CosmosMessage
    with QueryMessage<QueryDelegatorValidatorsResponse> {
  /// delegator_addr defines the delegator address to query for.
  final BaseAddress? delegatorAddr;

  /// pagination defines an optional pagination for the request.
  final PageRequest? pagination;
  const QueryDelegatorValidatorsRequest({this.delegatorAddr, this.pagination});
  factory QueryDelegatorValidatorsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryDelegatorValidatorsRequest(
        delegatorAddr:
            decode.getResult(1)?.to<BaseAddress, String>((e) => BaseAddress(e)),
        pagination: decode
            .getResult(2)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  String get queryPath => StakingV1beta1Types.queryDelegatorValidators.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "delegator_addr": delegatorAddr?.address,
      "pagination": pagination?.toJson()
    };
  }

  @override
  String get typeUrl =>
      StakingV1beta1Types.queryDelegatorValidatorsRequest.typeUrl;

  @override
  List get values => [delegatorAddr, pagination];

  @override
  QueryDelegatorValidatorsResponse onResponse(List<int> bytes) {
    return QueryDelegatorValidatorsResponse.deserialize(bytes);
  }
}
