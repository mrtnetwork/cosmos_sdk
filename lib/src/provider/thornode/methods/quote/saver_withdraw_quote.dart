import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';

/// Provide a quote estimate for the provided saver withdraw.
class ThorNodeRequestSaverWithdrawQuote
    extends ThorNodeRequestParam<Map<String, dynamic>, Map<String, dynamic>> {
  ThorNodeRequestSaverWithdrawQuote(
      {this.height, this.asset, this.address, this.withdrawBPS});

  /// optional block height, defaults to current tip
  final BigInt? height;

  /// tthe asset to withdraw
  final String? asset;

  /// the address for the position
  final String? address;

  /// the basis points of the existing position to withdraw
  final BigInt? withdrawBPS;

  @override
  String get method => ThorNodeMethods.saverWithdraw.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {
        "height": height?.toString(),
        "address": address,
        "asset": asset?.toString(),
        "withdraw_bps": withdrawBPS?.toString()
      };
}
