import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v2/query/spot_price_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v2/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// SpotPriceRequest defines the gRPC request structure for a SpotPrice query.
class OsmosisPoolManagerV2SpotPriceRequest extends CosmosMessage
    with
        QueryMessage<OsmosisPoolManagerV2SpotPriceResponse>,
        RPCMessage<OsmosisPoolManagerV2SpotPriceResponse> {
  final BigInt? poolId;
  final String? baseAssetDenom;
  final String? quoteAssetDenom;

  const OsmosisPoolManagerV2SpotPriceRequest(
      {this.poolId, this.baseAssetDenom, this.quoteAssetDenom});
  factory OsmosisPoolManagerV2SpotPriceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerV2SpotPriceRequest(
        poolId: decode.getField(1),
        baseAssetDenom: decode.getField(2),
        quoteAssetDenom: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  OsmosisPoolManagerV2SpotPriceResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisPoolManagerV2SpotPriceResponse.fromRpc(json);
  }

  @override
  OsmosisPoolManagerV2SpotPriceResponse onResponse(List<int> bytes) {
    return OsmosisPoolManagerV2SpotPriceResponse.deserialize(bytes);
  }

  @override
  Map<String, String?> get queryParameters => {
        "base_asset_denom": baseAssetDenom,
        "quote_asset_denom": quoteAssetDenom
      };

  @override
  String get queryPath => OsmosisPoolManagerV2Types.spotPriceV2.typeUrl;

  @override
  String get rpcPath => OsmosisPoolManagerV2Types.spotPriceV2
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
  String get typeUrl => OsmosisPoolManagerV2Types.spotPriceRequest.typeUrl;

  @override
  List get values => [poolId, baseAssetDenom, quoteAssetDenom];
}
