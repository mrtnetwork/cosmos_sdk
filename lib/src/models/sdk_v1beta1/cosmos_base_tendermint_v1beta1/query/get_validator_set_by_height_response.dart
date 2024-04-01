import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_tendermint_v1beta1/messages/validator.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_tendermint_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// GetValidatorSetByHeightResponse is the response type for the Query/GetValidatorSetByHeight RPC method.
class GetValidatorSetByHeightResponse extends CosmosMessage {
  final BigInt? blockHeight;
  final List<CosmosTendermintValidator> validator;

  /// pagination defines an pagination for the response.
  final PageResponse? pagination;
  GetValidatorSetByHeightResponse(
      {this.blockHeight,
      required List<CosmosTendermintValidator> validator,
      this.pagination})
      : validator = validator.mutable;
  factory GetValidatorSetByHeightResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GetValidatorSetByHeightResponse(
        blockHeight: decode.getField(1),
        validator: decode
            .getFileds<List<int>>(2)
            .map((e) => CosmosTendermintValidator.deserialize(e))
            .toList(),
        pagination: decode
            .getResult(3)
            ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "block_height": blockHeight?.toString(),
      "validator": validator.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson()
    };
  }

  @override
  String get typeUrl =>
      BaseTendermintV1beta1Types.getValidatorSetByHeightResponse.typeUrl;

  @override
  List get values => [blockHeight, validator, pagination];
}
