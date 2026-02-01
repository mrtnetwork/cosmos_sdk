import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_tendermint_v1beta1/messages/validator.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_tendermint_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// GetValidatorSetByHeightResponse is the response type for the Query/GetValidatorSetByHeight RPC method.
class GetValidatorSetByHeightResponse extends CosmosMessage {
  final BigInt? blockHeight;
  final List<CosmosTendermintValidator> validators;

  /// pagination defines an pagination for the response.
  final PageResponse? pagination;

  factory GetValidatorSetByHeightResponse.fromJson(Map<String, dynamic> json) {
    return GetValidatorSetByHeightResponse(
      validators:
          (json["validators"] as List?)
              ?.map((e) => CosmosTendermintValidator.fromJson(e))
              .toList() ??
          [],
      blockHeight: BigintUtils.tryParse(json["block_height"]),
      pagination:
          json["pagination"] == null
              ? null
              : PageResponse.fromJson(json["pagination"]),
    );
  }

  GetValidatorSetByHeightResponse({
    this.blockHeight,
    required List<CosmosTendermintValidator> validators,
    this.pagination,
  }) : validators = validators.immutable;
  factory GetValidatorSetByHeightResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GetValidatorSetByHeightResponse(
      blockHeight: decode.getField(1),
      validators:
          decode
              .getFields<List<int>>(2)
              .map((e) => CosmosTendermintValidator.deserialize(e))
              .toList(),
      pagination: decode
          .getResult(3)
          ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "block_height": blockHeight?.toString(),
      "validator": validators.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl =>
      BaseTendermintV1beta1Types.getValidatorSetByHeightResponse;

  @override
  List get values => [blockHeight, validators, pagination];
}
