import 'package:blockchain_utils/helper/helper.dart';

class StreamingSwapStateResponse {
  final String txId;
  final int interval;
  final int quantity;
  final int count;
  final int lastHeight;
  final String tradeTarget;
  final String sourceAsset;
  final String targetAsset;
  final String destination;
  final String deposit;
  final String inAmount;
  final String outAmount;
  final List<int> failedSwaps;
  final List<String> failedSwapReasons;

  StreamingSwapStateResponse({
    required this.txId,
    required this.interval,
    required this.quantity,
    required this.count,
    required this.lastHeight,
    required this.tradeTarget,
    required this.sourceAsset,
    required this.targetAsset,
    required this.destination,
    required this.deposit,
    required this.inAmount,
    required this.outAmount,
    required List<int> failedSwaps,
    required List<String> failedSwapReasons,
  })  : failedSwaps = failedSwaps.immutable,
        failedSwapReasons = failedSwapReasons.immutable;

  factory StreamingSwapStateResponse.fromJson(Map<String, dynamic> json) {
    return StreamingSwapStateResponse(
      txId: json['tx_id'],
      interval: json['interval'],
      quantity: json['quantity'],
      count: json['count'],
      lastHeight: json['last_height'],
      tradeTarget: json['trade_target'],
      sourceAsset: json['source_asset'],
      targetAsset: json['target_asset'],
      destination: json['destination'],
      deposit: json['deposit'],
      inAmount: json['in'],
      outAmount: json['out'],
      failedSwaps: List<int>.from(json['failed_swaps']),
      failedSwapReasons: List<String>.from(json['failed_swap_reasons']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tx_id': txId,
      'interval': interval,
      'quantity': quantity,
      'count': count,
      'last_height': lastHeight,
      'trade_target': tradeTarget,
      'source_asset': sourceAsset,
      'target_asset': targetAsset,
      'destination': destination,
      'deposit': deposit,
      'in': inAmount,
      'out': outAmount,
      'failed_swaps': failedSwaps,
      'failed_swap_reasons': failedSwapReasons,
    };
  }
}
