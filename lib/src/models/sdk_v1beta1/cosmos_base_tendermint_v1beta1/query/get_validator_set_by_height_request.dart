import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_tendermint_v1beta1/query/get_validator_set_by_height_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_tendermint_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// GetValidatorSetByHeightRequest is the request type for the Query/GetValidatorSetByHeight RPC method.
class GetValidatorSetByHeightRequest extends CosmosMessage
    with QueryMessage<GetValidatorSetByHeightResponse> {
  final BigInt? height;

  /// pagination defines an pagination for the request.
  final PageRequest? pagination;
  const GetValidatorSetByHeightRequest({this.height, this.pagination});
  factory GetValidatorSetByHeightRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GetValidatorSetByHeightRequest(
        height: decode.getField(1),
        pagination: decode
            .getResult(2)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  String get queryPath =>
      BaseTendermintV1beta1Types.getValidatorSetByHeight.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"height": height?.toString(), "pagination": pagination?.toJson()};
  }

  @override
  String get typeUrl =>
      BaseTendermintV1beta1Types.getValidatorSetByHeightRequest.typeUrl;

  @override
  List get values => [height, pagination];

  @override
  GetValidatorSetByHeightResponse onResponse(List<int> bytes) {
    return GetValidatorSetByHeightResponse.deserialize(bytes);
  }
}
