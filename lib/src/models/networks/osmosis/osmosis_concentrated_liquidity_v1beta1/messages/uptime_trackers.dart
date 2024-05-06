import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/dec_coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class OsmosisConcentratedLiquidityUptimeTracker extends CosmosMessage {
  final List<DecCoin> uptimeGrowthOutside;
  OsmosisConcentratedLiquidityUptimeTracker(List<DecCoin> uptimeGrowthOutside)
      : uptimeGrowthOutside = uptimeGrowthOutside.mutable;
  factory OsmosisConcentratedLiquidityUptimeTracker.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityUptimeTracker(
        decode.getFields(1).map((e) => DecCoin.deserialize(e)).toList());
  }
  factory OsmosisConcentratedLiquidityUptimeTracker.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityUptimeTracker(
        (json["uptime_growth_outside"] as List?)
                ?.map((e) => DecCoin.fromRpc(e))
                .toList() ??
            <DecCoin>[]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {
      "uptime_growth_outside":
          uptimeGrowthOutside.map((e) => e.toJson()).toList()
    };
  }

  @override
  List get values => [uptimeGrowthOutside];

  @override
  String get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.uptimeTracker.typeUrl;
}
