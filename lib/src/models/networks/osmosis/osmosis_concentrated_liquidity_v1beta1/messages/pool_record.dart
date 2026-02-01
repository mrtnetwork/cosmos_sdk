import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// PoolIdToTickSpacingRecord is a struct that contains a pool id to new tick spacing pair.
class OsmosisConcentratedLiquidityPoolRecord extends CosmosMessage {
  final String? denom0;
  final String? denom1;
  final BigInt? tickSpacing;
  final String spreadFactor;
  OsmosisConcentratedLiquidityPoolRecord({
    this.denom0,
    this.denom1,
    this.tickSpacing,
    required this.spreadFactor,
  });
  factory OsmosisConcentratedLiquidityPoolRecord.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityPoolRecord(
      denom0: decode.getField(1),
      denom1: decode.getField(2),
      tickSpacing: decode.getField(3),
      spreadFactor: decode.getField(5),
    );
  }
  factory OsmosisConcentratedLiquidityPoolRecord.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisConcentratedLiquidityPoolRecord(
      denom0: json["denom0"],
      denom1: json["denom1"],
      tickSpacing: BigintUtils.tryParse(json["tick_spacing"]),
      spreadFactor: json["spread_factor"],
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "denom0": denom0,
      "denom1": denom1,
      "tick_spacing": tickSpacing?.toString(),
      "spread_factor": spreadFactor,
    };
  }

  @override
  List get values => [denom0, denom1, tickSpacing, spreadFactor];

  @override
  TypeUrl get typeUrl => OsmosisConcentratedLiquidityV1beta1Types.poolRecord;
}
