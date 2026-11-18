import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QueryPoolRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryPoolResponse> {
  final String? asset;

  final String? height;

  const QueryPoolRequest({this.asset, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/pool/{asset}",
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

  factory QueryPoolRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPoolRequest(
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

  factory QueryPoolRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPoolRequest(
      asset: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryPoolRequest;
  @override
  QueryPoolResponse onQueryResponse(List<int> bytes) {
    return QueryPoolResponse.deserialize(bytes);
  }

  @override
  QueryPoolResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryPoolResponse.fromJson(json);
  }
}

class QueryPoolResponse extends CosmosProtoMessage {
  final String? asset;

  final String? shortCode;

  final String? status;

  final BigInt? decimals;

  final String? pendingInboundAsset;

  final String? pendingInboundRune;

  final String? balanceAsset;

  final String? balanceRune;

  /// the USD (TOR) price of the asset in 1e8
  final String? assetTorPrice;

  /// the total pool units, this is the sum of LP and synth units
  final String? poolUnits;

  /// the total pool liquidity provider units
  final String? lpUnits;

  /// the total synth units in the pool
  final String? synthUnits;

  /// the total supply of synths for the asset
  final String? synthSupply;

  /// the balance of L1 asset deposited into the Savers Vault
  final String? saversDepth;

  /// the number of units owned by Savers
  final String? saversUnits;

  /// the filled savers capacity in basis points, 4500/10000 = 45%
  final String? saversFillBps;

  /// amount of remaining capacity in asset
  final String? saversCapacityRemaining;

  /// whether additional synths cannot be minted
  final bool? synthMintPaused;

  /// the amount of synth supply remaining before the current max supply is
  /// reached
  final String? synthSupplyRemaining;

  /// the depth of the derived virtual pool relative to L1 pool (in basis points)
  final String? derivedDepthBps;

  /// whether trading is halted
  final bool? tradingHalted;

  /// 24h trading volume rune
  final String? volumeRune;

  /// 24h trading volume asset
  final String? volumeAsset;

  /// cumulative RUNE deposited by POL Reserve into this pool
  final String? polReserveRuneDeposited;

  /// rolling liquidity fees accumulated (in RUNE) since the last pool cycle
  /// reset; used as the numerator of the POL Reserve deployment score
  final String? rollingPoolLiquidityFeeRune;

  const QueryPoolResponse({
    this.asset,
    this.shortCode,
    this.status,
    this.decimals,
    this.pendingInboundAsset,
    this.pendingInboundRune,
    this.balanceAsset,
    this.balanceRune,
    this.assetTorPrice,
    this.poolUnits,
    this.lpUnits,
    this.synthUnits,
    this.synthSupply,
    this.saversDepth,
    this.saversUnits,
    this.saversFillBps,
    this.saversCapacityRemaining,
    this.synthMintPaused,
    this.synthSupplyRemaining,
    this.derivedDepthBps,
    this.tradingHalted,
    this.volumeRune,
    this.volumeAsset,
    this.polReserveRuneDeposited,
    this.rollingPoolLiquidityFeeRune,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.int64(4),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(7, options: const []),
        ProtoFieldConfig.string(8, options: const []),
        ProtoFieldConfig.string(9, options: const []),
        ProtoFieldConfig.string(10, options: const []),
        ProtoFieldConfig.string(11, options: const []),
        ProtoFieldConfig.string(12, options: const []),
        ProtoFieldConfig.string(13, options: const []),
        ProtoFieldConfig.string(14, options: const []),
        ProtoFieldConfig.string(15, options: const []),
        ProtoFieldConfig.string(16, options: const []),
        ProtoFieldConfig.string(17, options: const []),
        ProtoFieldConfig.bool(18, options: const []),
        ProtoFieldConfig.string(19, options: const []),
        ProtoFieldConfig.string(23, options: const []),
        ProtoFieldConfig.bool(24, options: const []),
        ProtoFieldConfig.string(25, options: const []),
        ProtoFieldConfig.string(26, options: const []),
        ProtoFieldConfig.string(27, options: const []),
        ProtoFieldConfig.string(28, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    asset,
    shortCode,
    status,
    decimals,
    pendingInboundAsset,
    pendingInboundRune,
    balanceAsset,
    balanceRune,
    assetTorPrice,
    poolUnits,
    lpUnits,
    synthUnits,
    synthSupply,
    saversDepth,
    saversUnits,
    saversFillBps,
    saversCapacityRemaining,
    synthMintPaused,
    synthSupplyRemaining,
    derivedDepthBps,
    tradingHalted,
    volumeRune,
    volumeAsset,
    polReserveRuneDeposited,
    rollingPoolLiquidityFeeRune,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'asset': asset,
      'short_code': shortCode,
      'status': status,
      'decimals': config.encodeBigint(decimals),
      'pending_inbound_asset': pendingInboundAsset,
      'pending_inbound_rune': pendingInboundRune,
      'balance_asset': balanceAsset,
      'balance_rune': balanceRune,
      'asset_tor_price': assetTorPrice,
      'pool_units': poolUnits,
      'LP_units': lpUnits,
      'synth_units': synthUnits,
      'synth_supply': synthSupply,
      'savers_depth': saversDepth,
      'savers_units': saversUnits,
      'savers_fill_bps': saversFillBps,
      'savers_capacity_remaining': saversCapacityRemaining,
      'synth_mint_paused': synthMintPaused,
      'synth_supply_remaining': synthSupplyRemaining,
      'derived_depth_bps': derivedDepthBps,
      'trading_halted': tradingHalted,
      'volume_rune': volumeRune,
      'volume_asset': volumeAsset,
      'pol_reserve_rune_deposited': polReserveRuneDeposited,
      'rolling_pool_liquidity_fee_rune': rollingPoolLiquidityFeeRune,
    };
  }

  factory QueryPoolResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPoolResponse(
      asset: json.valueAsString<String?>(
        'asset',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      shortCode: json.valueAsString<String?>(
        'short_code',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      status: json.valueAsString<String?>(
        'status',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      decimals: json.valueAsBigInt<BigInt?>(
        'decimals',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      pendingInboundAsset: json.valueAsString<String?>(
        'pending_inbound_asset',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      pendingInboundRune: json.valueAsString<String?>(
        'pending_inbound_rune',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      balanceAsset: json.valueAsString<String?>(
        'balance_asset',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      balanceRune: json.valueAsString<String?>(
        'balance_rune',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      assetTorPrice: json.valueAsString<String?>(
        'asset_tor_price',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      poolUnits: json.valueAsString<String?>(
        'pool_units',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      lpUnits: json.valueAsString<String?>(
        'LP_units',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      synthUnits: json.valueAsString<String?>(
        'synth_units',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      synthSupply: json.valueAsString<String?>(
        'synth_supply',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      saversDepth: json.valueAsString<String?>(
        'savers_depth',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      saversUnits: json.valueAsString<String?>(
        'savers_units',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      saversFillBps: json.valueAsString<String?>(
        'savers_fill_bps',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      saversCapacityRemaining: json.valueAsString<String?>(
        'savers_capacity_remaining',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      synthMintPaused: json.valueAsBool<bool?>(
        'synth_mint_paused',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      synthSupplyRemaining: json.valueAsString<String?>(
        'synth_supply_remaining',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      derivedDepthBps: json.valueAsString<String?>(
        'derived_depth_bps',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      tradingHalted: json.valueAsBool<bool?>(
        'trading_halted',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      volumeRune: json.valueAsString<String?>(
        'volume_rune',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      volumeAsset: json.valueAsString<String?>(
        'volume_asset',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      polReserveRuneDeposited: json.valueAsString<String?>(
        'pol_reserve_rune_deposited',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      rollingPoolLiquidityFeeRune: json.valueAsString<String?>(
        'rolling_pool_liquidity_fee_rune',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryPoolResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPoolResponse(
      asset: decode.getString<String?>(1),
      shortCode: decode.getString<String?>(2),
      status: decode.getString<String?>(3),
      decimals: decode.getBigInt<BigInt?>(4),
      pendingInboundAsset: decode.getString<String?>(5),
      pendingInboundRune: decode.getString<String?>(6),
      balanceAsset: decode.getString<String?>(7),
      balanceRune: decode.getString<String?>(8),
      assetTorPrice: decode.getString<String?>(9),
      poolUnits: decode.getString<String?>(10),
      lpUnits: decode.getString<String?>(11),
      synthUnits: decode.getString<String?>(12),
      synthSupply: decode.getString<String?>(13),
      saversDepth: decode.getString<String?>(14),
      saversUnits: decode.getString<String?>(15),
      saversFillBps: decode.getString<String?>(16),
      saversCapacityRemaining: decode.getString<String?>(17),
      synthMintPaused: decode.getBool<bool?>(18),
      synthSupplyRemaining: decode.getString<String?>(19),
      derivedDepthBps: decode.getString<String?>(23),
      tradingHalted: decode.getBool<bool?>(24),
      volumeRune: decode.getString<String?>(25),
      volumeAsset: decode.getString<String?>(26),
      polReserveRuneDeposited: decode.getString<String?>(27),
      rollingPoolLiquidityFeeRune: decode.getString<String?>(28),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryPoolResponse;
}

class QueryPoolsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryPoolsResponse> {
  final String? height;

  const QueryPoolsRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/pools",
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

  factory QueryPoolsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPoolsRequest(
      height: json.valueAsString<String?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryPoolsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPoolsRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryPoolsRequest;
  @override
  QueryPoolsResponse onQueryResponse(List<int> bytes) {
    return QueryPoolsResponse.deserialize(bytes);
  }

  @override
  QueryPoolsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryPoolsResponse.fromJson(json);
  }
}

class QueryPoolsResponse extends CosmosProtoMessage {
  final List<QueryPoolResponse> pools;

  const QueryPoolsResponse({this.pools = const []});

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
  List<Object?> get protoValues => [pools];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'pools': pools.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QueryPoolsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPoolsResponse(
      pools:
          (json.valueEnsureAsList<dynamic>(
                'pools',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<QueryPoolResponse, Object>(
                  value: e,
                  parse:
                      (v) => QueryPoolResponse.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryPoolsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPoolsResponse(
      pools:
          decode
              .getListOfBytes(1)
              .map((b) => QueryPoolResponse.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryPoolsResponse;
}
