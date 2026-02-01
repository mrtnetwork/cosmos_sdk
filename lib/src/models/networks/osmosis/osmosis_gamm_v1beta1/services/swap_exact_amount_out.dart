import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/messages/sawap_ammount_in_route.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/sdk_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'swap_exact_amount_out_response.dart';

class OsmosisGammMsgSwapExactAmountOut
    extends OsmosisGammV1Beta1<OsmosisGammMsgSwapExactAmountOutResponse> {
  final String? sender;
  final List<OsmosisGammSwapAmountInRoute> routes;
  final String tokenInMaxAmount;
  final Coin tokenOut;

  OsmosisGammMsgSwapExactAmountOut({
    this.sender,
    required List<OsmosisGammSwapAmountInRoute> routes,
    required this.tokenOut,
    required this.tokenInMaxAmount,
  }) : routes = routes.immutable;
  factory OsmosisGammMsgSwapExactAmountOut.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammMsgSwapExactAmountOut(
      sender: decode.getField(1),
      routes:
          decode
              .getFields<List<int>>(2)
              .map((e) => OsmosisGammSwapAmountInRoute.deserialize(e))
              .toList(),
      tokenInMaxAmount: decode.getField(3),
      tokenOut: Coin.deserialize(decode.getField(4)),
    );
  }
  factory OsmosisGammMsgSwapExactAmountOut.fromJson(Map<String, dynamic> json) {
    return OsmosisGammMsgSwapExactAmountOut(
      sender: json.as("sender"),
      routes:
          json
              .asListOfMap("routes")
              ?.map((e) => OsmosisGammSwapAmountInRoute.fromJson(e))
              .toList() ??
          [],
      tokenInMaxAmount: json.as("token_in_max_amount"),
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
      "token_in_max_amount": tokenInMaxAmount,
      "token_out": tokenOut.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisGammV1beta1Types.msgSwapExactAmountOut;

  @override
  List get values => [sender, routes, tokenInMaxAmount, tokenOut];

  @override
  OsmosisGammMsgSwapExactAmountOutResponse onResponse(List<int> bytes) {
    return OsmosisGammMsgSwapExactAmountOutResponse.deserialize(bytes);
  }

  @override
  List<String?> get signers => [sender];
}
