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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'pool_id': config.encodeBigint(poolId)};
  }

  factory QueryGaugeIdsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryGaugeIdsRequest(
      poolId: json.valueAsBigInt<BigInt?>(
        'pool_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'gauge_ids_with_duration':
          gaugeIdsWithDuration.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QueryGaugeIdsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryGaugeIdsResponse(
      gaugeIdsWithDuration:
          (json.valueEnsureAsList<dynamic>(
                'gauge_ids_with_duration',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  QueryGaugeIdsResponseGaugeIdWithDuration,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => QueryGaugeIdsResponseGaugeIdWithDuration.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'gauge_id': config.encodeBigint(gaugeId),
      'duration': duration?.encodeString(asNanos: true),
      'gauge_incentive_percentage': gaugeIncentivePercentage,
    };
  }

  factory QueryGaugeIdsResponseGaugeIdWithDuration.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryGaugeIdsResponseGaugeIdWithDuration(
      gaugeId: json.valueAsBigInt<BigInt?>(
        'gauge_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      duration: json.valueTo<google_protobuf_duration.Duration?, Object>(
        key: 'duration',
        parse:
            (v) => google_protobuf_duration.Duration.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      gaugeIncentivePercentage: json.valueAsString<String?>(
        'gauge_incentive_percentage',
        normalizeKeyLookup: config.normalizeKeys,
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory QueryDistrInfoRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'distr_info': config.encodeMessage(distrInfo)};
  }

  factory QueryDistrInfoResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryDistrInfoResponse(
      distrInfo: json.valueTo<
        osmosis_poolincentives_v1beta1_incentives.DistrInfo?,
        Object
      >(
        key: 'distr_info',
        parse:
            (v) => osmosis_poolincentives_v1beta1_incentives.DistrInfo.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory QueryParamsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'params': config.encodeMessage(params)};
  }

  factory QueryParamsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryParamsResponse(
      params: json
          .valueTo<osmosis_poolincentives_v1beta1_incentives.Params?, Object>(
            key: 'params',
            parse:
                (v) => osmosis_poolincentives_v1beta1_incentives
                    .Params.fromJson(JsonParser.valueAs(v), config: config),
            normalizeKeyLookup: config.normalizeKeys,
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory QueryLockableDurationsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'lockable_durations':
          lockableDurations.map((e) => e.encodeString(asNanos: true)).toList(),
    };
  }

  factory QueryLockableDurationsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryLockableDurationsResponse(
      lockableDurations:
          (json.valueEnsureAsList<dynamic>(
                'lockable_durations',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  google_protobuf_duration.Duration,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => google_protobuf_duration.Duration.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory QueryIncentivizedPoolsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'pool_id': config.encodeBigint(poolId),
      'lockable_duration': lockableDuration?.encodeString(asNanos: true),
      'gauge_id': config.encodeBigint(gaugeId),
    };
  }

  factory IncentivizedPool.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return IncentivizedPool(
      poolId: json.valueAsBigInt<BigInt?>(
        'pool_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      lockableDuration: json
          .valueTo<google_protobuf_duration.Duration?, Object>(
            key: 'lockable_duration',
            parse:
                (v) => google_protobuf_duration.Duration.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      gaugeId: json.valueAsBigInt<BigInt?>(
        'gauge_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'incentivized_pools':
          incentivizedPools.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QueryIncentivizedPoolsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryIncentivizedPoolsResponse(
      incentivizedPools:
          (json.valueEnsureAsList<dynamic>(
                'incentivized_pools',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<IncentivizedPool, Object>(
                  value: e,
                  parse:
                      (v) => IncentivizedPool.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory QueryExternalIncentiveGaugesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'data': data.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QueryExternalIncentiveGaugesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryExternalIncentiveGaugesResponse(
      data:
          (json.valueEnsureAsList<dynamic>(
                'data',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<osmosis_incentives_gauge.Gauge, Object>(
                      value: e,
                      parse:
                          (v) => osmosis_incentives_gauge.Gauge.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
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
