import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';
import 'package:cosmos_sdk/src/provider/thornode/models/models/asset_trade_info.dart';

/// Returns the total units and depth for each trade asset
class ThorNodeRequestTradeUnits
    extends
        ThorNodeRequestParam<
          List<AssetTradeInfoResponse>,
          List<Map<String, dynamic>>
        > {
  ThorNodeRequestTradeUnits({this.height});

  /// optional block height, defaults to current tip
  final BigInt? height;
  @override
  String get method => ThorNodeMethods.tradeUnits.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};

  @override
  List<AssetTradeInfoResponse> onResonse(List<Map<String, dynamic>> result) {
    return result.map((e) => AssetTradeInfoResponse.fromJson(e)).toList();
  }
}
