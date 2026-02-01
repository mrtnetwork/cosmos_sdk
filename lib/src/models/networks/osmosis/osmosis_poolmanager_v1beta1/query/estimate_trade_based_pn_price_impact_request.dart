import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/cosmos_base_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'estimate_trade_based_on_price_impact_response.dart';

class OsmosisPoolManagerEstimateTradeBasedOnPriceImpactRequest
    extends CosmosMessage
    with
        QueryMessage<
          OsmosisPoolManagerEstimateTradeBasedOnPriceImpactResponse
        > {
  /// from_coin is the total amount of tokens that the user wants to sell.
  final Coin fromCoin;

  /// to_coin_denom is the denom identifier of the token that the user wants to
  /// buy.
  final String? toCoinDenom;

  /// pool_id is the identifier of the liquidity pool that the trade will occur
  /// on.
  final BigInt poolId;

  /// max_price_impact is the maximum percentage that the user is willing
  /// to affect the price of the liquidity pool.
  final String maxPriceImpact;

  /// external_price is an optional external price that the user can enter.
  /// It adjusts the MaxPriceImpact as the SpotPrice of a pool can be changed at
  /// any time.
  final String externalPrice;

  OsmosisPoolManagerEstimateTradeBasedOnPriceImpactRequest({
    required this.fromCoin,
    this.toCoinDenom,
    required this.poolId,
    required this.maxPriceImpact,
    required this.externalPrice,
  });
  factory OsmosisPoolManagerEstimateTradeBasedOnPriceImpactRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerEstimateTradeBasedOnPriceImpactRequest(
      fromCoin: Coin.deserialize(decode.getField(1)),
      toCoinDenom: decode.getField(2),
      poolId: decode.getField(3),
      maxPriceImpact: decode.getField(4),
      externalPrice: decode.getField(5),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  OsmosisPoolManagerEstimateTradeBasedOnPriceImpactResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return OsmosisPoolManagerEstimateTradeBasedOnPriceImpactResponse.fromJson(
      json,
    );
  }

  @override
  OsmosisPoolManagerEstimateTradeBasedOnPriceImpactResponse onResponse(
    List<int> bytes,
  ) {
    return OsmosisPoolManagerEstimateTradeBasedOnPriceImpactResponse.deserialize(
      bytes,
    );
  }

  @override
  Map<String, String?> get queryParameters => {
    "to_coin_denom": toCoinDenom,
    "max_price_impact": maxPriceImpact,
    "external_price": externalPrice,
    ...fromCoin.toQueryParam("from_coin"),
  };

  @override
  Map<String, dynamic> toJson() {
    return {
      "from_coin": fromCoin.toJson(),
      "to_coin_denom": toCoinDenom,
      "pool_id": poolId.toString(),
      "max_price_impact": maxPriceImpact,
      "external_price": externalPrice,
    };
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisPoolManagerV1beta1Types.estimateTradeBasedOnPriceImpactRequest;

  @override
  List get values => [
    fromCoin,
    toCoinDenom,
    poolId,
    maxPriceImpact,
    externalPrice,
  ];

  @override
  List<String> get pathParameters => [poolId.toString()];
}
