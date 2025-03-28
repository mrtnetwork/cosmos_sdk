import 'package:blockchain_utils/utils/numbers/utils/bigint_utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_tendermint_v1beta1/query/get_validator_set_by_height_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_tendermint_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// GetValidatorSetByHeightRequest is the request type for the Query/GetValidatorSetByHeight RPC method.
class GetValidatorSetByHeightRequest extends CosmosMessage
    with QueryMessage<GetValidatorSetByHeightResponse> {
  /// height must be a int for grpc and can be string tag like 'latest' for RPC
  final String height;

  /// pagination defines an pagination for the request.
  final PageRequest? pagination;
  const GetValidatorSetByHeightRequest({required this.height, this.pagination});
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
  Map<String, dynamic> toJson() {
    return {"height": height, "pagination": pagination?.toJson()};
  }

  @override
  TypeUrl get typeUrl =>
      BaseTendermintV1beta1Types.getValidatorSetByHeightRequest;

  @override
  List get values => [BigintUtils.tryParse(height), pagination];

  @override
  GetValidatorSetByHeightResponse onResponse(List<int> bytes) {
    return GetValidatorSetByHeightResponse.deserialize(bytes);
  }

  @override
  GetValidatorSetByHeightResponse onJsonResponse(Map<String, dynamic> json) {
    return GetValidatorSetByHeightResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [height];

  @override
  Map<String, String?> get queryParameters => pagination?.queryParameters ?? {};
}
