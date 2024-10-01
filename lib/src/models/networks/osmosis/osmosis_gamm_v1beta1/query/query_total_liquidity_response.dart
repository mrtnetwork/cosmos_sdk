import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisGammQueryTotalLiquidityResponse extends CosmosMessage {
  final List<Coin> liquidity;

  OsmosisGammQueryTotalLiquidityResponse({required List<Coin> liquidity})
      : liquidity = liquidity.immutable;
  factory OsmosisGammQueryTotalLiquidityResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammQueryTotalLiquidityResponse(
        liquidity: decode
            .getFields<List<int>>(1)
            .map((e) => Coin.deserialize(e))
            .toList());
  }
  factory OsmosisGammQueryTotalLiquidityResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisGammQueryTotalLiquidityResponse(
        liquidity: (json["liquidity"] as List?)
                ?.map((e) => Coin.fromRpc(e))
                .toList() ??
            <Coin>[]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"liquidity": liquidity.map((e) => e.toJson()).toList()};
  }

  @override
  String get typeUrl =>
      OsmosisGammV1beta1Types.queryTotalLiquidityResponse.typeUrl;

  @override
  List get values => [liquidity];
}
