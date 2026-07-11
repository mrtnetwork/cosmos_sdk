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
  Map<String, dynamic> toJson() {
    return {'tx_id': txId, 'height': height};
  }

  factory QueryStreamingSwapRequest.fromJson(Map<String, dynamic> json) {
    return QueryStreamingSwapRequest(
      txId: json.valueAsString<String?>('tx_id', acceptCamelCase: true),
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {
      'tx_id': txId,
      'interval': interval?.toString(),
      'quantity': quantity?.toString(),
      'count': count?.toString(),
      'last_height': lastHeight?.toString(),
      'trade_target': tradeTarget,
      'source_asset': sourceAsset,
      'target_asset': targetAsset,
      'destination': destination,
      'deposit': deposit,
      'in': in_,
      'out': out,
      'failed_swaps': failedSwaps.map((e) => e.toString()).toList(),
      'failed_swap_reasons': failedSwapReasons.map((e) => e).toList(),
      'initial_height': initialHeight?.toString(),
    };
  }

  factory QueryStreamingSwapResponse.fromJson(Map<String, dynamic> json) {
    return QueryStreamingSwapResponse(
      txId: json.valueAsString<String?>('tx_id', acceptCamelCase: true),
      interval: json.valueAsBigInt<BigInt?>('interval', acceptCamelCase: true),
      quantity: json.valueAsBigInt<BigInt?>('quantity', acceptCamelCase: true),
      count: json.valueAsBigInt<BigInt?>('count', acceptCamelCase: true),
      lastHeight: json.valueAsBigInt<BigInt?>(
        'last_height',
        acceptCamelCase: true,
      ),
      tradeTarget: json.valueAsString<String?>(
        'trade_target',
        acceptCamelCase: true,
      ),
      sourceAsset: json.valueAsString<String?>(
        'source_asset',
        acceptCamelCase: true,
      ),
      targetAsset: json.valueAsString<String?>(
        'target_asset',
        acceptCamelCase: true,
      ),
      destination: json.valueAsString<String?>(
        'destination',
        acceptCamelCase: true,
      ),
      deposit: json.valueAsString<String?>('deposit', acceptCamelCase: true),
      in_: json.valueAsString<String?>('in', acceptCamelCase: true),
      out: json.valueAsString<String?>('out', acceptCamelCase: true),
      failedSwaps:
          (json.valueEnsureAsList<dynamic>(
            'failed_swaps',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
      failedSwapReasons:
          (json.valueEnsureAsList<dynamic>(
            'failed_swap_reasons',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      initialHeight: json.valueAsBigInt<BigInt?>(
        'initial_height',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'height': height};
  }

  factory QueryStreamingSwapsRequest.fromJson(Map<String, dynamic> json) {
    return QueryStreamingSwapsRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'streaming_swaps': streamingSwaps.map((e) => e.toJson()).toList()};
  }

  factory QueryStreamingSwapsResponse.fromJson(Map<String, dynamic> json) {
    return QueryStreamingSwapsResponse(
      streamingSwaps:
          (json.valueEnsureAsList<dynamic>(
                'streaming_swaps',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  QueryStreamingSwapResponse,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => QueryStreamingSwapResponse.fromJson(v),
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
