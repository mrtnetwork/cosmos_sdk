import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_cosmwasmpool_v1beta1/query/pools_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_cosmwasmpool_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/cosmos_base_query_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisCosmWasmPoolPoolsRequest extends CosmosMessage
    with QueryMessage<OsmosisCosmWasmPoolPoolsResponse> {
  /// pagination defines an optional pagination for the request
  final PageRequest? pagination;

  OsmosisCosmWasmPoolPoolsRequest({this.pagination});
  factory OsmosisCosmWasmPoolPoolsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisCosmWasmPoolPoolsRequest(
        pagination: decode
            .getResult(1)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [2];

  @override
  Map<String, dynamic> toJson() {
    return {"pagination": pagination?.toJson()};
  }

  @override
  TypeUrl get typeUrl => OsmosisCosmWasmPoolV1beta1Types.poolsRequest;

  @override
  List get values => [pagination];

  @override
  OsmosisCosmWasmPoolPoolsResponse onResponse(List<int> bytes) {
    return OsmosisCosmWasmPoolPoolsResponse.deserialize(bytes);
  }

  @override
  OsmosisCosmWasmPoolPoolsResponse onJsonResponse(Map<String, dynamic> json) {
    return OsmosisCosmWasmPoolPoolsResponse.fromJson(json);
  }

  @override
  Map<String, String?> get queryParameters => pagination?.queryParameters ?? {};
}
