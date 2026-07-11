import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/osmosis/lockup/src/lock.dart"
    as osmosis_lockup_lock;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;

/// Gauge is an object that stores and distributes yields to recipients who
/// satisfy certain conditions. Currently gauges support conditions around the
/// duration for which a given denom is locked.
class Gauge extends CosmosProtoMessage {
  /// id is the unique ID of a Gauge
  final BigInt? id;

  /// is_perpetual is a flag to show if it's a perpetual or non-perpetual gauge
  /// Non-perpetual gauges distribute their tokens equally per epoch while the
  /// gauge is in the active period. Perpetual gauges distribute all their tokens
  /// at a single time and only distribute their tokens again once the gauge is
  /// refilled, Intended for use with incentives that get refilled daily.
  final bool? isPerpetual;

  /// distribute_to is where the gauge rewards are distributed to.
  /// This is queried via lock duration or by timestamp
  final osmosis_lockup_lock.QueryCondition? distributeTo;

  /// coins is the total amount of coins that have been in the gauge
  /// Can distribute multiple coin denoms
  final List<cosmos_base_v1beta1_coin.Coin> coins;

  /// start_time is the distribution start time
  final google_protobuf_timestamp.Timestamp? startTime;

  /// num_epochs_paid_over is the number of total epochs distribution will be
  /// completed over
  final BigInt? numEpochsPaidOver;

  /// filled_epochs is the number of epochs distribution has been completed on
  /// already
  final BigInt? filledEpochs;

  /// distributed_coins are coins that have been distributed already
  final List<cosmos_base_v1beta1_coin.Coin> distributedCoins;

  const Gauge({
    this.id,
    this.isPerpetual,
    this.distributeTo,
    this.coins = const [],
    this.startTime,
    this.numEpochsPaidOver,
    this.filledEpochs,
    this.distributedCoins = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.bool(2),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.message(5, options: const []),
        ProtoFieldConfig.uint64(6),
        ProtoFieldConfig.uint64(7),
        ProtoFieldConfig.repeated(
          fieldNumber: 8,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    id,
    isPerpetual,
    distributeTo,
    coins,
    startTime,
    numEpochsPaidOver,
    filledEpochs,
    distributedCoins,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id?.toString(),
      'is_perpetual': isPerpetual,
      'distribute_to': distributeTo?.toJson(),
      'coins': coins.map((e) => e.toJson()).toList(),
      'start_time': startTime?.toRfc3339(),
      'num_epochs_paid_over': numEpochsPaidOver?.toString(),
      'filled_epochs': filledEpochs?.toString(),
      'distributed_coins': distributedCoins.map((e) => e.toJson()).toList(),
    };
  }

  factory Gauge.fromJson(Map<String, dynamic> json) {
    return Gauge(
      id: json.valueAsBigInt<BigInt?>('id', acceptCamelCase: true),
      isPerpetual: json.valueAsBool<bool?>(
        'is_perpetual',
        acceptCamelCase: true,
      ),
      distributeTo: json
          .valueTo<osmosis_lockup_lock.QueryCondition?, Map<String, dynamic>>(
            key: 'distribute_to',
            parse: (v) => osmosis_lockup_lock.QueryCondition.fromJson(v),
            acceptCamelCase: true,
          ),
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
      startTime: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'start_time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
      numEpochsPaidOver: json.valueAsBigInt<BigInt?>(
        'num_epochs_paid_over',
        acceptCamelCase: true,
      ),
      filledEpochs: json.valueAsBigInt<BigInt?>(
        'filled_epochs',
        acceptCamelCase: true,
      ),
      distributedCoins:
          (json.valueEnsureAsList<dynamic>(
                'distributed_coins',
                acceptCamelCase: true,
              ))
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

  factory Gauge.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Gauge(
      id: decode.getBigInt<BigInt?>(1),
      isPerpetual: decode.getBool<bool?>(2),
      distributeTo: decode.messageTo<osmosis_lockup_lock.QueryCondition?>(
        3,
        (b) => osmosis_lockup_lock.QueryCondition.deserialize(b),
      ),
      coins:
          decode
              .getListOfBytes(4)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      startTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        5,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      numEpochsPaidOver: decode.getBigInt<BigInt?>(6),
      filledEpochs: decode.getBigInt<BigInt?>(7),
      distributedCoins:
          decode
              .getListOfBytes(8)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisIncentivesGauge;
}
