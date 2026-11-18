import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/google/protobuf/src/duration.dart"
    as google_protobuf_duration;

enum TimeoutPolicy implements ProtoEnumVariant {
  rejectQueryResponse(0, 'REJECT_QUERY_RESPONSE'),
  retryQueryRequest(1, 'RETRY_QUERY_REQUEST'),
  executeQueryCallback(2, 'EXECUTE_QUERY_CALLBACK');

  const TimeoutPolicy(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static TimeoutPolicy fromValue(int? value) {
    value ??= 0;
    return TimeoutPolicy.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching TimeoutPolicy found for the given value. $value",
                details: {"name": "TimeoutPolicy", "value": value?.toString()},
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static TimeoutPolicy from(Object? value) {
    value ??= 0;
    return TimeoutPolicy.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching TimeoutPolicy found for the given value. $value",
                details: {"name": "TimeoutPolicy", "value": value?.toString()},
              ),
    );
  }
}

class Query extends CosmosProtoMessage {
  final String? id;

  final String? connectionId;

  final String? chainId;

  final String? queryType;

  final BuBytes? requestData;

  final String? callbackModule;

  final String? callbackId;

  final BuBytes? callbackData;

  final TimeoutPolicy? timeoutPolicy;

  final google_protobuf_duration.Duration? timeoutDuration;

  final BigInt? timeoutTimestamp;

  final bool? requestSent;

  final BigInt? submissionHeight;

  Query({
    this.id,
    this.connectionId,
    this.chainId,
    this.queryType,
    List<int>? requestData,
    this.callbackModule,
    this.callbackId,
    List<int>? callbackData,
    this.timeoutPolicy,
    this.timeoutDuration,
    this.timeoutTimestamp,
    this.requestSent,
    this.submissionHeight,
  }) : requestData = requestData?.asImmutableBytes,
       callbackData = callbackData?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.bytes(5),
        ProtoFieldConfig.string(13),
        ProtoFieldConfig.string(8),
        ProtoFieldConfig.bytes(12),
        ProtoFieldConfig.enumType(15),
        ProtoFieldConfig.message(14, options: const []),
        ProtoFieldConfig.uint64(9),
        ProtoFieldConfig.bool(11),
        ProtoFieldConfig.uint64(16),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    id,
    connectionId,
    chainId,
    queryType,
    requestData,
    callbackModule,
    callbackId,
    callbackData,
    timeoutPolicy,
    timeoutDuration,
    timeoutTimestamp,
    requestSent,
    submissionHeight,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'id': id,
      'connection_id': connectionId,
      'chain_id': chainId,
      'query_type': queryType,
      'request_data': config.encodeBinary(requestData),
      'callback_module': callbackModule,
      'callback_id': callbackId,
      'callback_data': config.encodeBinary(callbackData),
      'timeout_policy': config.encodeEnum(timeoutPolicy),
      'timeout_duration': timeoutDuration?.encodeString(asNanos: true),
      'timeout_timestamp': config.encodeBigint(timeoutTimestamp),
      'request_sent': requestSent,
      'submission_height': config.encodeBigint(submissionHeight),
    };
  }

  factory Query.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Query(
      id: json.valueAsString<String?>(
        'id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      connectionId: json.valueAsString<String?>(
        'connection_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      chainId: json.valueAsString<String?>(
        'chain_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      queryType: json.valueAsString<String?>(
        'query_type',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      requestData: config.decodeBinary<List<int>?>(
        json.valueAs('request_data', normalizeKeyLookup: config.normalizeKeys),
      ),
      callbackModule: json.valueAsString<String?>(
        'callback_module',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      callbackId: json.valueAsString<String?>(
        'callback_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      callbackData: config.decodeBinary<List<int>?>(
        json.valueAs('callback_data', normalizeKeyLookup: config.normalizeKeys),
      ),
      timeoutPolicy: json.valueTo<TimeoutPolicy?, Object?>(
        key: 'timeout_policy',
        parse: (v) => TimeoutPolicy.from(v),
      ),
      timeoutDuration: json.valueTo<google_protobuf_duration.Duration?, Object>(
        key: 'timeout_duration',
        parse:
            (v) => google_protobuf_duration.Duration.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      timeoutTimestamp: json.valueAsBigInt<BigInt?>(
        'timeout_timestamp',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      requestSent: json.valueAsBool<bool?>(
        'request_sent',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      submissionHeight: json.valueAsBigInt<BigInt?>(
        'submission_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Query.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Query(
      id: decode.getString<String?>(1),
      connectionId: decode.getString<String?>(2),
      chainId: decode.getString<String?>(3),
      queryType: decode.getString<String?>(4),
      requestData: decode.getBytes<List<int>?>(5),
      callbackModule: decode.getString<String?>(13),
      callbackId: decode.getString<String?>(8),
      callbackData: decode.getBytes<List<int>?>(12),
      timeoutPolicy: decode.getEnum<TimeoutPolicy?>(15, TimeoutPolicy.values),
      timeoutDuration: decode.messageTo<google_protobuf_duration.Duration?>(
        14,
        (b) => google_protobuf_duration.Duration.deserialize(b),
      ),
      timeoutTimestamp: decode.getBigInt<BigInt?>(9),
      requestSent: decode.getBool<bool?>(11),
      submissionHeight: decode.getBigInt<BigInt?>(16),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideInterchainqueryV1Query;
}
