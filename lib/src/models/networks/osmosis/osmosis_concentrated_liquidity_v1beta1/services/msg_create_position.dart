import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

import 'msg_create_position_response.dart';

class OsmosisConcentratedLiquidityMsgCreatePosition extends CosmosMessage
    with ServiceMessage<OsmosisConcentratedLiquidityMsgCreatePositionResponse> {
  final BigInt? poolId;
  final String? sender;
  final BigInt? lowerTick;
  final BigInt? upperTick;

  /// tokens_provided is the amount of tokens provided for the position.
  /// It must at a minimum be of length 1 (for a single sided position)
  /// and at a maximum be of length 2 (for a position that straddles the current
  /// tick).
  final List<Coin> tokensProvided;
  final BigInt tokenMinAmount0;
  final BigInt tokenMinAmount1;
  OsmosisConcentratedLiquidityMsgCreatePosition(
      {this.poolId,
      this.sender,
      this.lowerTick,
      this.upperTick,
      required List<Coin> tokensProvided,
      required this.tokenMinAmount0,
      required this.tokenMinAmount1})
      : tokensProvided = tokensProvided.immutable;
  factory OsmosisConcentratedLiquidityMsgCreatePosition.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityMsgCreatePosition(
        poolId: decode.getField(1),
        sender: decode.getField(2),
        lowerTick: decode.getField(3),
        upperTick: decode.getField(4),
        tokensProvided:
            decode.getFields(5).map((e) => Coin.deserialize(e)).toList(),
        tokenMinAmount0: BigInt.parse(decode.getField(6)),
        tokenMinAmount1: BigInt.parse(decode.getField(7)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7];

  @override
  Map<String, dynamic> toJson() {
    return {
      "pool_id": poolId?.toString(),
      "sender": sender,
      "lower_tick": lowerTick?.toString(),
      "upper_tick": upperTick?.toString(),
      "tokens_provided": tokensProvided.map((e) => e.toJson()).toList(),
      "token_min_amount0": tokenMinAmount0.toString(),
      "token_min_amount1": tokenMinAmount1.toString()
    };
  }

  @override
  List get values => [
        poolId,
        sender,
        lowerTick,
        upperTick,
        tokensProvided,
        tokenMinAmount0.toString(),
        tokenMinAmount1.toString()
      ];

  @override
  String get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.msgCreatePosition.typeUrl;

  @override
  OsmosisConcentratedLiquidityMsgCreatePositionResponse onResponse(
      List<int> bytes) {
    return OsmosisConcentratedLiquidityMsgCreatePositionResponse.deserialize(
        bytes);
  }

  @override
  String get service =>
      OsmosisConcentratedLiquidityV1beta1Types.createPosition.typeUrl;

  @override
  List<String?> get signers => [sender];
}
