import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'spot_price_response.dart';

class OsmosisPoolManagerSpotPriceRequest extends CosmosMessage
    with
        QueryMessage<OsmosisPoolManagerSpotPriceResponse>,
        RPCMessage<OsmosisPoolManagerSpotPriceResponse> {
  final BigInt? poolId;
  final String? baseAssetDenom;
  final String? quoteAssetDenom;
  const OsmosisPoolManagerSpotPriceRequest(
      {this.poolId, this.baseAssetDenom, this.quoteAssetDenom});
  factory OsmosisPoolManagerSpotPriceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerSpotPriceRequest(
        poolId: decode.getField(1),
        baseAssetDenom: decode.getField(2),
        quoteAssetDenom: decode.getField(3));
  }
  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  OsmosisPoolManagerSpotPriceResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisPoolManagerSpotPriceResponse.fromRpc(json);
  }

  @override
  OsmosisPoolManagerSpotPriceResponse onResponse(List<int> bytes) {
    return OsmosisPoolManagerSpotPriceResponse.deserialize(bytes);
  }

  @override
  Map<String, String?> get queryParameters => {
        "base_asset_denom": baseAssetDenom,
        "quote_asset_denom": quoteAssetDenom
      };

  @override
  String get queryPath => OsmosisPoolManagerV1beta1Types.spotPrice.typeUrl;

  @override
  String get rpcPath => OsmosisPoolManagerV1beta1Types.spotPrice
      .rpcUrl(pathParameters: [poolId?.toString()]);

  @override
  Map<String, dynamic> toJson() {
    return {
      "pool_id": poolId?.toString(),
      "base_asset_denom": baseAssetDenom,
      "quote_asset_denom": quoteAssetDenom
    };
  }

  @override
  String get typeUrl => OsmosisPoolManagerV1beta1Types.spotPriceRequest.typeUrl;

  @override
  List get values => [poolId, baseAssetDenom, quoteAssetDenom];
}
