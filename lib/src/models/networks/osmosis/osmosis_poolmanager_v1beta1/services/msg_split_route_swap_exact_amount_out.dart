import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/messages/swap_amount_out_split_route.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'msg_split_route_swap_exact_amount_out_response.dart';

class OsmosisPoolManagerMsgSplitRouteSwapExactAmountOut
    extends
        OsmosisPoolManagerV1Beta1<
          OsmosisPoolManagerMsgSplitRouteSwapExactAmountOutResponse
        > {
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
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerMsgSplitRouteSwapExactAmountOut(
      sender: decode.getField(1),
      routes:
          decode
              .getFields<List<int>>(2)
              .map(
                (e) => OsmosisPoolManagerSwapAmountOutSplitRoute.deserialize(e),
              )
              .toList(),
      tokenOutDenom: decode.getField(3),
      tokenInMaxAmount: BigInt.parse(decode.getField(4)),
    );
  }
  factory OsmosisPoolManagerMsgSplitRouteSwapExactAmountOut.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisPoolManagerMsgSplitRouteSwapExactAmountOut(
      sender: json.as("sender"),
      routes:
          json
              .asListOfMap("routes")
              ?.map(
                (e) => OsmosisPoolManagerSwapAmountOutSplitRoute.fromJson(e),
              )
              .toList() ??
          [],
      tokenOutDenom: json.as("token_out_denom"),
      tokenInMaxAmount: json.asBigInt("token_out_denom"),
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
  List get values => [
    sender,
    routes,
    tokenOutDenom,
    tokenInMaxAmount.toString(),
  ];

  @override
  List<String?> get signers => [sender];

  @override
  OsmosisPoolManagerMsgSplitRouteSwapExactAmountOutResponse onResponse(
    List<int> bytes,
  ) {
    return OsmosisPoolManagerMsgSplitRouteSwapExactAmountOutResponse.deserialize(
      bytes,
    );
  }
}
