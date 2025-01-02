import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'uptime_trackers.dart';

class OsmosisConcentratedLiquidityUptimeTrackers extends CosmosMessage {
  final List<OsmosisConcentratedLiquidityUptimeTracker> list;
  OsmosisConcentratedLiquidityUptimeTrackers(
      List<OsmosisConcentratedLiquidityUptimeTracker> list)
      : list = list.immutable;
  factory OsmosisConcentratedLiquidityUptimeTrackers.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityUptimeTrackers(decode
        .getFields(1)
        .map((e) => OsmosisConcentratedLiquidityUptimeTracker.deserialize(e))
        .toList());
  }
  factory OsmosisConcentratedLiquidityUptimeTrackers.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityUptimeTrackers((json["list"] as List?)
            ?.map((e) => OsmosisConcentratedLiquidityUptimeTracker.fromRpc(e))
            .toList() ??
        <OsmosisConcentratedLiquidityUptimeTracker>[]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"list": list.map((e) => e.toJson()).toList()};
  }

  @override
  List get values => [list];

  @override
  TypeUrl get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.uptimeTrackers;
}
