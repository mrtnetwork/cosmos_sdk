import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryDelegatorWithdrawAddressResponse is the response type for the Query/DelegatorWithdrawAddress RPC method.
class DistributionQueryDelegatorWithdrawAddressResponse extends CosmosMessage {
  /// withdraw_address defines the delegator address to query for.
  final CosmosBaseAddress? withdrawAddress;
  const DistributionQueryDelegatorWithdrawAddressResponse(
      {this.withdrawAddress});

  factory DistributionQueryDelegatorWithdrawAddressResponse.fromRpc(
      Map<String, dynamic> json) {
    return DistributionQueryDelegatorWithdrawAddressResponse(
        withdrawAddress: json["withdraw_address"] == null
            ? null
            : CosmosBaseAddress(json["withdraw_address"]));
  }
  factory DistributionQueryDelegatorWithdrawAddressResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionQueryDelegatorWithdrawAddressResponse(
        withdrawAddress: decode
            .getResult(1)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"withdraw_address": withdrawAddress?.address};
  }

  @override
  TypeUrl get typeUrl => DistributionV1beta1Types
      .distributionQueryDelegatorWithdrawAddressResponse;

  @override
  List get values => [withdrawAddress?.address];
}
