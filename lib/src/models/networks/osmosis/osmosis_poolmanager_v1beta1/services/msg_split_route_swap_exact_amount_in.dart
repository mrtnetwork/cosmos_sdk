import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/messages/swap_amount_out_split_route.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'msg_split_route_swap_exact_amount_in_response.dart';

class OsmosisPoolManagerMsgSplitRouteSwapExactAmountIn extends CosmosMessage
    with
        ServiceMessage<
            OsmosisPoolManagerMsgSplitRouteSwapExactAmountInResponse> {
  final String? sender;
  final List<OsmosisPoolManagerSwapAmountOutSplitRoute> routes;
  final String? tokenInDenom;
  final BigInt tokenOutMinAmount;

  OsmosisPoolManagerMsgSplitRouteSwapExactAmountIn({
    this.sender,
    required List<OsmosisPoolManagerSwapAmountOutSplitRoute> routes,
    this.tokenInDenom,
    required this.tokenOutMinAmount,
  }) : routes = routes.immutable;
  factory OsmosisPoolManagerMsgSplitRouteSwapExactAmountIn.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerMsgSplitRouteSwapExactAmountIn(
        sender: decode.getField(1),
        routes: decode
            .getFields(2)
            .map(
                (e) => OsmosisPoolManagerSwapAmountOutSplitRoute.deserialize(e))
            .toList(),
        tokenInDenom: decode.getField(3),
        tokenOutMinAmount: BigInt.parse(decode.getField(4)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "routes": routes.map((e) => e.toJson()).toList(),
      "token_in_denom": tokenInDenom,
      "token_out_min_amount": tokenOutMinAmount.toString()
    };
  }

  @override
  String get typeUrl =>
      OsmosisPoolManagerV1beta1Types.msgSplitRouteSwapExactAmountIn.typeUrl;

  @override
  List get values =>
      [sender, routes, tokenInDenom, tokenOutMinAmount.toString()];

  @override
  String get service =>
      OsmosisPoolManagerV1beta1Types.splitRouteSwapExactAmountIn.typeUrl;

  @override
  List<String?> get signers => [sender];

  @override
  OsmosisPoolManagerMsgSplitRouteSwapExactAmountInResponse onResponse(
      List<int> bytes) {
    return OsmosisPoolManagerMsgSplitRouteSwapExactAmountInResponse.deserialize(
        bytes);
  }
}
