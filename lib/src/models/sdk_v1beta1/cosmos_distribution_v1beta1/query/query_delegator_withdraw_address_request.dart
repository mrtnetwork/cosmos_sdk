import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/query/query_delegator_withdraw_address_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryDelegatorWithdrawAddressRequest is the request type for the Query/DelegatorWithdrawAddress RPC method.
class DistributionQueryDelegatorWithdrawAddressRequest extends CosmosMessage
    with QueryMessage<DistributionQueryDelegatorWithdrawAddressResponse> {
  /// delegator_address defines the delegator address to query for.
  final CosmosBaseAddress? delegatorAddress;
  DistributionQueryDelegatorWithdrawAddressRequest({this.delegatorAddress});
  factory DistributionQueryDelegatorWithdrawAddressRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionQueryDelegatorWithdrawAddressRequest(
        delegatorAddress: decode
            .getResult(1)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  String get queryPath =>
      DistributionV1beta1Types.distributionDelegatorWithdrawAddress.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"delegator_address": delegatorAddress?.address};
  }

  @override
  String get typeUrl => DistributionV1beta1Types
      .distributionQueryDelegatorWithdrawAddressRequest.typeUrl;

  @override
  List get values => [delegatorAddress?.address];

  @override
  DistributionQueryDelegatorWithdrawAddressResponse onResponse(
      List<int> bytes) {
    return DistributionQueryDelegatorWithdrawAddressResponse.deserialize(bytes);
  }
}
