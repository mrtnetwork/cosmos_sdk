import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_incentives/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_incentives/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/messages/query_condition.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class OsmosisIncentiveMsgCreateGauge
    extends OsmosisIncentives<EmptyServiceRequestResponse> {
  /// is_perpetual shows if it's a perpetual or non-perpetual gauge
  /// Non-perpetual gauges distribute their tokens equally per epoch while the
  /// gauge is in the active period. Perpetual gauges distribute all their tokens
  /// at a single time and only distribute their tokens again once the gauge is
  /// refilled
  final bool? isPerpetual;

  /// owner is the address of gauge creator
  final String? owner;

  /// distribute_to show which lock the gauge should distribute to by time
  /// duration or by timestamp
  final OsmosisLockupQueryCondition distributeTo;

  /// coins are coin(s) to be distributed by the gauge
  final List<Coin> coins;

  /// start_time is the distribution start time
  final ProtobufTimestamp startTime;

  /// num_epochs_paid_over is the number of epochs distribution will be completed
  /// over
  final BigInt? numEpochsPaidOver;

  OsmosisIncentiveMsgCreateGauge(
      {this.isPerpetual,
      this.owner,
      required this.distributeTo,
      required List<Coin> coins,
      required this.startTime,
      this.numEpochsPaidOver})
      : coins = coins.immutable;
  factory OsmosisIncentiveMsgCreateGauge.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisIncentiveMsgCreateGauge(
        isPerpetual: decode.getField(1),
        owner: decode.getField(2),
        distributeTo:
            OsmosisLockupQueryCondition.deserialize(decode.getField(3)),
        coins: decode
            .getFields<List<int>>(4)
            .map((e) => Coin.deserialize(e))
            .toList(),
        startTime: ProtobufTimestamp.deserialize(decode.getField(5)),
        numEpochsPaidOver: decode.getField(6));
  }
  factory OsmosisIncentiveMsgCreateGauge.fromJson(Map<String, dynamic> json) {
    return OsmosisIncentiveMsgCreateGauge(
        isPerpetual: json.as("is_perpetual"),
        owner: json.as("owner"),
        distributeTo: OsmosisLockupQueryCondition.deserialize(
            json.asMap("distribute_to")),
        coins:
            json.asListOfMap("coins")?.map((e) => Coin.fromJson(e)).toList() ??
                [],
        startTime: ProtobufTimestamp.fromString(json.as("start_time")),
        numEpochsPaidOver: json.asBigInt("num_epochs_paid_over"));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  List<String?> get signers => [owner];

  @override
  Map<String, dynamic> toJson() {
    return {
      "is_perpetual": isPerpetual,
      "owner": owner,
      "distribute_to": distributeTo.toJson(),
      "coins": coins.map((e) => e.toJson()).toList(),
      "start_time": startTime.toJson(),
      "num_epochs_paid_over": numEpochsPaidOver?.toString()
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisIncentivesTypes.msgCreateGauge;

  @override
  List get values =>
      [isPerpetual, owner, distributeTo, coins, startTime, numEpochsPaidOver];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        OsmosisIncentivesTypes.msgCreateGaugeResponse);
  }
}
