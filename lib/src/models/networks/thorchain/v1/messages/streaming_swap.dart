import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class ThorchainStreamingSwap extends CosmosMessage {
  final String? txId;
  final BigInt? interval;
  final BigInt? quantity;
  final BigInt? count;
  final BigInt? lastHeight;
  final BigInt tradeTarget;
  final BigInt deposit;
  final BigInt inValue;
  final BigInt outValue;
  final List<BigInt>? failedSwaps;
  final List<String>? failedSwapReasons;
  ThorchainStreamingSwap(
      {this.txId,
      this.interval,
      this.quantity,
      this.count,
      this.lastHeight,
      required this.tradeTarget,
      required this.deposit,
      required this.inValue,
      required this.outValue,
      List<BigInt>? failedSwaps,
      List<String>? failedSwapReasons})
      : failedSwaps = failedSwaps?.emptyAsNull?.immutable,
        failedSwapReasons = failedSwapReasons?.emptyAsNull?.immutable;
  factory ThorchainStreamingSwap.deserialized(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainStreamingSwap(
      txId: decode.getField(1),
      interval: decode.getField(2),
      quantity: decode.getField(3),
      count: decode.getField(4),
      lastHeight: decode.getField(5),
      tradeTarget: BigInt.parse(decode.getField(6)),
      deposit: BigInt.parse(decode.getField(7)),
      inValue: BigInt.parse(decode.getField(8)),
      outValue: BigInt.parse(decode.getField(9)),
      failedSwaps: decode
              .getResult<ProtocolBufferDecoderResult?>(10)
              ?.to<List<BigInt>, List<int>>(
                  (e) => e.map((e) => BigintUtils.parse(e)).toList()) ??
          <BigInt>[],
      failedSwapReasons: decode.getField(11),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];

  @override
  Map<String, dynamic> toJson() {
    return {
      "tx_id": txId,
      "interval": interval.toString(),
      "quantity": quantity.toString(),
      "count": count.toString(),
      "last_height": lastHeight?.toString(),
      "trade_target": tradeTarget.toString(),
      "deposit": deposit.toString(),
      "in": inValue.toString(),
      "out": outValue.toString(),
      "failed_swaps": failedSwaps?.map((e) => e.toString()).toList(),
      "failed_swap_reasons": failedSwapReasons
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.streamingSwap.typeUrl;

  @override
  List get values => [
        txId,
        interval,
        quantity,
        count,
        lastHeight,
        tradeTarget.toString(),
        deposit.toString(),
        inValue.toString(),
        outValue.toString(),
        failedSwaps,
        failedSwapReasons
      ];
}
