import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/osmosis/incentives/src/gauge.dart"
    as osmosis_incentives_gauge;
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/duration.dart"
    as google_protobuf_duration;
import "package:cosmos_sdk/proto_messages/osmosis/incentives/src/group.dart"
    as osmosis_incentives_group;
import "package:cosmos_sdk/proto_messages/osmosis/incentives/src/params.dart"
    as osmosis_incentives_params;

class ModuleToDistributeCoinsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<ModuleToDistributeCoinsResponse> {
  const ModuleToDistributeCoinsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/incentives/v1beta1/module_to_distribute_coins",
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

  factory ModuleToDistributeCoinsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ModuleToDistributeCoinsRequest();
  }

  factory ModuleToDistributeCoinsRequest.deserialize(List<int> bytes) {
    return ModuleToDistributeCoinsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisIncentivesModuleToDistributeCoinsRequest;
  @override
  ModuleToDistributeCoinsResponse onQueryResponse(List<int> bytes) {
    return ModuleToDistributeCoinsResponse.deserialize(bytes);
  }

  @override
  ModuleToDistributeCoinsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return ModuleToDistributeCoinsResponse.fromJson(json);
  }
}

class ModuleToDistributeCoinsResponse extends CosmosProtoMessage {
  /// Coins that have yet to be distributed
  final List<cosmos_base_v1beta1_coin.Coin> coins;

  const ModuleToDistributeCoinsResponse({this.coins = const []});

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
  List<Object?> get protoValues => [coins];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'coins': coins.map((e) => config.encodeMessage(e)).toList()};
  }

  factory ModuleToDistributeCoinsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ModuleToDistributeCoinsResponse(
      coins:
          (json.valueEnsureAsList<dynamic>(
                'coins',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<cosmos_base_v1beta1_coin.Coin, Object>(
                      value: e,
                      parse:
                          (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
    );
  }

  factory ModuleToDistributeCoinsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ModuleToDistributeCoinsResponse(
      coins:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisIncentivesModuleToDistributeCoinsResponse;
}

class GaugeByIDRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<GaugeByIDResponse> {
  /// Gauge ID being queried
  final BigInt? id;

  const GaugeByIDRequest({this.id});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/incentives/v1beta1/gauge_by_id/{id}",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [id];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'id': config.encodeBigint(id)};
  }

  factory GaugeByIDRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return GaugeByIDRequest(
      id: json.valueAsBigInt<BigInt?>(
        'id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory GaugeByIDRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GaugeByIDRequest(id: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisIncentivesGaugeByIDRequest;
  @override
  GaugeByIDResponse onQueryResponse(List<int> bytes) {
    return GaugeByIDResponse.deserialize(bytes);
  }

  @override
  GaugeByIDResponse onQueryResponseJson(Map<String, dynamic> json) {
    return GaugeByIDResponse.fromJson(json);
  }
}

class GaugeByIDResponse extends CosmosProtoMessage {
  /// Gauge that corresponds to provided gauge ID
  final osmosis_incentives_gauge.Gauge? gauge;

  const GaugeByIDResponse({this.gauge});

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
  List<Object?> get protoValues => [gauge];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'gauge': config.encodeMessage(gauge)};
  }

  factory GaugeByIDResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return GaugeByIDResponse(
      gauge: json.valueTo<osmosis_incentives_gauge.Gauge?, Object>(
        key: 'gauge',
        parse:
            (v) => osmosis_incentives_gauge.Gauge.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory GaugeByIDResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GaugeByIDResponse(
      gauge: decode.messageTo<osmosis_incentives_gauge.Gauge?>(
        1,
        (b) => osmosis_incentives_gauge.Gauge.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisIncentivesGaugeByIDResponse;
}

class GaugesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<GaugesResponse> {
  /// Pagination defines pagination for the request
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const GaugesRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/incentives/v1beta1/gauges",
        ),
      ],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'pagination': config.encodeMessage(pagination)};
  }

  factory GaugesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return GaugesRequest(
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
    );
  }

  factory GaugesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GaugesRequest(
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
      DefaultCosmosProtoTypeUrl.osmosisIncentivesGaugesRequest;
  @override
  GaugesResponse onQueryResponse(List<int> bytes) {
    return GaugesResponse.deserialize(bytes);
  }

  @override
  GaugesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return GaugesResponse.fromJson(json);
  }
}

class GaugesResponse extends CosmosProtoMessage {
  /// Upcoming and active gauges
  final List<osmosis_incentives_gauge.Gauge> data;

  /// Pagination defines pagination for the response
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const GaugesResponse({this.data = const [], this.pagination});

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
  List<Object?> get protoValues => [data, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'data': data.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory GaugesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return GaugesResponse(
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

  factory GaugesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GaugesResponse(
      data:
          decode
              .getListOfBytes(1)
              .map((b) => osmosis_incentives_gauge.Gauge.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.osmosisIncentivesGaugesResponse;
}

class ActiveGaugesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<ActiveGaugesResponse> {
  /// Pagination defines pagination for the request
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const ActiveGaugesRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/incentives/v1beta1/active_gauges",
        ),
      ],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'pagination': config.encodeMessage(pagination)};
  }

  factory ActiveGaugesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ActiveGaugesRequest(
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
    );
  }

  factory ActiveGaugesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ActiveGaugesRequest(
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
      DefaultCosmosProtoTypeUrl.osmosisIncentivesActiveGaugesRequest;
  @override
  ActiveGaugesResponse onQueryResponse(List<int> bytes) {
    return ActiveGaugesResponse.deserialize(bytes);
  }

  @override
  ActiveGaugesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return ActiveGaugesResponse.fromJson(json);
  }
}

