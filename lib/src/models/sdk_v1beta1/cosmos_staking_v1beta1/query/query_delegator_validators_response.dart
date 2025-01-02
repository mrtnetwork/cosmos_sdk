import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/messages/validator.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// QueryDelegatorValidatorsResponse is response type for the Query/DelegatorValidators RPC method.
class QueryDelegatorValidatorsResponse extends CosmosMessage {
  /// validators defines the validators' info of a delegator.
  final List<StakingValidator> validators;

  /// pagination defines the pagination in the response.
  final PageResponse? pagination;
  factory QueryDelegatorValidatorsResponse.fromRpc(Map<String, dynamic> json) {
    return QueryDelegatorValidatorsResponse(
      validators: (json["validators"] as List?)
              ?.map((e) => StakingValidator.fromRpc(e))
              .toList() ??
          [],
      pagination: json["pagination"] == null
          ? null
          : PageResponse.fromRpc(json["pagination"]),
    );
  }
  QueryDelegatorValidatorsResponse(
      {required List<StakingValidator> validators, this.pagination})
      : validators = validators.immutable;
  factory QueryDelegatorValidatorsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryDelegatorValidatorsResponse(
        validators: decode
            .getFields(1)
            .map((e) => StakingValidator.deserialize(e))
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
      "validators": validators.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => StakingV1beta1Types.queryDelegatorValidatorsResponse;

  @override
  List get values => [validators, pagination];
}
