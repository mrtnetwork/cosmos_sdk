import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/stride/staketia/src/staketia.dart"
    as stride_staketia_staketia;
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;

/// Host Zone
class QueryHostZoneRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryHostZoneResponse> {
  const QueryHostZoneRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/Stride-Labs/stride/staketia/host_zone",
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

  factory QueryHostZoneRequest.fromJson(Map<String, dynamic> json) {
    return QueryHostZoneRequest();
  }

  factory QueryHostZoneRequest.deserialize(List<int> bytes) {
    return QueryHostZoneRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStaketiaQueryHostZoneRequest;
  @override
  QueryHostZoneResponse onQueryResponse(List<int> bytes) {
    return QueryHostZoneResponse.deserialize(bytes);
  }

  @override
  QueryHostZoneResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryHostZoneResponse.fromJson(json);
  }
}

class QueryHostZoneResponse extends CosmosProtoMessage {
  final stride_staketia_staketia.HostZone? hostZone;

  const QueryHostZoneResponse({this.hostZone});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [hostZone];

  @override
  Map<String, dynamic> toJson() {
    return {'host_zone': hostZone?.toJson()};
  }

  factory QueryHostZoneResponse.fromJson(Map<String, dynamic> json) {
    return QueryHostZoneResponse(
      hostZone: json
          .valueTo<stride_staketia_staketia.HostZone?, Map<String, dynamic>>(
            key: 'host_zone',
            parse: (v) => stride_staketia_staketia.HostZone.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryHostZoneResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryHostZoneResponse(
      hostZone: decode.messageTo<stride_staketia_staketia.HostZone?>(
        1,
        (b) => stride_staketia_staketia.HostZone.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStaketiaQueryHostZoneResponse;
}

/// All Delegation Records
class QueryDelegationRecordsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDelegationRecordsResponse> {
  final bool? includeArchived;

  const QueryDelegationRecordsRequest({this.includeArchived});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/Stride-Labs/stride/staketia/delegation_records",
        ),
      ],
      fields: [ProtoFieldConfig.bool(1)],
    );
  }

  @override
  List<Object?> get protoValues => [includeArchived];

  @override
  Map<String, dynamic> toJson() {
    return {'include_archived': includeArchived};
  }

  factory QueryDelegationRecordsRequest.fromJson(Map<String, dynamic> json) {
    return QueryDelegationRecordsRequest(
      includeArchived: json.valueAsBool<bool?>(
        'include_archived',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryDelegationRecordsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDelegationRecordsRequest(
      includeArchived: decode.getBool<bool?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStaketiaQueryDelegationRecordsRequest;
  @override
  QueryDelegationRecordsResponse onQueryResponse(List<int> bytes) {
    return QueryDelegationRecordsResponse.deserialize(bytes);
  }

  @override
  QueryDelegationRecordsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryDelegationRecordsResponse.fromJson(json);
  }
}

class QueryDelegationRecordsResponse extends CosmosProtoMessage {
  final List<stride_staketia_staketia.DelegationRecord> delegationRecords;

  const QueryDelegationRecordsResponse({this.delegationRecords = const []});

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
  List<Object?> get protoValues => [delegationRecords];

  @override
  Map<String, dynamic> toJson() {
    return {
      'delegation_records': delegationRecords.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryDelegationRecordsResponse.fromJson(Map<String, dynamic> json) {
    return QueryDelegationRecordsResponse(
      delegationRecords:
          (json.valueEnsureAsList<dynamic>(
                'delegation_records',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  stride_staketia_staketia.DelegationRecord,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) =>
                          stride_staketia_staketia.DelegationRecord.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryDelegationRecordsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDelegationRecordsResponse(
      delegationRecords:
          decode
              .getListOfBytes(1)
              .map(
                (b) => stride_staketia_staketia.DelegationRecord.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStaketiaQueryDelegationRecordsResponse;
}

/// All Unbonding Records
class QueryUnbondingRecordsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryUnbondingRecordsResponse> {
  final bool? includeArchived;

  const QueryUnbondingRecordsRequest({this.includeArchived});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/Stride-Labs/stride/staketia/unbonding_records",
        ),
      ],
      fields: [ProtoFieldConfig.bool(1)],
    );
  }

  @override
  List<Object?> get protoValues => [includeArchived];

  @override
  Map<String, dynamic> toJson() {
    return {'include_archived': includeArchived};
  }

  factory QueryUnbondingRecordsRequest.fromJson(Map<String, dynamic> json) {
    return QueryUnbondingRecordsRequest(
      includeArchived: json.valueAsBool<bool?>(
        'include_archived',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryUnbondingRecordsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryUnbondingRecordsRequest(
      includeArchived: decode.getBool<bool?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStaketiaQueryUnbondingRecordsRequest;
  @override
  QueryUnbondingRecordsResponse onQueryResponse(List<int> bytes) {
    return QueryUnbondingRecordsResponse.deserialize(bytes);
  }

  @override
  QueryUnbondingRecordsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryUnbondingRecordsResponse.fromJson(json);
  }
}

class QueryUnbondingRecordsResponse extends CosmosProtoMessage {
  final List<stride_staketia_staketia.UnbondingRecord> unbondingRecords;

  const QueryUnbondingRecordsResponse({this.unbondingRecords = const []});

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
  List<Object?> get protoValues => [unbondingRecords];

  @override
  Map<String, dynamic> toJson() {
    return {
      'unbonding_records': unbondingRecords.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryUnbondingRecordsResponse.fromJson(Map<String, dynamic> json) {
    return QueryUnbondingRecordsResponse(
      unbondingRecords:
          (json.valueEnsureAsList<dynamic>(
                'unbonding_records',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  stride_staketia_staketia.UnbondingRecord,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) =>
                          stride_staketia_staketia.UnbondingRecord.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryUnbondingRecordsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryUnbondingRecordsResponse(
      unbondingRecords:
          decode
              .getListOfBytes(1)
              .map(
                (b) => stride_staketia_staketia.UnbondingRecord.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStaketiaQueryUnbondingRecordsResponse;
}

/// Single Redemption Record
class QueryRedemptionRecordRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryRedemptionRecordResponse> {
  final BigInt? unbondingRecordId;

  final String? address;

  const QueryRedemptionRecordRequest({this.unbondingRecordId, this.address});

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
              "/Stride-Labs/stride/staketia/redemption_record/{unbonding_record_id}/{address}",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [unbondingRecordId, address];

  @override
  Map<String, dynamic> toJson() {
    return {
      'unbonding_record_id': unbondingRecordId?.toString(),
      'address': address,
    };
  }

  factory QueryRedemptionRecordRequest.fromJson(Map<String, dynamic> json) {
    return QueryRedemptionRecordRequest(
      unbondingRecordId: json.valueAsBigInt<BigInt?>(
        'unbonding_record_id',
        acceptCamelCase: true,
      ),
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
    );
  }

  factory QueryRedemptionRecordRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRedemptionRecordRequest(
      unbondingRecordId: decode.getBigInt<BigInt?>(1),
      address: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStaketiaQueryRedemptionRecordRequest;
  @override
  QueryRedemptionRecordResponse onQueryResponse(List<int> bytes) {
    return QueryRedemptionRecordResponse.deserialize(bytes);
  }

  @override
  QueryRedemptionRecordResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryRedemptionRecordResponse.fromJson(json);
  }
}

class QueryRedemptionRecordResponse extends CosmosProtoMessage {
  final RedemptionRecordResponse? redemptionRecordResponse;

  const QueryRedemptionRecordResponse({this.redemptionRecordResponse});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [redemptionRecordResponse];

  @override
  Map<String, dynamic> toJson() {
    return {'redemption_record_response': redemptionRecordResponse?.toJson()};
  }

  factory QueryRedemptionRecordResponse.fromJson(Map<String, dynamic> json) {
    return QueryRedemptionRecordResponse(
      redemptionRecordResponse: json
          .valueTo<RedemptionRecordResponse?, Map<String, dynamic>>(
            key: 'redemption_record_response',
            parse: (v) => RedemptionRecordResponse.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryRedemptionRecordResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRedemptionRecordResponse(
      redemptionRecordResponse: decode.messageTo<RedemptionRecordResponse?>(
        1,
        (b) => RedemptionRecordResponse.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStaketiaQueryRedemptionRecordResponse;
}

/// All Redemption Records
class QueryRedemptionRecordsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryRedemptionRecordsResponse> {
  final String? address;

  final BigInt? unbondingRecordId;

  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryRedemptionRecordsRequest({
    this.address,
    this.unbondingRecordId,
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
          path: "/Stride-Labs/stride/staketia/redemption_records",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.message(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [address, unbondingRecordId, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'unbonding_record_id': unbondingRecordId?.toString(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryRedemptionRecordsRequest.fromJson(Map<String, dynamic> json) {
    return QueryRedemptionRecordsRequest(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      unbondingRecordId: json.valueAsBigInt<BigInt?>(
        'unbonding_record_id',
        acceptCamelCase: true,
      ),
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

  factory QueryRedemptionRecordsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRedemptionRecordsRequest(
      address: decode.getString<String?>(1),
      unbondingRecordId: decode.getBigInt<BigInt?>(2),
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            3,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStaketiaQueryRedemptionRecordsRequest;
  @override
  QueryRedemptionRecordsResponse onQueryResponse(List<int> bytes) {
    return QueryRedemptionRecordsResponse.deserialize(bytes);
  }

  @override
  QueryRedemptionRecordsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryRedemptionRecordsResponse.fromJson(json);
  }
}

class QueryRedemptionRecordsResponse extends CosmosProtoMessage {
  final List<RedemptionRecordResponse> redemptionRecordResponses;

  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryRedemptionRecordsResponse({
    this.redemptionRecordResponses = const [],
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
  List<Object?> get protoValues => [redemptionRecordResponses, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'redemption_record_responses':
          redemptionRecordResponses.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryRedemptionRecordsResponse.fromJson(Map<String, dynamic> json) {
    return QueryRedemptionRecordsResponse(
      redemptionRecordResponses:
          (json.valueEnsureAsList<dynamic>(
                'redemption_record_responses',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  RedemptionRecordResponse,
                  Map<String, dynamic>
                >(value: e, parse: (v) => RedemptionRecordResponse.fromJson(v)),
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

  factory QueryRedemptionRecordsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRedemptionRecordsResponse(
      redemptionRecordResponses:
          decode
              .getListOfBytes(1)
              .map((b) => RedemptionRecordResponse.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.strideStaketiaQueryRedemptionRecordsResponse;
}

/// All Slash Records
class QuerySlashRecordsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySlashRecordsResponse> {
  const QuerySlashRecordsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/Stride-Labs/stride/staketia/slash_records",
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

  factory QuerySlashRecordsRequest.fromJson(Map<String, dynamic> json) {
    return QuerySlashRecordsRequest();
  }

  factory QuerySlashRecordsRequest.deserialize(List<int> bytes) {
    return QuerySlashRecordsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStaketiaQuerySlashRecordsRequest;
  @override
  QuerySlashRecordsResponse onQueryResponse(List<int> bytes) {
    return QuerySlashRecordsResponse.deserialize(bytes);
  }

  @override
  QuerySlashRecordsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QuerySlashRecordsResponse.fromJson(json);
  }
}

class QuerySlashRecordsResponse extends CosmosProtoMessage {
  final List<stride_staketia_staketia.SlashRecord> slashRecords;

  const QuerySlashRecordsResponse({this.slashRecords = const []});

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
  List<Object?> get protoValues => [slashRecords];

  @override
  Map<String, dynamic> toJson() {
    return {'slash_records': slashRecords.map((e) => e.toJson()).toList()};
  }

  factory QuerySlashRecordsResponse.fromJson(Map<String, dynamic> json) {
    return QuerySlashRecordsResponse(
      slashRecords:
          (json.valueEnsureAsList<dynamic>(
                'slash_records',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  stride_staketia_staketia.SlashRecord,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => stride_staketia_staketia.SlashRecord.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QuerySlashRecordsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySlashRecordsResponse(
      slashRecords:
          decode
              .getListOfBytes(1)
              .map((b) => stride_staketia_staketia.SlashRecord.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStaketiaQuerySlashRecordsResponse;
}

/// Data structure for frontend to consume
class RedemptionRecordResponse extends CosmosProtoMessage {
  /// Redemption record
  final stride_staketia_staketia.RedemptionRecord? redemptionRecord;

  /// The Unix timestamp (in seconds) at which the unbonding for the UR
  /// associated with this RR completes
  final BigInt? unbondingCompletionTimeSeconds;

  const RedemptionRecordResponse({
    this.redemptionRecord,
    this.unbondingCompletionTimeSeconds,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1), ProtoFieldConfig.uint64(2)],
    );
  }

  @override
  List<Object?> get protoValues => [
    redemptionRecord,
    unbondingCompletionTimeSeconds,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'redemption_record': redemptionRecord?.toJson(),
      'unbonding_completion_time_seconds':
          unbondingCompletionTimeSeconds?.toString(),
    };
  }

  factory RedemptionRecordResponse.fromJson(Map<String, dynamic> json) {
    return RedemptionRecordResponse(
      redemptionRecord: json.valueTo<
        stride_staketia_staketia.RedemptionRecord?,
        Map<String, dynamic>
      >(
        key: 'redemption_record',
        parse: (v) => stride_staketia_staketia.RedemptionRecord.fromJson(v),
        acceptCamelCase: true,
      ),
      unbondingCompletionTimeSeconds: json.valueAsBigInt<BigInt?>(
        'unbonding_completion_time_seconds',
        acceptCamelCase: true,
      ),
    );
  }

  factory RedemptionRecordResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RedemptionRecordResponse(
      redemptionRecord: decode
          .messageTo<stride_staketia_staketia.RedemptionRecord?>(
            1,
            (b) => stride_staketia_staketia.RedemptionRecord.deserialize(b),
          ),
      unbondingCompletionTimeSeconds: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStaketiaRedemptionRecordResponse;
}
