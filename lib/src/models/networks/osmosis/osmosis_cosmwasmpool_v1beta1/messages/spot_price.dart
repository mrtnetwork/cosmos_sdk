import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_cosmwasmpool_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisCosmWasmPoolSpotPrice extends CosmosMessage {
  /// quote_asset_denom is the quote asset of the spot query
  final String? quoteAssetDenom;

  /// base_asset_denom is the base asset of the spot query.
  final String? baseAssetDenom;

  OsmosisCosmWasmPoolSpotPrice(
      {this.quoteAssetDenom, required this.baseAssetDenom});
  factory OsmosisCosmWasmPoolSpotPrice.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisCosmWasmPoolSpotPrice(
        quoteAssetDenom: decode.getField(1),
        baseAssetDenom: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "quote_asset_denom": quoteAssetDenom,
      "base_asset_denom": baseAssetDenom
    };
  }

  @override
  String get typeUrl => OsmosisCosmWasmPoolV1beta1Types.spotPrice.typeUrl;

  @override
  List get values => [quoteAssetDenom, baseAssetDenom];
}
