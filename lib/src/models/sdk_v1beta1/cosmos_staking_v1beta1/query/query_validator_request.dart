import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/query/query_validator_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// QueryValidatorRequest is response type for the Query/Validator RPC method
class QueryValidatorRequest extends CosmosMessage
    with QueryMessage<QueryValidatorResponse> {
  /// validator_addr defines the validator address to query for.
  final CosmosBaseAddress validatorAddr;
  const QueryValidatorRequest(this.validatorAddr);

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"validator_addr": validatorAddr.address};
  }

  @override
  TypeUrl get typeUrl => StakingV1beta1Types.queryValidatorRequest;

  @override
  List get values => [validatorAddr];

  @override
  QueryValidatorResponse onResponse(List<int> bytes) {
    return QueryValidatorResponse.deserialize(bytes);
  }

  @override
  QueryValidatorResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryValidatorResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [validatorAddr.address];
}
