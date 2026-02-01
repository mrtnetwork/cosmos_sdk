import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'msg_add_to_position_response.dart';

class OsmosisConcentratedLiquidityMsgAddToPosition
    extends
        OsmosisConcentratedLiquidityV1Beta1<
          OsmosisConcentratedLiquidityMsgAddToPositionResponse
        > {
  final BigInt? positionId;
  final String? sender;

  /// amount0 represents the amount of token0 willing to put in.
  final BigInt amount0;

  /// amount1 represents the amount of token1 willing to put in.
  final BigInt amount1;

  /// token_min_amount0 represents the minimum amount of token0 desired from the
  /// new position being created. Note that this field indicates the min amount0
  /// corresponding to the liquidity that is being added, not the total
  /// liquidity of the position.
  final BigInt tokenMinAmount0;

  /// token_min_amount1 represents the minimum amount of token1 desired from the
  /// new position being created. Note that this field indicates the min amount1
  /// corresponding to the liquidity that is being added, not the total
  /// liquidity of the position.
  final BigInt tokenMinAmount1;

  OsmosisConcentratedLiquidityMsgAddToPosition({
    this.positionId,
    this.sender,
    required this.amount0,
    required this.amount1,
    required this.tokenMinAmount0,
    required this.tokenMinAmount1,
  });
  factory OsmosisConcentratedLiquidityMsgAddToPosition.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityMsgAddToPosition(
      positionId: decode.getField(1),
      sender: decode.getField(2),
      amount0: BigInt.parse(decode.getField(3)),
      amount1: BigInt.parse(decode.getField(4)),
      tokenMinAmount0: BigInt.parse(decode.getField(5)),
      tokenMinAmount1: BigInt.parse(decode.getField(6)),
    );
  }
  factory OsmosisConcentratedLiquidityMsgAddToPosition.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisConcentratedLiquidityMsgAddToPosition(
      positionId: json.asBigInt("position_id"),
      sender: json.as("sender"),
      amount0: json.asBigInt("amount0"),
      amount1: json.asBigInt("amount1"),
      tokenMinAmount0: json.asBigInt("token_min_amount0"),
      tokenMinAmount1: json.asBigInt("token_min_amount1"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  Map<String, dynamic> toJson() {
    return {
      "position_id": positionId?.toString(),
      "sender": sender,
      "amount0": amount0.toString(),
      "amount1": amount1.toString(),
      "token_min_amount0": tokenMinAmount0.toString(),
      "token_min_amount1": tokenMinAmount1.toString(),
    };
  }

  @override
  List get values => [
    positionId,
    sender,
    amount0.toString(),
    amount1.toString(),
    tokenMinAmount0.toString(),
    tokenMinAmount1.toString(),
  ];

  @override
  TypeUrl get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.msgAddToPosition;

  @override
  OsmosisConcentratedLiquidityMsgAddToPositionResponse onResponse(
    List<int> bytes,
  ) {
    return OsmosisConcentratedLiquidityMsgAddToPositionResponse.deserialize(
      bytes,
    );
  }

  @override
  List<String?> get signers => [sender];
}
