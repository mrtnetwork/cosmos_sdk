import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/messages/swap_amount_out_route.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/services/msg_swap_exact_amount_out_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class OsmosisPoolManagerMsgSwapExactAmountOut extends OsmosisPoolManagerV1Beta1<
    OsmosisPoolManagerMsgSwapExactAmountOutResponse> {
  final String? sender;
  final List<OsmosisPoolManagerSwapAmountOutRoute> routes;
  final BigInt tokenInMaxAmount;
  final Coin tokenOut;

  OsmosisPoolManagerMsgSwapExactAmountOut({
    this.sender,
    required List<OsmosisPoolManagerSwapAmountOutRoute> routes,
    required this.tokenInMaxAmount,
    required this.tokenOut,
  }) : routes = routes.immutable;
  factory OsmosisPoolManagerMsgSwapExactAmountOut.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerMsgSwapExactAmountOut(
      sender: decode.getField(1),
      routes: decode
          .getFields<List<int>>(2)
          .map((e) => OsmosisPoolManagerSwapAmountOutRoute.deserialize(e))
          .toList(),
      tokenInMaxAmount: BigInt.parse(decode.getField(3)),
      tokenOut: Coin.deserialize(decode.getField(4)),
    );
  }
  factory OsmosisPoolManagerMsgSwapExactAmountOut.fromJson(
      Map<String, dynamic> json) {
    return OsmosisPoolManagerMsgSwapExactAmountOut(
      sender: json.as("sender"),
      routes: json
              .asListOfMap("routes")
              ?.map((e) => OsmosisPoolManagerSwapAmountOutRoute.fromJson(e))
              .toList() ??
          [],
      tokenInMaxAmount: json.asBigInt("token_in_max_amount"),
      tokenOut: Coin.deserialize(json.asMap("token_out")),
    );
  }
  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "routes": routes.map((e) => e.toJson()).toList(),
      "token_in_max_amount": tokenInMaxAmount.toString(),
      "token_out": tokenOut.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisPoolManagerV1beta1Types.msgSwapExactAmountOut;

  @override
  List get values => [sender, routes, tokenInMaxAmount.toString(), tokenOut];

  @override
  List<String?> get signers => [sender];

  @override
  OsmosisPoolManagerMsgSwapExactAmountOutResponse onResponse(List<int> bytes) {
    return OsmosisPoolManagerMsgSwapExactAmountOutResponse.deserialize(bytes);
  }
}
