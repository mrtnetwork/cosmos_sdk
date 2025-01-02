import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class ThorchainEventStreamingSwap extends CosmosMessage {
  final String? txId;
  final BigInt? interval;
  final BigInt? quantity;
  final BigInt? count;
  final BigInt? lastHeight;
  final BigInt tradeTarget;
  final ThorchainCoin deposit;
  final ThorchainCoin inCoin;
  final ThorchainCoin outCoin;
  final List<BigInt>? failedSwaps;
  final List<String>? failedSwapReasons;
  ThorchainEventStreamingSwap(
      {this.txId,
      this.interval,
      this.quantity,
      this.count,
      this.lastHeight,
      required this.tradeTarget,
      required this.deposit,
      required this.inCoin,
      required this.outCoin,
      List<BigInt>? failedSwaps,
      List<String>? failedSwapReasonss})
      : failedSwapReasons = failedSwapReasonss?.emptyAsNull?.immutable,
        failedSwaps = failedSwaps?.emptyAsNull?.immutable;
  factory ThorchainEventStreamingSwap.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainEventStreamingSwap(
        txId: decode.getField(1),
        interval: decode.getField(2),
        quantity: decode.getField(3),
        count: decode.getField(4),
        lastHeight: decode.getField(5),
        tradeTarget: BigintUtils.parse(decode.getField<String>(6)),
        deposit: ThorchainCoin.deserialize(decode.getField(7)),
        inCoin: ThorchainCoin.deserialize(decode.getField(8)),
        outCoin: ThorchainCoin.deserialize(decode.getField(9)),
        failedSwaps: decode
                .getResult<ProtocolBufferDecoderResult?>(10)
                ?.to<List<BigInt>, List<int>>(
                    (e) => e.map((e) => BigintUtils.parse(e)).toList()) ??
            <BigInt>[],
        failedSwapReasonss: decode.getFields<String>(11));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];

  @override
  Map<String, dynamic> toJson() {
    return {
      "tx_id": txId,
      "interval": interval?.toString(),
      "quantity": quantity?.toString(),
      "count": count?.toString(),
      "last_height": lastHeight?.toString(),
      "trade_target": tradeTarget.toString(),
      "deposit": deposit.toJson(),
      "in": inCoin.toJson(),
      "out": outCoin.toJson(),
      "failed_swaps": failedSwaps?.map((e) => e.toString()).toList(),
      "failed_swap_reasons": failedSwapReasons
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.eventStreamingSwap;

  @override
  List get values => [
        txId,
        interval,
        quantity,
        count,
        lastHeight,
        tradeTarget.toString(),
        deposit,
        inCoin,
        outCoin,
        failedSwaps,
        failedSwapReasons
      ];
}
