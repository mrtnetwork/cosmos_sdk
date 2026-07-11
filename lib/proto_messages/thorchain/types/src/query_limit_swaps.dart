import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/thorchain/types/src/msg_swap.dart"
    as types_msg_swap;

class QueryLimitSwapsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryLimitSwapsResponse> {
  final String? height;

  final BigInt? offset;

  final BigInt? limit;

  final String? sourceAsset;

  final String? targetAsset;

  final String? sender;

  final String? sortBy;

  final String? sortOrder;

  const QueryLimitSwapsRequest({
    this.height,
    this.offset,
    this.limit,
    this.sourceAsset,
    this.targetAsset,
    this.sender,
    this.sortBy,
    this.sortOrder,
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
          path: "/thorchain/queue/limit_swaps",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.string(6),
        ProtoFieldConfig.string(7),
        ProtoFieldConfig.string(8),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    height,
    offset,
    limit,
    sourceAsset,
    targetAsset,
    sender,
    sortBy,
    sortOrder,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'height': height,
      'offset': offset?.toString(),
      'limit': limit?.toString(),
      'source_asset': sourceAsset,
      'target_asset': targetAsset,
      'sender': sender,
      'sort_by': sortBy,
      'sort_order': sortOrder,
    };
  }

  factory QueryLimitSwapsRequest.fromJson(Map<String, dynamic> json) {
    return QueryLimitSwapsRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
      offset: json.valueAsBigInt<BigInt?>('offset', acceptCamelCase: true),
      limit: json.valueAsBigInt<BigInt?>('limit', acceptCamelCase: true),
      sourceAsset: json.valueAsString<String?>(
        'source_asset',
        acceptCamelCase: true,
      ),
      targetAsset: json.valueAsString<String?>(
        'target_asset',
        acceptCamelCase: true,
      ),
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      sortBy: json.valueAsString<String?>('sort_by', acceptCamelCase: true),
      sortOrder: json.valueAsString<String?>(
        'sort_order',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryLimitSwapsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryLimitSwapsRequest(
      height: decode.getString<String?>(1),
      offset: decode.getBigInt<BigInt?>(2),
      limit: decode.getBigInt<BigInt?>(3),
      sourceAsset: decode.getString<String?>(4),
      targetAsset: decode.getString<String?>(5),
      sender: decode.getString<String?>(6),
      sortBy: decode.getString<String?>(7),
      sortOrder: decode.getString<String?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryLimitSwapsRequest;
  @override
  QueryLimitSwapsResponse onQueryResponse(List<int> bytes) {
    return QueryLimitSwapsResponse.deserialize(bytes);
  }

  @override
  QueryLimitSwapsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryLimitSwapsResponse.fromJson(json);
  }
}

class LimitSwapWithDetails extends CosmosProtoMessage {
  final types_msg_swap.MsgSwap? swap;

  final String? ratio;

  final BigInt? blocksSinceCreated;

  final BigInt? timeToExpiryBlocks;

  final BigInt? createdTimestamp;

  const LimitSwapWithDetails({
    this.swap,
    this.ratio,
    this.blocksSinceCreated,
    this.timeToExpiryBlocks,
    this.createdTimestamp,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.int64(3),
        ProtoFieldConfig.int64(4),
        ProtoFieldConfig.int64(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    swap,
    ratio,
    blocksSinceCreated,
    timeToExpiryBlocks,
    createdTimestamp,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'swap': swap?.toJson(),
      'ratio': ratio,
      'blocks_since_created': blocksSinceCreated?.toString(),
      'time_to_expiry_blocks': timeToExpiryBlocks?.toString(),
      'created_timestamp': createdTimestamp?.toString(),
    };
  }

  factory LimitSwapWithDetails.fromJson(Map<String, dynamic> json) {
    return LimitSwapWithDetails(
      swap: json.valueTo<types_msg_swap.MsgSwap?, Map<String, dynamic>>(
        key: 'swap',
        parse: (v) => types_msg_swap.MsgSwap.fromJson(v),
        acceptCamelCase: true,
      ),
      ratio: json.valueAsString<String?>('ratio', acceptCamelCase: true),
      blocksSinceCreated: json.valueAsBigInt<BigInt?>(
        'blocks_since_created',
        acceptCamelCase: true,
      ),
      timeToExpiryBlocks: json.valueAsBigInt<BigInt?>(
        'time_to_expiry_blocks',
        acceptCamelCase: true,
      ),
      createdTimestamp: json.valueAsBigInt<BigInt?>(
        'created_timestamp',
        acceptCamelCase: true,
      ),
    );
  }

  factory LimitSwapWithDetails.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return LimitSwapWithDetails(
      swap: decode.messageTo<types_msg_swap.MsgSwap?>(
        1,
        (b) => types_msg_swap.MsgSwap.deserialize(b),
      ),
      ratio: decode.getString<String?>(2),
      blocksSinceCreated: decode.getBigInt<BigInt?>(3),
      timeToExpiryBlocks: decode.getBigInt<BigInt?>(4),
      createdTimestamp: decode.getBigInt<BigInt?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesLimitSwapWithDetails;
}

class PaginationMeta extends CosmosProtoMessage {
  final BigInt? offset;

  final BigInt? limit;

  final BigInt? total;

  final bool? hasNext;

  final bool? hasPrev;

  const PaginationMeta({
    this.offset,
    this.limit,
    this.total,
    this.hasNext,
    this.hasPrev,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.bool(4),
        ProtoFieldConfig.bool(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [offset, limit, total, hasNext, hasPrev];

  @override
  Map<String, dynamic> toJson() {
    return {
      'offset': offset?.toString(),
      'limit': limit?.toString(),
      'total': total?.toString(),
      'has_next': hasNext,
      'has_prev': hasPrev,
    };
  }

  factory PaginationMeta.fromJson(Map<String, dynamic> json) {
    return PaginationMeta(
      offset: json.valueAsBigInt<BigInt?>('offset', acceptCamelCase: true),
      limit: json.valueAsBigInt<BigInt?>('limit', acceptCamelCase: true),
      total: json.valueAsBigInt<BigInt?>('total', acceptCamelCase: true),
      hasNext: json.valueAsBool<bool?>('has_next', acceptCamelCase: true),
      hasPrev: json.valueAsBool<bool?>('has_prev', acceptCamelCase: true),
    );
  }

  factory PaginationMeta.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PaginationMeta(
      offset: decode.getBigInt<BigInt?>(1),
      limit: decode.getBigInt<BigInt?>(2),
      total: decode.getBigInt<BigInt?>(3),
      hasNext: decode.getBool<bool?>(4),
      hasPrev: decode.getBool<bool?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesPaginationMeta;
}

class QueryLimitSwapsResponse extends CosmosProtoMessage {
  final List<LimitSwapWithDetails> limitSwaps;

  final PaginationMeta? pagination;

  const QueryLimitSwapsResponse({this.limitSwaps = const [], this.pagination});

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
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [limitSwaps, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'limit_swaps': limitSwaps.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryLimitSwapsResponse.fromJson(Map<String, dynamic> json) {
    return QueryLimitSwapsResponse(
      limitSwaps:
          (json.valueEnsureAsList<dynamic>(
                'limit_swaps',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  LimitSwapWithDetails,
                  Map<String, dynamic>
                >(value: e, parse: (v) => LimitSwapWithDetails.fromJson(v)),
              )
              .toList(),
      pagination: json.valueTo<PaginationMeta?, Map<String, dynamic>>(
        key: 'pagination',
        parse: (v) => PaginationMeta.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryLimitSwapsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryLimitSwapsResponse(
      limitSwaps:
          decode
              .getListOfBytes(1)
              .map((b) => LimitSwapWithDetails.deserialize(b))
              .toList(),
      pagination: decode.messageTo<PaginationMeta?>(
        2,
        (b) => PaginationMeta.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryLimitSwapsResponse;
}
