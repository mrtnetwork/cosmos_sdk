import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'msg_withdraw_position_response.dart';

class OsmosisConcentratedLiquidityMsgWithdrawPosition extends CosmosMessage
    with
        ServiceMessage<
            OsmosisConcentratedLiquidityMsgWithdrawPositionResponse> {
  final BigInt? positionId;
  final String? sender;
  final String liquidityAmount;

  OsmosisConcentratedLiquidityMsgWithdrawPosition(
      {this.positionId, this.sender, required this.liquidityAmount});
  factory OsmosisConcentratedLiquidityMsgWithdrawPosition.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityMsgWithdrawPosition(
        positionId: decode.getField(1),
        sender: decode.getField(2),
        liquidityAmount: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "position_id": positionId?.toString(),
      "sender": sender,
      "liquidity_amount": liquidityAmount
    };
  }

  @override
  List get values => [positionId, sender, liquidityAmount];

  @override
  TypeUrl get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.msgWithdrawPosition;

  @override
  OsmosisConcentratedLiquidityMsgWithdrawPositionResponse onResponse(
      List<int> bytes) {
    return OsmosisConcentratedLiquidityMsgWithdrawPositionResponse.deserialize(
        bytes);
  }

  @override
  TypeUrl get service =>
      OsmosisConcentratedLiquidityV1beta1Types.withdrawPosition;

  @override
  List<String?> get signers => [sender];
}
