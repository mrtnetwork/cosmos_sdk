import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

import 'msg_withdraw_validator_commission_response.dart';

/// MsgWithdrawValidatorCommission withdraws the full commission to the validator address.
class DistributionMsgWithdrawValidatorCommission
    extends
        DistributionV1Beta1Service<
          DistributionMsgWithdrawValidatorCommissionResponse
        >
    with AminoMessage<DistributionMsgWithdrawValidatorCommissionResponse> {
  final CosmosBaseAddress? validatorAddress;
  const DistributionMsgWithdrawValidatorCommission({this.validatorAddress});
  factory DistributionMsgWithdrawValidatorCommission.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionMsgWithdrawValidatorCommission(
      validatorAddress: decode
          .getResult(1)
          ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
    );
  }
  factory DistributionMsgWithdrawValidatorCommission.fromJson(
    Map<String, dynamic> json,
  ) {
    return DistributionMsgWithdrawValidatorCommission(
      validatorAddress: json.asAddress("validator_address"),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"validator_address": validatorAddress?.address};
  }

  @override
  TypeUrl get typeUrl =>
      DistributionV1beta1Types.distributionMsgWithdrawValidatorCommission;

  @override
  List get values => [validatorAddress?.address];

  @override
  List<String?> get signers => [validatorAddress?.address];

  @override
  DistributionMsgWithdrawValidatorCommissionResponse onResponse(
    List<int> bytes,
  ) {
    return DistributionMsgWithdrawValidatorCommissionResponse.deserialize(
      bytes,
    );
  }
}
