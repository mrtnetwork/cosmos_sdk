import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_cosmwasmpool_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/cosmos_base_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisCosmWasmPoolSwapExactAmountIn extends CosmosMessage {
  final String? sender;

  /// [tokenIn] is the token to be sent to the pool.
  final Coin tokenIn;

  /// [tokenOutDenom] is the token denom to be received from the pool.
  final String? tokenOutDenom;

  /// [tokenOutMinAmount] is the minimum amount of token_out to be received from
  /// the pool.
  final BigInt tokenOutMinAmount;

  /// [swapFee] is the swap fee for this swap estimate.
  final String swapFee;

  OsmosisCosmWasmPoolSwapExactAmountIn(
      {this.sender,
      required this.tokenIn,
      this.tokenOutDenom,
      required this.tokenOutMinAmount,
      required this.swapFee});
  factory OsmosisCosmWasmPoolSwapExactAmountIn.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisCosmWasmPoolSwapExactAmountIn(
        sender: decode.getField(1),
        tokenIn: Coin.deserialize(decode.getField(2)),
        tokenOutDenom: decode.getField(3),
        tokenOutMinAmount: BigInt.parse(decode.getField(4)),
        swapFee: decode.getField(5));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "token_in": tokenIn.toJson(),
      "token_out_denom": tokenOutDenom,
      "token_out_min_amount": tokenOutMinAmount.toString(),
      "swap_fee": swapFee
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisCosmWasmPoolV1beta1Types.swapExactAmountIn;

  @override
  List get values =>
      [sender, tokenIn, tokenOutDenom, tokenOutMinAmount.toString(), swapFee];
}
