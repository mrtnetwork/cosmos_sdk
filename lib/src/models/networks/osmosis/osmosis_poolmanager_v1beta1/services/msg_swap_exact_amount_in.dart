import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/messages/swap_amount_in_route.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

import 'msg_swap_exact_amount_in_response.dart';

class OsmosisPoolManagerMsgSwapExactAmountIn
    extends
        OsmosisPoolManagerV1Beta1<
          OsmosisPoolManagerMsgSwapExactAmountInResponse
        > {
  final String? sender;
  final List<OsmosisPoolManagerSwapAmountInRoute> routes;
  final Coin tokenIn;
  final BigInt tokenOutMinAmount;

  OsmosisPoolManagerMsgSwapExactAmountIn({
    this.sender,
    required List<OsmosisPoolManagerSwapAmountInRoute> routes,
    required this.tokenIn,
    required this.tokenOutMinAmount,
  }) : routes = routes.immutable;
  factory OsmosisPoolManagerMsgSwapExactAmountIn.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerMsgSwapExactAmountIn(
      sender: decode.getField(1),
      routes:
          decode
              .getFields<List<int>>(2)
              .map((e) => OsmosisPoolManagerSwapAmountInRoute.deserialize(e))
              .toList(),
      tokenIn: Coin.deserialize(decode.getField(3)),
      tokenOutMinAmount: BigInt.parse(decode.getField(4)),
    );
  }
  factory OsmosisPoolManagerMsgSwapExactAmountIn.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisPoolManagerMsgSwapExactAmountIn(
      sender: json.as("sender"),
      routes:
          json
              .asListOfMap("routes")
              ?.map((e) => OsmosisPoolManagerSwapAmountInRoute.fromJson(e))
              .toList() ??
          [],
      tokenIn: Coin.deserialize(json.asMap("token_in")),
      tokenOutMinAmount: json.asBigInt("token_out_min_amount"),
    );
  }
  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "routes": routes.map((e) => e.toJson()).toList(),
      "token_in": tokenIn.toJson(),
      "token_out_min_amount": tokenOutMinAmount.toString(),
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisPoolManagerV1beta1Types.msgSwapExactAmountIn;

  @override
  List get values => [sender, routes, tokenIn, tokenOutMinAmount.toString()];

  @override
  List<String?> get signers => [sender];

  @override
  OsmosisPoolManagerMsgSwapExactAmountInResponse onResponse(List<int> bytes) {
    return OsmosisPoolManagerMsgSwapExactAmountInResponse.deserialize(bytes);
  }
}
