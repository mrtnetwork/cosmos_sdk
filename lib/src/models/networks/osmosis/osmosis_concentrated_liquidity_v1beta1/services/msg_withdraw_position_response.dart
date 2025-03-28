import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Position contains position's id, address, pool id, lower tick, upper tick join time, and liquidity.
class OsmosisConcentratedLiquidityMsgWithdrawPositionResponse
    extends CosmosMessage {
  final BigInt amount0;
  final BigInt amount1;

  OsmosisConcentratedLiquidityMsgWithdrawPositionResponse(
      {required this.amount0, required this.amount1});
  factory OsmosisConcentratedLiquidityMsgWithdrawPositionResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityMsgWithdrawPositionResponse(
        amount0: BigInt.parse(decode.getField(2)),
        amount1: BigInt.parse(decode.getField(3)));
  }
  factory OsmosisConcentratedLiquidityMsgWithdrawPositionResponse.fromJson(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityMsgWithdrawPositionResponse(
        amount0: BigintUtils.parse(json["amount0"]),
        amount1: BigintUtils.parse(json["amount1"]));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"amount0": amount0.toString(), "amount1": amount1.toString()};
  }

  @override
  List get values => [
        amount0.toString(),
        amount1.toString(),
      ];

  @override
  TypeUrl get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.msgWithdrawPositionResponse;
}
