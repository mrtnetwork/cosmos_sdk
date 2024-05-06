import 'package:blockchain_utils/numbers/bigint_utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisConcentratedLiquidityMsgAddToPositionResponse
    extends CosmosMessage {
  final BigInt? positionId;
  final BigInt amount0;
  final BigInt amount1;

  OsmosisConcentratedLiquidityMsgAddToPositionResponse(
      {this.positionId, required this.amount0, required this.amount1});
  factory OsmosisConcentratedLiquidityMsgAddToPositionResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityMsgAddToPositionResponse(
        positionId: decode.getField(1),
        amount0: BigInt.parse(decode.getField(2)),
        amount1: BigInt.parse(decode.getField(3)));
  }
  factory OsmosisConcentratedLiquidityMsgAddToPositionResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityMsgAddToPositionResponse(
        positionId: BigintUtils.tryParse(json["position_id"]),
        amount0: BigintUtils.parse(json["amount0"]),
        amount1: BigintUtils.parse(json["amount1"]));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "position_id": positionId?.toString(),
      "amount0": amount0.toString(),
      "amount1": amount1.toString()
    };
  }

  @override
  List get values => [positionId, amount0.toString(), amount1.toString()];

  @override
  String get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.msgAddToPositionResponse.typeUrl;
}
