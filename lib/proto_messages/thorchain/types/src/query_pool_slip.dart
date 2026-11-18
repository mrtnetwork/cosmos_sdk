import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QueryPoolSlipRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryPoolSlipsResponse> {
  final String? asset;

  final String? height;

  const QueryPoolSlipRequest({this.asset, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/slip/{asset}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [asset, height];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'asset': asset, 'height': height};
  }

  factory QueryPoolSlipRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPoolSlipRequest(
      asset: json.valueAsString<String?>(
        'asset',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      height: json.valueAsString<String?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryPoolSlipRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPoolSlipRequest(
      asset: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryPoolSlipRequest;
  @override
  QueryPoolSlipsResponse onQueryResponse(List<int> bytes) {
    return QueryPoolSlipsResponse.deserialize(bytes);
  }

  @override
  QueryPoolSlipsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryPoolSlipsResponse.fromJson(json);
  }
}

class QueryPoolSlipResponse extends CosmosProtoMessage {
  final String? asset;

  /// Pool slip for this asset's pool for the current height
  final BigInt? poolSlip;

  /// Number of stored pool slips contributing to the current stored rollup
  final BigInt? rollupCount;

  /// Median of rollup snapshots over a long period
  final BigInt? longRollup;

  /// Stored sum of pool slips over a number of previous block heights
  final BigInt? rollup;

  /// Summed pool slips over a number of previous block heights, to checksum the
  /// stored rollup
  final BigInt? summedRollup;

  const QueryPoolSlipResponse({
    this.asset,
    this.poolSlip,
    this.rollupCount,
    this.longRollup,
    this.rollup,
    this.summedRollup,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.int64(2, options: const []),
        ProtoFieldConfig.int64(3, options: const []),
        ProtoFieldConfig.int64(4, options: const []),
        ProtoFieldConfig.int64(5, options: const []),
        ProtoFieldConfig.int64(6, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    asset,
    poolSlip,
    rollupCount,
    longRollup,
    rollup,
    summedRollup,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'asset': asset,
      'pool_slip': config.encodeBigint(poolSlip),
      'rollup_count': config.encodeBigint(rollupCount),
      'long_rollup': config.encodeBigint(longRollup),
      'rollup': config.encodeBigint(rollup),
      'summed_rollup': config.encodeBigint(summedRollup),
    };
  }

  factory QueryPoolSlipResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPoolSlipResponse(
      asset: json.valueAsString<String?>(
        'asset',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      poolSlip: json.valueAsBigInt<BigInt?>(
        'pool_slip',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      rollupCount: json.valueAsBigInt<BigInt?>(
        'rollup_count',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      longRollup: json.valueAsBigInt<BigInt?>(
        'long_rollup',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      rollup: json.valueAsBigInt<BigInt?>(
        'rollup',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      summedRollup: json.valueAsBigInt<BigInt?>(
        'summed_rollup',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryPoolSlipResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPoolSlipResponse(
      asset: decode.getString<String?>(1),
      poolSlip: decode.getBigInt<BigInt?>(2),
      rollupCount: decode.getBigInt<BigInt?>(3),
      longRollup: decode.getBigInt<BigInt?>(4),
      rollup: decode.getBigInt<BigInt?>(5),
      summedRollup: decode.getBigInt<BigInt?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryPoolSlipResponse;
}

class QueryPoolSlipsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryPoolSlipsResponse> {
  final String? height;

  const QueryPoolSlipsRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/slips",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [height];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'height': height};
  }

  factory QueryPoolSlipsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPoolSlipsRequest(
      height: json.valueAsString<String?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryPoolSlipsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPoolSlipsRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryPoolSlipsRequest;
  @override
  QueryPoolSlipsResponse onQueryResponse(List<int> bytes) {
    return QueryPoolSlipsResponse.deserialize(bytes);
  }

  @override
  QueryPoolSlipsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryPoolSlipsResponse.fromJson(json);
  }
}

class QueryPoolSlipsResponse extends CosmosProtoMessage {
  final List<QueryPoolSlipResponse> poolSlips;

  const QueryPoolSlipsResponse({this.poolSlips = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [poolSlips];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'pool_slips': poolSlips.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QueryPoolSlipsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPoolSlipsResponse(
      poolSlips:
          (json.valueEnsureAsList<dynamic>(
                'pool_slips',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<QueryPoolSlipResponse, Object>(
                  value: e,
                  parse:
                      (v) => QueryPoolSlipResponse.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryPoolSlipsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPoolSlipsResponse(
      poolSlips:
          decode
              .getListOfBytes(1)
              .map((b) => QueryPoolSlipResponse.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryPoolSlipsResponse;
}
