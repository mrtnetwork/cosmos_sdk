import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// SpotPriceRequest defines the gRPC request structure for a SpotPrice
/// query.
class SpotPriceRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<SpotPriceResponse> {
  final BigInt? poolId;

  final String? baseAssetDenom;

  final String? quoteAssetDenom;

  const SpotPriceRequest({
    this.poolId,
    this.baseAssetDenom,
    this.quoteAssetDenom,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/poolmanager/v2/pools/{pool_id}/prices",
        ),
      ],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [poolId, baseAssetDenom, quoteAssetDenom];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'pool_id': config.encodeBigint(poolId),
      'base_asset_denom': baseAssetDenom,
      'quote_asset_denom': quoteAssetDenom,
    };
  }

  factory SpotPriceRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return SpotPriceRequest(
      poolId: json.valueAsBigInt<BigInt?>(
        'pool_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      baseAssetDenom: json.valueAsString<String?>(
        'base_asset_denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      quoteAssetDenom: json.valueAsString<String?>(
        'quote_asset_denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory SpotPriceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SpotPriceRequest(
      poolId: decode.getBigInt<BigInt?>(1),
      baseAssetDenom: decode.getString<String?>(2),
      quoteAssetDenom: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisPoolmanagerV2SpotPriceRequest;
  @override
  SpotPriceResponse onQueryResponse(List<int> bytes) {
    return SpotPriceResponse.deserialize(bytes);
  }

  @override
  SpotPriceResponse onQueryResponseJson(Map<String, dynamic> json) {
    return SpotPriceResponse.fromJson(json);
  }
}

/// SpotPriceResponse defines the gRPC response structure for a SpotPrice
/// query.
class SpotPriceResponse extends CosmosProtoMessage {
  /// String of the BigDec. Ex) 10.203uatom
  final String? spotPrice;

  const SpotPriceResponse({this.spotPrice});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [spotPrice];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'spot_price': spotPrice};
  }

  factory SpotPriceResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return SpotPriceResponse(
      spotPrice: json.valueAsString<String?>(
        'spot_price',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory SpotPriceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SpotPriceResponse(spotPrice: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisPoolmanagerV2SpotPriceResponse;
}
