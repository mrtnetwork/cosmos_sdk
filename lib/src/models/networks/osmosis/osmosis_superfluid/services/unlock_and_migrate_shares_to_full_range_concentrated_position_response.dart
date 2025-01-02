import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisSuperfluidMsgUnlockAndMigrateSharesToFullRangeConcentratedPositionResponse
    extends CosmosMessage {
  final BigInt amount0;
  final BigInt amount1;
  final String liquidityCreated;
  final ProtobufTimestamp joinTime;

  OsmosisSuperfluidMsgUnlockAndMigrateSharesToFullRangeConcentratedPositionResponse(
      {required this.amount0,
      required this.amount1,
      required this.liquidityCreated,
      required this.joinTime});
  factory OsmosisSuperfluidMsgUnlockAndMigrateSharesToFullRangeConcentratedPositionResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidMsgUnlockAndMigrateSharesToFullRangeConcentratedPositionResponse(
        amount0: BigInt.parse(decode.getField(1)),
        amount1: BigInt.parse(decode.getField(2)),
        liquidityCreated: decode.getField(3),
        joinTime: ProtobufTimestamp.deserialize(decode.getField(4)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "amount0": amount0.toString(),
      "amount1": amount1.toString(),
      "liquidity_created": liquidityCreated,
      "join_time": joinTime.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisSuperfluidTypes
      .msgUnlockAndMigrateSharesToFullRangeConcentratedPositionResponse;

  @override
  List get values =>
      [amount0.toString(), amount1.toString(), liquidityCreated, joinTime];
}
