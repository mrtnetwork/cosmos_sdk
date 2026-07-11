import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Deprecated: please use alternate in x/poolmanager
class QuerySpotPriceRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySpotPriceResponse> {
  final BigInt? poolId;

  final String? baseAssetDenom;

  final String? quoteAssetDenom;

  /// DEPRECATED
  final bool? withSwapFee;

  const QuerySpotPriceRequest({
    this.poolId,
    this.baseAssetDenom,
    this.quoteAssetDenom,
    this.withSwapFee,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionBool(name: "deprecated", value: true),
        ProtoOptionBool(name: "deprecated", value: true),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/gamm/v2/pools/{pool_id}/prices",
        ),
      ],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.bool(
          4,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    poolId,
    baseAssetDenom,
    quoteAssetDenom,
    withSwapFee,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'pool_id': poolId?.toString(),
      'base_asset_denom': baseAssetDenom,
      'quote_asset_denom': quoteAssetDenom,
      'withSwapFee': withSwapFee,
    };
  }

  factory QuerySpotPriceRequest.fromJson(Map<String, dynamic> json) {
    return QuerySpotPriceRequest(
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
      baseAssetDenom: json.valueAsString<String?>(
        'base_asset_denom',
        acceptCamelCase: true,
      ),
      quoteAssetDenom: json.valueAsString<String?>(
        'quote_asset_denom',
        acceptCamelCase: true,
      ),
      withSwapFee: json.valueAsBool<bool?>(
        'withSwapFee',
        acceptCamelCase: true,
      ),
    );
  }

  factory QuerySpotPriceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySpotPriceRequest(
      poolId: decode.getBigInt<BigInt?>(1),
      baseAssetDenom: decode.getString<String?>(2),
      quoteAssetDenom: decode.getString<String?>(3),
      withSwapFee: decode.getBool<bool?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisGammV2QuerySpotPriceRequest;
  @override
  QuerySpotPriceResponse onQueryResponse(List<int> bytes) {
    return QuerySpotPriceResponse.deserialize(bytes);
  }

  @override
  QuerySpotPriceResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QuerySpotPriceResponse.fromJson(json);
  }
}

/// Deprecated: please use alternate in x/poolmanager
class QuerySpotPriceResponse extends CosmosProtoMessage {
  /// String of the Dec. Ex) 10.203uatom
  final String? spotPrice;

  const QuerySpotPriceResponse({this.spotPrice});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [ProtoOptionBool(name: "deprecated", value: true)],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [spotPrice];

  @override
  Map<String, dynamic> toJson() {
    return {'spot_price': spotPrice};
  }

  factory QuerySpotPriceResponse.fromJson(Map<String, dynamic> json) {
    return QuerySpotPriceResponse(
      spotPrice: json.valueAsString<String?>(
        'spot_price',
        acceptCamelCase: true,
      ),
    );
  }

  factory QuerySpotPriceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySpotPriceResponse(spotPrice: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisGammV2QuerySpotPriceResponse;
}
