import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/query/query_validator_distribution_info_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryValidatorDistributionInfoRequest is the request type for the Query/ValidatorDistributionInfo RPC method.
class DistributionQueryValidatorDistributionInfoRequest extends CosmosMessage
    with QueryMessage<DistributionQueryValidatorDistributionInfoResponse> {
  /// validator_address defines the validator address to query for.
  final CosmosBaseAddress validatorAddress;
  const DistributionQueryValidatorDistributionInfoRequest({
    required this.validatorAddress,
  });
  factory DistributionQueryValidatorDistributionInfoRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionQueryValidatorDistributionInfoRequest(
      validatorAddress: CosmosBaseAddress(decode.getField(1)),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"validator_address": validatorAddress.address};
  }

  @override
  TypeUrl get typeUrl =>
      DistributionV1beta1Types
          .distributionQueryValidatorDistributionInfoRequest;

  @override
  List get values => [validatorAddress.address];

  @override
  DistributionQueryValidatorDistributionInfoResponse onResponse(
    List<int> bytes,
  ) {
    return DistributionQueryValidatorDistributionInfoResponse.deserialize(
      bytes,
    );
  }

  @override
  DistributionQueryValidatorDistributionInfoResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return DistributionQueryValidatorDistributionInfoResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [validatorAddress.address];
}
