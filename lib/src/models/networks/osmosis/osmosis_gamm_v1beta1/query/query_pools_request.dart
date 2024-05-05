import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';

import 'query_pools_response.dart';

class OsmosisGammQueryPoolsRequest extends CosmosMessage
    with
        QueryMessage<OsmosisGammQueryPoolsResponse>,
        RPCMessage<OsmosisGammQueryPoolsResponse> {
  /// pagination defines an optional pagination for the request.
  final PageRequest? pagination;
  const OsmosisGammQueryPoolsRequest({this.pagination});
  factory OsmosisGammQueryPoolsRequest.fromBytes(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammQueryPoolsRequest(
        pagination: decode
            .getResult(2)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [2];

  @override
  OsmosisGammQueryPoolsResponse onResponse(List<int> bytes) {
    return OsmosisGammQueryPoolsResponse.deserialize(bytes);
  }

  @override
  String get queryPath => OsmosisGammV1beta1Types.pools.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"pagination": pagination?.toJson()};
  }

  @override
  String get typeUrl => OsmosisGammV1beta1Types.queryPoolsRequest.typeUrl;

  @override
  List get values => [pagination];

  @override
  OsmosisGammQueryPoolsResponse onJsonResponse(Map<String, dynamic> json) {
    return OsmosisGammQueryPoolsResponse.fromRpc(json);
  }

  @override
  Map<String, String> get queryParameters => {};

  @override
  String get rpcPath => OsmosisGammV1beta1Types.pools.rpcUrl();
}
