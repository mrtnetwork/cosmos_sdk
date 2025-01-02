import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_cosmwasmpool_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/cosmos_base_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisCosmWasmPoolSwapExactAmountOut extends CosmosMessage {
  final String? sender;

  /// [tokenOut] is the token to be sent out of the pool.
  final Coin tokenOut;

  /// [tokenInDenom] is the token denom to be sent too the pool.
  final String? tokenInDenom;

  /// [tokenInMaxAmount] is the maximum amount of token_in to be sent to the
  /// pool.
  final BigInt tokenInMaxAmount;

  /// [swapFee] is the swap fee for this swap estimate.
  final String swapFee;

  OsmosisCosmWasmPoolSwapExactAmountOut(
      {this.sender,
      required this.tokenOut,
      this.tokenInDenom,
      required this.tokenInMaxAmount,
      required this.swapFee});
  factory OsmosisCosmWasmPoolSwapExactAmountOut.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisCosmWasmPoolSwapExactAmountOut(
        sender: decode.getField(1),
        tokenOut: Coin.deserialize(decode.getField(2)),
        tokenInDenom: decode.getField(3),
        tokenInMaxAmount: BigInt.parse(decode.getField(4)),
        swapFee: decode.getField(5));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "token_out": tokenOut.toJson(),
      "token_in_denom": tokenInDenom,
      "token_in_max_amount": tokenInMaxAmount.toString(),
      "swap_fee": swapFee
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisCosmWasmPoolV1beta1Types.swapExactAmountOut;

  @override
  List get values =>
      [sender, tokenOut, tokenInDenom, tokenInMaxAmount.toString(), swapFee];
}
