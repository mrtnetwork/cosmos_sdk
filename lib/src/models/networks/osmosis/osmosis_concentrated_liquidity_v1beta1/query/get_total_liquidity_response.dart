import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class OsmosisConcentratedLiquidityGetTotalLiquidityResponse
    extends CosmosMessage {
  final List<Coin> totalLiquidity;

  OsmosisConcentratedLiquidityGetTotalLiquidityResponse(
      List<Coin> totalLiquidity)
      : totalLiquidity = totalLiquidity.mutable;
  factory OsmosisConcentratedLiquidityGetTotalLiquidityResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityGetTotalLiquidityResponse(
        decode.getFields(1).map((e) => Coin.deserialize(e)).toList());
  }
  factory OsmosisConcentratedLiquidityGetTotalLiquidityResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityGetTotalLiquidityResponse(
      (json["total_liquidity"] as List?)
              ?.map((e) => Coin.fromRpc(e))
              .toList() ??
          <Coin>[],
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"total_liquidity": totalLiquidity.map((e) => e.toJson()).toList()};
  }

  @override
  String get typeUrl => OsmosisConcentratedLiquidityV1beta1Types
      .getTotalLiquidityResponse.typeUrl;

  @override
  List get values => [totalLiquidity];
}
