import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'tick_info.dart';

/// FullTick contains tick index and pool id along with other tick model information.
class OsmosisConcentratedLiquidityFullTick extends CosmosMessage {
  /// pool id associated with the tick.
  final BigInt? poolId;

  /// tick's index.
  final BigInt? tickIndex;

  /// tick's info.
  final OsmosisConcentratedLiquidityTickInfo info;
  OsmosisConcentratedLiquidityFullTick(
      {this.poolId, this.tickIndex, required this.info});
  factory OsmosisConcentratedLiquidityFullTick.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityFullTick(
        poolId: decode.getField(1),
        tickIndex: decode.getField(2),
        info: OsmosisConcentratedLiquidityTickInfo.deserialize(
            decode.getField(3)));
  }
  factory OsmosisConcentratedLiquidityFullTick.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityFullTick(
        poolId: BigintUtils.tryParse(json["pool_id"]),
        tickIndex: BigintUtils.tryParse(json["tick_index"]),
        info: OsmosisConcentratedLiquidityTickInfo.fromRpc(json["info"]));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "pool_id": poolId?.toString(),
      "tick_index": tickIndex?.toString(),
      "info": info.toJson()
    };
  }

  @override
  List get values => [poolId, tickIndex, info];

  @override
  String get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.fullTick.typeUrl;
}
