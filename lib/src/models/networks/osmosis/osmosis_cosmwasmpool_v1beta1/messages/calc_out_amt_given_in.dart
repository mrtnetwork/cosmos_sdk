import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_cosmwasmpool_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/cosmos_base_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisCosmWasmPoolCalcOutAmtGivenIn extends CosmosMessage {
  /// [tokenIn] is the token to be sent to the pool.
  final Coin tokenIn;

  /// [tokenOutDenom] is the token denom to be received from the pool
  final String? tokenOutDenom;

  /// [swapFee] is the swap fee for this swap estimate.
  final String swapFee;

  OsmosisCosmWasmPoolCalcOutAmtGivenIn(
      {required this.tokenIn, this.tokenOutDenom, required this.swapFee});
  factory OsmosisCosmWasmPoolCalcOutAmtGivenIn.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisCosmWasmPoolCalcOutAmtGivenIn(
        tokenIn: Coin.deserialize(decode.getField(1)),
        tokenOutDenom: decode.getField(2),
        swapFee: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "token_in": tokenIn.toJson(),
      "token_out_denom": tokenOutDenom,
      "swap_fee": swapFee
    };
  }

  @override
  String get typeUrl =>
      OsmosisCosmWasmPoolV1beta1Types.calcOutAmtGivenIn.typeUrl;

  @override
  List get values => [tokenIn, tokenOutDenom, swapFee];
}
