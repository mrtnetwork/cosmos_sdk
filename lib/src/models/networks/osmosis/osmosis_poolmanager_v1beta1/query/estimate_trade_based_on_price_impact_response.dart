import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisPoolManagerEstimateTradeBasedOnPriceImpactResponse
    extends CosmosMessage {
  /// input_coin is the actual input amount that would be tradeable
  /// under the specified price impact
  final Coin inputCoin;

  /// output_coin is the amount of tokens of the ToCoinDenom type
  /// that will be received for the actual InputCoin trade.
  final Coin outputCoin;
  const OsmosisPoolManagerEstimateTradeBasedOnPriceImpactResponse(
      {required this.inputCoin, required this.outputCoin});
  factory OsmosisPoolManagerEstimateTradeBasedOnPriceImpactResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerEstimateTradeBasedOnPriceImpactResponse(
        inputCoin: Coin.deserialize(decode.getField(1)),
        outputCoin: Coin.deserialize(decode.getField(2)));
  }
  factory OsmosisPoolManagerEstimateTradeBasedOnPriceImpactResponse.fromJson(
      Map<String, dynamic> json) {
    return OsmosisPoolManagerEstimateTradeBasedOnPriceImpactResponse(
        inputCoin: Coin.fromJson(json["input_coin"]),
        outputCoin: Coin.fromJson(json["output_coin"]));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "input_coin": inputCoin.toJson(),
      "output_coin": outputCoin.toJson()
    };
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisPoolManagerV1beta1Types.estimateTradeBasedOnPriceImpactResponse;

  @override
  List get values => [inputCoin, outputCoin];
}
