import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// PageRequest is to be embedded in gRPC request messages for efficient
/// pagination. Ex:
///
/// message SomeRequest {
/// Foo some_parameter = 1;
/// PageRequest pagination = 2;
/// }
class PageRequest extends CosmosProtoMessage {
  /// key is a value returned in PageResponse.next_key to begin
  /// querying the next page most efficiently. Only one of offset or key
  /// should be set.
  final BuBytes? key;

  /// offset is a numeric offset that can be used when key is unavailable.
  /// It is less efficient than using key. Only one of offset or key should
  /// be set.
  final BigInt? offset;

  /// limit is the total number of results to be returned in the result page.
  /// If left empty it will default to a value to be set by each app.
  final BigInt? limit;

  /// count_total is set to true  to indicate that the result set should include
  /// a count of the total number of items available for pagination in UIs.
  /// count_total is only respected when offset is used. It is ignored when key
  /// is set.
  final bool? countTotal;

  /// reverse is set to true if results are to be returned in the descending order.
  final bool? reverse;

  PageRequest({
    List<int>? key,
    this.offset,
    this.limit,
    this.countTotal,
    this.reverse,
  }) : key = key?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bytes(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.bool(4),
        ProtoFieldConfig.bool(
          5,
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.43",
            ),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [key, offset, limit, countTotal, reverse];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'key': config.encodeBinary(key),
      'offset': config.encodeBigint(offset),
      'limit': config.encodeBigint(limit),
      'count_total': countTotal,
      'reverse': reverse,
    };
  }

  factory PageRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return PageRequest(
      key: config.decodeBinary<List<int>?>(
        json.valueAs('key', normalizeKeyLookup: config.normalizeKeys),
      ),
      offset: json.valueAsBigInt<BigInt?>(
        'offset',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      limit: json.valueAsBigInt<BigInt?>(
        'limit',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      countTotal: json.valueAsBool<bool?>(
        'count_total',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      reverse: json.valueAsBool<bool?>(
        'reverse',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory PageRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PageRequest(
      key: decode.getBytes<List<int>?>(1),
      offset: decode.getBigInt<BigInt?>(2),
      limit: decode.getBigInt<BigInt?>(3),
      countTotal: decode.getBool<bool?>(4),
      reverse: decode.getBool<bool?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBaseQueryV1beta1PageRequest;
}

/// PageResponse is to be embedded in gRPC response messages where the
/// corresponding request message has used PageRequest.
///
/// message SomeResponse {
/// repeated Bar results = 1;
/// PageResponse page = 2;
/// }
class PageResponse extends CosmosProtoMessage {
  /// next_key is the key to be passed to PageRequest.key to
  /// query the next page most efficiently. It will be empty if
  /// there are no more results.
  final BuBytes? nextKey;

  /// total is total number of results available if PageRequest.count_total
  /// was set, its value is undefined otherwise
  final BigInt? total;

  PageResponse({List<int>? nextKey, this.total})
    : nextKey = nextKey?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bytes(1), ProtoFieldConfig.uint64(2)],
    );
  }

  @override
  List<Object?> get protoValues => [nextKey, total];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'next_key': config.encodeBinary(nextKey),
      'total': config.encodeBigint(total),
    };
  }

  factory PageResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return PageResponse(
      nextKey: config.decodeBinary<List<int>?>(
        json.valueAs('next_key', normalizeKeyLookup: config.normalizeKeys),
      ),
      total: json.valueAsBigInt<BigInt?>(
        'total',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory PageResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PageResponse(
      nextKey: decode.getBytes<List<int>?>(1),
      total: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBaseQueryV1beta1PageResponse;
}
