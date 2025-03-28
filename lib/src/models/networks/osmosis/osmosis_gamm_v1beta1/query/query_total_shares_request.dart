import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'query_total_shares_response.dart';

class OsmosisGammQueryTotalSharesRequest extends CosmosMessage
    with QueryMessage<OsmosisGammQueryTotalSharesResponse> {
  final BigInt poolId;
  const OsmosisGammQueryTotalSharesRequest(this.poolId);
  factory OsmosisGammQueryTotalSharesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammQueryTotalSharesRequest(decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  OsmosisGammQueryTotalSharesResponse onResponse(List<int> bytes) {
    return OsmosisGammQueryTotalSharesResponse.deserialize(bytes);
  }

  @override
  Map<String, dynamic> toJson() {
    return {"pool_id": poolId.toString()};
  }

  @override
  TypeUrl get typeUrl => OsmosisGammV1beta1Types.queryTotalSharesRequest;

  @override
  List get values => [poolId];

  @override
  List<String> get pathParameters => [poolId.toString()];

  @override
  OsmosisGammQueryTotalSharesResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisGammQueryTotalSharesResponse.fromJson(json);
  }

  @override
  Map<String, String> get queryParameters => {};
}
