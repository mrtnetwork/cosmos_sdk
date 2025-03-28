import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/messages/period_lock.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'position.dart';

/// Position contains position's id, address, pool id, lower tick, upper tick join time, and liquidity.
class OsmosisConcentratedLiquidityPositionWithPeriodLock extends CosmosMessage {
  final OsmosisConcentratedLiquidityPosition position;
  final OsmosisLockupPeriodLock locks;
  const OsmosisConcentratedLiquidityPositionWithPeriodLock(
      {required this.position, required this.locks});
  factory OsmosisConcentratedLiquidityPositionWithPeriodLock.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityPositionWithPeriodLock(
        position: OsmosisConcentratedLiquidityPosition.deserialize(
            decode.getField(1)),
        locks: OsmosisLockupPeriodLock.deserialize(decode.getField(2)));
  }
  factory OsmosisConcentratedLiquidityPositionWithPeriodLock.fromJson(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityPositionWithPeriodLock(
      position: OsmosisConcentratedLiquidityPosition.fromJson(json["position"]),
      locks: OsmosisLockupPeriodLock.fromJson(json["locks"]),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"position": position.toJson(), "locks": locks.toJson()};
  }

  @override
  List get values => [position, locks];

  @override
  TypeUrl get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.positionWithPeriodLock;
}
