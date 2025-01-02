import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'tick_accumulator_trackers_response.dart';

class OsmosisConcentratedLiquidityTickAccumulatorTrackersRequest
    extends CosmosMessage
    with
        QueryMessage<
            OsmosisConcentratedLiquidityTickAccumulatorTrackersResponse> {
  final BigInt? poolId;
  final BigInt? tickIndex;
  OsmosisConcentratedLiquidityTickAccumulatorTrackersRequest(
      {this.poolId, this.tickIndex});
  factory OsmosisConcentratedLiquidityTickAccumulatorTrackersRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityTickAccumulatorTrackersRequest(
        poolId: decode.getField(1), tickIndex: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, String?> get queryParameters =>
      {"pool_id": poolId?.toString(), "tick_index": tickIndex?.toString()};

  @override
  Map<String, dynamic> toJson() {
    return {"pool_id": poolId?.toString(), "tick_index": tickIndex?.toString()};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.tickAccumulatorTrackersRequest;

  @override
  List get values => [poolId, tickIndex];

  @override
  OsmosisConcentratedLiquidityTickAccumulatorTrackersResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityTickAccumulatorTrackersResponse.fromRpc(
        json);
  }

  @override
  OsmosisConcentratedLiquidityTickAccumulatorTrackersResponse onResponse(
      List<int> bytes) {
    return OsmosisConcentratedLiquidityTickAccumulatorTrackersResponse
        .deserialize(bytes);
  }
}
