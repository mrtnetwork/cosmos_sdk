import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/query/query_delegator_withdraw_address_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryDelegatorWithdrawAddressRequest is the request type for the Query/DelegatorWithdrawAddress RPC method.
class DistributionQueryDelegatorWithdrawAddressRequest extends CosmosMessage
    with QueryMessage<DistributionQueryDelegatorWithdrawAddressResponse> {
  /// delegator_address defines the delegator address to query for.
  final CosmosBaseAddress delegatorAddress;
  DistributionQueryDelegatorWithdrawAddressRequest(
      {required this.delegatorAddress});
  factory DistributionQueryDelegatorWithdrawAddressRequest.fromRpc(
      Map<String, dynamic> json) {
    return DistributionQueryDelegatorWithdrawAddressRequest(
        delegatorAddress: CosmosBaseAddress(json["delegator_address"]));
  }
  factory DistributionQueryDelegatorWithdrawAddressRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionQueryDelegatorWithdrawAddressRequest(
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
      DistributionV1beta1Types.distributionQueryDelegatorWithdrawAddressRequest;

  @override
  List get values => [delegatorAddress.address];

  @override
  DistributionQueryDelegatorWithdrawAddressResponse onResponse(
      List<int> bytes) {
    return DistributionQueryDelegatorWithdrawAddressResponse.deserialize(bytes);
  }

  @override
  DistributionQueryDelegatorWithdrawAddressResponse onJsonResponse(
      Map<String, dynamic> json) {
    return DistributionQueryDelegatorWithdrawAddressResponse.fromRpc(json);
  }

  @override
  List<String> get pathParameters => [delegatorAddress.address];
}
