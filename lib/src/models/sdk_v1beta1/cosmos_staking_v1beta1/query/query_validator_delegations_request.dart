import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/query/query_validator_delegations_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// QueryValidatorDelegationsRequest is request type for the Query/ValidatorDelegations RPC method
class QueryValidatorDelegationsRequest extends CosmosMessage
    with QueryMessage<QueryValidatorDelegationsResponse> {
  /// validator_addr defines the validator address to query for.
  final CosmosBaseAddress validatorAddr;

  /// pagination defines an optional pagination for the request.
  final PageRequest? pagination;
  const QueryValidatorDelegationsRequest({
    required this.validatorAddr,
    this.pagination,
  });

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "validator_addr": validatorAddr.address,
      "pagination": pagination?.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => StakingV1beta1Types.queryValidatorDelegationsRequest;

  @override
  List get values => [validatorAddr.address, pagination];
  @override
  QueryValidatorDelegationsResponse onResponse(List<int> bytes) {
    return QueryValidatorDelegationsResponse.deserialize(bytes);
  }

  @override
  QueryValidatorDelegationsResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryValidatorDelegationsResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [validatorAddr.address];

  @override
  Map<String, String?> get queryParameters => pagination?.queryParameters ?? {};
}
