import 'package:cosmos_sdk/src/utils/quick.dart';

class ThoreNodeQouteSwapResponse {
  final String inboundAddress;
  final BigInt? inboundConfirmationBlocks;
  final BigInt? inboundConfirmationSeconds;
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
  final BigInt? maxStreamingQuantity;
  final BigInt? streamingSwapBlocks;
  final BigInt? streamingSwapSeconds;
  final int? totalSwapSeconds;
  final ThoreNodeQouteSwapFeeResponse fees;
  ThoreNodeQouteSwapResponse(
      {required this.inboundAddress,
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
      required this.fees});

  factory ThoreNodeQouteSwapResponse.fromJson(Map<String, dynamic> json) {
    return ThoreNodeQouteSwapResponse(
        inboundAddress: json.as("inbound_address"),
        inboundConfirmationBlocks: json.asBigInt("inbound_confirmation_blocks"),
        inboundConfirmationSeconds:
            json.asBigInt("inbound_confirmation_seconds"),
        outboundDelayBlocks: json.asBigInt("outbound_delay_blocks"),
        outboundDelaySeconds: json.asBigInt("outbound_delay_seconds"),
        router: json.as("router"),
        expiry: json.asBigInt("expiry"),
        warning: json.as("warning"),
        notes: json.as("notes"),
        dustThreshold: json.as("dust_threshold"),
        recommendedMinAmountIn: json.as("recommended_min_amount_in"),
        recommendedGasRate: json.as("recommended_gas_rate"),
        gasRateUnits: json.as("gas_rate_units"),
        memo: json.as("memo"),
        expectedAmountOut: json.asBigInt("expected_amount_out"),
        maxStreamingQuantity: json.asBigInt("max_streaming_quantity"),
        streamingSwapBlocks: json.asBigInt("streaming_swap_blocks"),
        streamingSwapSeconds: json.asBigInt("streaming_swap_seconds"),
        totalSwapSeconds: json.asInt("total_swap_seconds"),
        fees: ThoreNodeQouteSwapFeeResponse.fromJson(json.asMap("fees")));
  }
  Map<String, dynamic> toJson() {
    return {
      "inbound_address": inboundAddress,
      "inbound_confirmation_blocks": inboundConfirmationBlocks?.toString(),
      "inbound_confirmation_seconds": inboundConfirmationSeconds?.toString(),
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
      "max_streaming_quantity": maxStreamingQuantity?.toString(),
      "streaming_swap_blocks": streamingSwapBlocks?.toString(),
      "streaming_swap_seconds": streamingSwapSeconds?.toString(),
      "total_swap_seconds": totalSwapSeconds?.toString(),
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
  final BigInt slippageBps;
  final BigInt totalBps;
  const ThoreNodeQouteSwapFeeResponse(
      {required this.asset,
      required this.affiliate,
      required this.outbound,
      required this.liquidity,
      required this.total,
      required this.slippageBps,
      required this.totalBps});
  factory ThoreNodeQouteSwapFeeResponse.fromJson(Map<String, dynamic> json) {
    return ThoreNodeQouteSwapFeeResponse(
        asset: json.as("asset"),
        affiliate: json.as("affiliate"),
        outbound: json.as("outbound"),
        liquidity: json.as("liquidity"),
        total: json.as("total"),
        slippageBps: json.asBigInt("slippage_bps"),
        totalBps: json.asBigInt("total_bps"));
  }
  Map<String, dynamic> toJson() {
    return {
      "asset": asset,
      "affiliate": affiliate,
      "outbound": outbound,
      "liquidity": liquidity,
      "total": total,
      "slippage_bps": slippageBps.toString(),
      "total_bps": totalBps.toString(),
    };
  }
}
