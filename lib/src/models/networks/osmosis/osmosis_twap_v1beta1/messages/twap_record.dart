import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_twap_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// A TWAP record should be indexed in state by pool_id, (asset pair), timestamp The asset
/// pair assets should be lexicographically sorted. Technically (pool_id, asset_0_denom,
/// asset_1_denom, height) do not need to appear in the struct however we view this as
/// the wrong performance tradeoff given SDK today. Would rather we optimize for
/// readability and correctness, than an optimal state storage format. The system bottleneck is elsewhere for now.
class OsmosisTwapTwapRecord extends CosmosMessage {
  final BigInt? poolId;

  /// Lexicographically smaller denom of the pair
  final String? asset0Denom;

  /// Lexicographically larger denom of the pair
  final String? asset1Denom;

  /// height this record corresponds to, for debugging purposes
  final BigInt? height;

  /// This field should only exist until we have a global registry in the state
  /// machine, mapping prior block heights within {TIME RANGE} to times.
  final ProtobufTimestamp time;

  final String p0LastSpotPrice;
  final String p1LastSpotPrice;
  final String p0ArithmeticTwapAccumulator;
  final String p1ArithmeticTwapAccumulator;

  /// This field contains the time in which the last spot price error occured.
  /// It is used to alert the caller if they are getting a potentially erroneous
  /// TWAP, due to an unforeseen underlying error.
  final ProtobufTimestamp lastErrorTime;

  OsmosisTwapTwapRecord(
      {this.poolId,
      this.asset0Denom,
      this.asset1Denom,
      this.height,
      required this.time,
      required this.p0LastSpotPrice,
      required this.p1LastSpotPrice,
      required this.p0ArithmeticTwapAccumulator,
      required this.p1ArithmeticTwapAccumulator,
      required this.lastErrorTime});
  factory OsmosisTwapTwapRecord.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisTwapTwapRecord(
        poolId: decode.getField(1),
        asset0Denom: decode.getField(2),
        asset1Denom: decode.getField(3),
        height: decode.getField(4),
        time: ProtobufTimestamp.deserialize(decode.getField(5)),
        p0LastSpotPrice: decode.getField(6),
        p1LastSpotPrice: decode.getField(7),
        p0ArithmeticTwapAccumulator: decode.getField(8),
        p1ArithmeticTwapAccumulator: decode.getField(9),
        lastErrorTime: ProtobufTimestamp.deserialize(decode.getField(11)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8, 9, 11];

  @override
  Map<String, dynamic> toJson() {
    return {
      "pool_id": poolId?.toString(),
      "asset0_denom": asset0Denom,
      "asset1_denom": asset1Denom,
      "height": height?.toString(),
      "time": time.toJson(),
      "p0_last_spot_price": p0LastSpotPrice,
      "p1_last_spot_price": p1LastSpotPrice,
      "p0_arithmetic_twap_accumulator": p0ArithmeticTwapAccumulator,
      "p1_arithmetic_twap_accumulator": p1ArithmeticTwapAccumulator,
      "last_error_time": lastErrorTime.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisTwapV1beta1Types.twapRecord;

  @override
  List get values => [
        poolId,
        asset0Denom,
        asset1Denom,
        height,
        time,
        p0LastSpotPrice,
        p1LastSpotPrice,
        p0ArithmeticTwapAccumulator,
        p1ArithmeticTwapAccumulator,
        lastErrorTime
      ];
}
