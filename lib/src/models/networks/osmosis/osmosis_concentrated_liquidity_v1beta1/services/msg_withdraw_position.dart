import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'msg_withdraw_position_response.dart';

class OsmosisConcentratedLiquidityMsgWithdrawPosition
    extends
        OsmosisConcentratedLiquidityV1Beta1<
          OsmosisConcentratedLiquidityMsgWithdrawPositionResponse
        > {
  final BigInt? positionId;
  final String? sender;
  final String liquidityAmount;

  OsmosisConcentratedLiquidityMsgWithdrawPosition({
    this.positionId,
    this.sender,
    required this.liquidityAmount,
  });
  factory OsmosisConcentratedLiquidityMsgWithdrawPosition.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityMsgWithdrawPosition(
      positionId: decode.getField(1),
      sender: decode.getField(2),
      liquidityAmount: decode.getField(3),
    );
  }
  factory OsmosisConcentratedLiquidityMsgWithdrawPosition.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisConcentratedLiquidityMsgWithdrawPosition(
      positionId: json.asBigInt("position_id"),
      sender: json.as("sender"),
      liquidityAmount: json.as("liquidity_amount"),
    );
  }
  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "position_id": positionId?.toString(),
      "sender": sender,
      "liquidity_amount": liquidityAmount,
    };
  }

  @override
  List get values => [positionId, sender, liquidityAmount];

  @override
  TypeUrl get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.msgWithdrawPosition;

  @override
  OsmosisConcentratedLiquidityMsgWithdrawPositionResponse onResponse(
    List<int> bytes,
  ) {
    return OsmosisConcentratedLiquidityMsgWithdrawPositionResponse.deserialize(
      bytes,
    );
  }

  @override
  List<String?> get signers => [sender];
}
