import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/stride/records/src/params.dart"
    as stride_records_params;
import "package:cosmos_sdk/proto_messages/stride/records/src/records.dart"
    as stride_records_records;
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;

/// QueryParamsRequest is request type for the Query/Params RPC method.
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
          path: "/StrideLabs/stride/records/params",
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
      DefaultCosmosProtoTypeUrl.strideRecordsQueryParamsRequest;
  @override
  QueryParamsResponse onQueryResponse(List<int> bytes) {
    return QueryParamsResponse.deserialize(bytes);
  }

  @override
  QueryParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryParamsResponse.fromJson(json);
  }
}

/// QueryParamsResponse is response type for the Query/Params RPC method.
class QueryParamsResponse extends CosmosProtoMessage {
  /// params holds all the parameters of this module.
  final stride_records_params.Params? params;

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
      params: json.valueTo<stride_records_params.Params?, Map<String, dynamic>>(
        key: 'params',
        parse: (v) => stride_records_params.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<stride_records_params.Params?>(
        1,
        (b) => stride_records_params.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideRecordsQueryParamsResponse;
}

class QueryGetDepositRecordRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGetDepositRecordResponse> {
  final BigInt? id;

  const QueryGetDepositRecordRequest({this.id});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/Stride-Labs/stride/records/deposit_record/{id}",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [id];

  @override
  Map<String, dynamic> toJson() {
    return {'id': id?.toString()};
  }

  factory QueryGetDepositRecordRequest.fromJson(Map<String, dynamic> json) {
    return QueryGetDepositRecordRequest(
      id: json.valueAsBigInt<BigInt?>('id', acceptCamelCase: true),
    );
  }

  factory QueryGetDepositRecordRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetDepositRecordRequest(id: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideRecordsQueryGetDepositRecordRequest;
  @override
  QueryGetDepositRecordResponse onQueryResponse(List<int> bytes) {
    return QueryGetDepositRecordResponse.deserialize(bytes);
  }

  @override
  QueryGetDepositRecordResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryGetDepositRecordResponse.fromJson(json);
  }
}

class QueryGetDepositRecordResponse extends CosmosProtoMessage {
  final stride_records_records.DepositRecord? depositRecord;

  const QueryGetDepositRecordResponse({this.depositRecord});

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
  List<Object?> get protoValues => [depositRecord];

  @override
  Map<String, dynamic> toJson() {
    return {'deposit_record': depositRecord?.toJson()};
  }

  factory QueryGetDepositRecordResponse.fromJson(Map<String, dynamic> json) {
    return QueryGetDepositRecordResponse(
      depositRecord: json
          .valueTo<stride_records_records.DepositRecord?, Map<String, dynamic>>(
            key: 'deposit_record',
            parse: (v) => stride_records_records.DepositRecord.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryGetDepositRecordResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetDepositRecordResponse(
      depositRecord: decode.messageTo<stride_records_records.DepositRecord?>(
        1,
        (b) => stride_records_records.DepositRecord.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideRecordsQueryGetDepositRecordResponse;
}

class QueryAllDepositRecordRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAllDepositRecordResponse> {
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryAllDepositRecordRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/Stride-Labs/stride/records/deposit_record",
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

  factory QueryAllDepositRecordRequest.fromJson(Map<String, dynamic> json) {
    return QueryAllDepositRecordRequest(
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

  factory QueryAllDepositRecordRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllDepositRecordRequest(
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
      DefaultCosmosProtoTypeUrl.strideRecordsQueryAllDepositRecordRequest;
  @override
  QueryAllDepositRecordResponse onQueryResponse(List<int> bytes) {
    return QueryAllDepositRecordResponse.deserialize(bytes);
  }

  @override
  QueryAllDepositRecordResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAllDepositRecordResponse.fromJson(json);
  }
}

class QueryAllDepositRecordResponse extends CosmosProtoMessage {
  final List<stride_records_records.DepositRecord> depositRecord;

  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryAllDepositRecordResponse({
    this.depositRecord = const [],
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
          options: const [],
        ),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [depositRecord, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'deposit_record': depositRecord.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryAllDepositRecordResponse.fromJson(Map<String, dynamic> json) {
    return QueryAllDepositRecordResponse(
      depositRecord:
          (json.valueEnsureAsList<dynamic>(
                'deposit_record',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  stride_records_records.DepositRecord,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => stride_records_records.DepositRecord.fromJson(v),
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

  factory QueryAllDepositRecordResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllDepositRecordResponse(
      depositRecord:
          decode
              .getListOfBytes(1)
              .map((b) => stride_records_records.DepositRecord.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.strideRecordsQueryAllDepositRecordResponse;
}

class QueryDepositRecordByHostRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDepositRecordByHostResponse> {
  final String? hostZoneId;

  const QueryDepositRecordByHostRequest({this.hostZoneId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/Stride-Labs/stride/records/deposit_record_by_host_zone/{host_zone_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [hostZoneId];

  @override
  Map<String, dynamic> toJson() {
    return {'host_zone_id': hostZoneId};
  }

  factory QueryDepositRecordByHostRequest.fromJson(Map<String, dynamic> json) {
    return QueryDepositRecordByHostRequest(
      hostZoneId: json.valueAsString<String?>(
        'host_zone_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryDepositRecordByHostRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDepositRecordByHostRequest(
      hostZoneId: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideRecordsQueryDepositRecordByHostRequest;
  @override
  QueryDepositRecordByHostResponse onQueryResponse(List<int> bytes) {
    return QueryDepositRecordByHostResponse.deserialize(bytes);
  }

  @override
  QueryDepositRecordByHostResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryDepositRecordByHostResponse.fromJson(json);
  }
}

class QueryDepositRecordByHostResponse extends CosmosProtoMessage {
  final List<stride_records_records.DepositRecord> depositRecord;

  const QueryDepositRecordByHostResponse({this.depositRecord = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [depositRecord];

  @override
  Map<String, dynamic> toJson() {
    return {'deposit_record': depositRecord.map((e) => e.toJson()).toList()};
  }

  factory QueryDepositRecordByHostResponse.fromJson(Map<String, dynamic> json) {
    return QueryDepositRecordByHostResponse(
      depositRecord:
          (json.valueEnsureAsList<dynamic>(
                'deposit_record',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  stride_records_records.DepositRecord,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => stride_records_records.DepositRecord.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryDepositRecordByHostResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDepositRecordByHostResponse(
      depositRecord:
          decode
              .getListOfBytes(1)
              .map((b) => stride_records_records.DepositRecord.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideRecordsQueryDepositRecordByHostResponse;
}

class QueryGetUserRedemptionRecordRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGetUserRedemptionRecordResponse> {
  final String? id;

  const QueryGetUserRedemptionRecordRequest({this.id});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/Stride-Labs/stride/records/user_redemption_record/{id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [id];

  @override
  Map<String, dynamic> toJson() {
    return {'id': id};
  }

  factory QueryGetUserRedemptionRecordRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetUserRedemptionRecordRequest(
      id: json.valueAsString<String?>('id', acceptCamelCase: true),
    );
  }

  factory QueryGetUserRedemptionRecordRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetUserRedemptionRecordRequest(
      id: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .strideRecordsQueryGetUserRedemptionRecordRequest;
  @override
  QueryGetUserRedemptionRecordResponse onQueryResponse(List<int> bytes) {
    return QueryGetUserRedemptionRecordResponse.deserialize(bytes);
  }

  @override
  QueryGetUserRedemptionRecordResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetUserRedemptionRecordResponse.fromJson(json);
  }
}

class QueryGetUserRedemptionRecordResponse extends CosmosProtoMessage {
  final stride_records_records.UserRedemptionRecord? userRedemptionRecord;

  const QueryGetUserRedemptionRecordResponse({this.userRedemptionRecord});

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
  List<Object?> get protoValues => [userRedemptionRecord];

  @override
  Map<String, dynamic> toJson() {
    return {'user_redemption_record': userRedemptionRecord?.toJson()};
  }

  factory QueryGetUserRedemptionRecordResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetUserRedemptionRecordResponse(
      userRedemptionRecord: json.valueTo<
        stride_records_records.UserRedemptionRecord?,
        Map<String, dynamic>
      >(
        key: 'user_redemption_record',
        parse: (v) => stride_records_records.UserRedemptionRecord.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryGetUserRedemptionRecordResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetUserRedemptionRecordResponse(
      userRedemptionRecord: decode
          .messageTo<stride_records_records.UserRedemptionRecord?>(
            1,
            (b) => stride_records_records.UserRedemptionRecord.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .strideRecordsQueryGetUserRedemptionRecordResponse;
}

class QueryAllUserRedemptionRecordRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAllUserRedemptionRecordResponse> {
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryAllUserRedemptionRecordRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/Stride-Labs/stride/records/user_redemption_record",
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

  factory QueryAllUserRedemptionRecordRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryAllUserRedemptionRecordRequest(
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

  factory QueryAllUserRedemptionRecordRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllUserRedemptionRecordRequest(
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
      DefaultCosmosProtoTypeUrl
          .strideRecordsQueryAllUserRedemptionRecordRequest;
  @override
  QueryAllUserRedemptionRecordResponse onQueryResponse(List<int> bytes) {
    return QueryAllUserRedemptionRecordResponse.deserialize(bytes);
  }

  @override
  QueryAllUserRedemptionRecordResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryAllUserRedemptionRecordResponse.fromJson(json);
  }
}

class QueryAllUserRedemptionRecordResponse extends CosmosProtoMessage {
  final List<stride_records_records.UserRedemptionRecord> userRedemptionRecord;

  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryAllUserRedemptionRecordResponse({
    this.userRedemptionRecord = const [],
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
          options: const [],
        ),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [userRedemptionRecord, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'user_redemption_record':
          userRedemptionRecord.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryAllUserRedemptionRecordResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryAllUserRedemptionRecordResponse(
      userRedemptionRecord:
          (json.valueEnsureAsList<dynamic>(
                'user_redemption_record',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  stride_records_records.UserRedemptionRecord,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => stride_records_records
                          .UserRedemptionRecord.fromJson(v),
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

  factory QueryAllUserRedemptionRecordResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllUserRedemptionRecordResponse(
      userRedemptionRecord:
          decode
              .getListOfBytes(1)
              .map(
                (b) =>
                    stride_records_records.UserRedemptionRecord.deserialize(b),
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
      DefaultCosmosProtoTypeUrl
          .strideRecordsQueryAllUserRedemptionRecordResponse;
}

/// Query UserRedemptionRecords by chainId / userId pair
class QueryAllUserRedemptionRecordForUserRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAllUserRedemptionRecordForUserResponse> {
  final String? chainId;

  final BigInt? day;

  final String? address;

  final BigInt? limit;

  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryAllUserRedemptionRecordForUserRequest({
    this.chainId,
    this.day,
    this.address,
    this.limit,
    this.pagination,
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
          path:
              "/Stride-Labs/stride/records/user_redemption_record_for_user/{chain_id}/{day}/{address}/{limit}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.uint64(4),
        ProtoFieldConfig.message(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [chainId, day, address, limit, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'chain_id': chainId,
      'day': day?.toString(),
      'address': address,
      'limit': limit?.toString(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryAllUserRedemptionRecordForUserRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryAllUserRedemptionRecordForUserRequest(
      chainId: json.valueAsString<String?>('chain_id', acceptCamelCase: true),
      day: json.valueAsBigInt<BigInt?>('day', acceptCamelCase: true),
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      limit: json.valueAsBigInt<BigInt?>('limit', acceptCamelCase: true),
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

  factory QueryAllUserRedemptionRecordForUserRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllUserRedemptionRecordForUserRequest(
      chainId: decode.getString<String?>(1),
      day: decode.getBigInt<BigInt?>(2),
      address: decode.getString<String?>(3),
      limit: decode.getBigInt<BigInt?>(4),
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            5,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .strideRecordsQueryAllUserRedemptionRecordForUserRequest;
  @override
  QueryAllUserRedemptionRecordForUserResponse onQueryResponse(List<int> bytes) {
    return QueryAllUserRedemptionRecordForUserResponse.deserialize(bytes);
  }

  @override
  QueryAllUserRedemptionRecordForUserResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryAllUserRedemptionRecordForUserResponse.fromJson(json);
  }
}

class QueryAllUserRedemptionRecordForUserResponse extends CosmosProtoMessage {
  final List<stride_records_records.UserRedemptionRecord> userRedemptionRecord;

  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryAllUserRedemptionRecordForUserResponse({
    this.userRedemptionRecord = const [],
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
          options: const [],
        ),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [userRedemptionRecord, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'user_redemption_record':
          userRedemptionRecord.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryAllUserRedemptionRecordForUserResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryAllUserRedemptionRecordForUserResponse(
      userRedemptionRecord:
          (json.valueEnsureAsList<dynamic>(
                'user_redemption_record',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  stride_records_records.UserRedemptionRecord,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => stride_records_records
                          .UserRedemptionRecord.fromJson(v),
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

  factory QueryAllUserRedemptionRecordForUserResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllUserRedemptionRecordForUserResponse(
      userRedemptionRecord:
          decode
              .getListOfBytes(1)
              .map(
                (b) =>
                    stride_records_records.UserRedemptionRecord.deserialize(b),
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
      DefaultCosmosProtoTypeUrl
          .strideRecordsQueryAllUserRedemptionRecordForUserResponse;
}

class QueryGetEpochUnbondingRecordRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGetEpochUnbondingRecordResponse> {
  final BigInt? epochNumber;

  const QueryGetEpochUnbondingRecordRequest({this.epochNumber});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/Stride-Labs/stride/records/epoch_unbonding_record/{epoch_number}",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [epochNumber];

  @override
  Map<String, dynamic> toJson() {
    return {'epoch_number': epochNumber?.toString()};
  }

  factory QueryGetEpochUnbondingRecordRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetEpochUnbondingRecordRequest(
      epochNumber: json.valueAsBigInt<BigInt?>(
        'epoch_number',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryGetEpochUnbondingRecordRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetEpochUnbondingRecordRequest(
      epochNumber: decode.getBigInt<BigInt?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .strideRecordsQueryGetEpochUnbondingRecordRequest;
  @override
  QueryGetEpochUnbondingRecordResponse onQueryResponse(List<int> bytes) {
    return QueryGetEpochUnbondingRecordResponse.deserialize(bytes);
  }

  @override
  QueryGetEpochUnbondingRecordResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetEpochUnbondingRecordResponse.fromJson(json);
  }
}

class QueryGetEpochUnbondingRecordResponse extends CosmosProtoMessage {
  final stride_records_records.EpochUnbondingRecord? epochUnbondingRecord;

  const QueryGetEpochUnbondingRecordResponse({this.epochUnbondingRecord});

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
  List<Object?> get protoValues => [epochUnbondingRecord];

  @override
  Map<String, dynamic> toJson() {
    return {'epoch_unbonding_record': epochUnbondingRecord?.toJson()};
  }

  factory QueryGetEpochUnbondingRecordResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetEpochUnbondingRecordResponse(
      epochUnbondingRecord: json.valueTo<
        stride_records_records.EpochUnbondingRecord?,
        Map<String, dynamic>
      >(
        key: 'epoch_unbonding_record',
        parse: (v) => stride_records_records.EpochUnbondingRecord.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryGetEpochUnbondingRecordResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetEpochUnbondingRecordResponse(
      epochUnbondingRecord: decode
          .messageTo<stride_records_records.EpochUnbondingRecord?>(
            1,
            (b) => stride_records_records.EpochUnbondingRecord.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .strideRecordsQueryGetEpochUnbondingRecordResponse;
}

class QueryAllEpochUnbondingRecordRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAllEpochUnbondingRecordResponse> {
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryAllEpochUnbondingRecordRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/Stride-Labs/stride/records/epoch_unbonding_record",
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

  factory QueryAllEpochUnbondingRecordRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryAllEpochUnbondingRecordRequest(
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

  factory QueryAllEpochUnbondingRecordRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllEpochUnbondingRecordRequest(
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
      DefaultCosmosProtoTypeUrl
          .strideRecordsQueryAllEpochUnbondingRecordRequest;
  @override
  QueryAllEpochUnbondingRecordResponse onQueryResponse(List<int> bytes) {
    return QueryAllEpochUnbondingRecordResponse.deserialize(bytes);
  }

  @override
  QueryAllEpochUnbondingRecordResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryAllEpochUnbondingRecordResponse.fromJson(json);
  }
}

class QueryAllEpochUnbondingRecordResponse extends CosmosProtoMessage {
  final List<stride_records_records.EpochUnbondingRecord> epochUnbondingRecord;

  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryAllEpochUnbondingRecordResponse({
    this.epochUnbondingRecord = const [],
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
          options: const [],
        ),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [epochUnbondingRecord, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'epoch_unbonding_record':
          epochUnbondingRecord.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryAllEpochUnbondingRecordResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryAllEpochUnbondingRecordResponse(
      epochUnbondingRecord:
          (json.valueEnsureAsList<dynamic>(
                'epoch_unbonding_record',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  stride_records_records.EpochUnbondingRecord,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => stride_records_records
                          .EpochUnbondingRecord.fromJson(v),
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

  factory QueryAllEpochUnbondingRecordResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllEpochUnbondingRecordResponse(
      epochUnbondingRecord:
          decode
              .getListOfBytes(1)
              .map(
                (b) =>
                    stride_records_records.EpochUnbondingRecord.deserialize(b),
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
      DefaultCosmosProtoTypeUrl
          .strideRecordsQueryAllEpochUnbondingRecordResponse;
}

class QueryLSMDepositRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryLSMDepositResponse> {
  final String? chainId;

  final String? denom;

  const QueryLSMDepositRequest({this.chainId, this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/Stride-Labs/stride/stakeibc/lsm_deposit/{chain_id}/{denom}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [chainId, denom];

  @override
  Map<String, dynamic> toJson() {
    return {'chain_id': chainId, 'denom': denom};
  }

  factory QueryLSMDepositRequest.fromJson(Map<String, dynamic> json) {
    return QueryLSMDepositRequest(
      chainId: json.valueAsString<String?>('chain_id', acceptCamelCase: true),
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory QueryLSMDepositRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryLSMDepositRequest(
      chainId: decode.getString<String?>(1),
      denom: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideRecordsQueryLSMDepositRequest;
  @override
  QueryLSMDepositResponse onQueryResponse(List<int> bytes) {
    return QueryLSMDepositResponse.deserialize(bytes);
  }

  @override
  QueryLSMDepositResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryLSMDepositResponse.fromJson(json);
  }
}

class QueryLSMDepositResponse extends CosmosProtoMessage {
  final stride_records_records.LSMTokenDeposit? deposit;

  const QueryLSMDepositResponse({this.deposit});

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
  List<Object?> get protoValues => [deposit];

  @override
  Map<String, dynamic> toJson() {
    return {'deposit': deposit?.toJson()};
  }

  factory QueryLSMDepositResponse.fromJson(Map<String, dynamic> json) {
    return QueryLSMDepositResponse(
      deposit: json.valueTo<
        stride_records_records.LSMTokenDeposit?,
        Map<String, dynamic>
      >(
        key: 'deposit',
        parse: (v) => stride_records_records.LSMTokenDeposit.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryLSMDepositResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryLSMDepositResponse(
      deposit: decode.messageTo<stride_records_records.LSMTokenDeposit?>(
        1,
        (b) => stride_records_records.LSMTokenDeposit.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideRecordsQueryLSMDepositResponse;
}

class QueryLSMDepositsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryLSMDepositsResponse> {
  final String? chainId;

  final String? validatorAddress;

  final String? status;

  const QueryLSMDepositsRequest({
    this.chainId,
    this.validatorAddress,
    this.status,
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
          path: "/Stride-Labs/stride/stakeibc/lsm_deposits",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [chainId, validatorAddress, status];

  @override
  Map<String, dynamic> toJson() {
    return {
      'chain_id': chainId,
      'validator_address': validatorAddress,
      'status': status,
    };
  }

  factory QueryLSMDepositsRequest.fromJson(Map<String, dynamic> json) {
    return QueryLSMDepositsRequest(
      chainId: json.valueAsString<String?>('chain_id', acceptCamelCase: true),
      validatorAddress: json.valueAsString<String?>(
        'validator_address',
        acceptCamelCase: true,
      ),
      status: json.valueAsString<String?>('status', acceptCamelCase: true),
    );
  }

  factory QueryLSMDepositsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryLSMDepositsRequest(
      chainId: decode.getString<String?>(1),
      validatorAddress: decode.getString<String?>(2),
      status: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideRecordsQueryLSMDepositsRequest;
  @override
  QueryLSMDepositsResponse onQueryResponse(List<int> bytes) {
    return QueryLSMDepositsResponse.deserialize(bytes);
  }

  @override
  QueryLSMDepositsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryLSMDepositsResponse.fromJson(json);
  }
}

class QueryLSMDepositsResponse extends CosmosProtoMessage {
  final List<stride_records_records.LSMTokenDeposit> deposits;

  const QueryLSMDepositsResponse({this.deposits = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [deposits];

  @override
  Map<String, dynamic> toJson() {
    return {'deposits': deposits.map((e) => e.toJson()).toList()};
  }

  factory QueryLSMDepositsResponse.fromJson(Map<String, dynamic> json) {
    return QueryLSMDepositsResponse(
      deposits:
          (json.valueEnsureAsList<dynamic>('deposits', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  stride_records_records.LSMTokenDeposit,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => stride_records_records.LSMTokenDeposit.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryLSMDepositsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryLSMDepositsResponse(
      deposits:
          decode
              .getListOfBytes(1)
              .map((b) => stride_records_records.LSMTokenDeposit.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideRecordsQueryLSMDepositsResponse;
}
