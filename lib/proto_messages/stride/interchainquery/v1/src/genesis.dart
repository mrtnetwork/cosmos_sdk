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
    return TimeoutPolicy.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(name: "TimeoutPolicy", value: value),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static TimeoutPolicy from(Object? value) {
    return TimeoutPolicy.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(name: "TimeoutPolicy", value: value),
    );
  }
}

class Query extends CosmosProtoMessage {
  final String? id;

  final String? connectionId;

  final String? chainId;

  final String? queryType;

  final List<int>? requestData;

  final String? callbackModule;

  final String? callbackId;

  final List<int>? callbackData;

  final TimeoutPolicy? timeoutPolicy;

  final google_protobuf_duration.Duration? timeoutDuration;

  final BigInt? timeoutTimestamp;

  final bool? requestSent;

  final BigInt? submissionHeight;

  const Query({
    this.id,
    this.connectionId,
    this.chainId,
    this.queryType,
    this.requestData,
    this.callbackModule,
    this.callbackId,
    this.callbackData,
    this.timeoutPolicy,
    this.timeoutDuration,
    this.timeoutTimestamp,
    this.requestSent,
    this.submissionHeight,
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
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'connection_id': connectionId,
      'chain_id': chainId,
      'query_type': queryType,
      'request_data': switch (requestData) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'callback_module': callbackModule,
      'callback_id': callbackId,
      'callback_data': switch (callbackData) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'timeout_policy': timeoutPolicy?.protoName,
      'timeout_duration': timeoutDuration?.encodeString(asNanos: true),
      'timeout_timestamp': timeoutTimestamp?.toString(),
      'request_sent': requestSent,
      'submission_height': submissionHeight?.toString(),
    };
  }

  factory Query.fromJson(Map<String, dynamic> json) {
    return Query(
      id: json.valueAsString<String?>('id', acceptCamelCase: true),
      connectionId: json.valueAsString<String?>(
        'connection_id',
        acceptCamelCase: true,
      ),
      chainId: json.valueAsString<String?>('chain_id', acceptCamelCase: true),
      queryType: json.valueAsString<String?>(
        'query_type',
        acceptCamelCase: true,
      ),
      requestData: json.valueAsBytes<List<int>?>(
        'request_data',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      callbackModule: json.valueAsString<String?>(
        'callback_module',
        acceptCamelCase: true,
      ),
      callbackId: json.valueAsString<String?>(
        'callback_id',
        acceptCamelCase: true,
      ),
      callbackData: json.valueAsBytes<List<int>?>(
        'callback_data',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      timeoutPolicy: json.valueTo<TimeoutPolicy?, Object?>(
        key: 'timeout_policy',
        parse: (v) => TimeoutPolicy.from(v),
      ),
      timeoutDuration: json.valueTo<google_protobuf_duration.Duration?, String>(
        key: 'timeout_duration',
        parse: (v) => google_protobuf_duration.Duration.fromString(v),
        acceptCamelCase: true,
      ),
      timeoutTimestamp: json.valueAsBigInt<BigInt?>(
        'timeout_timestamp',
        acceptCamelCase: true,
      ),
      requestSent: json.valueAsBool<bool?>(
        'request_sent',
        acceptCamelCase: true,
      ),
      submissionHeight: json.valueAsBigInt<BigInt?>(
        'submission_height',
        acceptCamelCase: true,
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
