import 'package:blockchain_utils/numbers/bigint_utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Position contains position's id, address, pool id, lower tick, upper tick join time, and liquidity.
class OsmosisConcentratedLiquidityPosition extends CosmosMessage {
  final BigInt? positionId;
  final String? address;
  final BigInt? poolId;
  final BigInt? lowerTick;
  final BigInt? upperTick;
  final ProtobufTimestamp joinTime;
  final String liquidity;
  OsmosisConcentratedLiquidityPosition(
      {this.positionId,
      this.address,
      this.poolId,
      this.lowerTick,
      this.upperTick,
      required this.joinTime,
      required this.liquidity});
  factory OsmosisConcentratedLiquidityPosition.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityPosition(
        positionId: decode.getField(1),
        address: decode.getField(2),
        poolId: decode.getField(3),
        lowerTick: decode.getField(4),
        upperTick: decode.getField(5),
        joinTime: ProtobufTimestamp.deserialize(decode.getField(6)),
        liquidity: decode.getField(7));
  }
  factory OsmosisConcentratedLiquidityPosition.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityPosition(
        positionId: BigintUtils.tryParse(json["position_id"]),
        address: json["address"],
        poolId: BigintUtils.tryParse(json["pool_id"]),
        lowerTick: BigintUtils.tryParse(json["lower_tick"]),
        upperTick: BigintUtils.tryParse(json["upper_tick"]),
        joinTime: ProtobufTimestamp.fromString(json["join_time"]),
        liquidity: json["liquidity"]);
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7];

  @override
  Map<String, dynamic> toJson() {
    return {
      "position_id": positionId?.toString(),
      "address": address,
      "pool_id": poolId?.toString(),
      "lower_tick": lowerTick?.toString(),
      "upper_tick": upperTick?.toString(),
      "join_time": joinTime.toJson(),
      "liquidity": liquidity
    };
  }

  @override
  List get values =>
      [positionId, address, poolId, lowerTick, upperTick, joinTime, liquidity];

  @override
  String get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.position.typeUrl;
}
