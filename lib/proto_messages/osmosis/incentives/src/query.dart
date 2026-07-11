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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory ModuleToDistributeCoinsRequest.fromJson(Map<String, dynamic> json) {
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
  Map<String, dynamic> toJson() {
    return {'coins': coins.map((e) => e.toJson()).toList()};
  }

  factory ModuleToDistributeCoinsResponse.fromJson(Map<String, dynamic> json) {
    return ModuleToDistributeCoinsResponse(
      coins:
          (json.valueEnsureAsList<dynamic>('coins', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.Coin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
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
  Map<String, dynamic> toJson() {
    return {'id': id?.toString()};
  }

  factory GaugeByIDRequest.fromJson(Map<String, dynamic> json) {
    return GaugeByIDRequest(
      id: json.valueAsBigInt<BigInt?>('id', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'gauge': gauge?.toJson()};
  }

  factory GaugeByIDResponse.fromJson(Map<String, dynamic> json) {
    return GaugeByIDResponse(
      gauge: json
          .valueTo<osmosis_incentives_gauge.Gauge?, Map<String, dynamic>>(
            key: 'gauge',
            parse: (v) => osmosis_incentives_gauge.Gauge.fromJson(v),
            acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'pagination': pagination?.toJson()};
  }

  factory GaugesRequest.fromJson(Map<String, dynamic> json) {
    return GaugesRequest(
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
  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory GaugesResponse.fromJson(Map<String, dynamic> json) {
    return GaugesResponse(
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
  Map<String, dynamic> toJson() {
    return {'pagination': pagination?.toJson()};
  }

  factory ActiveGaugesRequest.fromJson(Map<String, dynamic> json) {
    return ActiveGaugesRequest(
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
  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory ActiveGaugesResponse.fromJson(Map<String, dynamic> json) {
    return ActiveGaugesResponse(
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
  Map<String, dynamic> toJson() {
    return {'denom': denom, 'pagination': pagination?.toJson()};
  }

  factory ActiveGaugesPerDenomRequest.fromJson(Map<String, dynamic> json) {
    return ActiveGaugesPerDenomRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory ActiveGaugesPerDenomResponse.fromJson(Map<String, dynamic> json) {
    return ActiveGaugesPerDenomResponse(
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
  Map<String, dynamic> toJson() {
    return {'pagination': pagination?.toJson()};
  }

  factory UpcomingGaugesRequest.fromJson(Map<String, dynamic> json) {
    return UpcomingGaugesRequest(
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
  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory UpcomingGaugesResponse.fromJson(Map<String, dynamic> json) {
    return UpcomingGaugesResponse(
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
  Map<String, dynamic> toJson() {
    return {'denom': denom, 'pagination': pagination?.toJson()};
  }

  factory UpcomingGaugesPerDenomRequest.fromJson(Map<String, dynamic> json) {
    return UpcomingGaugesPerDenomRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {
      'upcoming_gauges': upcomingGauges.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory UpcomingGaugesPerDenomResponse.fromJson(Map<String, dynamic> json) {
    return UpcomingGaugesPerDenomResponse(
      upcomingGauges:
          (json.valueEnsureAsList<dynamic>(
                'upcoming_gauges',
                acceptCamelCase: true,
              ))
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
  Map<String, dynamic> toJson() {
    return {
      'owner': owner,
      'lock_ids': lockIds.map((e) => e.toString()).toList(),
      'end_epoch': endEpoch?.toString(),
    };
  }

  factory RewardsEstRequest.fromJson(Map<String, dynamic> json) {
    return RewardsEstRequest(
      owner: json.valueAsString<String?>('owner', acceptCamelCase: true),
      lockIds:
          (json.valueEnsureAsList<dynamic>(
            'lock_ids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
      endEpoch: json.valueAsBigInt<BigInt?>('end_epoch', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'coins': coins.map((e) => e.toJson()).toList()};
  }

  factory RewardsEstResponse.fromJson(Map<String, dynamic> json) {
    return RewardsEstResponse(
      coins:
          (json.valueEnsureAsList<dynamic>('coins', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.Coin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryAllGroupsRequest.fromJson(Map<String, dynamic> json) {
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
  Map<String, dynamic> toJson() {
    return {'groups': groups.map((e) => e.toJson()).toList()};
  }

  factory QueryAllGroupsResponse.fromJson(Map<String, dynamic> json) {
    return QueryAllGroupsResponse(
      groups:
          (json.valueEnsureAsList<dynamic>('groups', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_incentives_group.Group,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => osmosis_incentives_group.Group.fromJson(v),
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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryAllGroupsGaugesRequest.fromJson(Map<String, dynamic> json) {
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
  Map<String, dynamic> toJson() {
    return {'gauges': gauges.map((e) => e.toJson()).toList()};
  }

  factory QueryAllGroupsGaugesResponse.fromJson(Map<String, dynamic> json) {
    return QueryAllGroupsGaugesResponse(
      gauges:
          (json.valueEnsureAsList<dynamic>('gauges', acceptCamelCase: true))
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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryAllGroupsWithGaugeRequest.fromJson(Map<String, dynamic> json) {
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
  Map<String, dynamic> toJson() {
    return {
      'groups_with_gauge': groupsWithGauge.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryAllGroupsWithGaugeResponse.fromJson(Map<String, dynamic> json) {
    return QueryAllGroupsWithGaugeResponse(
      groupsWithGauge:
          (json.valueEnsureAsList<dynamic>(
                'groups_with_gauge',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_incentives_group.GroupsWithGauge,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) =>
                          osmosis_incentives_group.GroupsWithGauge.fromJson(v),
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
  Map<String, dynamic> toJson() {
    return {'id': id?.toString()};
  }

  factory QueryGroupByGroupGaugeIDRequest.fromJson(Map<String, dynamic> json) {
    return QueryGroupByGroupGaugeIDRequest(
      id: json.valueAsBigInt<BigInt?>('id', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'group': group?.toJson()};
  }

  factory QueryGroupByGroupGaugeIDResponse.fromJson(Map<String, dynamic> json) {
    return QueryGroupByGroupGaugeIDResponse(
      group: json
          .valueTo<osmosis_incentives_group.Group?, Map<String, dynamic>>(
            key: 'group',
            parse: (v) => osmosis_incentives_group.Group.fromJson(v),
            acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'group_gauge_id': groupGaugeId?.toString()};
  }

  factory QueryCurrentWeightByGroupGaugeIDRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryCurrentWeightByGroupGaugeIDRequest(
      groupGaugeId: json.valueAsBigInt<BigInt?>(
        'group_gauge_id',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'gauge_weight': gaugeWeight.map((e) => e.toJson()).toList()};
  }

  factory QueryCurrentWeightByGroupGaugeIDResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryCurrentWeightByGroupGaugeIDResponse(
      gaugeWeight:
          (json.valueEnsureAsList<dynamic>(
                'gauge_weight',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<GaugeWeight, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => GaugeWeight.fromJson(v),
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
  Map<String, dynamic> toJson() {
    return {'gauge_id': gaugeId?.toString(), 'weight_ratio': weightRatio};
  }

  factory GaugeWeight.fromJson(Map<String, dynamic> json) {
    return GaugeWeight(
      gaugeId: json.valueAsBigInt<BigInt?>('gauge_id', acceptCamelCase: true),
      weightRatio: json.valueAsString<String?>(
        'weight_ratio',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'pagination': pagination?.toJson()};
  }

  factory QueryInternalGaugesRequest.fromJson(Map<String, dynamic> json) {
    return QueryInternalGaugesRequest(
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
  Map<String, dynamic> toJson() {
    return {
      'gauges': gauges.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryInternalGaugesResponse.fromJson(Map<String, dynamic> json) {
    return QueryInternalGaugesResponse(
      gauges:
          (json.valueEnsureAsList<dynamic>('gauges', acceptCamelCase: true))
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
  Map<String, dynamic> toJson() {
    return {'pagination': pagination?.toJson()};
  }

  factory QueryExternalGaugesRequest.fromJson(Map<String, dynamic> json) {
    return QueryExternalGaugesRequest(
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
  Map<String, dynamic> toJson() {
    return {
      'gauges': gauges.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryExternalGaugesResponse.fromJson(Map<String, dynamic> json) {
    return QueryExternalGaugesResponse(
      gauges:
          (json.valueEnsureAsList<dynamic>('gauges', acceptCamelCase: true))
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
  Map<String, dynamic> toJson() {
    return {'id': id?.toString(), 'pagination': pagination?.toJson()};
  }

  factory QueryGaugesByPoolIDRequest.fromJson(Map<String, dynamic> json) {
    return QueryGaugesByPoolIDRequest(
      id: json.valueAsBigInt<BigInt?>('id', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {
      'gauges': gauges.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryGaugesByPoolIDResponse.fromJson(Map<String, dynamic> json) {
    return QueryGaugesByPoolIDResponse(
      gauges:
          (json.valueEnsureAsList<dynamic>('gauges', acceptCamelCase: true))
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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory ParamsRequest.fromJson(Map<String, dynamic> json) {
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
  Map<String, dynamic> toJson() {
    return {'params': params?.toJson()};
  }

  factory ParamsResponse.fromJson(Map<String, dynamic> json) {
    return ParamsResponse(
      params: json
          .valueTo<osmosis_incentives_params.Params?, Map<String, dynamic>>(
            key: 'params',
            parse: (v) => osmosis_incentives_params.Params.fromJson(v),
            acceptCamelCase: true,
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
