import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_accum_v1beta1/messages/record_msg.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

import 'position.dart';

/// Position contains position's id, address, pool id, lower tick, upper tick join time, and liquidity.
class OsmosisConcentratedLiquidityPositionData extends CosmosMessage {
  final OsmosisConcentratedLiquidityPosition? position;
  final BigInt? lockId;
  final OsmosisAccumRecord spreadRewardAccumRecord;
  final List<OsmosisAccumRecord> uptimeAccumRecords;
  OsmosisConcentratedLiquidityPositionData({
    this.position,
    this.lockId,
    required this.spreadRewardAccumRecord,
    required List<OsmosisAccumRecord> uptimeAccumRecords,
  }) : uptimeAccumRecords = uptimeAccumRecords.immutable;
  factory OsmosisConcentratedLiquidityPositionData.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityPositionData(
        position: decode
            .getResult(1)
            ?.to<OsmosisConcentratedLiquidityPosition, List<int>>(
                (e) => OsmosisConcentratedLiquidityPosition.deserialize(e)),
        lockId: decode.getField(2),
        spreadRewardAccumRecord:
            OsmosisAccumRecord.deserialize(decode.getField(3)),
        uptimeAccumRecords: decode
            .getFields<List<int>>(4)
            .map((e) => OsmosisAccumRecord.deserialize(e))
            .toList());
  }
  factory OsmosisConcentratedLiquidityPositionData.fromJson(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityPositionData(
        position: json["position"] == null
            ? null
            : OsmosisConcentratedLiquidityPosition.fromJson(json["position"]),
        lockId: BigintUtils.tryParse(json["lock_id"]),
        spreadRewardAccumRecord:
            OsmosisAccumRecord.fromJson(json["spread_reward_accum_record"]),
        uptimeAccumRecords: (json["uptime_accum_records"] as List?)
                ?.map((e) => OsmosisAccumRecord.deserialize(e))
                .toList() ??
            <OsmosisAccumRecord>[]);
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "position": position?.toJson(),
      "lock_id": lockId?.toString(),
      "spread_reward_accum_record": spreadRewardAccumRecord.toJson(),
      "uptime_accum_records": uptimeAccumRecords.map((e) => e.toJson()).toList()
    };
  }

  @override
  List get values =>
      [position, lockId, spreadRewardAccumRecord, uptimeAccumRecords];

  @override
  TypeUrl get typeUrl => OsmosisConcentratedLiquidityV1beta1Types.positionData;
}
