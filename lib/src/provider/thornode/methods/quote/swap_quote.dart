import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';

/// Provide a quote estimate for the provided swap.
class ThorNodeRequestSwapQuote
    extends ThorNodeRequestParam<Map<String, dynamic>, Map<String, dynamic>> {
  ThorNodeRequestSwapQuote(
      {this.height,
      this.fromAsset,
      this.toAsset,
      this.amount,
      this.destination,
      this.refundAddress,
      this.streamingInterval,
      this.streamingQuantity,
      this.toleranceBps,
      this.affiliateBps,
      this.affiliate,
      this.fromAddress});

  /// optional block height, defaults to current tip
  final BigInt? height;

  /// the source asset
  final String? fromAsset;

  /// the target asset
  final String? toAsset;

  /// the source asset amount in 1e8 decimals
  final BigInt? amount;

  /// the destination address, required to generate memo
  final String? destination;

  /// he refund address, refunds will be sent here if the swap fails
  final String? refundAddress;

  /// the interval in which streaming swaps are swapped
  final BigInt? streamingInterval;

  /// the quantity of swaps within a streaming swap
  final BigInt? streamingQuantity;

  /// the maximum basis points from the current feeless swap price to set the limit in the generated memo
  final BigInt? toleranceBps;

  /// the affiliate fee in basis points
  final BigInt? affiliateBps;

  /// the affiliate (address or thorname)
  final String? affiliate;

  final String? fromAddress;

  @override
  String get method => ThorNodeMethods.quoteSwap.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {
        "height": height?.toString(),
        "from_asset": fromAsset,
        "to_asset": toAsset,
        "amount": amount?.toString(),
        "destination": destination,
        "refund_address": refundAddress,
        "streaming_interval": streamingInterval?.toString(),
        "streaming_quantity": streamingQuantity?.toString(),
        "tolerance_bps": toleranceBps?.toString(),
        "affiliate_bps": affiliateBps?.toString(),
        "affiliate": affiliate,
        "from_address": fromAddress
      };
}
