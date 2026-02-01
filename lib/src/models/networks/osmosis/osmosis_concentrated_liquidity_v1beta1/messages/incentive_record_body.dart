import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/dec_coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// IncentiveRecordBody represents the body stored in state for each individual record.
class OsmosisConcentratedLiquidityIncentiveRecordBody extends CosmosMessage {
  /// [remainingCoin] is the total amount of incentives to be distributed
  final DecCoin remainingCoin;

  /// emission_rate is the incentive emission rate per second
  final String emissionRate;

  /// start_time is the time when the incentive starts distributing
  final ProtobufTimestamp startTime;

  OsmosisConcentratedLiquidityIncentiveRecordBody({
    required this.remainingCoin,
    required this.emissionRate,
    required this.startTime,
  });
  factory OsmosisConcentratedLiquidityIncentiveRecordBody.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityIncentiveRecordBody(
      remainingCoin: DecCoin.deserialize(decode.getField(1)),
      emissionRate: decode.getField(2),
      startTime: ProtobufTimestamp.deserialize(decode.getField(3)),
    );
  }
  factory OsmosisConcentratedLiquidityIncentiveRecordBody.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisConcentratedLiquidityIncentiveRecordBody(
      remainingCoin: DecCoin.fromJson(json["remaining_coin"]),
      emissionRate: json["emission_rate"],
      startTime: ProtobufTimestamp.fromString(json["start_time"]),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "remaining_coin": remainingCoin.toJson(),
      "emission_rate": emissionRate,
      "start_time": startTime.toJson(),
    };
  }

  @override
  List get values => [remainingCoin, emissionRate, startTime];

  @override
  TypeUrl get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.incentiveRecordBody;
}
