import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// QueryDelegatorValidatorsResponse is the response type for the Query/DelegatorValidators RPC method.
class DistributionQueryDelegatorValidatorsResponse extends CosmosMessage {
  /// validators defines the validators a delegator is delegating for.
  final List<String> validators;
  DistributionQueryDelegatorValidatorsResponse(List<String> validators)
      : validators = validators.immutable;
  factory DistributionQueryDelegatorValidatorsResponse.fromJson(
      Map<String, dynamic> json) {
    return DistributionQueryDelegatorValidatorsResponse(
        (json["validators"] as List?)?.cast() ?? []);
  }
  factory DistributionQueryDelegatorValidatorsResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionQueryDelegatorValidatorsResponse(
        decode.getFields<String>(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"validators": validators};
  }

  @override
  TypeUrl get typeUrl =>
      DistributionV1beta1Types.distributionQueryDelegatorValidatorsResponse;

  @override
  List get values => [validators];
}
