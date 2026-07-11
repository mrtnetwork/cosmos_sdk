import 'package:blockchain_utils/utils/json/extension/json.dart';

class ThoreNodeQouteSwapResponse {
  final String inboundAddress;
  final BigInt? inboundConfirmationBlocks;
  final int inboundConfirmationSeconds;
  final BigInt? outboundDelayBlocks;
  final BigInt? outboundDelaySeconds;
  final String? router;
  final BigInt expiry;
  final String warning;
  final String notes;
  final String? dustThreshold;
  final String? recommendedMinAmountIn;
  final String? recommendedGasRate;
  final String? gasRateUnits;
  final String? memo;
  final BigInt expectedAmountOut;
  final int maxStreamingQuantity;
  final int streamingSwapBlocks;
  final int streamingSwapSeconds;
  final int totalSwapSeconds;
  final ThoreNodeQouteSwapFeeResponse fees;
  ThoreNodeQouteSwapResponse({
    required this.inboundAddress,
    required this.inboundConfirmationBlocks,
    required this.inboundConfirmationSeconds,
    required this.outboundDelayBlocks,
    required this.outboundDelaySeconds,
    required this.router,
    required this.expiry,
    required this.warning,
    required this.notes,
    required this.dustThreshold,
    required this.recommendedMinAmountIn,
    required this.recommendedGasRate,
    required this.gasRateUnits,
    required this.memo,
    required this.expectedAmountOut,
    required this.maxStreamingQuantity,
    required this.streamingSwapBlocks,
    required this.streamingSwapSeconds,
    required this.totalSwapSeconds,
    required this.fees,
  });

  factory ThoreNodeQouteSwapResponse.fromJson(Map<String, dynamic> json) {
    return ThoreNodeQouteSwapResponse(
      inboundAddress: json.valueAs("inbound_address"),
      inboundConfirmationBlocks: json.valueAsBigInt(
        "inbound_confirmation_blocks",
      ),
      inboundConfirmationSeconds:
          json.valueAsInt<int?>("inbound_confirmation_seconds") ?? 0,
      outboundDelayBlocks: json.valueAsBigInt("outbound_delay_blocks"),
      outboundDelaySeconds: json.valueAsBigInt("outbound_delay_seconds"),
      router: json.valueAs("router"),
      expiry: json.valueAsBigInt("expiry"),
      warning: json.valueAs("warning"),
      notes: json.valueAs("notes"),
      dustThreshold: json.valueAs("dust_threshold"),
      recommendedMinAmountIn: json.valueAs("recommended_min_amount_in"),
      recommendedGasRate: json.valueAs("recommended_gas_rate"),
      gasRateUnits: json.valueAs("gas_rate_units"),
      memo: json.valueAs("memo"),
      expectedAmountOut: json.valueAsBigInt("expected_amount_out"),
      maxStreamingQuantity:
          json.valueAsInt<int?>("max_streaming_quantity") ?? 0,
      streamingSwapBlocks: json.valueAsInt<int?>("streaming_swap_blocks") ?? 0,
      streamingSwapSeconds:
          json.valueAsInt<int?>("streaming_swap_seconds") ?? 0,
      totalSwapSeconds: json.valueAsInt<int?>("total_swap_seconds") ?? 0,
      fees: ThoreNodeQouteSwapFeeResponse.fromJson(
        json.valueEnsureAsMap<String, dynamic>("fees"),
      ),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "inbound_address": inboundAddress,
      "inbound_confirmation_blocks": inboundConfirmationBlocks?.toString(),
      "inbound_confirmation_seconds": inboundConfirmationSeconds.toString(),
      "outbound_delay_blocks": outboundDelayBlocks?.toString(),
      "outbound_delay_seconds": outboundDelaySeconds?.toString(),
      "router": router,
      "expiry": expiry.toString(),
      "warning": warning,
      "notes": notes,
      "dust_threshold": dustThreshold,
      "recommended_min_amount_in": recommendedMinAmountIn,
      "recommended_gas_rate": recommendedGasRate,
      "gas_rate_units": gasRateUnits,
      "memo": memo,
      "expected_amount_out": expectedAmountOut.toString(),
      "max_streaming_quantity": maxStreamingQuantity,
      "streaming_swap_blocks": streamingSwapBlocks,
      "streaming_swap_seconds": streamingSwapSeconds,
      "total_swap_seconds": totalSwapSeconds,
      "fees": fees.toJson(),
    };
  }
}

class ThoreNodeQouteSwapFeeResponse {
  final String asset;
  final String? affiliate;
  final String? outbound;
  final String liquidity;
  final String total;
  final int slippageBps;
  final int totalBps;
  const ThoreNodeQouteSwapFeeResponse({
    required this.asset,
    required this.affiliate,
    required this.outbound,
    required this.liquidity,
    required this.total,
    required this.slippageBps,
    required this.totalBps,
  });
  factory ThoreNodeQouteSwapFeeResponse.fromJson(Map<String, dynamic> json) {
    return ThoreNodeQouteSwapFeeResponse(
      asset: json.valueAs("asset"),
      affiliate: json.valueAs("affiliate"),
      outbound: json.valueAs("outbound"),
      liquidity: json.valueAs("liquidity"),
      total: json.valueAs("total"),
      slippageBps: json.valueAsInt("slippage_bps"),
      totalBps: json.valueAsInt("total_bps"),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "asset": asset,
      "affiliate": affiliate,
      "outbound": outbound,
      "liquidity": liquidity,
      "total": total,
      "slippage_bps": slippageBps,
      "total_bps": totalBps,
    };
  }
}
