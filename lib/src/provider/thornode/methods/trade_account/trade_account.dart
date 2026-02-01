import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';
import 'package:cosmos_sdk/src/provider/thornode/models/models/trade_account.dart';

/// Returns the units and depth of a trade account
class ThorNodeRequestTradeAccount
    extends
        ThorNodeRequestParam<ThorTradeAccountResponse, Map<String, dynamic>> {
  ThorNodeRequestTradeAccount({this.height, required this.address});

  /// optional block height, defaults to current tip
  final BigInt? height;
  final String address;
  @override
  String get method => ThorNodeMethods.tradeAccount.url;

  @override
  List<String> get pathParameters => [address];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};

  @override
  ThorTradeAccountResponse onResonse(Map<String, dynamic> result) {
    return ThorTradeAccountResponse.fromJson(result);
  }
}
