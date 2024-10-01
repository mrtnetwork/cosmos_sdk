import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_incentives/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/messages/query_condition.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// Gauge is an object that stores and distributes yields to recipients who satisfy certain conditions.
/// Currently gauges support conditions around the duration for which a given denom is locked.
class OsmosisIncentivesGauge extends CosmosMessage {
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
  final OsmosisLockupQueryCondition distributeTo;

  /// coins is the total amount of coins that have been in the gauge
  /// Can distribute multiple coin denoms
  final List<Coin> coins;

  /// start_time is the distribution start time
  final ProtobufTimestamp startTime;

  /// num_epochs_paid_over is the number of total epochs distribution will be
  /// completed over
  final BigInt? numEpochsPaidOver;

  /// filled_epochs is the number of epochs distribution has been completed on
  /// already
  final BigInt? filledEpochs;

  /// distributed_coins are coins that have been distributed already
  final List<Coin> distributedCoins;
  OsmosisIncentivesGauge(
      {this.id,
      this.isPerpetual,
      required this.distributeTo,
      required List<Coin> coins,
      required this.startTime,
      this.numEpochsPaidOver,
      this.filledEpochs,
      required List<Coin> distributedCoins})
      : coins = coins.immutable,
        distributedCoins = distributedCoins.immutable;
  factory OsmosisIncentivesGauge.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisIncentivesGauge(
      id: decode.getField(1),
      isPerpetual: decode.getField(2),
      distributeTo: OsmosisLockupQueryCondition.deserialize(decode.getField(3)),
      coins: decode.getFields(4).map((e) => Coin.deserialize(e)).toList(),
      startTime: ProtobufTimestamp.deserialize(decode.getField(5)),
      numEpochsPaidOver: decode.getField(6),
      filledEpochs: decode.getField(7),
      distributedCoins:
          decode.getFields(8).map((e) => Coin.deserialize(e)).toList(),
    );
  }

  factory OsmosisIncentivesGauge.fromRpc(Map<String, dynamic> json) {
    return OsmosisIncentivesGauge(
        id: BigintUtils.tryParse(json["id"]),
        isPerpetual: json["is_perpetual"],
        distributeTo:
            OsmosisLockupQueryCondition.fromRpc(json["distribute_to"]),
        coins: (json["coins"] as List?)?.map((e) => Coin.fromRpc(e)).toList() ??
            <Coin>[],
        startTime: ProtobufTimestamp.fromString(json["start_time"]),
        distributedCoins: (json["distributed_coins"] as List?)
                ?.map((e) => Coin.fromRpc(e))
                .toList() ??
            <Coin>[],
        filledEpochs: BigintUtils.tryParse(json["filled_epochs"]),
        numEpochsPaidOver: BigintUtils.tryParse(json["num_epochs_paid_over"]));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8];

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "is_perpetual": isPerpetual,
      "distribute_to": distributeTo.toJson(),
      "coins": coins.map((e) => e.toJson()).toList(),
      "start_time": startTime.toJson(),
      "num_epochs_paid_over": numEpochsPaidOver?.toString(),
      "filled_epochs": filledEpochs?.toString(),
      "distributed_coins": distributedCoins.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl => OsmosisIncentivesTypes.gauge.typeUrl;

  @override
  List get values => [
        id,
        isPerpetual,
        distributeTo,
        coins,
        startTime,
        numEpochsPaidOver,
        filledEpochs,
        distributedCoins
      ];
}
