import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgSetWithdrawAddress sets the withdraw address for a delegator (or validator self-delegation).
class DistributionMsgSetWithdrawAddress
    extends DistributionV1Beta1Service<EmptyServiceRequestResponse>
    with AminoMessage<EmptyServiceRequestResponse> {
  final CosmosBaseAddress? delegatorAddress;
  final CosmosBaseAddress? withdrawAddress;
  const DistributionMsgSetWithdrawAddress({
    this.delegatorAddress,
    this.withdrawAddress,
  });
  factory DistributionMsgSetWithdrawAddress.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionMsgSetWithdrawAddress(
      delegatorAddress: decode
          .getResult(1)
          ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
      withdrawAddress: decode
          .getResult(2)
          ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
    );
  }
  factory DistributionMsgSetWithdrawAddress.fromJson(
    Map<String, dynamic> json,
  ) {
    return DistributionMsgSetWithdrawAddress(
      delegatorAddress: json.asAddress("delegator_address"),
      withdrawAddress: json.asAddress("withdraw_address"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "delegator_address": delegatorAddress?.address,
      "withdraw_address": withdrawAddress?.address,
    };
  }

  @override
  TypeUrl get typeUrl =>
      DistributionV1beta1Types.distributionMsgSetWithdrawAddress;

  @override
  List get values => [delegatorAddress?.address, withdrawAddress?.address];
  @override
  List<String?> get signers => [delegatorAddress?.address];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
      DistributionV1beta1Types.distributionMsgSetWithdrawAddressResponse,
    );
  }
}
