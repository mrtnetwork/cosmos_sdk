import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';
import 'package:cosmos_sdk/src/provider/thornode/models/models/trade_account.dart';

/// Returns all trade accounts for an asset
class ThorNodeRequestTradeAccounts
    extends
        ThorNodeRequestParam<
          List<ThorTradeAccountResponse>,
          List<Map<String, dynamic>>
        > {
  ThorNodeRequestTradeAccounts({required this.asset, this.height});

  /// optional block height, defaults to current tip
  final BigInt? height;
  final String asset;

  @override
  String get method => ThorNodeMethods.tradeAccounts.url;

  @override
  List<String> get pathParameters => [asset];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};

  @override
  List<ThorTradeAccountResponse> onResonse(List<Map<String, dynamic>> result) {
    return result.map((e) => ThorTradeAccountResponse.fromJson(e)).toList();
  }
}
