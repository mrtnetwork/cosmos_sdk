import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/osmosis/protorev/v1beta1/src/params.dart"
    as osmosis_protorev_v1beta1_params;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/osmosis/protorev/v1beta1/src/protorev.dart"
    as osmosis_protorev_v1beta1_protorev;

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
          path: "/osmosis/protorev/params",
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
      DefaultCosmosProtoTypeUrl.osmosisProtorevV1beta1QueryParamsRequest;
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
  final osmosis_protorev_v1beta1_params.Params? params;

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
        osmosis_protorev_v1beta1_params.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse: (v) => osmosis_protorev_v1beta1_params.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<osmosis_protorev_v1beta1_params.Params?>(
        1,
        (b) => osmosis_protorev_v1beta1_params.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisProtorevV1beta1QueryParamsResponse;
}

/// QueryGetProtoRevNumberOfTradesRequest is request type for the
/// Query/GetProtoRevNumberOfTrades RPC method.
class QueryGetProtoRevNumberOfTradesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGetProtoRevNumberOfTradesResponse> {
  const QueryGetProtoRevNumberOfTradesRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/protorev/number_of_trades",
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

  factory QueryGetProtoRevNumberOfTradesRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevNumberOfTradesRequest();
  }

  factory QueryGetProtoRevNumberOfTradesRequest.deserialize(List<int> bytes) {
    return QueryGetProtoRevNumberOfTradesRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisProtorevV1beta1QueryGetProtoRevNumberOfTradesRequest;
  @override
  QueryGetProtoRevNumberOfTradesResponse onQueryResponse(List<int> bytes) {
    return QueryGetProtoRevNumberOfTradesResponse.deserialize(bytes);
  }

  @override
  QueryGetProtoRevNumberOfTradesResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevNumberOfTradesResponse.fromJson(json);
  }
}

/// QueryGetProtoRevNumberOfTradesResponse is response type for the
/// Query/GetProtoRevNumberOfTrades RPC method.
class QueryGetProtoRevNumberOfTradesResponse extends CosmosProtoMessage {
  /// number_of_trades is the number of trades the module has executed
  final String? numberOfTrades;

  const QueryGetProtoRevNumberOfTradesResponse({this.numberOfTrades});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [numberOfTrades];

  @override
  Map<String, dynamic> toJson() {
    return {'number_of_trades': numberOfTrades};
  }

