import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/thorchain/types/src/msg_swap.dart"
    as types_msg_swap;
import "package:cosmos_sdk/proto_messages/thorchain/types/src/query_limit_swaps.dart"
    as types_query_limit_swaps;

class QuerySwapQueueRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySwapQueueResponse> {
  final String? height;

  const QuerySwapQueueRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/queue/swap",
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

  factory QuerySwapQueueRequest.fromJson(Map<String, dynamic> json) {
    return QuerySwapQueueRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QuerySwapQueueRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySwapQueueRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQuerySwapQueueRequest;
  @override
  QuerySwapQueueResponse onQueryResponse(List<int> bytes) {
    return QuerySwapQueueResponse.deserialize(bytes);
  }

  @override
  QuerySwapQueueResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QuerySwapQueueResponse.fromJson(json);
  }
}

class QuerySwapQueueResponse extends CosmosProtoMessage {
  final List<types_msg_swap.MsgSwap> swapQueue;

  const QuerySwapQueueResponse({this.swapQueue = const []});

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
  List<Object?> get protoValues => [swapQueue];

  @override
  Map<String, dynamic> toJson() {
    return {'swap_queue': swapQueue.map((e) => e.toJson()).toList()};
  }

  factory QuerySwapQueueResponse.fromJson(Map<String, dynamic> json) {
    return QuerySwapQueueResponse(
      swapQueue:
          (json.valueEnsureAsList<dynamic>('swap_queue', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  types_msg_swap.MsgSwap,
                  Map<String, dynamic>
                >(value: e, parse: (v) => types_msg_swap.MsgSwap.fromJson(v)),
              )
              .toList(),
    );
  }

  factory QuerySwapQueueResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySwapQueueResponse(
      swapQueue:
          decode
              .getListOfBytes(1)
              .map((b) => types_msg_swap.MsgSwap.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQuerySwapQueueResponse;
}

class QuerySwapQueuePaginatedRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySwapQueuePaginatedResponse> {
  final String? height;

  final BigInt? offset;

  final BigInt? limit;

  const QuerySwapQueuePaginatedRequest({this.height, this.offset, this.limit});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/queue/swap/paginated",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.uint64(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [height, offset, limit];

  @override
  Map<String, dynamic> toJson() {
    return {
      'height': height,
      'offset': offset?.toString(),
      'limit': limit?.toString(),
    };
  }

  factory QuerySwapQueuePaginatedRequest.fromJson(Map<String, dynamic> json) {
    return QuerySwapQueuePaginatedRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
      offset: json.valueAsBigInt<BigInt?>('offset', acceptCamelCase: true),
      limit: json.valueAsBigInt<BigInt?>('limit', acceptCamelCase: true),
    );
  }

  factory QuerySwapQueuePaginatedRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySwapQueuePaginatedRequest(
      height: decode.getString<String?>(1),
      offset: decode.getBigInt<BigInt?>(2),
      limit: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQuerySwapQueuePaginatedRequest;
  @override
  QuerySwapQueuePaginatedResponse onQueryResponse(List<int> bytes) {
    return QuerySwapQueuePaginatedResponse.deserialize(bytes);
  }

  @override
  QuerySwapQueuePaginatedResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QuerySwapQueuePaginatedResponse.fromJson(json);
  }
}

class QuerySwapQueuePaginatedResponse extends CosmosProtoMessage {
  final List<types_msg_swap.MsgSwap> swapQueue;

  final types_query_limit_swaps.PaginationMeta? pagination;

  const QuerySwapQueuePaginatedResponse({
    this.swapQueue = const [],
    this.pagination,
  });

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
  List<Object?> get protoValues => [swapQueue, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'swap_queue': swapQueue.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QuerySwapQueuePaginatedResponse.fromJson(Map<String, dynamic> json) {
    return QuerySwapQueuePaginatedResponse(
      swapQueue:
          (json.valueEnsureAsList<dynamic>('swap_queue', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  types_msg_swap.MsgSwap,
                  Map<String, dynamic>
                >(value: e, parse: (v) => types_msg_swap.MsgSwap.fromJson(v)),
              )
              .toList(),
      pagination: json.valueTo<
        types_query_limit_swaps.PaginationMeta?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse: (v) => types_query_limit_swaps.PaginationMeta.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QuerySwapQueuePaginatedResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySwapQueuePaginatedResponse(
      swapQueue:
          decode
              .getListOfBytes(1)
              .map((b) => types_msg_swap.MsgSwap.deserialize(b))
              .toList(),
      pagination: decode.messageTo<types_query_limit_swaps.PaginationMeta?>(
        2,
        (b) => types_query_limit_swaps.PaginationMeta.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQuerySwapQueuePaginatedResponse;
}
