import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/thorchain/scheduler/v1/src/scheduler.dart"
    as thorchain_scheduler_v1_scheduler;
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;

class QueryScheduleRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryScheduleResponse> {
  final BigInt? height;

  const QueryScheduleRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/schedule/{height}",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [height];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'height': config.encodeBigint(height)};
  }

  factory QueryScheduleRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryScheduleRequest(
      height: json.valueAsBigInt<BigInt?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryScheduleRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryScheduleRequest(height: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.thorchainSchedulerV1QueryScheduleRequest;
  @override
  QueryScheduleResponse onQueryResponse(List<int> bytes) {
    return QueryScheduleResponse.deserialize(bytes);
  }

  @override
  QueryScheduleResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryScheduleResponse.fromJson(json);
  }
}

class QueryScheduleResponse extends CosmosProtoMessage {
  final thorchain_scheduler_v1_scheduler.Schedule? schedule;

  const QueryScheduleResponse({this.schedule});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [schedule];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'schedule': config.encodeMessage(schedule)};
  }

  factory QueryScheduleResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryScheduleResponse(
      schedule: json
          .valueTo<thorchain_scheduler_v1_scheduler.Schedule?, Object>(
            key: 'schedule',
            parse:
                (v) => thorchain_scheduler_v1_scheduler.Schedule.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory QueryScheduleResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryScheduleResponse(
      schedule: decode.messageTo<thorchain_scheduler_v1_scheduler.Schedule?>(
        1,
        (b) => thorchain_scheduler_v1_scheduler.Schedule.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.thorchainSchedulerV1QueryScheduleResponse;
}

class QuerySchedulesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySchedulesResponse> {
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  final String? sender;

  const QuerySchedulesRequest({this.pagination, this.sender});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/schedules",
        ),
      ],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [pagination, sender];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'pagination': config.encodeMessage(pagination), 'sender': sender};
  }

  factory QuerySchedulesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySchedulesRequest(
      pagination: json
          .valueTo<cosmos_base_query_v1beta1_pagination.PageRequest?, Object>(
            key: 'pagination',
            parse:
                (v) =>
                    cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      sender: json.valueAsString<String?>(
        'sender',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QuerySchedulesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySchedulesRequest(
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            1,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
      sender: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.thorchainSchedulerV1QuerySchedulesRequest;
  @override
  QuerySchedulesResponse onQueryResponse(List<int> bytes) {
    return QuerySchedulesResponse.deserialize(bytes);
  }

  @override
  QuerySchedulesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QuerySchedulesResponse.fromJson(json);
  }
}

class QuerySchedulesResponse extends CosmosProtoMessage {
  final List<thorchain_scheduler_v1_scheduler.Schedule> schedules;

  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QuerySchedulesResponse({this.schedules = const [], this.pagination});

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
          options: const [],
        ),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [schedules, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'schedules': schedules.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QuerySchedulesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySchedulesResponse(
      schedules:
          (json.valueEnsureAsList<dynamic>(
                'schedules',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  thorchain_scheduler_v1_scheduler.Schedule,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => thorchain_scheduler_v1_scheduler.Schedule.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      pagination: json
          .valueTo<cosmos_base_query_v1beta1_pagination.PageResponse?, Object>(
            key: 'pagination',
            parse:
                (v) =>
                    cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory QuerySchedulesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySchedulesResponse(
      schedules:
          decode
              .getListOfBytes(1)
              .map(
                (b) => thorchain_scheduler_v1_scheduler.Schedule.deserialize(b),
              )
              .toList(),
      pagination: decode.messageTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?
      >(
        2,
        (b) => cosmos_base_query_v1beta1_pagination.PageResponse.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.thorchainSchedulerV1QuerySchedulesResponse;
}
