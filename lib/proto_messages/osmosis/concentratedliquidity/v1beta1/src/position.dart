import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/osmosis/lockup/src/lock.dart"
    as osmosis_lockup_lock;

/// this is a legacy package that requires additional migration logic
/// in order to use the correct package. Decision made to use legacy package path
/// until clear steps for migration logic and the unknowns for state breaking are
/// investigated for changing proto package.
/// Position contains position's id, address, pool id, lower tick, upper tick
/// join time, and liquidity.
class Position extends CosmosProtoMessage {
  final BigInt? positionId;

  final String? address;

  final BigInt? poolId;

  final BigInt? lowerTick;

  final BigInt? upperTick;

  final google_protobuf_timestamp.Timestamp? joinTime;

  final String? liquidity;

  const Position({
    this.positionId,
    this.address,
    this.poolId,
    this.lowerTick,
    this.upperTick,
    this.joinTime,
    this.liquidity,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.uint64(3, options: const []),
        ProtoFieldConfig.int64(4),
        ProtoFieldConfig.int64(5),
        ProtoFieldConfig.message(6, options: const []),
        ProtoFieldConfig.string(7, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    positionId,
    address,
    poolId,
    lowerTick,
    upperTick,
    joinTime,
    liquidity,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'position_id': config.encodeBigint(positionId),
      'address': address,
      'pool_id': config.encodeBigint(poolId),
      'lower_tick': config.encodeBigint(lowerTick),
      'upper_tick': config.encodeBigint(upperTick),
      'join_time': joinTime?.toRfc3339(),
      'liquidity': liquidity,
    };
  }

  factory Position.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Position(
      positionId: json.valueAsBigInt<BigInt?>(
        'position_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      poolId: json.valueAsBigInt<BigInt?>(
        'pool_id',
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
      joinTime: json.valueTo<google_protobuf_timestamp.Timestamp?, Object>(
        key: 'join_time',
        parse:
            (v) => google_protobuf_timestamp.Timestamp.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      liquidity: json.valueAsString<String?>(
        'liquidity',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Position.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Position(
      positionId: decode.getBigInt<BigInt?>(1),
      address: decode.getString<String?>(2),
      poolId: decode.getBigInt<BigInt?>(3),
      lowerTick: decode.getBigInt<BigInt?>(4),
      upperTick: decode.getBigInt<BigInt?>(5),
      joinTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        6,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      liquidity: decode.getString<String?>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisConcentratedliquidityV1beta1Position;
}

/// FullPositionBreakdown returns:
/// - the position itself
/// - the amount the position translates in terms of asset0 and asset1
/// - the amount of claimable fees
/// - the amount of claimable incentives
/// - the amount of incentives that would be forfeited if the position was closed
/// now
class FullPositionBreakdown extends CosmosProtoMessage {
  final Position? position;

  final cosmos_base_v1beta1_coin.Coin? asset0;

  final cosmos_base_v1beta1_coin.Coin? asset1;

  final List<cosmos_base_v1beta1_coin.Coin> claimableSpreadRewards;

  final List<cosmos_base_v1beta1_coin.Coin> claimableIncentives;

  final List<cosmos_base_v1beta1_coin.Coin> forfeitedIncentives;

  const FullPositionBreakdown({
    this.position,
    this.asset0,
    this.asset1,
    this.claimableSpreadRewards = const [],
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
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    position,
    asset0,
    asset1,
    claimableSpreadRewards,
    claimableIncentives,
    forfeitedIncentives,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'position': config.encodeMessage(position),
      'asset0': config.encodeMessage(asset0),
      'asset1': config.encodeMessage(asset1),
      'claimable_spread_rewards':
          claimableSpreadRewards.map((e) => config.encodeMessage(e)).toList(),
      'claimable_incentives':
          claimableIncentives.map((e) => config.encodeMessage(e)).toList(),
      'forfeited_incentives':
          forfeitedIncentives.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory FullPositionBreakdown.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return FullPositionBreakdown(
      position: json.valueTo<Position?, Object>(
        key: 'position',
        parse: (v) => Position.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      asset0: json.valueTo<cosmos_base_v1beta1_coin.Coin?, Object>(
        key: 'asset0',
        parse:
            (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      asset1: json.valueTo<cosmos_base_v1beta1_coin.Coin?, Object>(
        key: 'asset1',
        parse:
            (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
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

  factory FullPositionBreakdown.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return FullPositionBreakdown(
      position: decode.messageTo<Position?>(1, (b) => Position.deserialize(b)),
      asset0: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        2,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      asset1: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        3,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      claimableSpreadRewards:
          decode
              .getListOfBytes(4)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      claimableIncentives:
          decode
              .getListOfBytes(5)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      forfeitedIncentives:
          decode
              .getListOfBytes(6)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1FullPositionBreakdown;
}

class PositionWithPeriodLock extends CosmosProtoMessage {
  final Position? position;

  final osmosis_lockup_lock.PeriodLock? locks;

  const PositionWithPeriodLock({this.position, this.locks});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [position, locks];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'position': config.encodeMessage(position),
      'locks': config.encodeMessage(locks),
    };
  }

  factory PositionWithPeriodLock.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return PositionWithPeriodLock(
      position: json.valueTo<Position?, Object>(
        key: 'position',
        parse: (v) => Position.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      locks: json.valueTo<osmosis_lockup_lock.PeriodLock?, Object>(
        key: 'locks',
        parse:
            (v) => osmosis_lockup_lock.PeriodLock.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory PositionWithPeriodLock.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PositionWithPeriodLock(
      position: decode.messageTo<Position?>(1, (b) => Position.deserialize(b)),
      locks: decode.messageTo<osmosis_lockup_lock.PeriodLock?>(
        2,
        (b) => osmosis_lockup_lock.PeriodLock.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1PositionWithPeriodLock;
}
