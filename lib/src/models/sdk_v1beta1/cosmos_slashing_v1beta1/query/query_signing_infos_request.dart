import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_slashing_v1beta1/query/query_signing_infos_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_slashing_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QuerySigningInfosRequest is the request type for the Query/SigningInfos RPC method
class SlashingQuerySigningInfosRequest extends CosmosMessage
    with QueryMessage<SlashingQuerySigningInfosResponse> {
  final PageRequest? pagination;
  const SlashingQuerySigningInfosRequest({this.pagination});
  factory SlashingQuerySigningInfosRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return SlashingQuerySigningInfosRequest(
        pagination: decode
            .getResult(1)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  String get queryPath => SlashingV1beta1Types.slashingSigningInfos.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"pagination": pagination?.toJson()};
  }

  @override
  String get typeUrl =>
      SlashingV1beta1Types.slashingQuerySigningInfosRequest.typeUrl;

  @override
  List get values => [pagination];
  @override
  SlashingQuerySigningInfosResponse onResponse(List<int> bytes) {
    return SlashingQuerySigningInfosResponse.deserialize(bytes);
  }
}
