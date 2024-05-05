import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/messages/sawap_ammount_in_route.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/sdk_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';
import 'swap_exact_amount_out_response.dart';

class OsmosisGammMsgSwapExactAmountOut extends CosmosMessage
    with ServiceMessage<OsmosisGammMsgSwapExactAmountOutResponse> {
  final String? sender;
  final List<OsmosisGammSwapAmountInRoute> routes;
  final String tokenInMaxAmount;
  final Coin tokenOut;

  OsmosisGammMsgSwapExactAmountOut(
      {this.sender,
      required List<OsmosisGammSwapAmountInRoute> routes,
      required this.tokenOut,
      required this.tokenInMaxAmount})
      : routes = routes.mutable;
  factory OsmosisGammMsgSwapExactAmountOut.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammMsgSwapExactAmountOut(
      sender: decode.getField(1),
      routes: decode
          .getFields(2)
          .map((e) => OsmosisGammSwapAmountInRoute.deserialize(e))
          .toList(),
      tokenInMaxAmount: decode.getField(3),
      tokenOut: Coin.deserialize(decode.getField(4)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "routes": routes.map((e) => e.toJson()).toList(),
      "token_in_max_amount": tokenInMaxAmount,
      "token_out": tokenOut.toJson(),
    };
  }

  @override
  String get typeUrl => OsmosisGammV1beta1Types.msgSwapExactAmountOut.typeUrl;

  @override
  List get values => [sender, routes, tokenInMaxAmount, tokenOut];

  @override
  OsmosisGammMsgSwapExactAmountOutResponse onResponse(List<int> bytes) {
    return OsmosisGammMsgSwapExactAmountOutResponse.deserialize(bytes);
  }

  @override
  String get service => OsmosisGammV1beta1Types.swapExactAmountOut.typeUrl;

  @override
  List<String?> get signers => [sender];
}
