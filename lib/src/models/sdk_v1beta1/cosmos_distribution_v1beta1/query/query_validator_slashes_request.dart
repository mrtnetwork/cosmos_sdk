import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/query/query_validator_slashes_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryValidatorSlashesRequest is the request type for the Query/ValidatorSlashes RPC method
class DistributionQueryValidatorSlashesRequest extends CosmosMessage
    with QueryMessage<DistributionQueryValidatorSlashesResponse> {
  /// validator_address defines the validator address to query for.
  final BaseAddress? validatorAddress;

  /// starting_height defines the optional starting height to query the slashes.
  final BigInt? startingHeight;

  /// starting_height defines the optional ending height to query the slashes.
  final BigInt? endingHeight;

  /// pagination defines an optional pagination for the request.
  final PageRequest? pagination;
  const DistributionQueryValidatorSlashesRequest(
      {this.validatorAddress,
      this.startingHeight,
      this.endingHeight,
      this.pagination});
  factory DistributionQueryValidatorSlashesRequest.deserialize(
      List<int> bytes) {
    final deocde = CosmosProtocolBuffer.decode(bytes);
    return DistributionQueryValidatorSlashesRequest(
        validatorAddress:
            deocde.getResult(1)?.to<BaseAddress, String>((e) => BaseAddress(e)),
        startingHeight: deocde.getField(2),
        endingHeight: deocde.getField(3),
        pagination: deocde
            .getResult(4)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  String get queryPath =>
      DistributionV1beta1Types.distributionValidatorSlashes.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "validator_address": validatorAddress?.address,
      "starting_height": startingHeight?.toString(),
      "ending_height": endingHeight?.toString(),
      "pagination": pagination?.toJson()
    };
  }

  @override
  String get typeUrl =>
      DistributionV1beta1Types.distributionQueryValidatorSlashesRequest.typeUrl;

  @override
  List get values =>
      [validatorAddress?.address, startingHeight, endingHeight, pagination];

  @override
  DistributionQueryValidatorSlashesResponse onResponse(List<int> bytes) {
    return DistributionQueryValidatorSlashesResponse.deserialize(bytes);
  }
}
