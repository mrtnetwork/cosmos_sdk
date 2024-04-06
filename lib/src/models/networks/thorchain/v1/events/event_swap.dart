import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainEventSwap extends CosmosMessage {
  final ThorchainAsset pool;
  final BigInt swapTarget;
  final BigInt swapSlip;
  final BigInt liquidityFee;
  final BigInt liquidityFeeInRune;
  final ThorchainTx inTx;
  final ThorchainTx outTxs;
  final ThorchainCoin emitAsset;
  final BigInt synthUnits;
  final BigInt? streamingSwapQuantity;
  final BigInt? streamingSwapCount;
  final BigInt poolSlip;
  const ThorchainEventSwap(
      {required this.pool,
      required this.swapTarget,
      required this.swapSlip,
      required this.liquidityFee,
      required this.liquidityFeeInRune,
      required this.inTx,
      required this.outTxs,
      required this.emitAsset,
      required this.synthUnits,
      this.streamingSwapQuantity,
      this.streamingSwapCount,
      required this.poolSlip});
  factory ThorchainEventSwap.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainEventSwap(
        pool: ThorchainAsset.deserialize(decode.getField(1)),
        swapTarget: BigInt.parse(decode.getField(2)),
        swapSlip: BigInt.parse(decode.getField(3)),
        liquidityFee: BigInt.parse(decode.getField(4)),
        liquidityFeeInRune: BigInt.parse(decode.getField(5)),
        inTx: ThorchainTx.deserialize(decode.getField(6)),
        outTxs: ThorchainTx.deserialize(decode.getField(7)),
        emitAsset: ThorchainCoin.deserialize(decode.getField(8)),
        synthUnits: BigInt.parse(decode.getField(9)),
        streamingSwapQuantity: decode.getField(10),
        streamingSwapCount: decode.getField(11),
        poolSlip: BigInt.parse(decode.getField(12)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

  @override
  Map<String, dynamic> toJson() {
    return {
      "pool": pool.toJson(),
      "swap_target": swapTarget.toString(),
      "swap_slip": swapSlip.toString(),
      "liquidity_fee": liquidityFee.toString(),
      "liquidity_fee_in_rune": liquidityFeeInRune.toString(),
      "in_tx": inTx.toJson(),
      "out_txs": outTxs.toJson(),
      "emit_asset": emitAsset.toJson(),
      "synth_units": synthUnits.toString(),
      "streaming_swap_quantity": streamingSwapQuantity?.toString(),
      "streaming_swap_count": streamingSwapCount?.toString(),
      "pool_slip": poolSlip.toString()
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.eventSwap.typeUrl;

  @override
  List get values => [
        pool,
        swapTarget.toString(),
        swapSlip.toString(),
        liquidityFee.toString(),
        liquidityFeeInRune.toString(),
        inTx,
        outTxs,
        emitAsset,
        synthUnits.toString(),
        streamingSwapQuantity,
        streamingSwapCount,
        poolSlip.toString()
      ];
}
