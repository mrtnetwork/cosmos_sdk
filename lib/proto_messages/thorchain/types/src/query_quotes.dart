import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QueryQuoteSwapRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryQuoteSwapResponse> {
  final String? fromAsset;

  final String? toAsset;

  final String? amount;

  final String? streamingInterval;

  final String? streamingQuantity;

  final String? destination;

  final String? toleranceBps;

  final String? refundAddress;

  final String? affiliate;

  final String? affiliateBps;

  final String? height;

  final String? liquidityToleranceBps;

  final bool? extended;

  const QueryQuoteSwapRequest({
    this.fromAsset,
    this.toAsset,
    this.amount,
    this.streamingInterval,
    this.streamingQuantity,
    this.destination,
    this.toleranceBps,
    this.refundAddress,
    this.affiliate,
    this.affiliateBps,
    this.height,
    this.liquidityToleranceBps,
    this.extended,
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
          path: "/thorchain/quote/swap",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.string(6),
        ProtoFieldConfig.string(7),
        ProtoFieldConfig.string(8),
        ProtoFieldConfig.string(9),
        ProtoFieldConfig.string(10),
        ProtoFieldConfig.string(11),
        ProtoFieldConfig.string(12),
        ProtoFieldConfig.bool(13),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    fromAsset,
    toAsset,
    amount,
    streamingInterval,
    streamingQuantity,
    destination,
    toleranceBps,
    refundAddress,
    affiliate,
    affiliateBps,
    height,
    liquidityToleranceBps,
    extended,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'from_asset': fromAsset,
      'to_asset': toAsset,
      'amount': amount,
      'streaming_interval': streamingInterval,
      'streaming_quantity': streamingQuantity,
      'destination': destination,
      'tolerance_bps': toleranceBps,
      'refund_address': refundAddress,
      'affiliate': affiliate,
      'affiliate_bps': affiliateBps,
      'height': height,
      'liquidity_tolerance_bps': liquidityToleranceBps,
      'extended': extended,
    };
  }

  factory QueryQuoteSwapRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryQuoteSwapRequest(
      fromAsset: json.valueAsString<String?>(
        'from_asset',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      toAsset: json.valueAsString<String?>(
        'to_asset',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      amount: json.valueAsString<String?>(
        'amount',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      streamingInterval: json.valueAsString<String?>(
        'streaming_interval',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      streamingQuantity: json.valueAsString<String?>(
        'streaming_quantity',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      destination: json.valueAsString<String?>(
        'destination',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      toleranceBps: json.valueAsString<String?>(
        'tolerance_bps',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      refundAddress: json.valueAsString<String?>(
        'refund_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      affiliate: json.valueAsString<String?>(
        'affiliate',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      affiliateBps: json.valueAsString<String?>(
        'affiliate_bps',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      height: json.valueAsString<String?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      liquidityToleranceBps: json.valueAsString<String?>(
        'liquidity_tolerance_bps',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      extended: json.valueAsBool<bool?>(
        'extended',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryQuoteSwapRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryQuoteSwapRequest(
      fromAsset: decode.getString<String?>(1),
      toAsset: decode.getString<String?>(2),
      amount: decode.getString<String?>(3),
      streamingInterval: decode.getString<String?>(4),
      streamingQuantity: decode.getString<String?>(5),
      destination: decode.getString<String?>(6),
      toleranceBps: decode.getString<String?>(7),
      refundAddress: decode.getString<String?>(8),
      affiliate: decode.getString<String?>(9),
      affiliateBps: decode.getString<String?>(10),
      height: decode.getString<String?>(11),
      liquidityToleranceBps: decode.getString<String?>(12),
      extended: decode.getBool<bool?>(13),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryQuoteSwapRequest;
  @override
  QueryQuoteSwapResponse onQueryResponse(List<int> bytes) {
    return QueryQuoteSwapResponse.deserialize(bytes);
  }

  @override
  QueryQuoteSwapResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryQuoteSwapResponse.fromJson(json);
  }
}

class QueryQuoteSwapResponse extends CosmosProtoMessage {
  /// the inbound address for the transaction on the source chain
  final String? inboundAddress;

  /// the approximate number of source chain blocks required before processing
  final BigInt? inboundConfirmationBlocks;

  /// the approximate seconds for block confirmations required before processing
  final BigInt? inboundConfirmationSeconds;

  /// the number of thorchain blocks the outbound will be delayed
  final BigInt? outboundDelayBlocks;

  /// the approximate seconds for the outbound delay before it will be sent
  final BigInt? outboundDelaySeconds;

  final QuoteFees? fees;

  /// the EVM chain router contract address
  final String? router;

  /// expiration timestamp in unix seconds
  final BigInt? expiry;

  /// static warning message
  final String? warning;

  /// chain specific quote notes
  final String? notes;

  /// Defines the minimum transaction size for the chain in base units (sats,
  /// wei, uatom). Transactions with asset amounts lower than the dust_threshold
  /// are ignored.
  final String? dustThreshold;

  /// The recommended minimum inbound amount for this transaction type &amp; inbound
  /// asset. Sending less than this amount could result in failed refunds.
  final String? recommendedMinAmountIn;

  /// the recommended gas rate to use for the inbound to ensure timely
  /// confirmation
  final String? recommendedGasRate;

  /// the units of the recommended gas rate
  final String? gasRateUnits;

  /// generated memo for the swap
  final String? memo;

  /// the amount of the target asset the user can expect to receive after fees
  final String? expectedAmountOut;

  /// the amount of the target asset the user can expect to receive after fees
  final BigInt? maxStreamingQuantity;

  /// the number of blocks the streaming swap will execute over
  final BigInt? streamingSwapBlocks;

  /// approx the number of seconds the streaming swap will execute over
  final BigInt? streamingSwapSeconds;

  /// total number of seconds a swap is expected to take (inbound conf +
  /// streaming swap + outbound delay)
  final BigInt? totalSwapSeconds;

  /// List of outputs needed (additional to deposit and change return). Meant for
  /// wallets to easily construct transactions with more than 80bytes
  final List<Vout> vout;

  const QueryQuoteSwapResponse({
    this.inboundAddress,
    this.inboundConfirmationBlocks,
    this.inboundConfirmationSeconds,
    this.outboundDelayBlocks,
    this.outboundDelaySeconds,
    this.fees,
    this.router,
    this.expiry,
    this.warning,
    this.notes,
    this.dustThreshold,
    this.recommendedMinAmountIn,
    this.recommendedGasRate,
    this.gasRateUnits,
    this.memo,
    this.expectedAmountOut,
    this.maxStreamingQuantity,
    this.streamingSwapBlocks,
    this.streamingSwapSeconds,
    this.totalSwapSeconds,
    this.vout = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.int64(2),
        ProtoFieldConfig.int64(3),
        ProtoFieldConfig.int64(4, options: const []),
        ProtoFieldConfig.int64(5, options: const []),
        ProtoFieldConfig.message(6, options: const []),
        ProtoFieldConfig.string(7),
        ProtoFieldConfig.int64(8, options: const []),
        ProtoFieldConfig.string(9, options: const []),
        ProtoFieldConfig.string(10, options: const []),
        ProtoFieldConfig.string(11),
        ProtoFieldConfig.string(12),
        ProtoFieldConfig.string(13),
        ProtoFieldConfig.string(14),
        ProtoFieldConfig.string(15),
        ProtoFieldConfig.string(16, options: const []),
        ProtoFieldConfig.int64(17, options: const []),
        ProtoFieldConfig.int64(18, options: const []),
        ProtoFieldConfig.int64(19),
        ProtoFieldConfig.int64(20),
        ProtoFieldConfig.repeated(
          fieldNumber: 21,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    inboundAddress,
    inboundConfirmationBlocks,
    inboundConfirmationSeconds,
    outboundDelayBlocks,
    outboundDelaySeconds,
    fees,
    router,
    expiry,
    warning,
    notes,
    dustThreshold,
    recommendedMinAmountIn,
    recommendedGasRate,
    gasRateUnits,
    memo,
    expectedAmountOut,
    maxStreamingQuantity,
    streamingSwapBlocks,
    streamingSwapSeconds,
    totalSwapSeconds,
    vout,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'inbound_address': inboundAddress,
      'inbound_confirmation_blocks': config.encodeBigint(
        inboundConfirmationBlocks,
      ),
      'inbound_confirmation_seconds': config.encodeBigint(
        inboundConfirmationSeconds,
      ),
      'outbound_delay_blocks': config.encodeBigint(outboundDelayBlocks),
      'outbound_delay_seconds': config.encodeBigint(outboundDelaySeconds),
      'fees': config.encodeMessage(fees),
      'router': router,
      'expiry': config.encodeBigint(expiry),
      'warning': warning,
      'notes': notes,
      'dust_threshold': dustThreshold,
      'recommended_min_amount_in': recommendedMinAmountIn,
      'recommended_gas_rate': recommendedGasRate,
      'gas_rate_units': gasRateUnits,
      'memo': memo,
      'expected_amount_out': expectedAmountOut,
      'max_streaming_quantity': config.encodeBigint(maxStreamingQuantity),
      'streaming_swap_blocks': config.encodeBigint(streamingSwapBlocks),
      'streaming_swap_seconds': config.encodeBigint(streamingSwapSeconds),
      'total_swap_seconds': config.encodeBigint(totalSwapSeconds),
      'vout': vout.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QueryQuoteSwapResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryQuoteSwapResponse(
      inboundAddress: json.valueAsString<String?>(
        'inbound_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      inboundConfirmationBlocks: json.valueAsBigInt<BigInt?>(
        'inbound_confirmation_blocks',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      inboundConfirmationSeconds: json.valueAsBigInt<BigInt?>(
        'inbound_confirmation_seconds',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      outboundDelayBlocks: json.valueAsBigInt<BigInt?>(
        'outbound_delay_blocks',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      outboundDelaySeconds: json.valueAsBigInt<BigInt?>(
        'outbound_delay_seconds',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      fees: json.valueTo<QuoteFees?, Object>(
        key: 'fees',
        parse: (v) => QuoteFees.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      router: json.valueAsString<String?>(
        'router',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      expiry: json.valueAsBigInt<BigInt?>(
        'expiry',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      warning: json.valueAsString<String?>(
        'warning',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      notes: json.valueAsString<String?>(
        'notes',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      dustThreshold: json.valueAsString<String?>(
        'dust_threshold',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      recommendedMinAmountIn: json.valueAsString<String?>(
        'recommended_min_amount_in',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      recommendedGasRate: json.valueAsString<String?>(
        'recommended_gas_rate',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      gasRateUnits: json.valueAsString<String?>(
        'gas_rate_units',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      memo: json.valueAsString<String?>(
        'memo',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      expectedAmountOut: json.valueAsString<String?>(
        'expected_amount_out',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      maxStreamingQuantity: json.valueAsBigInt<BigInt?>(
        'max_streaming_quantity',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      streamingSwapBlocks: json.valueAsBigInt<BigInt?>(
        'streaming_swap_blocks',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      streamingSwapSeconds: json.valueAsBigInt<BigInt?>(
        'streaming_swap_seconds',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      totalSwapSeconds: json.valueAsBigInt<BigInt?>(
        'total_swap_seconds',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      vout:
          (json.valueEnsureAsList<dynamic>(
                'vout',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<Vout, Object>(
                  value: e,
                  parse:
                      (v) =>
                          Vout.fromJson(JsonParser.valueAs(v), config: config),
                ),
              )
              .toList(),
    );
  }

  factory QueryQuoteSwapResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryQuoteSwapResponse(
      inboundAddress: decode.getString<String?>(1),
      inboundConfirmationBlocks: decode.getBigInt<BigInt?>(2),
      inboundConfirmationSeconds: decode.getBigInt<BigInt?>(3),
      outboundDelayBlocks: decode.getBigInt<BigInt?>(4),
      outboundDelaySeconds: decode.getBigInt<BigInt?>(5),
      fees: decode.messageTo<QuoteFees?>(6, (b) => QuoteFees.deserialize(b)),
      router: decode.getString<String?>(7),
      expiry: decode.getBigInt<BigInt?>(8),
      warning: decode.getString<String?>(9),
      notes: decode.getString<String?>(10),
      dustThreshold: decode.getString<String?>(11),
      recommendedMinAmountIn: decode.getString<String?>(12),
      recommendedGasRate: decode.getString<String?>(13),
      gasRateUnits: decode.getString<String?>(14),
      memo: decode.getString<String?>(15),
      expectedAmountOut: decode.getString<String?>(16),
      maxStreamingQuantity: decode.getBigInt<BigInt?>(17),
      streamingSwapBlocks: decode.getBigInt<BigInt?>(18),
      streamingSwapSeconds: decode.getBigInt<BigInt?>(19),
      totalSwapSeconds: decode.getBigInt<BigInt?>(20),
      vout: decode.getListOfBytes(21).map((b) => Vout.deserialize(b)).toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryQuoteSwapResponse;
}

class QuoteFees extends CosmosProtoMessage {
  /// the target asset used for all fees
  final String? asset;

  /// affiliate fee in the target asset
  final String? affiliate;

  /// outbound fee in the target asset
  final String? outbound;

  /// liquidity fees paid to pools in the target asset
  final String? liquidity;

  /// total fees in the target asset
  final String? total;

  /// the swap slippage in basis points
  final BigInt? slippageBps;

  /// total basis points in fees relative to amount out
  final BigInt? totalBps;

  const QuoteFees({
    this.asset,
    this.affiliate,
    this.outbound,
    this.liquidity,
    this.total,
    this.slippageBps,
    this.totalBps,
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
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.int64(6, options: const []),
        ProtoFieldConfig.int64(7, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    asset,
    affiliate,
    outbound,
    liquidity,
    total,
    slippageBps,
    totalBps,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'asset': asset,
      'affiliate': affiliate,
      'outbound': outbound,
      'liquidity': liquidity,
      'total': total,
      'slippage_bps': config.encodeBigint(slippageBps),
      'total_bps': config.encodeBigint(totalBps),
    };
  }

  factory QuoteFees.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuoteFees(
      asset: json.valueAsString<String?>(
        'asset',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      affiliate: json.valueAsString<String?>(
        'affiliate',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      outbound: json.valueAsString<String?>(
        'outbound',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      liquidity: json.valueAsString<String?>(
        'liquidity',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      total: json.valueAsString<String?>(
        'total',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      slippageBps: json.valueAsBigInt<BigInt?>(
        'slippage_bps',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      totalBps: json.valueAsBigInt<BigInt?>(
        'total_bps',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QuoteFees.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuoteFees(
      asset: decode.getString<String?>(1),
      affiliate: decode.getString<String?>(2),
      outbound: decode.getString<String?>(3),
      liquidity: decode.getString<String?>(4),
      total: decode.getString<String?>(5),
      slippageBps: decode.getBigInt<BigInt?>(6),
      totalBps: decode.getBigInt<BigInt?>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQuoteFees;
}

class Vout extends CosmosProtoMessage {
  /// type of content, either "op_return" or "address"
  final String? type;

  /// l1 address or hex encoded memo
  final String? data;

  /// sats to send, depends on dust limit per chain, 0 for op_return
  final BigInt? amount;

  const Vout({this.type, this.data, this.amount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.int64(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [type, data, amount];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'type': type, 'data': data, 'amount': config.encodeBigint(amount)};
  }

  factory Vout.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Vout(
      type: json.valueAsString<String?>(
        'type',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      data: json.valueAsString<String?>(
        'data',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      amount: json.valueAsBigInt<BigInt?>(
        'amount',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Vout.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Vout(
      type: decode.getString<String?>(1),
      data: decode.getString<String?>(2),
      amount: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesVout;
}

/// Request for limit order quote
class QueryQuoteLimitRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryQuoteLimitResponse> {
  /// source asset
  final String? fromAsset;

  /// destination asset
  final String? toAsset;

  /// amount to swap (in source asset base units)
  final String? amount;

  /// destination address
  final String? destination;

  /// target output amount (in target asset base units) - REQUIRED for limit
  /// orders
  final String? targetOut;

  /// custom TTL in blocks for limit orders
  final String? customTtl;

  /// number of sub-swaps
  final String? streamingQuantity;

  /// affiliate address
  final String? affiliate;

  /// affiliate basis points (0-10000)
  final String? affiliateBps;

  /// refund address
  final String? refundAddress;

  const QueryQuoteLimitRequest({
    this.fromAsset,
    this.toAsset,
    this.amount,
    this.destination,
    this.targetOut,
    this.customTtl,
    this.streamingQuantity,
    this.affiliate,
    this.affiliateBps,
    this.refundAddress,
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
          path: "/thorchain/quote/limit",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(7, options: const []),
        ProtoFieldConfig.string(8, options: const []),
        ProtoFieldConfig.string(9, options: const []),
        ProtoFieldConfig.string(10, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    fromAsset,
    toAsset,
    amount,
    destination,
    targetOut,
    customTtl,
    streamingQuantity,
    affiliate,
    affiliateBps,
    refundAddress,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'from_asset': fromAsset,
      'to_asset': toAsset,
      'amount': amount,
      'destination': destination,
      'target_out': targetOut,
      'custom_ttl': customTtl,
      'streaming_quantity': streamingQuantity,
      'affiliate': affiliate,
      'affiliate_bps': affiliateBps,
      'refund_address': refundAddress,
    };
  }

  factory QueryQuoteLimitRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryQuoteLimitRequest(
      fromAsset: json.valueAsString<String?>(
        'from_asset',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      toAsset: json.valueAsString<String?>(
        'to_asset',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      amount: json.valueAsString<String?>(
        'amount',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      destination: json.valueAsString<String?>(
        'destination',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      targetOut: json.valueAsString<String?>(
        'target_out',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      customTtl: json.valueAsString<String?>(
        'custom_ttl',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      streamingQuantity: json.valueAsString<String?>(
        'streaming_quantity',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      affiliate: json.valueAsString<String?>(
        'affiliate',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      affiliateBps: json.valueAsString<String?>(
        'affiliate_bps',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      refundAddress: json.valueAsString<String?>(
        'refund_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryQuoteLimitRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryQuoteLimitRequest(
      fromAsset: decode.getString<String?>(1),
      toAsset: decode.getString<String?>(2),
      amount: decode.getString<String?>(3),
      destination: decode.getString<String?>(4),
      targetOut: decode.getString<String?>(5),
      customTtl: decode.getString<String?>(6),
      streamingQuantity: decode.getString<String?>(7),
      affiliate: decode.getString<String?>(8),
      affiliateBps: decode.getString<String?>(9),
      refundAddress: decode.getString<String?>(10),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryQuoteLimitRequest;
  @override
  QueryQuoteLimitResponse onQueryResponse(List<int> bytes) {
    return QueryQuoteLimitResponse.deserialize(bytes);
  }

  @override
  QueryQuoteLimitResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryQuoteLimitResponse.fromJson(json);
  }
}

/// Response for limit order quote
class QueryQuoteLimitResponse extends CosmosProtoMessage {
  /// expected amount out (same as target_out for limit orders)
  final String? expectedAmountOut;

  /// fees breakdown
  final QuoteFees? fees;

  /// inbound address to send funds to
  final String? inboundAddress;

  /// memo to include in transaction
  final String? memo;

  /// order expiry block height
  final BigInt? orderExpiryBlock;

  /// order expiry timestamp (unix)
  final BigInt? orderExpiryTimestamp;

  /// recommended minimum amount in
  final String? recommendedMinAmountIn;

  /// router address for EVM chains
  final String? router;

  /// dust threshold for source chain
  final String? dustThreshold;

  /// notes about the swap
  final String? notes;

  /// the recommended gas rate to use for the inbound to ensure timely
  /// confirmation
  final String? recommendedGasRate;

  /// the units of the recommended gas rate
  final String? gasRateUnits;

  const QueryQuoteLimitResponse({
    this.expectedAmountOut,
    this.fees,
    this.inboundAddress,
    this.memo,
    this.orderExpiryBlock,
    this.orderExpiryTimestamp,
    this.recommendedMinAmountIn,
    this.router,
    this.dustThreshold,
    this.notes,
    this.recommendedGasRate,
    this.gasRateUnits,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.int64(5, options: const []),
        ProtoFieldConfig.int64(6, options: const []),
        ProtoFieldConfig.string(7, options: const []),
        ProtoFieldConfig.string(8, options: const []),
        ProtoFieldConfig.string(9, options: const []),
        ProtoFieldConfig.string(10, options: const []),
        ProtoFieldConfig.string(11),
        ProtoFieldConfig.string(12),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    expectedAmountOut,
    fees,
    inboundAddress,
    memo,
    orderExpiryBlock,
    orderExpiryTimestamp,
    recommendedMinAmountIn,
    router,
    dustThreshold,
    notes,
    recommendedGasRate,
    gasRateUnits,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'expected_amount_out': expectedAmountOut,
      'fees': config.encodeMessage(fees),
      'inbound_address': inboundAddress,
      'memo': memo,
      'order_expiry_block': config.encodeBigint(orderExpiryBlock),
      'order_expiry_timestamp': config.encodeBigint(orderExpiryTimestamp),
      'recommended_min_amount_in': recommendedMinAmountIn,
      'router': router,
      'dust_threshold': dustThreshold,
      'notes': notes,
      'recommended_gas_rate': recommendedGasRate,
      'gas_rate_units': gasRateUnits,
    };
  }

  factory QueryQuoteLimitResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryQuoteLimitResponse(
      expectedAmountOut: json.valueAsString<String?>(
        'expected_amount_out',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      fees: json.valueTo<QuoteFees?, Object>(
        key: 'fees',
        parse: (v) => QuoteFees.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      inboundAddress: json.valueAsString<String?>(
        'inbound_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      memo: json.valueAsString<String?>(
        'memo',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      orderExpiryBlock: json.valueAsBigInt<BigInt?>(
        'order_expiry_block',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      orderExpiryTimestamp: json.valueAsBigInt<BigInt?>(
        'order_expiry_timestamp',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      recommendedMinAmountIn: json.valueAsString<String?>(
        'recommended_min_amount_in',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      router: json.valueAsString<String?>(
        'router',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      dustThreshold: json.valueAsString<String?>(
        'dust_threshold',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      notes: json.valueAsString<String?>(
        'notes',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      recommendedGasRate: json.valueAsString<String?>(
        'recommended_gas_rate',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      gasRateUnits: json.valueAsString<String?>(
        'gas_rate_units',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryQuoteLimitResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryQuoteLimitResponse(
      expectedAmountOut: decode.getString<String?>(1),
      fees: decode.messageTo<QuoteFees?>(2, (b) => QuoteFees.deserialize(b)),
      inboundAddress: decode.getString<String?>(3),
      memo: decode.getString<String?>(4),
      orderExpiryBlock: decode.getBigInt<BigInt?>(5),
      orderExpiryTimestamp: decode.getBigInt<BigInt?>(6),
      recommendedMinAmountIn: decode.getString<String?>(7),
      router: decode.getString<String?>(8),
      dustThreshold: decode.getString<String?>(9),
      notes: decode.getString<String?>(10),
      recommendedGasRate: decode.getString<String?>(11),
      gasRateUnits: decode.getString<String?>(12),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryQuoteLimitResponse;
}