class ActiveGaugesResponse extends CosmosProtoMessage {
  /// Active gauges only
  final List<osmosis_incentives_gauge.Gauge> data;

  /// Pagination defines pagination for the response
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const ActiveGaugesResponse({this.data = const [], this.pagination});

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
  List<Object?> get protoValues => [data, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'data': data.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory ActiveGaugesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ActiveGaugesResponse(
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

  factory ActiveGaugesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ActiveGaugesResponse(
      data:
          decode
              .getListOfBytes(1)
              .map((b) => osmosis_incentives_gauge.Gauge.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.osmosisIncentivesActiveGaugesResponse;
}

class ActiveGaugesPerDenomRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<ActiveGaugesPerDenomResponse> {
  /// Desired denom when querying active gauges
  final String? denom;

  /// Pagination defines pagination for the request
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const ActiveGaugesPerDenomRequest({this.denom, this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/incentives/v1beta1/active_gauges_per_denom",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [denom, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'denom': denom, 'pagination': config.encodeMessage(pagination)};
  }

  factory ActiveGaugesPerDenomRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ActiveGaugesPerDenomRequest(
      denom: json.valueAsString<String?>(
        'denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
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
    );
  }

  factory ActiveGaugesPerDenomRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ActiveGaugesPerDenomRequest(
      denom: decode.getString<String?>(1),
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            2,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisIncentivesActiveGaugesPerDenomRequest;
  @override
  ActiveGaugesPerDenomResponse onQueryResponse(List<int> bytes) {
    return ActiveGaugesPerDenomResponse.deserialize(bytes);
  }

  @override
  ActiveGaugesPerDenomResponse onQueryResponseJson(Map<String, dynamic> json) {
    return ActiveGaugesPerDenomResponse.fromJson(json);
  }
}

class ActiveGaugesPerDenomResponse extends CosmosProtoMessage {
  /// Active gauges that match denom in query
  final List<osmosis_incentives_gauge.Gauge> data;

  /// Pagination defines pagination for the response
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const ActiveGaugesPerDenomResponse({this.data = const [], this.pagination});

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
  List<Object?> get protoValues => [data, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'data': data.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory ActiveGaugesPerDenomResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ActiveGaugesPerDenomResponse(
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

  factory ActiveGaugesPerDenomResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ActiveGaugesPerDenomResponse(
      data:
          decode
              .getListOfBytes(1)
              .map((b) => osmosis_incentives_gauge.Gauge.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.osmosisIncentivesActiveGaugesPerDenomResponse;
}

class UpcomingGaugesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<UpcomingGaugesResponse> {
  /// Pagination defines pagination for the request
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const UpcomingGaugesRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/incentives/v1beta1/upcoming_gauges",
        ),
      ],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'pagination': config.encodeMessage(pagination)};
  }

  factory UpcomingGaugesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return UpcomingGaugesRequest(
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
    );
  }

  factory UpcomingGaugesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return UpcomingGaugesRequest(
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
      DefaultCosmosProtoTypeUrl.osmosisIncentivesUpcomingGaugesRequest;
  @override
  UpcomingGaugesResponse onQueryResponse(List<int> bytes) {
    return UpcomingGaugesResponse.deserialize(bytes);
  }

  @override
  UpcomingGaugesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return UpcomingGaugesResponse.fromJson(json);
  }
}

class UpcomingGaugesResponse extends CosmosProtoMessage {
  /// Gauges whose distribution is upcoming
  final List<osmosis_incentives_gauge.Gauge> data;

  /// Pagination defines pagination for the response
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const UpcomingGaugesResponse({this.data = const [], this.pagination});

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
  List<Object?> get protoValues => [data, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'data': data.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory UpcomingGaugesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return UpcomingGaugesResponse(
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

  factory UpcomingGaugesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return UpcomingGaugesResponse(
      data:
          decode
              .getListOfBytes(1)
              .map((b) => osmosis_incentives_gauge.Gauge.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.osmosisIncentivesUpcomingGaugesResponse;
}

class UpcomingGaugesPerDenomRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<UpcomingGaugesPerDenomResponse> {
  /// Filter for upcoming gauges that match specific denom
  final String? denom;

  /// Pagination defines pagination for the request
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const UpcomingGaugesPerDenomRequest({this.denom, this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/incentives/v1beta1/upcoming_gauges_per_denom",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [denom, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'denom': denom, 'pagination': config.encodeMessage(pagination)};
  }

  factory UpcomingGaugesPerDenomRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return UpcomingGaugesPerDenomRequest(
      denom: json.valueAsString<String?>(
        'denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
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
    );
  }

  factory UpcomingGaugesPerDenomRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return UpcomingGaugesPerDenomRequest(
      denom: decode.getString<String?>(1),
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            2,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisIncentivesUpcomingGaugesPerDenomRequest;
  @override
  UpcomingGaugesPerDenomResponse onQueryResponse(List<int> bytes) {
    return UpcomingGaugesPerDenomResponse.deserialize(bytes);
  }

  @override
  UpcomingGaugesPerDenomResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return UpcomingGaugesPerDenomResponse.fromJson(json);
  }
}

class UpcomingGaugesPerDenomResponse extends CosmosProtoMessage {
  /// Upcoming gauges that match denom in query
  final List<osmosis_incentives_gauge.Gauge> upcomingGauges;

  /// Pagination defines pagination for the response
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const UpcomingGaugesPerDenomResponse({
    this.upcomingGauges = const [],
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
  List<Object?> get protoValues => [upcomingGauges, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'upcoming_gauges':
          upcomingGauges.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory UpcomingGaugesPerDenomResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return UpcomingGaugesPerDenomResponse(
      upcomingGauges:
          (json.valueEnsureAsList<dynamic>(
                'upcoming_gauges',
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

  factory UpcomingGaugesPerDenomResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return UpcomingGaugesPerDenomResponse(
      upcomingGauges:
          decode
              .getListOfBytes(1)
              .map((b) => osmosis_incentives_gauge.Gauge.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.osmosisIncentivesUpcomingGaugesPerDenomResponse;
}

class RewardsEstRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<RewardsEstResponse> {
  /// Address that is being queried for future estimated rewards
  final String? owner;

  /// Lock IDs included in future reward estimation
  final List<BigInt> lockIds;

  /// Upper time limit of reward estimation
  /// Lower limit is current epoch
  final BigInt? endEpoch;

  const RewardsEstRequest({this.owner, this.lockIds = const [], this.endEpoch});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/incentives/v1beta1/rewards_est/{owner}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.uint64,
        ),
        ProtoFieldConfig.int64(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [owner, lockIds, endEpoch];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'owner': owner,
      'lock_ids': lockIds.map((e) => config.encodeBigint(e)).toList(),
      'end_epoch': config.encodeBigint(endEpoch),
    };
  }

  factory RewardsEstRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return RewardsEstRequest(
      owner: json.valueAsString<String?>(
        'owner',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      lockIds:
          (json.valueEnsureAsList<dynamic>(
            'lock_ids',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
      endEpoch: json.valueAsBigInt<BigInt?>(
        'end_epoch',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory RewardsEstRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RewardsEstRequest(
      owner: decode.getString<String?>(1),
      lockIds: decode.getListOrEmpty<BigInt>(2),
      endEpoch: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisIncentivesRewardsEstRequest;
  @override
  RewardsEstResponse onQueryResponse(List<int> bytes) {
    return RewardsEstResponse.deserialize(bytes);
  }

  @override
  RewardsEstResponse onQueryResponseJson(Map<String, dynamic> json) {
    return RewardsEstResponse.fromJson(json);
  }
}

class RewardsEstResponse extends CosmosProtoMessage {
  /// Estimated coin rewards that will be received at provided address
  /// from specified locks between current time and end epoch
  final List<cosmos_base_v1beta1_coin.Coin> coins;

  const RewardsEstResponse({this.coins = const []});

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
  List<Object?> get protoValues => [coins];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'coins': coins.map((e) => config.encodeMessage(e)).toList()};
  }

  factory RewardsEstResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return RewardsEstResponse(
      coins:
          (json.valueEnsureAsList<dynamic>(
                'coins',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<cosmos_base_v1beta1_coin.Coin, Object>(
                      value: e,
                      parse:
                          (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
    );
  }

  factory RewardsEstResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RewardsEstResponse(
      coins:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisIncentivesRewardsEstResponse;
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
          path: "/osmosis/incentives/v1beta1/lockable_durations",
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
      DefaultCosmosProtoTypeUrl.osmosisIncentivesQueryLockableDurationsRequest;
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
  /// Time durations that users can lock coins for in order to receive rewards
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
      DefaultCosmosProtoTypeUrl.osmosisIncentivesQueryLockableDurationsResponse;
}

class QueryAllGroupsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAllGroupsResponse> {
  const QueryAllGroupsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/incentives/v1beta1/all_groups",
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

  factory QueryAllGroupsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAllGroupsRequest();
  }

  factory QueryAllGroupsRequest.deserialize(List<int> bytes) {
    return QueryAllGroupsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisIncentivesQueryAllGroupsRequest;
  @override
  QueryAllGroupsResponse onQueryResponse(List<int> bytes) {
    return QueryAllGroupsResponse.deserialize(bytes);
  }

  @override
  QueryAllGroupsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAllGroupsResponse.fromJson(json);
  }
}

class QueryAllGroupsResponse extends CosmosProtoMessage {
  final List<osmosis_incentives_group.Group> groups;

  const QueryAllGroupsResponse({this.groups = const []});

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
  List<Object?> get protoValues => [groups];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'groups': groups.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QueryAllGroupsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAllGroupsResponse(
      groups:
          (json.valueEnsureAsList<dynamic>(
                'groups',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<osmosis_incentives_group.Group, Object>(
                      value: e,
                      parse:
                          (v) => osmosis_incentives_group.Group.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
    );
  }

  factory QueryAllGroupsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllGroupsResponse(
      groups:
          decode
              .getListOfBytes(1)
              .map((b) => osmosis_incentives_group.Group.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisIncentivesQueryAllGroupsResponse;
}

class QueryAllGroupsGaugesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAllGroupsGaugesResponse> {
  const QueryAllGroupsGaugesRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/incentives/v1beta1/all_groups_gauges",
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

  factory QueryAllGroupsGaugesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAllGroupsGaugesRequest();
  }

  factory QueryAllGroupsGaugesRequest.deserialize(List<int> bytes) {
    return QueryAllGroupsGaugesRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisIncentivesQueryAllGroupsGaugesRequest;
  @override
  QueryAllGroupsGaugesResponse onQueryResponse(List<int> bytes) {
    return QueryAllGroupsGaugesResponse.deserialize(bytes);
  }

  @override
  QueryAllGroupsGaugesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAllGroupsGaugesResponse.fromJson(json);
  }
}

class QueryAllGroupsGaugesResponse extends CosmosProtoMessage {
  final List<osmosis_incentives_gauge.Gauge> gauges;

  const QueryAllGroupsGaugesResponse({this.gauges = const []});

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
  List<Object?> get protoValues => [gauges];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'gauges': gauges.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QueryAllGroupsGaugesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAllGroupsGaugesResponse(
      gauges:
          (json.valueEnsureAsList<dynamic>(
                'gauges',
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

  factory QueryAllGroupsGaugesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllGroupsGaugesResponse(
      gauges:
          decode
              .getListOfBytes(1)
              .map((b) => osmosis_incentives_gauge.Gauge.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisIncentivesQueryAllGroupsGaugesResponse;
}

class QueryAllGroupsWithGaugeRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAllGroupsWithGaugeResponse> {
  const QueryAllGroupsWithGaugeRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/incentives/v1beta1/all_groups_with_gauge",
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

  factory QueryAllGroupsWithGaugeRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAllGroupsWithGaugeRequest();
  }

  factory QueryAllGroupsWithGaugeRequest.deserialize(List<int> bytes) {
    return QueryAllGroupsWithGaugeRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisIncentivesQueryAllGroupsWithGaugeRequest;
  @override
  QueryAllGroupsWithGaugeResponse onQueryResponse(List<int> bytes) {
    return QueryAllGroupsWithGaugeResponse.deserialize(bytes);
  }

  @override
  QueryAllGroupsWithGaugeResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryAllGroupsWithGaugeResponse.fromJson(json);
  }
}

class QueryAllGroupsWithGaugeResponse extends CosmosProtoMessage {
  final List<osmosis_incentives_group.GroupsWithGauge> groupsWithGauge;

  const QueryAllGroupsWithGaugeResponse({this.groupsWithGauge = const []});

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
  List<Object?> get protoValues => [groupsWithGauge];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'groups_with_gauge':
          groupsWithGauge.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QueryAllGroupsWithGaugeResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAllGroupsWithGaugeResponse(
      groupsWithGauge:
          (json.valueEnsureAsList<dynamic>(
                'groups_with_gauge',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_incentives_group.GroupsWithGauge,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => osmosis_incentives_group.GroupsWithGauge.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryAllGroupsWithGaugeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllGroupsWithGaugeResponse(
      groupsWithGauge:
          decode
              .getListOfBytes(1)
              .map(
                (b) => osmosis_incentives_group.GroupsWithGauge.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisIncentivesQueryAllGroupsWithGaugeResponse;
}

class QueryGroupByGroupGaugeIDRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGroupByGroupGaugeIDResponse> {
  final BigInt? id;

  const QueryGroupByGroupGaugeIDRequest({this.id});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/incentives/v1beta1/group_by_group_gauge_id/{id}",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [id];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'id': config.encodeBigint(id)};
  }

  factory QueryGroupByGroupGaugeIDRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryGroupByGroupGaugeIDRequest(
      id: json.valueAsBigInt<BigInt?>(
        'id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryGroupByGroupGaugeIDRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGroupByGroupGaugeIDRequest(id: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisIncentivesQueryGroupByGroupGaugeIDRequest;
  @override
  QueryGroupByGroupGaugeIDResponse onQueryResponse(List<int> bytes) {
    return QueryGroupByGroupGaugeIDResponse.deserialize(bytes);
  }

  @override
  QueryGroupByGroupGaugeIDResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryGroupByGroupGaugeIDResponse.fromJson(json);
  }
}

class QueryGroupByGroupGaugeIDResponse extends CosmosProtoMessage {
  final osmosis_incentives_group.Group? group;

  const QueryGroupByGroupGaugeIDResponse({this.group});

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
  List<Object?> get protoValues => [group];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'group': config.encodeMessage(group)};
  }

  factory QueryGroupByGroupGaugeIDResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryGroupByGroupGaugeIDResponse(
      group: json.valueTo<osmosis_incentives_group.Group?, Object>(
        key: 'group',
        parse:
            (v) => osmosis_incentives_group.Group.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryGroupByGroupGaugeIDResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGroupByGroupGaugeIDResponse(
      group: decode.messageTo<osmosis_incentives_group.Group?>(
        1,
        (b) => osmosis_incentives_group.Group.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisIncentivesQueryGroupByGroupGaugeIDResponse;
}

class QueryCurrentWeightByGroupGaugeIDRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryCurrentWeightByGroupGaugeIDResponse> {
  final BigInt? groupGaugeId;

  const QueryCurrentWeightByGroupGaugeIDRequest({this.groupGaugeId});

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
              "/osmosis/incentives/v1beta1/current_weight_by_group_gauge_id/{group_gauge_id}",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [groupGaugeId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'group_gauge_id': config.encodeBigint(groupGaugeId)};
  }

  factory QueryCurrentWeightByGroupGaugeIDRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryCurrentWeightByGroupGaugeIDRequest(
      groupGaugeId: json.valueAsBigInt<BigInt?>(
        'group_gauge_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryCurrentWeightByGroupGaugeIDRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCurrentWeightByGroupGaugeIDRequest(
      groupGaugeId: decode.getBigInt<BigInt?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisIncentivesQueryCurrentWeightByGroupGaugeIDRequest;
  @override
  QueryCurrentWeightByGroupGaugeIDResponse onQueryResponse(List<int> bytes) {
    return QueryCurrentWeightByGroupGaugeIDResponse.deserialize(bytes);
  }

  @override
  QueryCurrentWeightByGroupGaugeIDResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryCurrentWeightByGroupGaugeIDResponse.fromJson(json);
  }
}

class QueryCurrentWeightByGroupGaugeIDResponse extends CosmosProtoMessage {
  final List<GaugeWeight> gaugeWeight;

  const QueryCurrentWeightByGroupGaugeIDResponse({this.gaugeWeight = const []});

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
  List<Object?> get protoValues => [gaugeWeight];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'gauge_weight': gaugeWeight.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QueryCurrentWeightByGroupGaugeIDResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryCurrentWeightByGroupGaugeIDResponse(
      gaugeWeight:
          (json.valueEnsureAsList<dynamic>(
                'gauge_weight',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<GaugeWeight, Object>(
                  value: e,
                  parse:
                      (v) => GaugeWeight.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryCurrentWeightByGroupGaugeIDResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCurrentWeightByGroupGaugeIDResponse(
      gaugeWeight:
          decode
              .getListOfBytes(1)
              .map((b) => GaugeWeight.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisIncentivesQueryCurrentWeightByGroupGaugeIDResponse;
}

class GaugeWeight extends CosmosProtoMessage {
  final BigInt? gaugeId;

  final String? weightRatio;

  const GaugeWeight({this.gaugeId, this.weightRatio});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [gaugeId, weightRatio];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'gauge_id': config.encodeBigint(gaugeId),
      'weight_ratio': weightRatio,
    };
  }

  factory GaugeWeight.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return GaugeWeight(
      gaugeId: json.valueAsBigInt<BigInt?>(
        'gauge_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      weightRatio: json.valueAsString<String?>(
        'weight_ratio',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory GaugeWeight.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GaugeWeight(
      gaugeId: decode.getBigInt<BigInt?>(1),
      weightRatio: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisIncentivesGaugeWeight;
}

class QueryInternalGaugesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryInternalGaugesResponse> {
  /// Pagination defines pagination for the request
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryInternalGaugesRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/incentives/v1beta1/internal_gauges",
        ),
      ],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'pagination': config.encodeMessage(pagination)};
  }

  factory QueryInternalGaugesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryInternalGaugesRequest(
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
    );
  }

  factory QueryInternalGaugesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryInternalGaugesRequest(
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
      DefaultCosmosProtoTypeUrl.osmosisIncentivesQueryInternalGaugesRequest;
  @override
  QueryInternalGaugesResponse onQueryResponse(List<int> bytes) {
    return QueryInternalGaugesResponse.deserialize(bytes);
  }

  @override
  QueryInternalGaugesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryInternalGaugesResponse.fromJson(json);
  }
}

class QueryInternalGaugesResponse extends CosmosProtoMessage {
  final List<osmosis_incentives_gauge.Gauge> gauges;

  /// Pagination defines pagination for the response
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryInternalGaugesResponse({this.gauges = const [], this.pagination});

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
  List<Object?> get protoValues => [gauges, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'gauges': gauges.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryInternalGaugesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryInternalGaugesResponse(
      gauges:
          (json.valueEnsureAsList<dynamic>(
                'gauges',
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

  factory QueryInternalGaugesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryInternalGaugesResponse(
      gauges:
          decode
              .getListOfBytes(1)
              .map((b) => osmosis_incentives_gauge.Gauge.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.osmosisIncentivesQueryInternalGaugesResponse;
}

class QueryExternalGaugesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryExternalGaugesResponse> {
  /// Pagination defines pagination for the request
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryExternalGaugesRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/incentives/v1beta1/external_gauges",
        ),
      ],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'pagination': config.encodeMessage(pagination)};
  }

  factory QueryExternalGaugesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryExternalGaugesRequest(
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
    );
  }

  factory QueryExternalGaugesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryExternalGaugesRequest(
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
      DefaultCosmosProtoTypeUrl.osmosisIncentivesQueryExternalGaugesRequest;
  @override
  QueryExternalGaugesResponse onQueryResponse(List<int> bytes) {
    return QueryExternalGaugesResponse.deserialize(bytes);
  }

  @override
  QueryExternalGaugesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryExternalGaugesResponse.fromJson(json);
  }
}

class QueryExternalGaugesResponse extends CosmosProtoMessage {
  final List<osmosis_incentives_gauge.Gauge> gauges;

  /// Pagination defines pagination for the response
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryExternalGaugesResponse({this.gauges = const [], this.pagination});

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
  List<Object?> get protoValues => [gauges, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'gauges': gauges.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryExternalGaugesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryExternalGaugesResponse(
      gauges:
          (json.valueEnsureAsList<dynamic>(
                'gauges',
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

  factory QueryExternalGaugesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryExternalGaugesResponse(
      gauges:
          decode
              .getListOfBytes(1)
              .map((b) => osmosis_incentives_gauge.Gauge.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.osmosisIncentivesQueryExternalGaugesResponse;
}

class QueryGaugesByPoolIDRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGaugesByPoolIDResponse> {
  final BigInt? id;

  /// Pagination defines pagination for the request
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryGaugesByPoolIDRequest({this.id, this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/incentives/v1beta1/gauges_by_pool_id/{id}",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [id, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'id': config.encodeBigint(id),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryGaugesByPoolIDRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryGaugesByPoolIDRequest(
      id: json.valueAsBigInt<BigInt?>(
        'id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
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
    );
  }

  factory QueryGaugesByPoolIDRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGaugesByPoolIDRequest(
      id: decode.getBigInt<BigInt?>(1),
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            2,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisIncentivesQueryGaugesByPoolIDRequest;
  @override
  QueryGaugesByPoolIDResponse onQueryResponse(List<int> bytes) {
    return QueryGaugesByPoolIDResponse.deserialize(bytes);
  }

  @override
  QueryGaugesByPoolIDResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryGaugesByPoolIDResponse.fromJson(json);
  }
}

class QueryGaugesByPoolIDResponse extends CosmosProtoMessage {
  final List<osmosis_incentives_gauge.Gauge> gauges;

  /// Pagination defines pagination for the response
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryGaugesByPoolIDResponse({this.gauges = const [], this.pagination});

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
  List<Object?> get protoValues => [gauges, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'gauges': gauges.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryGaugesByPoolIDResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryGaugesByPoolIDResponse(
      gauges:
          (json.valueEnsureAsList<dynamic>(
                'gauges',
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

  factory QueryGaugesByPoolIDResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGaugesByPoolIDResponse(
      gauges:
          decode
              .getListOfBytes(1)
              .map((b) => osmosis_incentives_gauge.Gauge.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.osmosisIncentivesQueryGaugesByPoolIDResponse;
}

class ParamsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<ParamsResponse> {
  const ParamsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/incentives/v1beta1/params",
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

  factory ParamsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ParamsRequest();
  }

  factory ParamsRequest.deserialize(List<int> bytes) {
    return ParamsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisIncentivesParamsRequest;
  @override
  ParamsResponse onQueryResponse(List<int> bytes) {
    return ParamsResponse.deserialize(bytes);
  }

  @override
  ParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return ParamsResponse.fromJson(json);
  }
}

class ParamsResponse extends CosmosProtoMessage {
  final osmosis_incentives_params.Params? params;

  const ParamsResponse({this.params});

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

  factory ParamsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ParamsResponse(
      params: json.valueTo<osmosis_incentives_params.Params?, Object>(
        key: 'params',
        parse:
            (v) => osmosis_incentives_params.Params.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory ParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ParamsResponse(
      params: decode.messageTo<osmosis_incentives_params.Params?>(
        1,
        (b) => osmosis_incentives_params.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisIncentivesParamsResponse;
}
