import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';

/// Provide a quote estimate for the provided loan close.
class ThorNodeRequestLoanCloseQuote
    extends ThorNodeRequestParam<Map<String, dynamic>, Map<String, dynamic>> {
  ThorNodeRequestLoanCloseQuote({
    this.height,
    this.fromAsset,
    this.toAsset,
    this.minOut,
    this.repayBPS,
    this.loanOwner,
  });

  /// optional block height, defaults to current tip
  final BigInt? height;

  /// the asset used to repay the loan
  final String? fromAsset;

  /// the basis points of the existing position to repay
  final BigInt? repayBPS;

  /// the collateral asset of the loan
  final String? toAsset;

  /// the owner of the loan collateral
  final String? loanOwner;

  /// the minimum amount of the target asset to accept
  final String? minOut;

  @override
  String get method => ThorNodeMethods.loanClose.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {
    "height": height?.toString(),
    "from_asset": fromAsset,
    "to_asset": toAsset,
    "min_out": minOut,
    "repay_bps": repayBPS?.toString(),
    "loan_owner": loanOwner,
  };
}
