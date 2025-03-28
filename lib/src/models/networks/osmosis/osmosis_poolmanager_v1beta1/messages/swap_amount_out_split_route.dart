import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

import 'swap_amount_out_route.dart';

class OsmosisPoolManagerSwapAmountOutSplitRoute extends CosmosMessage {
  final List<OsmosisPoolManagerSwapAmountOutRoute> pools;
  final String tokenOutAmount;

  OsmosisPoolManagerSwapAmountOutSplitRoute(
      {required this.pools, required this.tokenOutAmount});
  factory OsmosisPoolManagerSwapAmountOutSplitRoute.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerSwapAmountOutSplitRoute(
        pools: decode
            .getFields<List<int>>(1)
            .map((e) => OsmosisPoolManagerSwapAmountOutRoute.deserialize(e))
            .toList(),
        tokenOutAmount: decode.getField(2));
  }
  factory OsmosisPoolManagerSwapAmountOutSplitRoute.fromJson(
      Map<String, dynamic> json) {
    return OsmosisPoolManagerSwapAmountOutSplitRoute(
        pools: json
                .asListOfMap("pools")
                ?.map((e) => OsmosisPoolManagerSwapAmountOutRoute.fromJson(e))
                .toList() ??
            [],
        tokenOutAmount: json.as("token_out_amount"));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "pools": pools.map((e) => e.toJson()).toList(),
      "token_out_amount": tokenOutAmount
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisPoolManagerV1beta1Types.swapAmountOutSplitRoute;

  @override
  List get values => [pools, tokenOutAmount];
}
