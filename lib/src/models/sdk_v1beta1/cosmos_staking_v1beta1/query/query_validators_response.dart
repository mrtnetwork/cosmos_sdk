import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/messages/validator.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// QueryValidatorsResponse is response type for the Query/Validators RPC method
class QueryValidatorsResponse extends CosmosMessage {
  /// validators contains all the queried validators.
  final List<StakingValidator> validators;

  /// pagination defines the pagination in the response.
  final PageResponse? pagination;
  const QueryValidatorsResponse({required this.validators, this.pagination});
  factory QueryValidatorsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryValidatorsResponse(
        validators: decode
            .getFileds<List<int>>(1)
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
  String get typeUrl => StakingV1beta1Types.queryValidatorsResponse.typeUrl;

  @override
  List get values => [validators, pagination];
}
