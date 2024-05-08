import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'incentive_records_response.dart';

class OsmosisConcentratedLiquidityIncentiveRecordsRequest extends CosmosMessage
    with
        QueryMessage<OsmosisConcentratedLiquidityIncentiveRecordsResponse>,
        RPCMessage<OsmosisConcentratedLiquidityIncentiveRecordsResponse> {
  final BigInt? poolId;
  final PageRequest? pagination;

  const OsmosisConcentratedLiquidityIncentiveRecordsRequest(
      {this.poolId, this.pagination});
  factory OsmosisConcentratedLiquidityIncentiveRecordsRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityIncentiveRecordsRequest(
        poolId: decode.getField(1),
        pagination: decode
            .getResult(2)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, String?> get queryParameters => {"pool_id": poolId?.toString()};

  @override
  String get queryPath =>
      OsmosisConcentratedLiquidityV1beta1Types.incentiveRecords.typeUrl;

  @override
  String get rpcPath =>
      OsmosisConcentratedLiquidityV1beta1Types.incentiveRecords
          .rpcUrl(pathParameters: []);

  @override
  Map<String, dynamic> toJson() {
    return {"pool_id": poolId?.toString(), "pagination": pagination?.toJson()};
  }

  @override
  String get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.incentiveRecordsRequest.typeUrl;

  @override
  List get values => [poolId, pagination];

  @override
  OsmosisConcentratedLiquidityIncentiveRecordsResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityIncentiveRecordsResponse.fromRpc(json);
  }

  @override
  OsmosisConcentratedLiquidityIncentiveRecordsResponse onResponse(
      List<int> bytes) {
    return OsmosisConcentratedLiquidityIncentiveRecordsResponse.deserialize(
        bytes);
  }
}
