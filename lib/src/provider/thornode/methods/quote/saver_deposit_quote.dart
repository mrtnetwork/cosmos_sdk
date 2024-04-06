import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';

/// Provide a quote estimate for the provided saver deposit.
class ThorNodeRequestSaverDepositQuote
    extends ThorNodeRequestParam<Map<String, dynamic>, Map<String, dynamic>> {
  ThorNodeRequestSaverDepositQuote({this.height, this.asset, this.amount});

  /// optional block height, defaults to current tip
  final BigInt? height;

  /// tthe asset to deposit
  final String? asset;

  /// the source asset amount in 1e8 decimals
  final BigInt? amount;

  @override
  String get method => ThorNodeMethods.saverDeposit.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {
        "height": height?.toString(),
        "amount": amount?.toString(),
        "asset": asset?.toString(),
      };
}
