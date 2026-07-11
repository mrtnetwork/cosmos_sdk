import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/google/protobuf/src/duration.dart"
    as google_protobuf_duration;
import "package:cosmos_sdk/proto_messages/osmosis/poolincentives/v1beta1/src/incentives.dart"
    as osmosis_poolincentives_v1beta1_incentives;
import "package:cosmos_sdk/proto_messages/osmosis/incentives/src/gauge.dart"
    as osmosis_incentives_gauge;

class QueryGaugeIdsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGaugeIdsResponse> {
  final BigInt? poolId;

  const QueryGaugeIdsRequest({this.poolId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/pool-incentives/v1beta1/gauge-ids/{pool_id}",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [poolId];

  @override
  Map<String, dynamic> toJson() {
    return {'pool_id': poolId?.toString()};
  }

  factory QueryGaugeIdsRequest.fromJson(Map<String, dynamic> json) {
    return QueryGaugeIdsRequest(
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
    );
  }

  factory QueryGaugeIdsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGaugeIdsRequest(poolId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolincentivesV1beta1QueryGaugeIdsRequest;
  @override
  QueryGaugeIdsResponse onQueryResponse(List<int> bytes) {
    return QueryGaugeIdsResponse.deserialize(bytes);
  }

  @override
  QueryGaugeIdsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryGaugeIdsResponse.fromJson(json);
  }
}

class QueryGaugeIdsResponse extends CosmosProtoMessage {
  final List<QueryGaugeIdsResponseGaugeIdWithDuration> gaugeIdsWithDuration;

  const QueryGaugeIdsResponse({this.gaugeIdsWithDuration = const []});

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
  List<Object?> get protoValues => [gaugeIdsWithDuration];

  @override
  Map<String, dynamic> toJson() {
    return {
      'gauge_ids_with_duration':
          gaugeIdsWithDuration.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryGaugeIdsResponse.fromJson(Map<String, dynamic> json) {
    return QueryGaugeIdsResponse(
      gaugeIdsWithDuration:
          (json.valueEnsureAsList<dynamic>(
                'gauge_ids_with_duration',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  QueryGaugeIdsResponseGaugeIdWithDuration,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) =>
                          QueryGaugeIdsResponseGaugeIdWithDuration.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryGaugeIdsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGaugeIdsResponse(
      gaugeIdsWithDuration:
          decode
              .getListOfBytes(1)
              .map(
                (b) => QueryGaugeIdsResponseGaugeIdWithDuration.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolincentivesV1beta1QueryGaugeIdsResponse;
}

class QueryGaugeIdsResponseGaugeIdWithDuration extends CosmosProtoMessage {
  final BigInt? gaugeId;

  final google_protobuf_duration.Duration? duration;

  final String? gaugeIncentivePercentage;

  const QueryGaugeIdsResponseGaugeIdWithDuration({
    this.gaugeId,
    this.duration,
    this.gaugeIncentivePercentage,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    gaugeId,
    duration,
    gaugeIncentivePercentage,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'gauge_id': gaugeId?.toString(),
      'duration': duration?.encodeString(asNanos: true),
      'gauge_incentive_percentage': gaugeIncentivePercentage,
    };
  }

  factory QueryGaugeIdsResponseGaugeIdWithDuration.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGaugeIdsResponseGaugeIdWithDuration(
      gaugeId: json.valueAsBigInt<BigInt?>('gauge_id', acceptCamelCase: true),
      duration: json.valueTo<google_protobuf_duration.Duration?, String>(
        key: 'duration',
        parse: (v) => google_protobuf_duration.Duration.fromString(v),
        acceptCamelCase: true,
      ),
      gaugeIncentivePercentage: json.valueAsString<String?>(
        'gauge_incentive_percentage',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryGaugeIdsResponseGaugeIdWithDuration.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGaugeIdsResponseGaugeIdWithDuration(
      gaugeId: decode.getBigInt<BigInt?>(1),
      duration: decode.messageTo<google_protobuf_duration.Duration?>(
        2,
        (b) => google_protobuf_duration.Duration.deserialize(b),
      ),
      gaugeIncentivePercentage: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolincentivesV1beta1QueryGaugeIdsResponseGaugeIdWithDuration;
}

class QueryDistrInfoRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDistrInfoResponse> {
  const QueryDistrInfoRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/pool-incentives/v1beta1/distr_info",
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

  factory QueryDistrInfoRequest.fromJson(Map<String, dynamic> json) {
    return QueryDistrInfoRequest();
  }

  factory QueryDistrInfoRequest.deserialize(List<int> bytes) {
    return QueryDistrInfoRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolincentivesV1beta1QueryDistrInfoRequest;
  @override
  QueryDistrInfoResponse onQueryResponse(List<int> bytes) {
    return QueryDistrInfoResponse.deserialize(bytes);
  }

  @override
  QueryDistrInfoResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryDistrInfoResponse.fromJson(json);
  }
}

class QueryDistrInfoResponse extends CosmosProtoMessage {
  final osmosis_poolincentives_v1beta1_incentives.DistrInfo? distrInfo;

  const QueryDistrInfoResponse({this.distrInfo});

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
  List<Object?> get protoValues => [distrInfo];

  @override
  Map<String, dynamic> toJson() {
    return {'distr_info': distrInfo?.toJson()};
  }

  factory QueryDistrInfoResponse.fromJson(Map<String, dynamic> json) {
    return QueryDistrInfoResponse(
      distrInfo: json.valueTo<
        osmosis_poolincentives_v1beta1_incentives.DistrInfo?,
        Map<String, dynamic>
      >(
        key: 'distr_info',
        parse:
            (v) =>
                osmosis_poolincentives_v1beta1_incentives.DistrInfo.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryDistrInfoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDistrInfoResponse(
      distrInfo: decode
          .messageTo<osmosis_poolincentives_v1beta1_incentives.DistrInfo?>(
            1,
            (b) => osmosis_poolincentives_v1beta1_incentives
                .DistrInfo.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolincentivesV1beta1QueryDistrInfoResponse;
}

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
          path: "/osmosis/pool-incentives/v1beta1/params",
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
      DefaultCosmosProtoTypeUrl.osmosisPoolincentivesV1beta1QueryParamsRequest;
  @override
  QueryParamsResponse onQueryResponse(List<int> bytes) {
    return QueryParamsResponse.deserialize(bytes);
  }

  @override
  QueryParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryParamsResponse.fromJson(json);
  }
}

class QueryParamsResponse extends CosmosProtoMessage {
  final osmosis_poolincentives_v1beta1_incentives.Params? params;

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
      params: json.valueTo<
        osmosis_poolincentives_v1beta1_incentives.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse:
            (v) => osmosis_poolincentives_v1beta1_incentives.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode
          .messageTo<osmosis_poolincentives_v1beta1_incentives.Params?>(
            1,
            (b) =>
                osmosis_poolincentives_v1beta1_incentives.Params.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisPoolincentivesV1beta1QueryParamsResponse;
}

class QueryLockableDurationsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryLockableDurationsResponse> {
  const QueryLockableDurationsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/pool-incentives/v1beta1/lockable_durations",
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

  factory QueryLockableDurationsRequest.fromJson(Map<String, dynamic> json) {
    return QueryLockableDurationsRequest();
  }

  factory QueryLockableDurationsRequest.deserialize(List<int> bytes) {
    return QueryLockableDurationsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolincentivesV1beta1QueryLockableDurationsRequest;
  @override
  QueryLockableDurationsResponse onQueryResponse(List<int> bytes) {
    return QueryLockableDurationsResponse.deserialize(bytes);
  }

  @override
  QueryLockableDurationsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryLockableDurationsResponse.fromJson(json);
  }
}

class QueryLockableDurationsResponse extends CosmosProtoMessage {
  final List<google_protobuf_duration.Duration> lockableDurations;

  const QueryLockableDurationsResponse({this.lockableDurations = const []});

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
  List<Object?> get protoValues => [lockableDurations];

  @override
  Map<String, dynamic> toJson() {
    return {
      'lockable_durations':
          lockableDurations.map((e) => e.encodeString(asNanos: true)).toList(),
    };
  }

  factory QueryLockableDurationsResponse.fromJson(Map<String, dynamic> json) {
    return QueryLockableDurationsResponse(
      lockableDurations:
          (json.valueEnsureAsList<dynamic>(
                'lockable_durations',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  google_protobuf_duration.Duration,
                  String
                >(
                  value: e,
                  parse: (v) => google_protobuf_duration.Duration.fromString(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryLockableDurationsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryLockableDurationsResponse(
      lockableDurations:
          decode
              .getListOfBytes(1)
              .map((b) => google_protobuf_duration.Duration.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolincentivesV1beta1QueryLockableDurationsResponse;
}

class QueryIncentivizedPoolsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryIncentivizedPoolsResponse> {
  const QueryIncentivizedPoolsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/pool-incentives/v1beta1/incentivized_pools",
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

  factory QueryIncentivizedPoolsRequest.fromJson(Map<String, dynamic> json) {
    return QueryIncentivizedPoolsRequest();
  }

  factory QueryIncentivizedPoolsRequest.deserialize(List<int> bytes) {
    return QueryIncentivizedPoolsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolincentivesV1beta1QueryIncentivizedPoolsRequest;
  @override
  QueryIncentivizedPoolsResponse onQueryResponse(List<int> bytes) {
    return QueryIncentivizedPoolsResponse.deserialize(bytes);
  }

  @override
  QueryIncentivizedPoolsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryIncentivizedPoolsResponse.fromJson(json);
  }
}

class IncentivizedPool extends CosmosProtoMessage {
  final BigInt? poolId;

  final google_protobuf_duration.Duration? lockableDuration;

  final BigInt? gaugeId;

  const IncentivizedPool({this.poolId, this.lockableDuration, this.gaugeId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.uint64(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [poolId, lockableDuration, gaugeId];

  @override
  Map<String, dynamic> toJson() {
    return {
      'pool_id': poolId?.toString(),
      'lockable_duration': lockableDuration?.encodeString(asNanos: true),
      'gauge_id': gaugeId?.toString(),
    };
  }

  factory IncentivizedPool.fromJson(Map<String, dynamic> json) {
    return IncentivizedPool(
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
      lockableDuration: json
          .valueTo<google_protobuf_duration.Duration?, String>(
            key: 'lockable_duration',
            parse: (v) => google_protobuf_duration.Duration.fromString(v),
            acceptCamelCase: true,
          ),
      gaugeId: json.valueAsBigInt<BigInt?>('gauge_id', acceptCamelCase: true),
    );
  }

  factory IncentivizedPool.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return IncentivizedPool(
      poolId: decode.getBigInt<BigInt?>(1),
      lockableDuration: decode.messageTo<google_protobuf_duration.Duration?>(
        2,
        (b) => google_protobuf_duration.Duration.deserialize(b),
      ),
      gaugeId: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisPoolincentivesV1beta1IncentivizedPool;
}

class QueryIncentivizedPoolsResponse extends CosmosProtoMessage {
  final List<IncentivizedPool> incentivizedPools;

  const QueryIncentivizedPoolsResponse({this.incentivizedPools = const []});

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
  List<Object?> get protoValues => [incentivizedPools];

  @override
  Map<String, dynamic> toJson() {
    return {
      'incentivized_pools': incentivizedPools.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryIncentivizedPoolsResponse.fromJson(Map<String, dynamic> json) {
    return QueryIncentivizedPoolsResponse(
      incentivizedPools:
          (json.valueEnsureAsList<dynamic>(
                'incentivized_pools',
                acceptCamelCase: true,
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<IncentivizedPool, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => IncentivizedPool.fromJson(v),
                    ),
              )
              .toList(),
    );
  }

  factory QueryIncentivizedPoolsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryIncentivizedPoolsResponse(
      incentivizedPools:
          decode
              .getListOfBytes(1)
              .map((b) => IncentivizedPool.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolincentivesV1beta1QueryIncentivizedPoolsResponse;
}

class QueryExternalIncentiveGaugesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryExternalIncentiveGaugesResponse> {
  const QueryExternalIncentiveGaugesRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/pool-incentives/v1beta1/external_incentive_gauges",
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

  factory QueryExternalIncentiveGaugesRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryExternalIncentiveGaugesRequest();
  }

  factory QueryExternalIncentiveGaugesRequest.deserialize(List<int> bytes) {
    return QueryExternalIncentiveGaugesRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolincentivesV1beta1QueryExternalIncentiveGaugesRequest;
  @override
  QueryExternalIncentiveGaugesResponse onQueryResponse(List<int> bytes) {
    return QueryExternalIncentiveGaugesResponse.deserialize(bytes);
  }

  @override
  QueryExternalIncentiveGaugesResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryExternalIncentiveGaugesResponse.fromJson(json);
  }
}

class QueryExternalIncentiveGaugesResponse extends CosmosProtoMessage {
  final List<osmosis_incentives_gauge.Gauge> data;

  const QueryExternalIncentiveGaugesResponse({this.data = const []});

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
  List<Object?> get protoValues => [data];

  @override
  Map<String, dynamic> toJson() {
    return {'data': data.map((e) => e.toJson()).toList()};
  }

  factory QueryExternalIncentiveGaugesResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryExternalIncentiveGaugesResponse(
      data:
          (json.valueEnsureAsList<dynamic>('data', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_incentives_gauge.Gauge,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => osmosis_incentives_gauge.Gauge.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryExternalIncentiveGaugesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryExternalIncentiveGaugesResponse(
      data:
          decode
              .getListOfBytes(1)
              .map((b) => osmosis_incentives_gauge.Gauge.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolincentivesV1beta1QueryExternalIncentiveGaugesResponse;
}
