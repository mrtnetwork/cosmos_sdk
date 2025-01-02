import 'package:cosmos_sdk/src/models/global_messages/unknown_message.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'accum_object.dart';
import 'full_tick.dart';
import 'incentive_record.dart';

/// PoolData represents a serialized pool along with its ticks for genesis state.
class OsmosisConcentratedLiquidityPoolData extends CosmosMessage {
  /// pool struct.
  final AnyMessage? pool;

  /// pool's ticks
  final List<OsmosisConcentratedLiquidityFullTick> ticks;
  final OsmosisConcentratedLiquidityAccumObject spreadRewardAccumulator;
  final List<OsmosisConcentratedLiquidityAccumObject> incentivesAccumulators;

  /// incentive records to be set
  final List<OsmosisConcentratedLiquidityIncentiveRecord> incentiveRecords;

  OsmosisConcentratedLiquidityPoolData(
      {this.pool,
      required List<OsmosisConcentratedLiquidityFullTick> ticks,
      required this.spreadRewardAccumulator,
      required List<OsmosisConcentratedLiquidityAccumObject>
          incentivesAccumulators,
      required List<OsmosisConcentratedLiquidityIncentiveRecord>
          incentiveRecords})
      : ticks = ticks.immutable,
        incentivesAccumulators = incentivesAccumulators.immutable,
        incentiveRecords = incentiveRecords.immutable;
  factory OsmosisConcentratedLiquidityPoolData.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityPoolData(
        pool: decode
            .getResult(1)
            ?.to<AnyMessage, List<int>>((e) => AnyMessage.deserialize(e)),
        ticks: decode
            .getFields(2)
            .map((e) => OsmosisConcentratedLiquidityFullTick.deserialize(e))
            .toList(),
        spreadRewardAccumulator:
            OsmosisConcentratedLiquidityAccumObject.deserialize(
                decode.getField(3)),
        incentivesAccumulators: decode
            .getFields(4)
            .map((e) => OsmosisConcentratedLiquidityAccumObject.deserialize(e))
            .toList(),
        incentiveRecords: decode
            .getFields(5)
            .map((e) =>
                OsmosisConcentratedLiquidityIncentiveRecord.deserialize(e))
            .toList());
  }
  factory OsmosisConcentratedLiquidityPoolData.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityPoolData(
        pool: json["pool"] == null ? null : AnyMessage.fromRpc(json["pool"]),
        incentiveRecords: (json["incentive_records"] as List?)
                ?.map((e) =>
                    OsmosisConcentratedLiquidityIncentiveRecord.fromRpc(e))
                .toList() ??
            <OsmosisConcentratedLiquidityIncentiveRecord>[],
        spreadRewardAccumulator:
            OsmosisConcentratedLiquidityAccumObject.fromRpc(
                json["incentives_accumulators"]),
        incentivesAccumulators: (json["incentives_accumulators"] as List?)
                ?.map((e) => OsmosisConcentratedLiquidityAccumObject.fromRpc(e))
                .toList() ??
            <OsmosisConcentratedLiquidityAccumObject>[],
        ticks: (json["ticks"] as List?)
                ?.map((e) => OsmosisConcentratedLiquidityFullTick.fromRpc(e))
                .toList() ??
            <OsmosisConcentratedLiquidityFullTick>[]);
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "pool": pool?.toJson(),
      "ticks": ticks.map((e) => e.toJson()).toList(),
      "spread_reward_accumulator": spreadRewardAccumulator.toJson(),
      "incentives_accumulators":
          incentivesAccumulators.map((e) => e.toJson()).toList(),
      "incentive_records": incentiveRecords.map((e) => e.toJson()).toList()
    };
  }

  @override
  List get values => [
        pool,
        ticks,
        spreadRewardAccumulator,
        incentivesAccumulators,
        incentiveRecords,
      ];

  @override
  TypeUrl get typeUrl => OsmosisConcentratedLiquidityV1beta1Types.poolData;
}
