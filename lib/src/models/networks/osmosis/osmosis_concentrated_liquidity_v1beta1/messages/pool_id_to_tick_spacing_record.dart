import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// PoolIdToTickSpacingRecord is a struct that contains a pool id to new tick spacing pair.
class OsmosisConcentratedLiquidityPoolIdToTickSpacingRecord
    extends CosmosMessage {
  final BigInt? poolId;
  final BigInt? newTickspacing;
  OsmosisConcentratedLiquidityPoolIdToTickSpacingRecord(
      {this.poolId, this.newTickspacing});
  factory OsmosisConcentratedLiquidityPoolIdToTickSpacingRecord.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityPoolIdToTickSpacingRecord(
        poolId: decode.getField(1), newTickspacing: decode.getField(2));
  }
  factory OsmosisConcentratedLiquidityPoolIdToTickSpacingRecord.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityPoolIdToTickSpacingRecord(
        poolId: BigintUtils.tryParse(json["pool_id"]),
        newTickspacing: BigintUtils.tryParse(json["new_tick_spacing"]));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "pool_id": poolId?.toString(),
      "new_tick_spacing": newTickspacing?.toString()
    };
  }

  @override
  List get values => [poolId, newTickspacing];

  @override
  TypeUrl get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.poolIdToTickSpacingRecord;
}
