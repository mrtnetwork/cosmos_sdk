import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/query/query_redelegations_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// QueryRedelegationsRequest is request type for the Query/Redelegations RPC method.
class QueryRedelegationsRequest extends CosmosMessage
    with QueryMessage<QueryRedelegationsResponse> {
  /// delegator_addr defines the delegator address to query for.
  final CosmosBaseAddress? delegatorAddr;

  /// src_validator_addr defines the validator address to redelegate from.
  final CosmosBaseAddress? srcValidatorAddr;

  /// dst_validator_addr defines the validator address to redelegate to.
  final CosmosBaseAddress? dstValidatorAddr;

  /// pagination defines an optional pagination for the request.
  final PageRequest? pagination;
  const QueryRedelegationsRequest(
      {this.delegatorAddr,
      this.srcValidatorAddr,
      this.dstValidatorAddr,
      this.pagination});
  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  String get queryPath => StakingV1beta1Types.queryRedelegations.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "delegator_addr": delegatorAddr?.address,
      "src_validator_addr": srcValidatorAddr?.address,
      "dst_validator_addr": dstValidatorAddr?.address,
      "pagination": pagination?.toJson()
    };
  }

  @override
  String get typeUrl => StakingV1beta1Types.queryRedelegationsRequest.typeUrl;

  @override
  List get values =>
      [delegatorAddr, srcValidatorAddr, dstValidatorAddr, pagination];

  @override
  QueryRedelegationsResponse onResponse(List<int> bytes) {
    return QueryRedelegationsResponse.deserialize(bytes);
  }
}
