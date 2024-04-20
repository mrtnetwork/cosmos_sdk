import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/query/query_validator_distribution_info_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryValidatorDistributionInfoRequest is the request type for the Query/ValidatorDistributionInfo RPC method.
class DistributionQueryValidatorDistributionInfoRequest extends CosmosMessage
    with QueryMessage<DistributionQueryValidatorDistributionInfoResponse> {
  /// validator_address defines the validator address to query for.
  final CosmosBaseAddress? validatorAddress;
  const DistributionQueryValidatorDistributionInfoRequest(
      {this.validatorAddress});
  factory DistributionQueryValidatorDistributionInfoRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionQueryValidatorDistributionInfoRequest(
        validatorAddress: decode
            .getResult(1)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  String get queryPath =>
      DistributionV1beta1Types.distributionValidatorDistributionInfo.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"validator_address": validatorAddress?.address};
  }

  @override
  String get typeUrl => DistributionV1beta1Types
      .distributionQueryValidatorDistributionInfoRequest.typeUrl;

  @override
  List get values => [validatorAddress?.address];

  @override
  DistributionQueryValidatorDistributionInfoResponse onResponse(
      List<int> bytes) {
    return DistributionQueryValidatorDistributionInfoResponse.deserialize(
        bytes);
  }
}
