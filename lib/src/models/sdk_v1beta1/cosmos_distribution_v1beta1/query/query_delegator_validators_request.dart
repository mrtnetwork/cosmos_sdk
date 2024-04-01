import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/query/query_delegator_validators_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

///QueryDelegatorValidatorsRequest is the request type for the Query/DelegatorValidators RPC method.
class DistributionQueryDelegatorValidatorsRequest extends CosmosMessage
    with QueryMessage<DistributionQueryDelegatorValidatorsResponse> {
  /// validators defines the validators a delegator is delegating for.
  final BaseAddress? delegatorAddress;
  const DistributionQueryDelegatorValidatorsRequest({this.delegatorAddress});
  factory DistributionQueryDelegatorValidatorsRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionQueryDelegatorValidatorsRequest(
        delegatorAddress: decode
            .getResult(1)
            ?.to<BaseAddress, String>((e) => BaseAddress(e)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  String get queryPath =>
      DistributionV1beta1Types.distributionDelegatorValidators.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"delegator_address": delegatorAddress?.address};
  }

  @override
  String get typeUrl => DistributionV1beta1Types
      .distributionQueryDelegatorValidatorsRequest.typeUrl;

  @override
  List get values => [delegatorAddress?.address];

  @override
  DistributionQueryDelegatorValidatorsResponse onResponse(List<int> bytes) {
    return DistributionQueryDelegatorValidatorsResponse.deserialize(bytes);
  }
}
