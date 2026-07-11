import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/secret/cron/src/params.dart"
    as secret_cron_params;
import "package:cosmos_sdk/proto_messages/secret/cron/src/schedule.dart"
    as secret_cron_schedule;
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;

/// this line is used by starport scaffolding # 2
/// The request type for the Query/Params RPC method.
class QueryParamsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryParamsResponse> {
  const QueryParamsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/secret/cron/params",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryParamsRequest.fromJson(Map<String, dynamic> json) {
    return QueryParamsRequest();
  }

  factory QueryParamsRequest.deserialize(List<int> bytes) {
    return QueryParamsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretCronQueryParamsRequest;
  @override
  QueryParamsResponse onQueryResponse(List<int> bytes) {
    return QueryParamsResponse.deserialize(bytes);
  }

  @override
  QueryParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryParamsResponse.fromJson(json);
  }
}

/// The response type for the Query/Params RPC method.
class QueryParamsResponse extends CosmosProtoMessage {
  /// params holds all the parameters of this module.
  final secret_cron_params.Params? params;

  const QueryParamsResponse({this.params});

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
  List<Object?> get protoValues => [params];

  @override
  Map<String, dynamic> toJson() {
    return {'params': params?.toJson()};
  }

  factory QueryParamsResponse.fromJson(Map<String, dynamic> json) {
    return QueryParamsResponse(
      params: json.valueTo<secret_cron_params.Params?, Map<String, dynamic>>(
        key: 'params',
        parse: (v) => secret_cron_params.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<secret_cron_params.Params?>(
        1,
        (b) => secret_cron_params.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretCronQueryParamsResponse;
}

/// The request type for the Query/Schedule RPC method.
class QueryGetScheduleRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGetScheduleResponse> {
  final String? name;

  const QueryGetScheduleRequest({this.name});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/secret/cron/schedule/{name}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [name];

  @override
  Map<String, dynamic> toJson() {
    return {'name': name};
  }

  factory QueryGetScheduleRequest.fromJson(Map<String, dynamic> json) {
    return QueryGetScheduleRequest(
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
    );
  }

  factory QueryGetScheduleRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetScheduleRequest(name: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretCronQueryGetScheduleRequest;
  @override
  QueryGetScheduleResponse onQueryResponse(List<int> bytes) {
    return QueryGetScheduleResponse.deserialize(bytes);
  }

  @override
  QueryGetScheduleResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryGetScheduleResponse.fromJson(json);
  }
}

/// The response type for the Query/Params RPC method.
class QueryGetScheduleResponse extends CosmosProtoMessage {
  final secret_cron_schedule.Schedule? schedule;

  const QueryGetScheduleResponse({this.schedule});

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
  Map<String, dynamic> toJson() {
    return {'schedule': schedule?.toJson()};
  }

  factory QueryGetScheduleResponse.fromJson(Map<String, dynamic> json) {
    return QueryGetScheduleResponse(
      schedule: json
          .valueTo<secret_cron_schedule.Schedule?, Map<String, dynamic>>(
            key: 'schedule',
            parse: (v) => secret_cron_schedule.Schedule.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryGetScheduleResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetScheduleResponse(
      schedule: decode.messageTo<secret_cron_schedule.Schedule?>(
        1,
        (b) => secret_cron_schedule.Schedule.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretCronQueryGetScheduleResponse;
}

/// The request type for the Query/Schedules RPC method.
class QuerySchedulesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySchedulesResponse> {
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QuerySchedulesRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/secret/cron/schedule",
        ),
      ],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [pagination];

  @override
  Map<String, dynamic> toJson() {
    return {'pagination': pagination?.toJson()};
  }

  factory QuerySchedulesRequest.fromJson(Map<String, dynamic> json) {
    return QuerySchedulesRequest(
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageRequest?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) => cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(v),
        acceptCamelCase: true,
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
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretCronQuerySchedulesRequest;
  @override
  QuerySchedulesResponse onQueryResponse(List<int> bytes) {
    return QuerySchedulesResponse.deserialize(bytes);
  }

  @override
  QuerySchedulesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QuerySchedulesResponse.fromJson(json);
  }
}

/// The response type for the Query/Params RPC method.
class QuerySchedulesResponse extends CosmosProtoMessage {
  final List<secret_cron_schedule.Schedule> schedules;

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
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [schedules, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'schedules': schedules.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QuerySchedulesResponse.fromJson(Map<String, dynamic> json) {
    return QuerySchedulesResponse(
      schedules:
          (json.valueEnsureAsList<dynamic>('schedules', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  secret_cron_schedule.Schedule,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => secret_cron_schedule.Schedule.fromJson(v),
                ),
              )
              .toList(),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) =>
                cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QuerySchedulesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySchedulesResponse(
      schedules:
          decode
              .getListOfBytes(1)
              .map((b) => secret_cron_schedule.Schedule.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.secretCronQuerySchedulesResponse;
}
