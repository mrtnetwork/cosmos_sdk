import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/osmosis/poolmanager/v1beta1/src/genesis.dart"
    as osmosis_poolmanager_v1beta1_genesis;
import "package:cosmos_sdk/proto_messages/osmosis/txfees/v1beta1/src/genesis.dart"
    as osmosis_txfees_v1beta1_genesis;

/// TokenPairArbRoutes tracks all of the hot routes for a given pair of tokens
class TokenPairArbRoutes extends CosmosProtoMessage {
  /// Stores all of the possible hot paths for a given pair of tokens
  final List<Route> arbRoutes;

  /// Token denomination of the first asset
  final String? tokenIn;

  /// Token denomination of the second asset
  final String? tokenOut;

  const TokenPairArbRoutes({
    this.arbRoutes = const [],
    this.tokenIn,
    this.tokenOut,
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
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [arbRoutes, tokenIn, tokenOut];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'arb_routes': arbRoutes.map((e) => config.encodeMessage(e)).toList(),
      'token_in': tokenIn,
      'token_out': tokenOut,
    };
  }

  factory TokenPairArbRoutes.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return TokenPairArbRoutes(
      arbRoutes:
          (json.valueEnsureAsList<dynamic>(
                'arb_routes',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<Route, Object>(
                  value: e,
                  parse:
                      (v) =>
                          Route.fromJson(JsonParser.valueAs(v), config: config),
                ),
              )
              .toList(),
      tokenIn: json.valueAsString<String?>(
        'token_in',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      tokenOut: json.valueAsString<String?>(
        'token_out',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory TokenPairArbRoutes.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TokenPairArbRoutes(
      arbRoutes:
          decode.getListOfBytes(1).map((b) => Route.deserialize(b)).toList(),
      tokenIn: decode.getString<String?>(2),
      tokenOut: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisProtorevV1beta1TokenPairArbRoutes;
}

/// Route is a hot route for a given pair of tokens
class Route extends CosmosProtoMessage {
  /// The pool IDs that are traversed in the directed cyclic graph (traversed
  /// left
  /// -&gt; right)
  final List<Trade> trades;

  /// The step size that will be used to find the optimal swap amount in the
  /// binary search
  final String? stepSize;

  const Route({this.trades = const [], this.stepSize});

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
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [trades, stepSize];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'trades': trades.map((e) => config.encodeMessage(e)).toList(),
      'step_size': stepSize,
    };
  }

  factory Route.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Route(
      trades:
          (json.valueEnsureAsList<dynamic>(
                'trades',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<Trade, Object>(
                  value: e,
                  parse:
                      (v) =>
                          Trade.fromJson(JsonParser.valueAs(v), config: config),
                ),
              )
              .toList(),
      stepSize: json.valueAsString<String?>(
        'step_size',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Route.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Route(
      trades:
          decode.getListOfBytes(1).map((b) => Trade.deserialize(b)).toList(),
      stepSize: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisProtorevV1beta1Route;
}

/// Trade is a single trade in a route
class Trade extends CosmosProtoMessage {
  /// The pool id of the pool that is traded on
  final BigInt? pool;

  /// The denom of the token that is traded
  final String? tokenIn;

  /// The denom of the token that is received
  final String? tokenOut;

  const Trade({this.pool, this.tokenIn, this.tokenOut});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [pool, tokenIn, tokenOut];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'pool': config.encodeBigint(pool),
      'token_in': tokenIn,
      'token_out': tokenOut,
    };
  }

  factory Trade.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Trade(
      pool: json.valueAsBigInt<BigInt?>(
        'pool',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      tokenIn: json.valueAsString<String?>(
        'token_in',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      tokenOut: json.valueAsString<String?>(
        'token_out',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Trade.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Trade(
      pool: decode.getBigInt<BigInt?>(1),
      tokenIn: decode.getString<String?>(2),
      tokenOut: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisProtorevV1beta1Trade;
}

/// RouteStatistics contains the number of trades the module has executed after a
/// swap on a given route and the profits from the trades
class RouteStatistics extends CosmosProtoMessage {
  /// profits is the total profit from all trades on this route
  final List<cosmos_base_v1beta1_coin.Coin> profits;

  /// number_of_trades is the number of trades the module has executed using this
  /// route
  final String? numberOfTrades;

  /// route is the route that was used (pool ids along the arbitrage route)
  final List<BigInt> route;

  const RouteStatistics({
    this.profits = const [],
    this.numberOfTrades,
    this.route = const [],
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
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.uint64,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [profits, numberOfTrades, route];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'profits': profits.map((e) => config.encodeMessage(e)).toList(),
      'number_of_trades': numberOfTrades,
      'route': route.map((e) => config.encodeBigint(e)).toList(),
    };
  }

  factory RouteStatistics.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return RouteStatistics(
      profits:
          (json.valueEnsureAsList<dynamic>(
                'profits',
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
      numberOfTrades: json.valueAsString<String?>(
        'number_of_trades',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      route:
          (json.valueEnsureAsList<dynamic>(
            'route',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
    );
  }

  factory RouteStatistics.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RouteStatistics(
      profits:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      numberOfTrades: decode.getString<String?>(2),
      route: decode.getListOrEmpty<BigInt>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisProtorevV1beta1RouteStatistics;
}

/// InfoByPoolType contains information pertaining to how expensive (in terms of
/// gas and time) it is to execute a swap on a given pool type. This distinction
/// is made and necessary because the execution time ranges significantly between
/// the different pool types.
class InfoByPoolType extends CosmosProtoMessage {
  /// The stable pool info
  final StablePoolInfo? stable;

  /// The balancer pool info
  final BalancerPoolInfo? balancer;

  /// The concentrated pool info
  final ConcentratedPoolInfo? concentrated;

  /// The cosmwasm pool info
  final CosmwasmPoolInfo? cosmwasm;

  const InfoByPoolType({
    this.stable,
    this.balancer,
    this.concentrated,
    this.cosmwasm,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.message(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [stable, balancer, concentrated, cosmwasm];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'stable': config.encodeMessage(stable),
      'balancer': config.encodeMessage(balancer),
      'concentrated': config.encodeMessage(concentrated),
      'cosmwasm': config.encodeMessage(cosmwasm),
    };
  }

  factory InfoByPoolType.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return InfoByPoolType(
      stable: json.valueTo<StablePoolInfo?, Object>(
        key: 'stable',
        parse:
            (v) =>
                StablePoolInfo.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      balancer: json.valueTo<BalancerPoolInfo?, Object>(
        key: 'balancer',
        parse:
            (v) => BalancerPoolInfo.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      concentrated: json.valueTo<ConcentratedPoolInfo?, Object>(
        key: 'concentrated',
        parse:
            (v) => ConcentratedPoolInfo.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      cosmwasm: json.valueTo<CosmwasmPoolInfo?, Object>(
        key: 'cosmwasm',
        parse:
            (v) => CosmwasmPoolInfo.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory InfoByPoolType.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return InfoByPoolType(
      stable: decode.messageTo<StablePoolInfo?>(
        1,
        (b) => StablePoolInfo.deserialize(b),
      ),
      balancer: decode.messageTo<BalancerPoolInfo?>(
        2,
        (b) => BalancerPoolInfo.deserialize(b),
      ),
      concentrated: decode.messageTo<ConcentratedPoolInfo?>(
        3,
        (b) => ConcentratedPoolInfo.deserialize(b),
      ),
      cosmwasm: decode.messageTo<CosmwasmPoolInfo?>(
        4,
        (b) => CosmwasmPoolInfo.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisProtorevV1beta1InfoByPoolType;
}

/// StablePoolInfo contains meta data pertaining to a stableswap pool type.
class StablePoolInfo extends CosmosProtoMessage {
  /// The weight of a stableswap pool
  final BigInt? weight;

  const StablePoolInfo({this.weight});

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
  List<Object?> get protoValues => [weight];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'weight': config.encodeBigint(weight)};
  }

  factory StablePoolInfo.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return StablePoolInfo(
      weight: json.valueAsBigInt<BigInt?>(
        'weight',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory StablePoolInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return StablePoolInfo(weight: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisProtorevV1beta1StablePoolInfo;
}

/// BalancerPoolInfo contains meta data pertaining to a balancer pool type.
class BalancerPoolInfo extends CosmosProtoMessage {
  /// The weight of a balancer pool
  final BigInt? weight;

  const BalancerPoolInfo({this.weight});

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
  List<Object?> get protoValues => [weight];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'weight': config.encodeBigint(weight)};
  }

  factory BalancerPoolInfo.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return BalancerPoolInfo(
      weight: json.valueAsBigInt<BigInt?>(
        'weight',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory BalancerPoolInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BalancerPoolInfo(weight: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisProtorevV1beta1BalancerPoolInfo;
}

/// ConcentratedPoolInfo contains meta data pertaining to a concentrated pool
/// type.
class ConcentratedPoolInfo extends CosmosProtoMessage {
  /// The weight of a concentrated pool
  final BigInt? weight;

  /// The maximum number of ticks we can move when rebalancing
  final BigInt? maxTicksCrossed;

  const ConcentratedPoolInfo({this.weight, this.maxTicksCrossed});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [weight, maxTicksCrossed];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'weight': config.encodeBigint(weight),
      'max_ticks_crossed': config.encodeBigint(maxTicksCrossed),
    };
  }

  factory ConcentratedPoolInfo.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ConcentratedPoolInfo(
      weight: json.valueAsBigInt<BigInt?>(
        'weight',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      maxTicksCrossed: json.valueAsBigInt<BigInt?>(
        'max_ticks_crossed',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory ConcentratedPoolInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ConcentratedPoolInfo(
      weight: decode.getBigInt<BigInt?>(1),
      maxTicksCrossed: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisProtorevV1beta1ConcentratedPoolInfo;
}

/// CosmwasmPoolInfo contains meta data pertaining to a cosmwasm pool type.
class CosmwasmPoolInfo extends CosmosProtoMessage {
  /// The weight of a cosmwasm pool (by contract address)
  final List<WeightMap> weightMaps;

  const CosmwasmPoolInfo({this.weightMaps = const []});

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
  List<Object?> get protoValues => [weightMaps];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'weight_maps': weightMaps.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory CosmwasmPoolInfo.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return CosmwasmPoolInfo(
      weightMaps:
          (json.valueEnsureAsList<dynamic>(
                'weight_maps',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<WeightMap, Object>(
                  value: e,
                  parse:
                      (v) => WeightMap.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory CosmwasmPoolInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return CosmwasmPoolInfo(
      weightMaps:
          decode
              .getListOfBytes(1)
              .map((b) => WeightMap.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisProtorevV1beta1CosmwasmPoolInfo;
}

/// WeightMap maps a contract address to a weight. The weight of an address
/// corresponds to the amount of ms required to execute a swap on that contract.
class WeightMap extends CosmosProtoMessage {
  /// The weight of a cosmwasm pool (by contract address)
  final BigInt? weight;

  /// The contract address
  final String? contractAddress;

  const WeightMap({this.weight, this.contractAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [weight, contractAddress];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'weight': config.encodeBigint(weight),
      'contract_address': contractAddress,
    };
  }

  factory WeightMap.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return WeightMap(
      weight: json.valueAsBigInt<BigInt?>(
        'weight',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      contractAddress: json.valueAsString<String?>(
        'contract_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory WeightMap.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return WeightMap(
      weight: decode.getBigInt<BigInt?>(1),
      contractAddress: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisProtorevV1beta1WeightMap;
}

/// BaseDenom represents a single base denom that the module uses for its
/// arbitrage trades. It contains the denom name alongside the step size of the
/// binary search that is used to find the optimal swap amount
class BaseDenom extends CosmosProtoMessage {
  /// The denom i.e. name of the base denom (ex. uosmo)
  final String? denom;

  /// The step size of the binary search that is used to find the optimal swap
  /// amount
  final String? stepSize;

  const BaseDenom({this.denom, this.stepSize});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [denom, stepSize];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'denom': denom, 'step_size': stepSize};
  }

  factory BaseDenom.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return BaseDenom(
      denom: json.valueAsString<String?>(
        'denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      stepSize: json.valueAsString<String?>(
        'step_size',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory BaseDenom.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BaseDenom(
      denom: decode.getString<String?>(1),
      stepSize: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisProtorevV1beta1BaseDenom;
}

class AllProtocolRevenue extends CosmosProtoMessage {
  final osmosis_poolmanager_v1beta1_genesis.TakerFeesTracker? takerFeesTracker;

  /// DEPRECATED
  final osmosis_txfees_v1beta1_genesis.TxFeesTracker? txFeesTracker;

  final CyclicArbTracker? cyclicArbTracker;

  const AllProtocolRevenue({
    this.takerFeesTracker,
    this.txFeesTracker,
    this.cyclicArbTracker,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.message(
          2,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    takerFeesTracker,
    txFeesTracker,
    cyclicArbTracker,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'taker_fees_tracker': config.encodeMessage(takerFeesTracker),
      'tx_fees_tracker': config.encodeMessage(txFeesTracker),
      'cyclic_arb_tracker': config.encodeMessage(cyclicArbTracker),
    };
  }

  factory AllProtocolRevenue.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return AllProtocolRevenue(
      takerFeesTracker: json.valueTo<
        osmosis_poolmanager_v1beta1_genesis.TakerFeesTracker?,
        Object
      >(
        key: 'taker_fees_tracker',
        parse:
            (v) =>
                osmosis_poolmanager_v1beta1_genesis.TakerFeesTracker.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      txFeesTracker: json
          .valueTo<osmosis_txfees_v1beta1_genesis.TxFeesTracker?, Object>(
            key: 'tx_fees_tracker',
            parse:
                (v) => osmosis_txfees_v1beta1_genesis.TxFeesTracker.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      cyclicArbTracker: json.valueTo<CyclicArbTracker?, Object>(
        key: 'cyclic_arb_tracker',
        parse:
            (v) => CyclicArbTracker.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory AllProtocolRevenue.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AllProtocolRevenue(
      takerFeesTracker: decode
          .messageTo<osmosis_poolmanager_v1beta1_genesis.TakerFeesTracker?>(
            1,
            (b) => osmosis_poolmanager_v1beta1_genesis
                .TakerFeesTracker.deserialize(b),
          ),
      txFeesTracker: decode
          .messageTo<osmosis_txfees_v1beta1_genesis.TxFeesTracker?>(
            2,
            (b) => osmosis_txfees_v1beta1_genesis.TxFeesTracker.deserialize(b),
          ),
      cyclicArbTracker: decode.messageTo<CyclicArbTracker?>(
        3,
        (b) => CyclicArbTracker.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisProtorevV1beta1AllProtocolRevenue;
}

class CyclicArbTracker extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> cyclicArb;

  final BigInt? heightAccountingStartsFrom;

  const CyclicArbTracker({
    this.cyclicArb = const [],
    this.heightAccountingStartsFrom,
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
  List<Object?> get protoValues => [cyclicArb, heightAccountingStartsFrom];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'cyclic_arb': cyclicArb.map((e) => config.encodeMessage(e)).toList(),
      'height_accounting_starts_from': config.encodeBigint(
        heightAccountingStartsFrom,
      ),
    };
  }

  factory CyclicArbTracker.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return CyclicArbTracker(
      cyclicArb:
          (json.valueEnsureAsList<dynamic>(
                'cyclic_arb',
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
      heightAccountingStartsFrom: json.valueAsBigInt<BigInt?>(
        'height_accounting_starts_from',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory CyclicArbTracker.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return CyclicArbTracker(
      cyclicArb:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      heightAccountingStartsFrom: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisProtorevV1beta1CyclicArbTracker;
}
