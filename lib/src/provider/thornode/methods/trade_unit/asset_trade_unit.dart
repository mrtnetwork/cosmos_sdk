import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';
import 'package:cosmos_sdk/src/provider/thornode/models/models/asset_trade_info.dart';

/// Returns the total units and depth of a trade asset
class ThorNodeRequestTradeUnit
    extends ThorNodeRequestParam<AssetTradeInfoResponse, Map<String, dynamic>> {
  ThorNodeRequestTradeUnit({this.height, required this.asset});

  /// optional block height, defaults to current tip
  final BigInt? height;
  final String asset;
  @override
  String get method => ThorNodeMethods.tradeUnit.url;

  @override
  List<String> get pathParameters => [asset];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};

  @override
  AssetTradeInfoResponse onResonse(Map<String, dynamic> result) {
    return AssetTradeInfoResponse.fromJson(result);
  }
}
