import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/query/query_validator_commission_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryValidatorCommissionRequest is the request type for the Query/ValidatorCommission RPC method
class DistributionQueryValidatorCommissionRequest extends CosmosMessage
    with QueryMessage<DistributionQueryValidatorCommissionResponse> {
  /// validator_address defines the validator address to query for.
  final BaseAddress? validatorAddress;
  const DistributionQueryValidatorCommissionRequest({this.validatorAddress});
  factory DistributionQueryValidatorCommissionRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionQueryValidatorCommissionRequest(
        validatorAddress: decode
            .getResult(1)
            ?.to<BaseAddress, String>((e) => BaseAddress(e)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  String get queryPath =>
      DistributionV1beta1Types.distributionValidatorCommission.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"validator_address": validatorAddress?.address};
  }

  @override
  String get typeUrl => DistributionV1beta1Types
      .distributionQueryValidatorCommissionRequest.typeUrl;

  @override
  List get values => [validatorAddress];

  @override
  DistributionQueryValidatorCommissionResponse onResponse(List<int> bytes) {
    return DistributionQueryValidatorCommissionResponse.deserialize(bytes);
  }
}
