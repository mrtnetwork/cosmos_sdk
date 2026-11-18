import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QueryStreamingSwapRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryStreamingSwapResponse> {
  final String? txId;

  final String? height;

  const QueryStreamingSwapRequest({this.txId, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/swap/streaming/{tx_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [txId, height];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'tx_id': txId, 'height': height};
  }

  factory QueryStreamingSwapRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryStreamingSwapRequest(
      txId: json.valueAsString<String?>(
        'tx_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      height: json.valueAsString<String?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryStreamingSwapRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryStreamingSwapRequest(
      txId: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryStreamingSwapRequest;
  @override
  QueryStreamingSwapResponse onQueryResponse(List<int> bytes) {
    return QueryStreamingSwapResponse.deserialize(bytes);
  }

  @override
  QueryStreamingSwapResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryStreamingSwapResponse.fromJson(json);
  }
}

class QueryStreamingSwapResponse extends CosmosProtoMessage {
  /// the hash of a transaction
  final String? txId;

  /// how often each swap is made, in blocks
  final BigInt? interval;

  /// the total number of swaps in a streaming swaps
  final BigInt? quantity;

  /// the amount of swap attempts so far
  final BigInt? count;

  /// the block height of the latest swap
  final BigInt? lastHeight;

  /// the total number of tokens the swapper wants to receive of the output asset
  final String? tradeTarget;

  /// the asset to be swapped from
  final String? sourceAsset;

  /// the asset to be swapped to
  final String? targetAsset;

  /// the destination address to receive the swap output
  final String? destination;

  /// the number of input tokens the swapper has deposited
  final String? deposit;

  /// the amount of input tokens that have been swapped so far
  final String? in_;

  /// the amount of output tokens that have been swapped so far
  final String? out;

  /// the list of swap indexes that failed
  final List<BigInt> failedSwaps;

  /// the list of reasons that sub-swaps have failed
  final List<String> failedSwapReasons;

  /// the block height when the swap first entered the queue
  final BigInt? initialHeight;

  const QueryStreamingSwapResponse({
    this.txId,
    this.interval,
    this.quantity,
    this.count,
    this.lastHeight,
    this.tradeTarget,
    this.sourceAsset,
    this.targetAsset,
    this.destination,
    this.deposit,
    this.in_,
    this.out,
    this.failedSwaps = const [],
    this.failedSwapReasons = const [],
    this.initialHeight,
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
        ProtoFieldConfig.int64(4),
        ProtoFieldConfig.int64(5),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(7),
        ProtoFieldConfig.string(8),
        ProtoFieldConfig.string(9),
        ProtoFieldConfig.string(10, options: const []),
        ProtoFieldConfig.string(11, options: const []),
        ProtoFieldConfig.string(12, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 13,
          elementType: ProtoFieldType.int64,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 14,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.int64(15),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    txId,
    interval,
    quantity,
    count,
    lastHeight,
    tradeTarget,
    sourceAsset,
    targetAsset,
    destination,
    deposit,
    in_,
    out,
    failedSwaps,
    failedSwapReasons,
    initialHeight,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'tx_id': txId,
      'interval': config.encodeBigint(interval),
      'quantity': config.encodeBigint(quantity),
      'count': config.encodeBigint(count),
      'last_height': config.encodeBigint(lastHeight),
      'trade_target': tradeTarget,
      'source_asset': sourceAsset,
      'target_asset': targetAsset,
      'destination': destination,
      'deposit': deposit,
      'in': in_,
      'out': out,
      'failed_swaps': failedSwaps.map((e) => config.encodeBigint(e)).toList(),
      'failed_swap_reasons': failedSwapReasons.map((e) => e).toList(),
      'initial_height': config.encodeBigint(initialHeight),
    };
  }

  factory QueryStreamingSwapResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryStreamingSwapResponse(
      txId: json.valueAsString<String?>(
        'tx_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      interval: json.valueAsBigInt<BigInt?>(
        'interval',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      quantity: json.valueAsBigInt<BigInt?>(
        'quantity',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      count: json.valueAsBigInt<BigInt?>(
        'count',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      lastHeight: json.valueAsBigInt<BigInt?>(
        'last_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      tradeTarget: json.valueAsString<String?>(
        'trade_target',
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
      destination: json.valueAsString<String?>(
        'destination',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      deposit: json.valueAsString<String?>(
        'deposit',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      in_: json.valueAsString<String?>(
        'in',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      out: json.valueAsString<String?>(
        'out',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      failedSwaps:
          (json.valueEnsureAsList<dynamic>(
            'failed_swaps',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
      failedSwapReasons:
          (json.valueEnsureAsList<dynamic>(
            'failed_swap_reasons',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      initialHeight: json.valueAsBigInt<BigInt?>(
        'initial_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryStreamingSwapResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryStreamingSwapResponse(
      txId: decode.getString<String?>(1),
      interval: decode.getBigInt<BigInt?>(2),
      quantity: decode.getBigInt<BigInt?>(3),
      count: decode.getBigInt<BigInt?>(4),
      lastHeight: decode.getBigInt<BigInt?>(5),
      tradeTarget: decode.getString<String?>(6),
      sourceAsset: decode.getString<String?>(7),
      targetAsset: decode.getString<String?>(8),
      destination: decode.getString<String?>(9),
      deposit: decode.getString<String?>(10),
      in_: decode.getString<String?>(11),
      out: decode.getString<String?>(12),
      failedSwaps: decode.getListOrEmpty<BigInt>(13),
      failedSwapReasons: decode.getListOrEmpty<String>(14),
      initialHeight: decode.getBigInt<BigInt?>(15),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryStreamingSwapResponse;
}

class QueryStreamingSwapsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryStreamingSwapsResponse> {
  final String? height;

  const QueryStreamingSwapsRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/swaps/streaming",
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

  factory QueryStreamingSwapsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryStreamingSwapsRequest(
      height: json.valueAsString<String?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryStreamingSwapsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryStreamingSwapsRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryStreamingSwapsRequest;
  @override
  QueryStreamingSwapsResponse onQueryResponse(List<int> bytes) {
    return QueryStreamingSwapsResponse.deserialize(bytes);
  }

  @override
  QueryStreamingSwapsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryStreamingSwapsResponse.fromJson(json);
  }
}

class QueryStreamingSwapsResponse extends CosmosProtoMessage {
  final List<QueryStreamingSwapResponse> streamingSwaps;

  const QueryStreamingSwapsResponse({this.streamingSwaps = const []});

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
  List<Object?> get protoValues => [streamingSwaps];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'streaming_swaps':
          streamingSwaps.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QueryStreamingSwapsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryStreamingSwapsResponse(
      streamingSwaps:
          (json.valueEnsureAsList<dynamic>(
                'streaming_swaps',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<QueryStreamingSwapResponse, Object>(
                  value: e,
                  parse:
                      (v) => QueryStreamingSwapResponse.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryStreamingSwapsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryStreamingSwapsResponse(
      streamingSwaps:
          decode
              .getListOfBytes(1)
              .map((b) => QueryStreamingSwapResponse.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryStreamingSwapsResponse;
}
