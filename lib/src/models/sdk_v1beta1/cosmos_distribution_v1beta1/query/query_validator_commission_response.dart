import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/messages/validator_accumulated_commission.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryValidatorCommissionResponse is the response type for the Query/ValidatorCommission RPC method
class DistributionQueryValidatorCommissionResponse extends CosmosMessage {
  /// commission defines the commission the validator received.
  final DistributionValidatorAccumulatedCommission commission;
  const DistributionQueryValidatorCommissionResponse(this.commission);
  factory DistributionQueryValidatorCommissionResponse.fromJson(
      Map<String, dynamic> json) {
    return DistributionQueryValidatorCommissionResponse(
        DistributionValidatorAccumulatedCommission.fromJson(
            json["commission"]));
  }
  factory DistributionQueryValidatorCommissionResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionQueryValidatorCommissionResponse(
        DistributionValidatorAccumulatedCommission.deserialize(
            decode.getField(1)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"commission": commission.toJson()};
  }

  @override
  TypeUrl get typeUrl =>
      DistributionV1beta1Types.distributionQueryValidatorCommissionResponse;

  @override
  List get values => [commission];
}
