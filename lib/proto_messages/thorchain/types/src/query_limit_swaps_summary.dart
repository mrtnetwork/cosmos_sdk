import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QueryLimitSwapsSummaryRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryLimitSwapsSummaryResponse> {
  final String? height;

  final String? sourceAsset;

  final String? targetAsset;

  const QueryLimitSwapsSummaryRequest({
    this.height,
    this.sourceAsset,
    this.targetAsset,
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
          path: "/thorchain/queue/limit_swaps/summary",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [height, sourceAsset, targetAsset];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'height': height,
      'source_asset': sourceAsset,
      'target_asset': targetAsset,
    };
  }

  factory QueryLimitSwapsSummaryRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryLimitSwapsSummaryRequest(
      height: json.valueAsString<String?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      sourceAsset: json.valueAsString<String?>(
        'source_asset',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      targetAsset: json.valueAsString<String?>(
        'target_asset',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryLimitSwapsSummaryRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryLimitSwapsSummaryRequest(
      height: decode.getString<String?>(1),
      sourceAsset: decode.getString<String?>(2),
      targetAsset: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryLimitSwapsSummaryRequest;
  @override
  QueryLimitSwapsSummaryResponse onQueryResponse(List<int> bytes) {
    return QueryLimitSwapsSummaryResponse.deserialize(bytes);
  }

  @override
  QueryLimitSwapsSummaryResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryLimitSwapsSummaryResponse.fromJson(json);
  }
}

class AssetPairSummary extends CosmosProtoMessage {
  final String? sourceAsset;

  final String? targetAsset;

  final BigInt? count;

  final String? totalValueUsd;

  const AssetPairSummary({
    this.sourceAsset,
    this.targetAsset,
    this.count,
    this.totalValueUsd,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.string(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sourceAsset,
    targetAsset,
    count,
    totalValueUsd,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'source_asset': sourceAsset,
      'target_asset': targetAsset,
      'count': config.encodeBigint(count),
      'total_value_usd': totalValueUsd,
    };
  }

  factory AssetPairSummary.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return AssetPairSummary(
      sourceAsset: json.valueAsString<String?>(
        'source_asset',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      targetAsset: json.valueAsString<String?>(
        'target_asset',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      count: json.valueAsBigInt<BigInt?>(
        'count',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      totalValueUsd: json.valueAsString<String?>(
        'total_value_usd',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory AssetPairSummary.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AssetPairSummary(
      sourceAsset: decode.getString<String?>(1),
      targetAsset: decode.getString<String?>(2),
      count: decode.getBigInt<BigInt?>(3),
      totalValueUsd: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesAssetPairSummary;
}

class QueryLimitSwapsSummaryResponse extends CosmosProtoMessage {
  final BigInt? totalLimitSwaps;

  final String? totalValueUsd;

  final List<AssetPairSummary> assetPairs;

  final BigInt? oldestSwapBlocks;

  final BigInt? averageAgeBlocks;

  const QueryLimitSwapsSummaryResponse({
    this.totalLimitSwaps,
    this.totalValueUsd,
    this.assetPairs = const [],
    this.oldestSwapBlocks,
    this.averageAgeBlocks,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.int64(4),
        ProtoFieldConfig.int64(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    totalLimitSwaps,
    totalValueUsd,
    assetPairs,
    oldestSwapBlocks,
    averageAgeBlocks,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'total_limit_swaps': config.encodeBigint(totalLimitSwaps),
      'total_value_usd': totalValueUsd,
      'asset_pairs': assetPairs.map((e) => config.encodeMessage(e)).toList(),
      'oldest_swap_blocks': config.encodeBigint(oldestSwapBlocks),
      'average_age_blocks': config.encodeBigint(averageAgeBlocks),
    };
  }

  factory QueryLimitSwapsSummaryResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryLimitSwapsSummaryResponse(
      totalLimitSwaps: json.valueAsBigInt<BigInt?>(
        'total_limit_swaps',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      totalValueUsd: json.valueAsString<String?>(
        'total_value_usd',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      assetPairs:
          (json.valueEnsureAsList<dynamic>(
                'asset_pairs',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<AssetPairSummary, Object>(
                  value: e,
                  parse:
                      (v) => AssetPairSummary.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      oldestSwapBlocks: json.valueAsBigInt<BigInt?>(
        'oldest_swap_blocks',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      averageAgeBlocks: json.valueAsBigInt<BigInt?>(
        'average_age_blocks',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryLimitSwapsSummaryResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryLimitSwapsSummaryResponse(
      totalLimitSwaps: decode.getBigInt<BigInt?>(1),
      totalValueUsd: decode.getString<String?>(2),
      assetPairs:
          decode
              .getListOfBytes(3)
              .map((b) => AssetPairSummary.deserialize(b))
              .toList(),
      oldestSwapBlocks: decode.getBigInt<BigInt?>(4),
      averageAgeBlocks: decode.getBigInt<BigInt?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryLimitSwapsSummaryResponse;
}