  factory QueryGetProtoRevNumberOfTradesResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevNumberOfTradesResponse(
      numberOfTrades: json.valueAsString<String?>(
        'number_of_trades',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryGetProtoRevNumberOfTradesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetProtoRevNumberOfTradesResponse(
      numberOfTrades: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisProtorevV1beta1QueryGetProtoRevNumberOfTradesResponse;
}

/// QueryGetProtoRevProfitsByDenomRequest is request type for the
/// Query/GetProtoRevProfitsByDenom RPC method.
class QueryGetProtoRevProfitsByDenomRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGetProtoRevProfitsByDenomResponse> {
  /// denom is the denom to query profits by
  final String? denom;

  const QueryGetProtoRevProfitsByDenomRequest({this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/protorev/profits_by_denom",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [denom];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom};
  }

  factory QueryGetProtoRevProfitsByDenomRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevProfitsByDenomRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory QueryGetProtoRevProfitsByDenomRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetProtoRevProfitsByDenomRequest(
      denom: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisProtorevV1beta1QueryGetProtoRevProfitsByDenomRequest;
  @override
  QueryGetProtoRevProfitsByDenomResponse onQueryResponse(List<int> bytes) {
    return QueryGetProtoRevProfitsByDenomResponse.deserialize(bytes);
  }

  @override
  QueryGetProtoRevProfitsByDenomResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevProfitsByDenomResponse.fromJson(json);
  }
}

/// QueryGetProtoRevProfitsByDenomResponse is response type for the
/// Query/GetProtoRevProfitsByDenom RPC method.
class QueryGetProtoRevProfitsByDenomResponse extends CosmosProtoMessage {
  /// profit is the profits of the module by the selected denom
  final cosmos_base_v1beta1_coin.Coin? profit;

  const QueryGetProtoRevProfitsByDenomResponse({this.profit});

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
  List<Object?> get protoValues => [profit];

  @override
  Map<String, dynamic> toJson() {
    return {'profit': profit?.toJson()};
  }

  factory QueryGetProtoRevProfitsByDenomResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevProfitsByDenomResponse(
      profit: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'profit',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryGetProtoRevProfitsByDenomResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetProtoRevProfitsByDenomResponse(
      profit: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        1,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisProtorevV1beta1QueryGetProtoRevProfitsByDenomResponse;
}

/// QueryGetProtoRevAllProfitsRequest is request type for the
/// Query/GetProtoRevAllProfits RPC method.
class QueryGetProtoRevAllProfitsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGetProtoRevAllProfitsResponse> {
  const QueryGetProtoRevAllProfitsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/protorev/all_profits",
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

  factory QueryGetProtoRevAllProfitsRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevAllProfitsRequest();
  }

  factory QueryGetProtoRevAllProfitsRequest.deserialize(List<int> bytes) {
    return QueryGetProtoRevAllProfitsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisProtorevV1beta1QueryGetProtoRevAllProfitsRequest;
  @override
  QueryGetProtoRevAllProfitsResponse onQueryResponse(List<int> bytes) {
    return QueryGetProtoRevAllProfitsResponse.deserialize(bytes);
  }

  @override
  QueryGetProtoRevAllProfitsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevAllProfitsResponse.fromJson(json);
  }
}

/// QueryGetProtoRevAllProfitsResponse is response type for the
/// Query/GetProtoRevAllProfits RPC method.
class QueryGetProtoRevAllProfitsResponse extends CosmosProtoMessage {
  /// profits is a list of all of the profits from the module
  final List<cosmos_base_v1beta1_coin.Coin> profits;

  const QueryGetProtoRevAllProfitsResponse({this.profits = const []});

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
  List<Object?> get protoValues => [profits];

  @override
  Map<String, dynamic> toJson() {
    return {'profits': profits.map((e) => e.toJson()).toList()};
  }

  factory QueryGetProtoRevAllProfitsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevAllProfitsResponse(
      profits:
          (json.valueEnsureAsList<dynamic>('profits', acceptCamelCase: true))
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

  factory QueryGetProtoRevAllProfitsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetProtoRevAllProfitsResponse(
      profits:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisProtorevV1beta1QueryGetProtoRevAllProfitsResponse;
}

/// QueryGetProtoRevStatisticsByPoolRequest is request type for the
/// Query/GetProtoRevStatisticsByRoute RPC method.
class QueryGetProtoRevStatisticsByRouteRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGetProtoRevStatisticsByRouteResponse> {
  /// route is the set of pool ids to query statistics by i.e. 1,2,3
  final List<BigInt> route;

  const QueryGetProtoRevStatisticsByRouteRequest({this.route = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/protorev/statistics_by_route",
        ),
      ],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.uint64,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [route];

  @override
  Map<String, dynamic> toJson() {
    return {'route': route.map((e) => e.toString()).toList()};
  }

  factory QueryGetProtoRevStatisticsByRouteRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevStatisticsByRouteRequest(
      route:
          (json.valueEnsureAsList<dynamic>(
            'route',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
    );
  }

  factory QueryGetProtoRevStatisticsByRouteRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetProtoRevStatisticsByRouteRequest(
      route: decode.getListOrEmpty<BigInt>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisProtorevV1beta1QueryGetProtoRevStatisticsByRouteRequest;
  @override
  QueryGetProtoRevStatisticsByRouteResponse onQueryResponse(List<int> bytes) {
    return QueryGetProtoRevStatisticsByRouteResponse.deserialize(bytes);
  }

  @override
  QueryGetProtoRevStatisticsByRouteResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevStatisticsByRouteResponse.fromJson(json);
  }
}

/// QueryGetProtoRevStatisticsByRouteResponse is response type for the
/// Query/GetProtoRevStatisticsByRoute RPC method.
class QueryGetProtoRevStatisticsByRouteResponse extends CosmosProtoMessage {
  /// statistics contains the number of trades the module has executed after a
  /// swap on a given pool and the profits from the trades
  final osmosis_protorev_v1beta1_protorev.RouteStatistics? statistics;

  const QueryGetProtoRevStatisticsByRouteResponse({this.statistics});

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
  List<Object?> get protoValues => [statistics];

  @override
  Map<String, dynamic> toJson() {
    return {'statistics': statistics?.toJson()};
  }

  factory QueryGetProtoRevStatisticsByRouteResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevStatisticsByRouteResponse(
      statistics: json.valueTo<
        osmosis_protorev_v1beta1_protorev.RouteStatistics?,
        Map<String, dynamic>
      >(
        key: 'statistics',
        parse:
            (v) =>
                osmosis_protorev_v1beta1_protorev.RouteStatistics.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryGetProtoRevStatisticsByRouteResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetProtoRevStatisticsByRouteResponse(
      statistics: decode.messageTo<
        osmosis_protorev_v1beta1_protorev.RouteStatistics?
      >(
        1,
        (b) => osmosis_protorev_v1beta1_protorev.RouteStatistics.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisProtorevV1beta1QueryGetProtoRevStatisticsByRouteResponse;
}

/// QueryGetProtoRevAllRouteStatisticsRequest is request type for the
/// Query/GetProtoRevAllRouteStatistics RPC method.
class QueryGetProtoRevAllRouteStatisticsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGetProtoRevAllRouteStatisticsResponse> {
  const QueryGetProtoRevAllRouteStatisticsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/protorev/all_route_statistics",
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

  factory QueryGetProtoRevAllRouteStatisticsRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevAllRouteStatisticsRequest();
  }

  factory QueryGetProtoRevAllRouteStatisticsRequest.deserialize(
    List<int> bytes,
  ) {
    return QueryGetProtoRevAllRouteStatisticsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisProtorevV1beta1QueryGetProtoRevAllRouteStatisticsRequest;
  @override
  QueryGetProtoRevAllRouteStatisticsResponse onQueryResponse(List<int> bytes) {
    return QueryGetProtoRevAllRouteStatisticsResponse.deserialize(bytes);
  }

  @override
  QueryGetProtoRevAllRouteStatisticsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevAllRouteStatisticsResponse.fromJson(json);
  }
}

/// QueryGetProtoRevAllRouteStatisticsResponse is response type for the
/// Query/GetProtoRevAllRouteStatistics RPC method.
class QueryGetProtoRevAllRouteStatisticsResponse extends CosmosProtoMessage {
  /// statistics contains the number of trades/profits the module has executed on
  /// all routes it has successfully executed a trade on
  final List<osmosis_protorev_v1beta1_protorev.RouteStatistics> statistics;

  const QueryGetProtoRevAllRouteStatisticsResponse({
    this.statistics = const [],
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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [statistics];

  @override
  Map<String, dynamic> toJson() {
    return {'statistics': statistics.map((e) => e.toJson()).toList()};
  }

  factory QueryGetProtoRevAllRouteStatisticsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevAllRouteStatisticsResponse(
      statistics:
          (json.valueEnsureAsList<dynamic>('statistics', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_protorev_v1beta1_protorev.RouteStatistics,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => osmosis_protorev_v1beta1_protorev
                          .RouteStatistics.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryGetProtoRevAllRouteStatisticsResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetProtoRevAllRouteStatisticsResponse(
      statistics:
          decode
              .getListOfBytes(1)
              .map(
                (b) => osmosis_protorev_v1beta1_protorev
                    .RouteStatistics.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisProtorevV1beta1QueryGetProtoRevAllRouteStatisticsResponse;
}

/// QueryGetProtoRevTokenPairArbRoutesRequest is request type for the
/// Query/GetProtoRevTokenPairArbRoutes RPC method.
class QueryGetProtoRevTokenPairArbRoutesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGetProtoRevTokenPairArbRoutesResponse> {
  const QueryGetProtoRevTokenPairArbRoutesRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/protorev/token_pair_arb_routes",
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

  factory QueryGetProtoRevTokenPairArbRoutesRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevTokenPairArbRoutesRequest();
  }

  factory QueryGetProtoRevTokenPairArbRoutesRequest.deserialize(
    List<int> bytes,
  ) {
    return QueryGetProtoRevTokenPairArbRoutesRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisProtorevV1beta1QueryGetProtoRevTokenPairArbRoutesRequest;
  @override
  QueryGetProtoRevTokenPairArbRoutesResponse onQueryResponse(List<int> bytes) {
    return QueryGetProtoRevTokenPairArbRoutesResponse.deserialize(bytes);
  }

  @override
  QueryGetProtoRevTokenPairArbRoutesResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevTokenPairArbRoutesResponse.fromJson(json);
  }
}

/// QueryGetProtoRevTokenPairArbRoutesResponse is response type for the
/// Query/GetProtoRevTokenPairArbRoutes RPC method.
class QueryGetProtoRevTokenPairArbRoutesResponse extends CosmosProtoMessage {
  /// routes is a list of all of the hot routes that the module is currently
  /// arbitraging
  final List<osmosis_protorev_v1beta1_protorev.TokenPairArbRoutes> routes;

  const QueryGetProtoRevTokenPairArbRoutesResponse({this.routes = const []});

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
  List<Object?> get protoValues => [routes];

  @override
  Map<String, dynamic> toJson() {
    return {'routes': routes.map((e) => e.toJson()).toList()};
  }

  factory QueryGetProtoRevTokenPairArbRoutesResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevTokenPairArbRoutesResponse(
      routes:
          (json.valueEnsureAsList<dynamic>('routes', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_protorev_v1beta1_protorev.TokenPairArbRoutes,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => osmosis_protorev_v1beta1_protorev
                          .TokenPairArbRoutes.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryGetProtoRevTokenPairArbRoutesResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetProtoRevTokenPairArbRoutesResponse(
      routes:
          decode
              .getListOfBytes(1)
              .map(
                (b) => osmosis_protorev_v1beta1_protorev
                    .TokenPairArbRoutes.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisProtorevV1beta1QueryGetProtoRevTokenPairArbRoutesResponse;
}

/// QueryGetProtoRevAdminAccountRequest is request type for the
/// Query/GetProtoRevAdminAccount RPC method.
class QueryGetProtoRevAdminAccountRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGetProtoRevAdminAccountResponse> {
  const QueryGetProtoRevAdminAccountRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/protorev/admin_account",
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

  factory QueryGetProtoRevAdminAccountRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevAdminAccountRequest();
  }

  factory QueryGetProtoRevAdminAccountRequest.deserialize(List<int> bytes) {
    return QueryGetProtoRevAdminAccountRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisProtorevV1beta1QueryGetProtoRevAdminAccountRequest;
  @override
  QueryGetProtoRevAdminAccountResponse onQueryResponse(List<int> bytes) {
    return QueryGetProtoRevAdminAccountResponse.deserialize(bytes);
  }

  @override
  QueryGetProtoRevAdminAccountResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevAdminAccountResponse.fromJson(json);
  }
}

/// QueryGetProtoRevAdminAccountResponse is response type for the
/// Query/GetProtoRevAdminAccount RPC method.
class QueryGetProtoRevAdminAccountResponse extends CosmosProtoMessage {
  /// admin_account is the admin account of the module
  final String? adminAccount;

  const QueryGetProtoRevAdminAccountResponse({this.adminAccount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [adminAccount];

  @override
  Map<String, dynamic> toJson() {
    return {'admin_account': adminAccount};
  }

  factory QueryGetProtoRevAdminAccountResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevAdminAccountResponse(
      adminAccount: json.valueAsString<String?>(
        'admin_account',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryGetProtoRevAdminAccountResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetProtoRevAdminAccountResponse(
      adminAccount: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisProtorevV1beta1QueryGetProtoRevAdminAccountResponse;
}

/// QueryGetProtoRevDeveloperAccountRequest is request type for the
/// Query/GetProtoRevDeveloperAccount RPC method.
class QueryGetProtoRevDeveloperAccountRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGetProtoRevDeveloperAccountResponse> {
  const QueryGetProtoRevDeveloperAccountRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/protorev/developer_account",
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

  factory QueryGetProtoRevDeveloperAccountRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevDeveloperAccountRequest();
  }

  factory QueryGetProtoRevDeveloperAccountRequest.deserialize(List<int> bytes) {
    return QueryGetProtoRevDeveloperAccountRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisProtorevV1beta1QueryGetProtoRevDeveloperAccountRequest;
  @override
  QueryGetProtoRevDeveloperAccountResponse onQueryResponse(List<int> bytes) {
    return QueryGetProtoRevDeveloperAccountResponse.deserialize(bytes);
  }

  @override
  QueryGetProtoRevDeveloperAccountResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevDeveloperAccountResponse.fromJson(json);
  }
}

/// QueryGetProtoRevDeveloperAccountResponse is response type for the
/// Query/GetProtoRevDeveloperAccount RPC method.
class QueryGetProtoRevDeveloperAccountResponse extends CosmosProtoMessage {
  /// developer_account is the developer account of the module
  final String? developerAccount;

  const QueryGetProtoRevDeveloperAccountResponse({this.developerAccount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [developerAccount];

  @override
  Map<String, dynamic> toJson() {
    return {'developer_account': developerAccount};
  }

  factory QueryGetProtoRevDeveloperAccountResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevDeveloperAccountResponse(
      developerAccount: json.valueAsString<String?>(
        'developer_account',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryGetProtoRevDeveloperAccountResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetProtoRevDeveloperAccountResponse(
      developerAccount: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisProtorevV1beta1QueryGetProtoRevDeveloperAccountResponse;
}

/// QueryGetProtoRevInfoByPoolTypeRequest is request type for the
/// Query/GetProtoRevInfoByPoolType RPC method.
class QueryGetProtoRevInfoByPoolTypeRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGetProtoRevInfoByPoolTypeResponse> {
  const QueryGetProtoRevInfoByPoolTypeRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/protorev/info_by_pool_type",
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

  factory QueryGetProtoRevInfoByPoolTypeRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevInfoByPoolTypeRequest();
  }

  factory QueryGetProtoRevInfoByPoolTypeRequest.deserialize(List<int> bytes) {
    return QueryGetProtoRevInfoByPoolTypeRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisProtorevV1beta1QueryGetProtoRevInfoByPoolTypeRequest;
  @override
  QueryGetProtoRevInfoByPoolTypeResponse onQueryResponse(List<int> bytes) {
    return QueryGetProtoRevInfoByPoolTypeResponse.deserialize(bytes);
  }

  @override
  QueryGetProtoRevInfoByPoolTypeResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevInfoByPoolTypeResponse.fromJson(json);
  }
}

/// QueryGetProtoRevInfoByPoolTypeResponse is response type for the
/// Query/GetProtoRevInfoByPoolType RPC method.
class QueryGetProtoRevInfoByPoolTypeResponse extends CosmosProtoMessage {
  /// InfoByPoolType contains all information pertaining to how different
  /// pool types are handled by the module.
  final osmosis_protorev_v1beta1_protorev.InfoByPoolType? infoByPoolType;

  const QueryGetProtoRevInfoByPoolTypeResponse({this.infoByPoolType});

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
  List<Object?> get protoValues => [infoByPoolType];

  @override
  Map<String, dynamic> toJson() {
    return {'info_by_pool_type': infoByPoolType?.toJson()};
  }

  factory QueryGetProtoRevInfoByPoolTypeResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevInfoByPoolTypeResponse(
      infoByPoolType: json.valueTo<
        osmosis_protorev_v1beta1_protorev.InfoByPoolType?,
        Map<String, dynamic>
      >(
        key: 'info_by_pool_type',
        parse:
            (v) => osmosis_protorev_v1beta1_protorev.InfoByPoolType.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryGetProtoRevInfoByPoolTypeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetProtoRevInfoByPoolTypeResponse(
      infoByPoolType: decode
          .messageTo<osmosis_protorev_v1beta1_protorev.InfoByPoolType?>(
            1,
            (b) =>
                osmosis_protorev_v1beta1_protorev.InfoByPoolType.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisProtorevV1beta1QueryGetProtoRevInfoByPoolTypeResponse;
}

/// QueryGetProtoRevMaxPoolPointsPerBlockRequest is request type for the
/// Query/GetProtoRevMaxPoolPointsPerBlock RPC method.
class QueryGetProtoRevMaxPoolPointsPerBlockRequest extends CosmosProtoMessage
    with
        ICosmosProtoQueryMessage<
          QueryGetProtoRevMaxPoolPointsPerBlockResponse
        > {
  const QueryGetProtoRevMaxPoolPointsPerBlockRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/protorev/max_pool_points_per_block",
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

  factory QueryGetProtoRevMaxPoolPointsPerBlockRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevMaxPoolPointsPerBlockRequest();
  }

  factory QueryGetProtoRevMaxPoolPointsPerBlockRequest.deserialize(
    List<int> bytes,
  ) {
    return QueryGetProtoRevMaxPoolPointsPerBlockRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisProtorevV1beta1QueryGetProtoRevMaxPoolPointsPerBlockRequest;
  @override
  QueryGetProtoRevMaxPoolPointsPerBlockResponse onQueryResponse(
    List<int> bytes,
  ) {
    return QueryGetProtoRevMaxPoolPointsPerBlockResponse.deserialize(bytes);
  }

  @override
  QueryGetProtoRevMaxPoolPointsPerBlockResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevMaxPoolPointsPerBlockResponse.fromJson(json);
  }
}

/// QueryGetProtoRevMaxPoolPointsPerBlockResponse is response type for the
/// Query/GetProtoRevMaxPoolPointsPerBlock RPC method.
class QueryGetProtoRevMaxPoolPointsPerBlockResponse extends CosmosProtoMessage {
  /// max_pool_points_per_block is the maximum number of pool points that can be
  /// consumed per block
  final BigInt? maxPoolPointsPerBlock;

  const QueryGetProtoRevMaxPoolPointsPerBlockResponse({
    this.maxPoolPointsPerBlock,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint64(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [maxPoolPointsPerBlock];

  @override
  Map<String, dynamic> toJson() {
    return {'max_pool_points_per_block': maxPoolPointsPerBlock?.toString()};
  }

  factory QueryGetProtoRevMaxPoolPointsPerBlockResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevMaxPoolPointsPerBlockResponse(
      maxPoolPointsPerBlock: json.valueAsBigInt<BigInt?>(
        'max_pool_points_per_block',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryGetProtoRevMaxPoolPointsPerBlockResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetProtoRevMaxPoolPointsPerBlockResponse(
      maxPoolPointsPerBlock: decode.getBigInt<BigInt?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisProtorevV1beta1QueryGetProtoRevMaxPoolPointsPerBlockResponse;
}

/// QueryGetProtoRevMaxPoolPointsPerTxRequest is request type for the
/// Query/GetProtoRevMaxPoolPointsPerTx RPC method.
class QueryGetProtoRevMaxPoolPointsPerTxRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGetProtoRevMaxPoolPointsPerTxResponse> {
  const QueryGetProtoRevMaxPoolPointsPerTxRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/protorev/max_pool_points_per_tx",
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

  factory QueryGetProtoRevMaxPoolPointsPerTxRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevMaxPoolPointsPerTxRequest();
  }

  factory QueryGetProtoRevMaxPoolPointsPerTxRequest.deserialize(
    List<int> bytes,
  ) {
    return QueryGetProtoRevMaxPoolPointsPerTxRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisProtorevV1beta1QueryGetProtoRevMaxPoolPointsPerTxRequest;
  @override
  QueryGetProtoRevMaxPoolPointsPerTxResponse onQueryResponse(List<int> bytes) {
    return QueryGetProtoRevMaxPoolPointsPerTxResponse.deserialize(bytes);
  }

  @override
  QueryGetProtoRevMaxPoolPointsPerTxResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevMaxPoolPointsPerTxResponse.fromJson(json);
  }
}

/// QueryGetProtoRevMaxPoolPointsPerTxResponse is response type for the
/// Query/GetProtoRevMaxPoolPointsPerTx RPC method.
class QueryGetProtoRevMaxPoolPointsPerTxResponse extends CosmosProtoMessage {
  /// max_pool_points_per_tx is the maximum number of pool points that can be
  /// consumed per transaction
  final BigInt? maxPoolPointsPerTx;

  const QueryGetProtoRevMaxPoolPointsPerTxResponse({this.maxPoolPointsPerTx});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint64(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [maxPoolPointsPerTx];

  @override
  Map<String, dynamic> toJson() {
    return {'max_pool_points_per_tx': maxPoolPointsPerTx?.toString()};
  }

  factory QueryGetProtoRevMaxPoolPointsPerTxResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevMaxPoolPointsPerTxResponse(
      maxPoolPointsPerTx: json.valueAsBigInt<BigInt?>(
        'max_pool_points_per_tx',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryGetProtoRevMaxPoolPointsPerTxResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetProtoRevMaxPoolPointsPerTxResponse(
      maxPoolPointsPerTx: decode.getBigInt<BigInt?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisProtorevV1beta1QueryGetProtoRevMaxPoolPointsPerTxResponse;
}

/// QueryGetProtoRevBaseDenomsRequest is request type for the
/// Query/GetProtoRevBaseDenoms RPC method.
class QueryGetProtoRevBaseDenomsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGetProtoRevBaseDenomsResponse> {
  const QueryGetProtoRevBaseDenomsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/protorev/base_denoms",
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

  factory QueryGetProtoRevBaseDenomsRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevBaseDenomsRequest();
  }

  factory QueryGetProtoRevBaseDenomsRequest.deserialize(List<int> bytes) {
    return QueryGetProtoRevBaseDenomsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisProtorevV1beta1QueryGetProtoRevBaseDenomsRequest;
  @override
  QueryGetProtoRevBaseDenomsResponse onQueryResponse(List<int> bytes) {
    return QueryGetProtoRevBaseDenomsResponse.deserialize(bytes);
  }

  @override
  QueryGetProtoRevBaseDenomsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevBaseDenomsResponse.fromJson(json);
  }
}

/// QueryGetProtoRevBaseDenomsResponse is response type for the
/// Query/GetProtoRevBaseDenoms RPC method.
class QueryGetProtoRevBaseDenomsResponse extends CosmosProtoMessage {
  /// base_denoms is a list of all of the base denoms and step sizes
  final List<osmosis_protorev_v1beta1_protorev.BaseDenom> baseDenoms;

  const QueryGetProtoRevBaseDenomsResponse({this.baseDenoms = const []});

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
  List<Object?> get protoValues => [baseDenoms];

  @override
  Map<String, dynamic> toJson() {
    return {'base_denoms': baseDenoms.map((e) => e.toJson()).toList()};
  }

  factory QueryGetProtoRevBaseDenomsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevBaseDenomsResponse(
      baseDenoms:
          (json.valueEnsureAsList<dynamic>(
                'base_denoms',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_protorev_v1beta1_protorev.BaseDenom,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => osmosis_protorev_v1beta1_protorev
                          .BaseDenom.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryGetProtoRevBaseDenomsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetProtoRevBaseDenomsResponse(
      baseDenoms:
          decode
              .getListOfBytes(1)
              .map(
                (b) =>
                    osmosis_protorev_v1beta1_protorev.BaseDenom.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisProtorevV1beta1QueryGetProtoRevBaseDenomsResponse;
}

/// QueryGetProtoRevEnabledRequest is request type for the
/// Query/GetProtoRevEnabled RPC method.
class QueryGetProtoRevEnabledRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGetProtoRevEnabledResponse> {
  const QueryGetProtoRevEnabledRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/protorev/enabled",
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

  factory QueryGetProtoRevEnabledRequest.fromJson(Map<String, dynamic> json) {
    return QueryGetProtoRevEnabledRequest();
  }

  factory QueryGetProtoRevEnabledRequest.deserialize(List<int> bytes) {
    return QueryGetProtoRevEnabledRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisProtorevV1beta1QueryGetProtoRevEnabledRequest;
  @override
  QueryGetProtoRevEnabledResponse onQueryResponse(List<int> bytes) {
    return QueryGetProtoRevEnabledResponse.deserialize(bytes);
  }

  @override
  QueryGetProtoRevEnabledResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetProtoRevEnabledResponse.fromJson(json);
  }
}

/// QueryGetProtoRevEnabledResponse is response type for the
/// Query/GetProtoRevEnabled RPC method.
class QueryGetProtoRevEnabledResponse extends CosmosProtoMessage {
  /// enabled is whether the module is enabled
  final bool? enabled;

  const QueryGetProtoRevEnabledResponse({this.enabled});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bool(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [enabled];

  @override
  Map<String, dynamic> toJson() {
    return {'enabled': enabled};
  }

  factory QueryGetProtoRevEnabledResponse.fromJson(Map<String, dynamic> json) {
    return QueryGetProtoRevEnabledResponse(
      enabled: json.valueAsBool<bool?>('enabled', acceptCamelCase: true),
    );
  }

  factory QueryGetProtoRevEnabledResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetProtoRevEnabledResponse(enabled: decode.getBool<bool?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisProtorevV1beta1QueryGetProtoRevEnabledResponse;
}

/// QueryGetProtoRevPoolRequest is request type for the
/// Query/GetProtoRevPool RPC method.
class QueryGetProtoRevPoolRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGetProtoRevPoolResponse> {
  /// base_denom is the base denom set in protorev for the denom pair to pool
  /// mapping
  final String? baseDenom;

  /// other_denom is the other denom for the denom pair to pool mapping
  final String? otherDenom;

  const QueryGetProtoRevPoolRequest({this.baseDenom, this.otherDenom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/protorev/pool",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [baseDenom, otherDenom];

  @override
  Map<String, dynamic> toJson() {
    return {'base_denom': baseDenom, 'other_denom': otherDenom};
  }

  factory QueryGetProtoRevPoolRequest.fromJson(Map<String, dynamic> json) {
    return QueryGetProtoRevPoolRequest(
      baseDenom: json.valueAsString<String?>(
        'base_denom',
        acceptCamelCase: true,
      ),
      otherDenom: json.valueAsString<String?>(
        'other_denom',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryGetProtoRevPoolRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetProtoRevPoolRequest(
      baseDenom: decode.getString<String?>(1),
      otherDenom: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisProtorevV1beta1QueryGetProtoRevPoolRequest;
  @override
  QueryGetProtoRevPoolResponse onQueryResponse(List<int> bytes) {
    return QueryGetProtoRevPoolResponse.deserialize(bytes);
  }

  @override
  QueryGetProtoRevPoolResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryGetProtoRevPoolResponse.fromJson(json);
  }
}

/// QueryGetProtoRevPoolResponse is response type for the
/// Query/GetProtoRevPool RPC method.
class QueryGetProtoRevPoolResponse extends CosmosProtoMessage {
  /// pool_id is the pool_id stored for the denom pair
  final BigInt? poolId;

  const QueryGetProtoRevPoolResponse({this.poolId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint64(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [poolId];

  @override
  Map<String, dynamic> toJson() {
    return {'pool_id': poolId?.toString()};
  }

  factory QueryGetProtoRevPoolResponse.fromJson(Map<String, dynamic> json) {
    return QueryGetProtoRevPoolResponse(
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
    );
  }

  factory QueryGetProtoRevPoolResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetProtoRevPoolResponse(poolId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisProtorevV1beta1QueryGetProtoRevPoolResponse;
}

class QueryGetAllProtocolRevenueRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGetAllProtocolRevenueResponse> {
  const QueryGetAllProtocolRevenueRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/protorev/all_protocol_revenue",
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

  factory QueryGetAllProtocolRevenueRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetAllProtocolRevenueRequest();
  }

  factory QueryGetAllProtocolRevenueRequest.deserialize(List<int> bytes) {
    return QueryGetAllProtocolRevenueRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisProtorevV1beta1QueryGetAllProtocolRevenueRequest;
  @override
  QueryGetAllProtocolRevenueResponse onQueryResponse(List<int> bytes) {
    return QueryGetAllProtocolRevenueResponse.deserialize(bytes);
  }

  @override
  QueryGetAllProtocolRevenueResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetAllProtocolRevenueResponse.fromJson(json);
  }
}

class QueryGetAllProtocolRevenueResponse extends CosmosProtoMessage {
  final osmosis_protorev_v1beta1_protorev.AllProtocolRevenue?
  allProtocolRevenue;

  const QueryGetAllProtocolRevenueResponse({this.allProtocolRevenue});

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
  List<Object?> get protoValues => [allProtocolRevenue];

  @override
  Map<String, dynamic> toJson() {
    return {'all_protocol_revenue': allProtocolRevenue?.toJson()};
  }

  factory QueryGetAllProtocolRevenueResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetAllProtocolRevenueResponse(
      allProtocolRevenue: json.valueTo<
        osmosis_protorev_v1beta1_protorev.AllProtocolRevenue?,
        Map<String, dynamic>
      >(
        key: 'all_protocol_revenue',
        parse:
            (v) => osmosis_protorev_v1beta1_protorev
                .AllProtocolRevenue.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryGetAllProtocolRevenueResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetAllProtocolRevenueResponse(
      allProtocolRevenue: decode
          .messageTo<osmosis_protorev_v1beta1_protorev.AllProtocolRevenue?>(
            1,
            (b) => osmosis_protorev_v1beta1_protorev
                .AllProtocolRevenue.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisProtorevV1beta1QueryGetAllProtocolRevenueResponse;
}
