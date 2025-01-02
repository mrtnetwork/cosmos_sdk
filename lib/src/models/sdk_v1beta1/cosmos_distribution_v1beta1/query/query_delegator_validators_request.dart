import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/query/query_delegator_validators_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

///QueryDelegatorValidatorsRequest is the request type for the Query/DelegatorValidators RPC method.
class DistributionQueryDelegatorValidatorsRequest extends CosmosMessage
    with QueryMessage<DistributionQueryDelegatorValidatorsResponse> {
  /// validators defines the validators a delegator is delegating for.
  final CosmosBaseAddress delegatorAddress;
  const DistributionQueryDelegatorValidatorsRequest(
      {required this.delegatorAddress});
  factory DistributionQueryDelegatorValidatorsRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionQueryDelegatorValidatorsRequest(
        delegatorAddress: CosmosBaseAddress(decode.getField(1)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"delegator_address": delegatorAddress.address};
  }

  @override
  TypeUrl get typeUrl =>
      DistributionV1beta1Types.distributionQueryDelegatorValidatorsRequest;

  @override
  List get values => [delegatorAddress.address];

  @override
  DistributionQueryDelegatorValidatorsResponse onResponse(List<int> bytes) {
    return DistributionQueryDelegatorValidatorsResponse.deserialize(bytes);
  }

  @override
  DistributionQueryDelegatorValidatorsResponse onJsonResponse(
      Map<String, dynamic> json) {
    return DistributionQueryDelegatorValidatorsResponse.fromRpc(json);
  }

  @override
  List<String> get pathParameters => [delegatorAddress.address];
}
