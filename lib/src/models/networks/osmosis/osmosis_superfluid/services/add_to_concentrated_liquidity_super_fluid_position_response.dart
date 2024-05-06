import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisSuperfluidMsgAddToConcentratedLiquiditySuperfluidPositionResponse
    extends CosmosMessage {
  final BigInt? positionId;
  final BigInt amount0;
  final BigInt amount1;

  /// new_liquidity is the final liquidity after the add.
  /// It includes the liquidity that existed before in the position
  /// and the new liquidity that was added to the position.
  final String? newLiquidity;
  final BigInt? lockId;

  OsmosisSuperfluidMsgAddToConcentratedLiquiditySuperfluidPositionResponse(
      {this.positionId,
      required this.amount0,
      required this.amount1,
      this.newLiquidity,
      this.lockId});
  factory OsmosisSuperfluidMsgAddToConcentratedLiquiditySuperfluidPositionResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidMsgAddToConcentratedLiquiditySuperfluidPositionResponse(
      positionId: decode.getField(1),
      amount0: BigInt.parse(decode.getField(2)),
      amount1: BigInt.parse(decode.getField(3)),
      lockId: decode.getField(4),
      newLiquidity: decode.getField(5),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "position_id": positionId?.toString(),
      "amount0": amount0.toString(),
      "amount1": amount1.toString(),
      "new_liquidity": newLiquidity,
      "lock_id": lockId?.toString()
    };
  }

  @override
  String get typeUrl => OsmosisSuperfluidTypes
      .msgAddToConcentratedLiquiditySuperfluidPositionResponse.typeUrl;

  @override
  List get values => [positionId, amount0, amount1, lockId, newLiquidity];
}
