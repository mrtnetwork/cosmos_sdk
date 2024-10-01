import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/messages/validator_slash_event.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// QueryValidatorSlashesResponse is the response type for the Query/ValidatorSlashes RPC method.
class DistributionQueryValidatorSlashesResponse extends CosmosMessage {
  /// slashes defines the slashes the validator received.
  final List<DistributionValidatorSlashEvent> slashes;

  /// pagination defines the pagination in the response.
  final PageResponse? pagination;
  DistributionQueryValidatorSlashesResponse(
      {required List<DistributionValidatorSlashEvent> slashes, this.pagination})
      : slashes = slashes.immutable;
  factory DistributionQueryValidatorSlashesResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionQueryValidatorSlashesResponse(
        slashes: decode
            .getFields<List<int>>(1)
            .map((e) => DistributionValidatorSlashEvent.deserialize(e))
            .toList(),
        pagination: decode
            .getResult(2)
            ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "slashes": slashes.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson()
    };
  }

  @override
  String get typeUrl => DistributionV1beta1Types
      .distributionQueryValidatorSlashesResponse.typeUrl;

  @override
  List get values => [slashes, pagination];
}
