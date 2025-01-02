import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/messages/swap_amount_out_split_route.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'msg_split_route_swap_exact_amount_out_response.dart';

class OsmosisPoolManagerMsgSplitRouteSwapExactAmountOut extends CosmosMessage
    with
        ServiceMessage<
            OsmosisPoolManagerMsgSplitRouteSwapExactAmountOutResponse> {
  final String? sender;
  final List<OsmosisPoolManagerSwapAmountOutSplitRoute> routes;
  final String? tokenOutDenom;
  final BigInt tokenInMaxAmount;

  OsmosisPoolManagerMsgSplitRouteSwapExactAmountOut({
    this.sender,
    required List<OsmosisPoolManagerSwapAmountOutSplitRoute> routes,
    required this.tokenInMaxAmount,
    this.tokenOutDenom,
  }) : routes = routes.immutable;
  factory OsmosisPoolManagerMsgSplitRouteSwapExactAmountOut.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerMsgSplitRouteSwapExactAmountOut(
      sender: decode.getField(1),
      routes: decode
          .getFields(2)
          .map((e) => OsmosisPoolManagerSwapAmountOutSplitRoute.deserialize(e))
          .toList(),
      tokenOutDenom: decode.getField(3),
      tokenInMaxAmount: BigInt.parse(decode.getField(4)),
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
      "token_out_denom": tokenOutDenom,
    };
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisPoolManagerV1beta1Types.msgSplitRouteSwapExactAmountOut;

  @override
  List get values =>
      [sender, routes, tokenOutDenom, tokenInMaxAmount.toString()];

  @override
  TypeUrl get service =>
      OsmosisPoolManagerV1beta1Types.splitRouteSwapExactAmountOut;

  @override
  List<String?> get signers => [sender];

  @override
  OsmosisPoolManagerMsgSplitRouteSwapExactAmountOutResponse onResponse(
      List<int> bytes) {
    return OsmosisPoolManagerMsgSplitRouteSwapExactAmountOutResponse
        .deserialize(bytes);
  }
}
