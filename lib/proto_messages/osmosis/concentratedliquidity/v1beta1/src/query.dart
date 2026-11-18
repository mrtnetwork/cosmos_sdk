import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;
import "package:cosmos_sdk/proto_messages/osmosis/concentratedliquidity/v1beta1/src/position.dart"
    as osmosis_concentratedliquidity_v1beta1_position;
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;
import "package:cosmos_sdk/proto_messages/osmosis/concentratedliquidity/src/params.dart"
    as osmosis_concentratedliquidity_params;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/osmosis/concentratedliquidity/v1beta1/src/tick_info.dart"
    as osmosis_concentratedliquidity_v1beta1_tick_info;
import "package:cosmos_sdk/proto_messages/osmosis/concentratedliquidity/v1beta1/src/incentive_record.dart"
    as osmosis_concentratedliquidity_v1beta1_incentive_record;

/// =============================== UserPositions
class UserPositionsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<UserPositionsResponse> {
  final String? address;

  final BigInt? poolId;

  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const UserPositionsRequest({this.address, this.poolId, this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/concentratedliquidity/v1beta1/positions/{address}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
        ProtoFieldConfig.message(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [address, poolId, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'address': address,
      'pool_id': config.encodeBigint(poolId),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory UserPositionsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return UserPositionsRequest(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      poolId: json.valueAsBigInt<BigInt?>(
        'pool_id',
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

  factory UserPositionsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return UserPositionsRequest(
      address: decode.getString<String?>(1),
      poolId: decode.getBigInt<BigInt?>(2),
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
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1UserPositionsRequest;
  @override
  UserPositionsResponse onQueryResponse(List<int> bytes) {
    return UserPositionsResponse.deserialize(bytes);
  }

  @override
  UserPositionsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return UserPositionsResponse.fromJson(json);
  }
}

class UserPositionsResponse extends CosmosProtoMessage {
  final List<
    osmosis_concentratedliquidity_v1beta1_position.FullPositionBreakdown
  >
  positions;

  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const UserPositionsResponse({this.positions = const [], this.pagination});

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
  List<Object?> get protoValues => [positions, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'positions': positions.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory UserPositionsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return UserPositionsResponse(
      positions:
          (json.valueEnsureAsList<dynamic>(
                'positions',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_concentratedliquidity_v1beta1_position.FullPositionBreakdown,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => osmosis_concentratedliquidity_v1beta1_position
                          .FullPositionBreakdown.fromJson(
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

  factory UserPositionsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return UserPositionsResponse(
      positions:
          decode
              .getListOfBytes(1)
              .map(
                (b) => osmosis_concentratedliquidity_v1beta1_position
                    .FullPositionBreakdown.deserialize(b),
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
          .osmosisConcentratedliquidityV1beta1UserPositionsResponse;
}

/// =============================== PositionById
class PositionByIdRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<PositionByIdResponse> {
  final BigInt? positionId;

  const PositionByIdRequest({this.positionId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/concentratedliquidity/v1beta1/position_by_id",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [positionId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'position_id': config.encodeBigint(positionId)};
  }

  factory PositionByIdRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return PositionByIdRequest(
      positionId: json.valueAsBigInt<BigInt?>(
        'position_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory PositionByIdRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PositionByIdRequest(positionId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1PositionByIdRequest;
  @override
  PositionByIdResponse onQueryResponse(List<int> bytes) {
    return PositionByIdResponse.deserialize(bytes);
  }

  @override
  PositionByIdResponse onQueryResponseJson(Map<String, dynamic> json) {
    return PositionByIdResponse.fromJson(json);
  }
}

class PositionByIdResponse extends CosmosProtoMessage {
  final osmosis_concentratedliquidity_v1beta1_position.FullPositionBreakdown?
  position;

  const PositionByIdResponse({this.position});

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
  List<Object?> get protoValues => [position];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'position': config.encodeMessage(position)};
  }

  factory PositionByIdResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return PositionByIdResponse(
      position: json.valueTo<
        osmosis_concentratedliquidity_v1beta1_position.FullPositionBreakdown?,
        Object
      >(
        key: 'position',
        parse:
            (v) => osmosis_concentratedliquidity_v1beta1_position
                .FullPositionBreakdown.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory PositionByIdResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PositionByIdResponse(
      position: decode.messageTo<
        osmosis_concentratedliquidity_v1beta1_position.FullPositionBreakdown?
      >(
        1,
        (b) => osmosis_concentratedliquidity_v1beta1_position
            .FullPositionBreakdown.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1PositionByIdResponse;
}

/// =============================== Pools
class PoolsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<PoolsResponse> {
  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const PoolsRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/concentratedliquidity/v1beta1/pools",
        ),
      ],
      fields: [ProtoFieldConfig.message(2)],
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

  factory PoolsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return PoolsRequest(
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

  factory PoolsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PoolsRequest(
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
      DefaultCosmosProtoTypeUrl.osmosisConcentratedliquidityV1beta1PoolsRequest;
  @override
  PoolsResponse onQueryResponse(List<int> bytes) {
    return PoolsResponse.deserialize(bytes);
  }

  @override
  PoolsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return PoolsResponse.fromJson(json);
  }
}

class PoolsResponse extends CosmosProtoMessage {
  final List<google_protobuf_any.Any> pools;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const PoolsResponse({this.pools = const [], this.pagination});

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
  List<Object?> get protoValues => [pools, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'pools': pools.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory PoolsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return PoolsResponse(
      pools:
          (json.valueEnsureAsList<dynamic>(
                'pools',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<google_protobuf_any.Any, Object>(
                  value: e,
                  parse:
                      (v) => google_protobuf_any.Any.fromJson(
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

  factory PoolsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PoolsResponse(
      pools:
          decode
              .getListOfBytes(1)
              .map((b) => google_protobuf_any.Any.deserialize(b))
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
          .osmosisConcentratedliquidityV1beta1PoolsResponse;
}

/// =============================== ModuleParams
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
          path: "/osmosis/concentratedliquidity/v1beta1/params",
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
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1ParamsRequest;
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
  final osmosis_concentratedliquidity_params.Params? params;

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
      params: json
          .valueTo<osmosis_concentratedliquidity_params.Params?, Object>(
            key: 'params',
            parse:
                (v) => osmosis_concentratedliquidity_params.Params.fromJson(
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
      params: decode.messageTo<osmosis_concentratedliquidity_params.Params?>(
        1,
        (b) => osmosis_concentratedliquidity_params.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1ParamsResponse;
}

class TickLiquidityNet extends CosmosProtoMessage {
  final String? liquidityNet;

  final BigInt? tickIndex;

  const TickLiquidityNet({this.liquidityNet, this.tickIndex});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.int64(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [liquidityNet, tickIndex];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'liquidity_net': liquidityNet,
      'tick_index': config.encodeBigint(tickIndex),
    };
  }

  factory TickLiquidityNet.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return TickLiquidityNet(
      liquidityNet: json.valueAsString<String?>(
        'liquidity_net',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      tickIndex: json.valueAsBigInt<BigInt?>(
        'tick_index',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory TickLiquidityNet.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TickLiquidityNet(
      liquidityNet: decode.getString<String?>(1),
      tickIndex: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1TickLiquidityNet;
}

class LiquidityDepthWithRange extends CosmosProtoMessage {
  final String? liquidityAmount;

  final BigInt? lowerTick;

  final BigInt? upperTick;

  const LiquidityDepthWithRange({
    this.liquidityAmount,
    this.lowerTick,
    this.upperTick,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.int64(2, options: const []),
        ProtoFieldConfig.int64(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [liquidityAmount, lowerTick, upperTick];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'liquidity_amount': liquidityAmount,
      'lower_tick': config.encodeBigint(lowerTick),
      'upper_tick': config.encodeBigint(upperTick),
    };
  }

  factory LiquidityDepthWithRange.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return LiquidityDepthWithRange(
      liquidityAmount: json.valueAsString<String?>(
        'liquidity_amount',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      lowerTick: json.valueAsBigInt<BigInt?>(
        'lower_tick',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      upperTick: json.valueAsBigInt<BigInt?>(
        'upper_tick',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory LiquidityDepthWithRange.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return LiquidityDepthWithRange(
      liquidityAmount: decode.getString<String?>(1),
      lowerTick: decode.getBigInt<BigInt?>(2),
      upperTick: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1LiquidityDepthWithRange;
}

/// =============================== LiquidityNetInDirection
class LiquidityNetInDirectionRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<LiquidityNetInDirectionResponse> {
  final BigInt? poolId;

  final String? tokenIn;

  final BigInt? startTick;

  final bool? useCurTick;

  final BigInt? boundTick;

  final bool? useNoBound;

  const LiquidityNetInDirectionRequest({
    this.poolId,
    this.tokenIn,
    this.startTick,
    this.useCurTick,
    this.boundTick,
    this.useNoBound,
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
              "/osmosis/concentratedliquidity/v1beta1/liquidity_net_in_direction",
        ),
      ],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.int64(3, options: const []),
        ProtoFieldConfig.bool(4, options: const []),
        ProtoFieldConfig.int64(5, options: const []),
        ProtoFieldConfig.bool(6, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    poolId,
    tokenIn,
    startTick,
    useCurTick,
    boundTick,
    useNoBound,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'pool_id': config.encodeBigint(poolId),
      'token_in': tokenIn,
      'start_tick': config.encodeBigint(startTick),
      'use_cur_tick': useCurTick,
      'bound_tick': config.encodeBigint(boundTick),
      'use_no_bound': useNoBound,
    };
  }

  factory LiquidityNetInDirectionRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return LiquidityNetInDirectionRequest(
      poolId: json.valueAsBigInt<BigInt?>(
        'pool_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      tokenIn: json.valueAsString<String?>(
        'token_in',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      startTick: json.valueAsBigInt<BigInt?>(
        'start_tick',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      useCurTick: json.valueAsBool<bool?>(
        'use_cur_tick',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      boundTick: json.valueAsBigInt<BigInt?>(
        'bound_tick',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      useNoBound: json.valueAsBool<bool?>(
        'use_no_bound',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory LiquidityNetInDirectionRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return LiquidityNetInDirectionRequest(
      poolId: decode.getBigInt<BigInt?>(1),
      tokenIn: decode.getString<String?>(2),
      startTick: decode.getBigInt<BigInt?>(3),
      useCurTick: decode.getBool<bool?>(4),
      boundTick: decode.getBigInt<BigInt?>(5),
      useNoBound: decode.getBool<bool?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1LiquidityNetInDirectionRequest;
  @override
  LiquidityNetInDirectionResponse onQueryResponse(List<int> bytes) {
    return LiquidityNetInDirectionResponse.deserialize(bytes);
  }

  @override
  LiquidityNetInDirectionResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return LiquidityNetInDirectionResponse.fromJson(json);
  }
}

class LiquidityNetInDirectionResponse extends CosmosProtoMessage {
  final List<TickLiquidityNet> liquidityDepths;

  final BigInt? currentTick;

  final String? currentLiquidity;

  final String? currentSqrtPrice;

  const LiquidityNetInDirectionResponse({
    this.liquidityDepths = const [],
    this.currentTick,
    this.currentLiquidity,
    this.currentSqrtPrice,
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
        ProtoFieldConfig.int64(2),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    liquidityDepths,
    currentTick,
    currentLiquidity,
    currentSqrtPrice,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'liquidity_depths':
          liquidityDepths.map((e) => config.encodeMessage(e)).toList(),
      'current_tick': config.encodeBigint(currentTick),
      'current_liquidity': currentLiquidity,
      'current_sqrt_price': currentSqrtPrice,
    };
  }

  factory LiquidityNetInDirectionResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return LiquidityNetInDirectionResponse(
      liquidityDepths:
          (json.valueEnsureAsList<dynamic>(
                'liquidity_depths',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<TickLiquidityNet, Object>(
                  value: e,
                  parse:
                      (v) => TickLiquidityNet.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      currentTick: json.valueAsBigInt<BigInt?>(
        'current_tick',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      currentLiquidity: json.valueAsString<String?>(
        'current_liquidity',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      currentSqrtPrice: json.valueAsString<String?>(
        'current_sqrt_price',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory LiquidityNetInDirectionResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return LiquidityNetInDirectionResponse(
      liquidityDepths:
          decode
              .getListOfBytes(1)
              .map((b) => TickLiquidityNet.deserialize(b))
              .toList(),
      currentTick: decode.getBigInt<BigInt?>(2),
      currentLiquidity: decode.getString<String?>(3),
      currentSqrtPrice: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1LiquidityNetInDirectionResponse;
}

/// =============================== LiquidityPerTickRange
class LiquidityPerTickRangeRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<LiquidityPerTickRangeResponse> {
  final BigInt? poolId;

  const LiquidityPerTickRangeRequest({this.poolId});

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
              "/osmosis/concentratedliquidity/v1beta1/liquidity_per_tick_range",
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

  factory LiquidityPerTickRangeRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return LiquidityPerTickRangeRequest(
      poolId: json.valueAsBigInt<BigInt?>(
        'pool_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory LiquidityPerTickRangeRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return LiquidityPerTickRangeRequest(poolId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1LiquidityPerTickRangeRequest;
  @override
  LiquidityPerTickRangeResponse onQueryResponse(List<int> bytes) {
    return LiquidityPerTickRangeResponse.deserialize(bytes);
  }

  @override
  LiquidityPerTickRangeResponse onQueryResponseJson(Map<String, dynamic> json) {
    return LiquidityPerTickRangeResponse.fromJson(json);
  }
}

class LiquidityPerTickRangeResponse extends CosmosProtoMessage {
  final List<LiquidityDepthWithRange> liquidity;

  final BigInt? bucketIndex;

  const LiquidityPerTickRangeResponse({
    this.liquidity = const [],
    this.bucketIndex,
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
        ProtoFieldConfig.int64(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [liquidity, bucketIndex];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'liquidity': liquidity.map((e) => config.encodeMessage(e)).toList(),
      'bucket_index': config.encodeBigint(bucketIndex),
    };
  }

  factory LiquidityPerTickRangeResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return LiquidityPerTickRangeResponse(
      liquidity:
          (json.valueEnsureAsList<dynamic>(
                'liquidity',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<LiquidityDepthWithRange, Object>(
                  value: e,
                  parse:
                      (v) => LiquidityDepthWithRange.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      bucketIndex: json.valueAsBigInt<BigInt?>(
        'bucket_index',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory LiquidityPerTickRangeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return LiquidityPerTickRangeResponse(
      liquidity:
          decode
              .getListOfBytes(1)
              .map((b) => LiquidityDepthWithRange.deserialize(b))
              .toList(),
      bucketIndex: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1LiquidityPerTickRangeResponse;
}

/// ===================== QueryClaimableSpreadRewards
class ClaimableSpreadRewardsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<ClaimableSpreadRewardsResponse> {
  final BigInt? positionId;

  const ClaimableSpreadRewardsRequest({this.positionId});

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
              "/osmosis/concentratedliquidity/v1beta1/claimable_spread_rewards",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [positionId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'position_id': config.encodeBigint(positionId)};
  }

  factory ClaimableSpreadRewardsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ClaimableSpreadRewardsRequest(
      positionId: json.valueAsBigInt<BigInt?>(
        'position_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory ClaimableSpreadRewardsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ClaimableSpreadRewardsRequest(
      positionId: decode.getBigInt<BigInt?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1ClaimableSpreadRewardsRequest;
  @override
  ClaimableSpreadRewardsResponse onQueryResponse(List<int> bytes) {
    return ClaimableSpreadRewardsResponse.deserialize(bytes);
  }

  @override
  ClaimableSpreadRewardsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return ClaimableSpreadRewardsResponse.fromJson(json);
  }
}

class ClaimableSpreadRewardsResponse extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> claimableSpreadRewards;

  const ClaimableSpreadRewardsResponse({
    this.claimableSpreadRewards = const [],
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
  List<Object?> get protoValues => [claimableSpreadRewards];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'claimable_spread_rewards':
          claimableSpreadRewards.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory ClaimableSpreadRewardsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ClaimableSpreadRewardsResponse(
      claimableSpreadRewards:
          (json.valueEnsureAsList<dynamic>(
                'claimable_spread_rewards',
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

  factory ClaimableSpreadRewardsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ClaimableSpreadRewardsResponse(
      claimableSpreadRewards:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1ClaimableSpreadRewardsResponse;
}

/// ===================== QueryClaimableIncentives
class ClaimableIncentivesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<ClaimableIncentivesResponse> {
  final BigInt? positionId;

  const ClaimableIncentivesRequest({this.positionId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/concentratedliquidity/v1beta1/claimable_incentives",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [positionId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'position_id': config.encodeBigint(positionId)};
  }

  factory ClaimableIncentivesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ClaimableIncentivesRequest(
      positionId: json.valueAsBigInt<BigInt?>(
        'position_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory ClaimableIncentivesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ClaimableIncentivesRequest(positionId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1ClaimableIncentivesRequest;
  @override
  ClaimableIncentivesResponse onQueryResponse(List<int> bytes) {
    return ClaimableIncentivesResponse.deserialize(bytes);
  }

  @override
  ClaimableIncentivesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return ClaimableIncentivesResponse.fromJson(json);
  }
}

class ClaimableIncentivesResponse extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> claimableIncentives;

  final List<cosmos_base_v1beta1_coin.Coin> forfeitedIncentives;

  const ClaimableIncentivesResponse({
    this.claimableIncentives = const [],
    this.forfeitedIncentives = const [],
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
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [claimableIncentives, forfeitedIncentives];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'claimable_incentives':
          claimableIncentives.map((e) => config.encodeMessage(e)).toList(),
      'forfeited_incentives':
          forfeitedIncentives.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory ClaimableIncentivesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ClaimableIncentivesResponse(
      claimableIncentives:
          (json.valueEnsureAsList<dynamic>(
                'claimable_incentives',
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
      forfeitedIncentives:
          (json.valueEnsureAsList<dynamic>(
                'forfeited_incentives',
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

  factory ClaimableIncentivesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ClaimableIncentivesResponse(
      claimableIncentives:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      forfeitedIncentives:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1ClaimableIncentivesResponse;
}

/// ===================== QueryPoolAccumulatorRewards
class PoolAccumulatorRewardsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<PoolAccumulatorRewardsResponse> {
  final BigInt? poolId;

  const PoolAccumulatorRewardsRequest({this.poolId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/concentratedliquidity/v1beta1/pool_accum_rewards",
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

  factory PoolAccumulatorRewardsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return PoolAccumulatorRewardsRequest(
      poolId: json.valueAsBigInt<BigInt?>(
        'pool_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory PoolAccumulatorRewardsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PoolAccumulatorRewardsRequest(poolId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1PoolAccumulatorRewardsRequest;
  @override
  PoolAccumulatorRewardsResponse onQueryResponse(List<int> bytes) {
    return PoolAccumulatorRewardsResponse.deserialize(bytes);
  }

  @override
  PoolAccumulatorRewardsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return PoolAccumulatorRewardsResponse.fromJson(json);
  }
}

class PoolAccumulatorRewardsResponse extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.DecCoin> spreadRewardGrowthGlobal;

  final List<osmosis_concentratedliquidity_v1beta1_tick_info.UptimeTracker>
  uptimeGrowthGlobal;

  const PoolAccumulatorRewardsResponse({
    this.spreadRewardGrowthGlobal = const [],
    this.uptimeGrowthGlobal = const [],
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
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    spreadRewardGrowthGlobal,
    uptimeGrowthGlobal,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'spread_reward_growth_global':
          spreadRewardGrowthGlobal.map((e) => config.encodeMessage(e)).toList(),
      'uptime_growth_global':
          uptimeGrowthGlobal.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory PoolAccumulatorRewardsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return PoolAccumulatorRewardsResponse(
      spreadRewardGrowthGlobal:
          (json.valueEnsureAsList<dynamic>(
                'spread_reward_growth_global',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.DecCoin,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => cosmos_base_v1beta1_coin.DecCoin.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      uptimeGrowthGlobal:
          (json.valueEnsureAsList<dynamic>(
                'uptime_growth_global',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_concentratedliquidity_v1beta1_tick_info.UptimeTracker,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => osmosis_concentratedliquidity_v1beta1_tick_info
                          .UptimeTracker.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory PoolAccumulatorRewardsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PoolAccumulatorRewardsResponse(
      spreadRewardGrowthGlobal:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.DecCoin.deserialize(b))
              .toList(),
      uptimeGrowthGlobal:
          decode
              .getListOfBytes(2)
              .map(
                (b) => osmosis_concentratedliquidity_v1beta1_tick_info
                    .UptimeTracker.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1PoolAccumulatorRewardsResponse;
}

/// ===================== QueryTickAccumulatorTrackers
class TickAccumulatorTrackersRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<TickAccumulatorTrackersResponse> {
  final BigInt? poolId;

  final BigInt? tickIndex;

  const TickAccumulatorTrackersRequest({this.poolId, this.tickIndex});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/concentratedliquidity/v1beta1/tick_accum_trackers",
        ),
      ],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.int64(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [poolId, tickIndex];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'pool_id': config.encodeBigint(poolId),
      'tick_index': config.encodeBigint(tickIndex),
    };
  }

  factory TickAccumulatorTrackersRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return TickAccumulatorTrackersRequest(
      poolId: json.valueAsBigInt<BigInt?>(
        'pool_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      tickIndex: json.valueAsBigInt<BigInt?>(
        'tick_index',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory TickAccumulatorTrackersRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TickAccumulatorTrackersRequest(
      poolId: decode.getBigInt<BigInt?>(1),
      tickIndex: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1TickAccumulatorTrackersRequest;
  @override
  TickAccumulatorTrackersResponse onQueryResponse(List<int> bytes) {
    return TickAccumulatorTrackersResponse.deserialize(bytes);
  }

  @override
  TickAccumulatorTrackersResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return TickAccumulatorTrackersResponse.fromJson(json);
  }
}

class TickAccumulatorTrackersResponse extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.DecCoin>
  spreadRewardGrowthOppositeDirectionOfLastTraversal;

  final List<osmosis_concentratedliquidity_v1beta1_tick_info.UptimeTracker>
  uptimeTrackers;

  const TickAccumulatorTrackersResponse({
    this.spreadRewardGrowthOppositeDirectionOfLastTraversal = const [],
    this.uptimeTrackers = const [],
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
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    spreadRewardGrowthOppositeDirectionOfLastTraversal,
    uptimeTrackers,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'spread_reward_growth_opposite_direction_of_last_traversal':
          spreadRewardGrowthOppositeDirectionOfLastTraversal
              .map((e) => config.encodeMessage(e))
              .toList(),
      'uptime_trackers':
          uptimeTrackers.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory TickAccumulatorTrackersResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return TickAccumulatorTrackersResponse(
      spreadRewardGrowthOppositeDirectionOfLastTraversal:
          (json.valueEnsureAsList<dynamic>(
                'spread_reward_growth_opposite_direction_of_last_traversal',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.DecCoin,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => cosmos_base_v1beta1_coin.DecCoin.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      uptimeTrackers:
          (json.valueEnsureAsList<dynamic>(
                'uptime_trackers',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_concentratedliquidity_v1beta1_tick_info.UptimeTracker,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => osmosis_concentratedliquidity_v1beta1_tick_info
                          .UptimeTracker.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory TickAccumulatorTrackersResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TickAccumulatorTrackersResponse(
      spreadRewardGrowthOppositeDirectionOfLastTraversal:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.DecCoin.deserialize(b))
              .toList(),
      uptimeTrackers:
          decode
              .getListOfBytes(2)
              .map(
                (b) => osmosis_concentratedliquidity_v1beta1_tick_info
                    .UptimeTracker.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1TickAccumulatorTrackersResponse;
}

/// ===================== QueryIncentiveRecords
class IncentiveRecordsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<IncentiveRecordsResponse> {
  final BigInt? poolId;

  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const IncentiveRecordsRequest({this.poolId, this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/concentratedliquidity/v1beta1/incentive_records",
        ),
      ],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [poolId, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'pool_id': config.encodeBigint(poolId),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory IncentiveRecordsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return IncentiveRecordsRequest(
      poolId: json.valueAsBigInt<BigInt?>(
        'pool_id',
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

  factory IncentiveRecordsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return IncentiveRecordsRequest(
      poolId: decode.getBigInt<BigInt?>(1),
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
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1IncentiveRecordsRequest;
  @override
  IncentiveRecordsResponse onQueryResponse(List<int> bytes) {
    return IncentiveRecordsResponse.deserialize(bytes);
  }

  @override
  IncentiveRecordsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return IncentiveRecordsResponse.fromJson(json);
  }
}

class IncentiveRecordsResponse extends CosmosProtoMessage {
  final List<
    osmosis_concentratedliquidity_v1beta1_incentive_record.IncentiveRecord
  >
  incentiveRecords;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const IncentiveRecordsResponse({
    this.incentiveRecords = const [],
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
  List<Object?> get protoValues => [incentiveRecords, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'incentive_records':
          incentiveRecords.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory IncentiveRecordsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return IncentiveRecordsResponse(
      incentiveRecords:
          (json.valueEnsureAsList<dynamic>(
                'incentive_records',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_concentratedliquidity_v1beta1_incentive_record.IncentiveRecord,
                  Object
                >(
                  value: e,
                  parse:
                      (v) =>
                          osmosis_concentratedliquidity_v1beta1_incentive_record
                              .IncentiveRecord.fromJson(
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

  factory IncentiveRecordsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return IncentiveRecordsResponse(
      incentiveRecords:
          decode
              .getListOfBytes(1)
              .map(
                (b) => osmosis_concentratedliquidity_v1beta1_incentive_record
                    .IncentiveRecord.deserialize(b),
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
          .osmosisConcentratedliquidityV1beta1IncentiveRecordsResponse;
}

/// =============================== CFMMPoolIdLinkFromConcentratedPoolId
class CFMMPoolIdLinkFromConcentratedPoolIdRequest extends CosmosProtoMessage
    with
        ICosmosProtoQueryMessage<CFMMPoolIdLinkFromConcentratedPoolIdResponse> {
  final BigInt? concentratedPoolId;

  const CFMMPoolIdLinkFromConcentratedPoolIdRequest({this.concentratedPoolId});

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
              "/osmosis/concentratedliquidity/v1beta1/cfmm_pool_id_link_from_concentrated/{concentrated_pool_id}",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [concentratedPoolId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'concentrated_pool_id': config.encodeBigint(concentratedPoolId)};
  }

  factory CFMMPoolIdLinkFromConcentratedPoolIdRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return CFMMPoolIdLinkFromConcentratedPoolIdRequest(
      concentratedPoolId: json.valueAsBigInt<BigInt?>(
        'concentrated_pool_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory CFMMPoolIdLinkFromConcentratedPoolIdRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return CFMMPoolIdLinkFromConcentratedPoolIdRequest(
      concentratedPoolId: decode.getBigInt<BigInt?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1CFMMPoolIdLinkFromConcentratedPoolIdRequest;
  @override
  CFMMPoolIdLinkFromConcentratedPoolIdResponse onQueryResponse(
    List<int> bytes,
  ) {
    return CFMMPoolIdLinkFromConcentratedPoolIdResponse.deserialize(bytes);
  }

  @override
  CFMMPoolIdLinkFromConcentratedPoolIdResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return CFMMPoolIdLinkFromConcentratedPoolIdResponse.fromJson(json);
  }
}

class CFMMPoolIdLinkFromConcentratedPoolIdResponse extends CosmosProtoMessage {
  final BigInt? cfmmPoolId;

  const CFMMPoolIdLinkFromConcentratedPoolIdResponse({this.cfmmPoolId});

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
  List<Object?> get protoValues => [cfmmPoolId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'cfmm_pool_id': config.encodeBigint(cfmmPoolId)};
  }

  factory CFMMPoolIdLinkFromConcentratedPoolIdResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return CFMMPoolIdLinkFromConcentratedPoolIdResponse(
      cfmmPoolId: json.valueAsBigInt<BigInt?>(
        'cfmm_pool_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory CFMMPoolIdLinkFromConcentratedPoolIdResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return CFMMPoolIdLinkFromConcentratedPoolIdResponse(
      cfmmPoolId: decode.getBigInt<BigInt?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1CFMMPoolIdLinkFromConcentratedPoolIdResponse;
}

/// =============================== UserUnbondingPositions
class UserUnbondingPositionsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<UserUnbondingPositionsResponse> {
  final String? address;

  const UserUnbondingPositionsRequest({this.address});

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
              "/osmosis/concentratedliquidity/v1beta1/user_unbonding_positions/{address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [address];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'address': address};
  }

  factory UserUnbondingPositionsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return UserUnbondingPositionsRequest(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory UserUnbondingPositionsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return UserUnbondingPositionsRequest(address: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1UserUnbondingPositionsRequest;
  @override
  UserUnbondingPositionsResponse onQueryResponse(List<int> bytes) {
    return UserUnbondingPositionsResponse.deserialize(bytes);
  }

  @override
  UserUnbondingPositionsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return UserUnbondingPositionsResponse.fromJson(json);
  }
}

class UserUnbondingPositionsResponse extends CosmosProtoMessage {
  final List<
    osmosis_concentratedliquidity_v1beta1_position.PositionWithPeriodLock
  >
  positionsWithPeriodLock;

  const UserUnbondingPositionsResponse({
    this.positionsWithPeriodLock = const [],
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
  List<Object?> get protoValues => [positionsWithPeriodLock];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'positions_with_period_lock':
          positionsWithPeriodLock.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory UserUnbondingPositionsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return UserUnbondingPositionsResponse(
      positionsWithPeriodLock:
          (json.valueEnsureAsList<dynamic>(
                'positions_with_period_lock',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_concentratedliquidity_v1beta1_position.PositionWithPeriodLock,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => osmosis_concentratedliquidity_v1beta1_position
                          .PositionWithPeriodLock.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory UserUnbondingPositionsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return UserUnbondingPositionsResponse(
      positionsWithPeriodLock:
          decode
              .getListOfBytes(1)
              .map(
                (b) => osmosis_concentratedliquidity_v1beta1_position
                    .PositionWithPeriodLock.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1UserUnbondingPositionsResponse;
}

/// =============================== GetTotalLiquidity
class GetTotalLiquidityRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<GetTotalLiquidityResponse> {
  const GetTotalLiquidityRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/concentratedliquidity/v1beta1/get_total_liquidity",
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

  factory GetTotalLiquidityRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return GetTotalLiquidityRequest();
  }

  factory GetTotalLiquidityRequest.deserialize(List<int> bytes) {
    return GetTotalLiquidityRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1GetTotalLiquidityRequest;
  @override
  GetTotalLiquidityResponse onQueryResponse(List<int> bytes) {
    return GetTotalLiquidityResponse.deserialize(bytes);
  }

  @override
  GetTotalLiquidityResponse onQueryResponseJson(Map<String, dynamic> json) {
    return GetTotalLiquidityResponse.fromJson(json);
  }
}

class GetTotalLiquidityResponse extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> totalLiquidity;

  const GetTotalLiquidityResponse({this.totalLiquidity = const []});

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
  List<Object?> get protoValues => [totalLiquidity];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'total_liquidity':
          totalLiquidity.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory GetTotalLiquidityResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return GetTotalLiquidityResponse(
      totalLiquidity:
          (json.valueEnsureAsList<dynamic>(
                'total_liquidity',
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

  factory GetTotalLiquidityResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GetTotalLiquidityResponse(
      totalLiquidity:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1GetTotalLiquidityResponse;
}

/// =============================== NumNextInitializedTicks
class NumNextInitializedTicksRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<NumNextInitializedTicksResponse> {
  final BigInt? poolId;

  final String? tokenInDenom;

  final BigInt? numNextInitializedTicks;

  const NumNextInitializedTicksRequest({
    this.poolId,
    this.tokenInDenom,
    this.numNextInitializedTicks,
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
              "/osmosis/concentratedliquidity/v1beta1/num_next_initialized_ticks",
        ),
      ],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.uint64(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    poolId,
    tokenInDenom,
    numNextInitializedTicks,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'pool_id': config.encodeBigint(poolId),
      'token_in_denom': tokenInDenom,
      'num_next_initialized_ticks': config.encodeBigint(
        numNextInitializedTicks,
      ),
    };
  }

  factory NumNextInitializedTicksRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return NumNextInitializedTicksRequest(
      poolId: json.valueAsBigInt<BigInt?>(
        'pool_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      tokenInDenom: json.valueAsString<String?>(
        'token_in_denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      numNextInitializedTicks: json.valueAsBigInt<BigInt?>(
        'num_next_initialized_ticks',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory NumNextInitializedTicksRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return NumNextInitializedTicksRequest(
      poolId: decode.getBigInt<BigInt?>(1),
      tokenInDenom: decode.getString<String?>(2),
      numNextInitializedTicks: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1NumNextInitializedTicksRequest;
  @override
  NumNextInitializedTicksResponse onQueryResponse(List<int> bytes) {
    return NumNextInitializedTicksResponse.deserialize(bytes);
  }

  @override
  NumNextInitializedTicksResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return NumNextInitializedTicksResponse.fromJson(json);
  }
}

class NumNextInitializedTicksResponse extends CosmosProtoMessage {
  final List<TickLiquidityNet> liquidityDepths;

  final BigInt? currentTick;

  final String? currentLiquidity;

  const NumNextInitializedTicksResponse({
    this.liquidityDepths = const [],
    this.currentTick,
    this.currentLiquidity,
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
        ProtoFieldConfig.int64(2),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    liquidityDepths,
    currentTick,
    currentLiquidity,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'liquidity_depths':
          liquidityDepths.map((e) => config.encodeMessage(e)).toList(),
      'current_tick': config.encodeBigint(currentTick),
      'current_liquidity': currentLiquidity,
    };
  }

  factory NumNextInitializedTicksResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return NumNextInitializedTicksResponse(
      liquidityDepths:
          (json.valueEnsureAsList<dynamic>(
                'liquidity_depths',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<TickLiquidityNet, Object>(
                  value: e,
                  parse:
                      (v) => TickLiquidityNet.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      currentTick: json.valueAsBigInt<BigInt?>(
        'current_tick',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      currentLiquidity: json.valueAsString<String?>(
        'current_liquidity',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory NumNextInitializedTicksResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return NumNextInitializedTicksResponse(
      liquidityDepths:
          decode
              .getListOfBytes(1)
              .map((b) => TickLiquidityNet.deserialize(b))
              .toList(),
      currentTick: decode.getBigInt<BigInt?>(2),
      currentLiquidity: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1NumNextInitializedTicksResponse;
}
