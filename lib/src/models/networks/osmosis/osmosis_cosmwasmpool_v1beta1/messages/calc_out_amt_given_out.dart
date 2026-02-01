import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_cosmwasmpool_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/cosmos_base_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisCosmWasmPoolCalcInAmtGivenOut extends CosmosMessage {
  /// [tokenOut] is the token out to be receoved from the pool.
  final Coin tokenOut;

  /// [tokenInDenom] is the token denom to be sentt to the pool.
  final String? tokenInDenom;

  /// [swapFee] is the swap fee for this swap estimate.
  final String swapFee;

  OsmosisCosmWasmPoolCalcInAmtGivenOut({
    required this.tokenOut,
    this.tokenInDenom,
    required this.swapFee,
  });
  factory OsmosisCosmWasmPoolCalcInAmtGivenOut.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisCosmWasmPoolCalcInAmtGivenOut(
      tokenOut: Coin.deserialize(decode.getField(1)),
      tokenInDenom: decode.getField(2),
      swapFee: decode.getField(3),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "token_out": tokenOut.toJson(),
      "token_out_denom": tokenInDenom,
      "swap_fee": swapFee,
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisCosmWasmPoolV1beta1Types.calcInAmtGivenOut;

  @override
  List get values => [tokenOut, tokenInDenom, swapFee];
}
