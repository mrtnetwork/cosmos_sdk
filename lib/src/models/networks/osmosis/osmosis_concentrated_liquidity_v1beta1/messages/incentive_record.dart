import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'incentive_record_body.dart';

/// IncentiveRecord is the high-level struct we use to deal with an independent incentive being distributed on a pool.
/// Note that PoolId, Denom, and MinUptime are included in the key so we avoid storing them in state,
/// hence the distinction between IncentiveRecord and IncentiveRecordBody.
class OsmosisConcentratedLiquidityIncentiveRecord extends CosmosMessage {
  /// incentive_id is the id uniquely identifying this incentive record.
  final BigInt? incentiveId;
  final BigInt? poolId;

  /// incentive record body holds necessary
  final OsmosisConcentratedLiquidityIncentiveRecordBody incentiveRecordBody;

  /// min_uptime is the minimum uptime required for liquidity to qualify for this
  /// incentive. It should be always be one of the supported uptimes in
  /// types.SupportedUptimes
  final ProtobufDuration minUptime;

  OsmosisConcentratedLiquidityIncentiveRecord(
      {this.incentiveId,
      this.poolId,
      required this.incentiveRecordBody,
      required this.minUptime});
  factory OsmosisConcentratedLiquidityIncentiveRecord.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityIncentiveRecord(
        incentiveId: decode.getField(1),
        poolId: decode.getField(2),
        incentiveRecordBody:
            OsmosisConcentratedLiquidityIncentiveRecordBody.deserialize(
                decode.getField(4)),
        minUptime: ProtobufDuration.deserialize(decode.getField(5)));
  }
  factory OsmosisConcentratedLiquidityIncentiveRecord.fromJson(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityIncentiveRecord(
        incentiveId: BigintUtils.tryParse(json["incentive_id"]),
        poolId: BigintUtils.tryParse(json["pool_id"]),
        incentiveRecordBody:
            OsmosisConcentratedLiquidityIncentiveRecordBody.fromJson(
                json["incentive_record_body"]),
        minUptime: ProtobufDuration.fromString(json["min_uptime"]));
  }

  @override
  List<int> get fieldIds => [1, 2, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "incentive_id": incentiveId?.toString(),
      "pool_id": poolId?.toString(),
      "incentive_record_body": incentiveRecordBody.toJson(),
      "min_uptime": minUptime.toJson()
    };
  }

  @override
  List get values => [incentiveId, poolId, incentiveRecordBody, minUptime];

  @override
  TypeUrl get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.incentiveRecord;
}
