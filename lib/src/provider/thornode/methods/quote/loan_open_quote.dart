import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';

/// Provide a quote estimate for the provided loan open.
class ThorNodeRequestLoanOpenQuote
    extends ThorNodeRequestParam<Map<String, dynamic>, Map<String, dynamic>> {
  ThorNodeRequestLoanOpenQuote(
      {this.height,
      this.fromAsset,
      this.amount,
      this.toAsset,
      this.destination,
      this.minOut,
      this.affiliateBPS,
      this.affiliate});

  /// optional block height, defaults to current tip
  final BigInt? height;

  /// the collateral asset
  final String? fromAsset;

  /// the collateral asset amount in 1e8 decimals
  final BigInt? amount;

  /// the target asset to receive (loan denominated in TOR regardless)
  final String? toAsset;

  /// the destination address, required to generate memo
  final String? destination;

  /// the minimum amount of the target asset to accept
  final String? minOut;

  /// the affiliate fee in basis points
  final BigInt? affiliateBPS;

  /// the affiliate (address or thorname)
  final String? affiliate;

  @override
  String get method => ThorNodeMethods.loanOpen.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {
        "height": height?.toString(),
        "from_asset": fromAsset,
        "amount": amount?.toString(),
        "to_asset": toAsset,
        "destination": destination,
        "min_out": minOut,
        "affiliate_bps": affiliateBPS?.toString(),
        "affiliate": affiliate
      };
}
