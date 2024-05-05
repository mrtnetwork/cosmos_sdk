import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/messages/sawap_ammount_in_route.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/sdk_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';
import 'swap_exact_amount_in_response.dart';

class OsmosisGammMsgSwapExactAmountIn extends CosmosMessage
    with ServiceMessage<OsmosisGammMsgSwapExactAmountInResponse> {
  final String? sender;
  final List<OsmosisGammSwapAmountInRoute> routes;
  final Coin tokenIn;
  final String tokenOutMinAmount;
  OsmosisGammMsgSwapExactAmountIn(
      {this.sender,
      required List<OsmosisGammSwapAmountInRoute> routes,
      required this.tokenIn,
      required this.tokenOutMinAmount})
      : routes = routes.mutable;
  factory OsmosisGammMsgSwapExactAmountIn.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammMsgSwapExactAmountIn(
      sender: decode.getField(1),
      routes: decode
          .getFields(2)
          .map((e) => OsmosisGammSwapAmountInRoute.deserialize(e))
          .toList(),
      tokenIn: Coin.deserialize(decode.getField(3)),
      tokenOutMinAmount: decode.getField(4),
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
      "token_out_min_amount": tokenOutMinAmount
    };
  }

  @override
  String get typeUrl => OsmosisGammV1beta1Types.msgSwapExactAmountIn.typeUrl;

  @override
  List get values => [sender, routes, tokenIn, tokenOutMinAmount];

  @override
  OsmosisGammMsgSwapExactAmountInResponse onResponse(List<int> bytes) {
    return OsmosisGammMsgSwapExactAmountInResponse.deserialize(bytes);
  }

  @override
  String get service => OsmosisGammV1beta1Types.swapExactAmountOut.typeUrl;

  @override
  List<String?> get signers => [sender];
}
