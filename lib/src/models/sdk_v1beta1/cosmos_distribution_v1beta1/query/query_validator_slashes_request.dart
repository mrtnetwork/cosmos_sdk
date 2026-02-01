import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/query/query_validator_slashes_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryValidatorSlashesRequest is the request type for the Query/ValidatorSlashes RPC method
class DistributionQueryValidatorSlashesRequest extends CosmosMessage
    with QueryMessage<DistributionQueryValidatorSlashesResponse> {
  /// validator_address defines the validator address to query for.
  final CosmosBaseAddress validatorAddress;

  /// starting_height defines the optional starting height to query the slashes.
  final BigInt? startingHeight;

  /// starting_height defines the optional ending height to query the slashes.
  final BigInt? endingHeight;

  /// pagination defines an optional pagination for the request.
  final PageRequest? pagination;
  const DistributionQueryValidatorSlashesRequest({
    required this.validatorAddress,
    this.startingHeight,
    this.endingHeight,
    this.pagination,
  });
  factory DistributionQueryValidatorSlashesRequest.deserialize(
    List<int> bytes,
  ) {
    final deocde = CosmosProtocolBuffer.decode(bytes);
    return DistributionQueryValidatorSlashesRequest(
      validatorAddress: CosmosBaseAddress(deocde.getField(1)),
      startingHeight: deocde.getField(2),
      endingHeight: deocde.getField(3),
      pagination: deocde
          .getResult(4)
          ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "validator_address": validatorAddress.address,
      "starting_height": startingHeight?.toString(),
      "ending_height": endingHeight?.toString(),
      "pagination": pagination?.toJson(),
    };
  }

  @override
  Map<String, String?> get queryParameters => {
    "starting_height": startingHeight?.toString(),
    "ending_height": endingHeight?.toString(),
    ...pagination?.queryParameters ?? {},
  };

  @override
  TypeUrl get typeUrl =>
      DistributionV1beta1Types.distributionQueryValidatorSlashesRequest;

  @override
  List get values => [
    validatorAddress.address,
    startingHeight,
    endingHeight,
    pagination,
  ];

  @override
  DistributionQueryValidatorSlashesResponse onResponse(List<int> bytes) {
    return DistributionQueryValidatorSlashesResponse.deserialize(bytes);
  }

  @override
  DistributionQueryValidatorSlashesResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return DistributionQueryValidatorSlashesResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [validatorAddress.address];
}
