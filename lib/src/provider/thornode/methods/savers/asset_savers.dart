import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';
import 'package:cosmos_sdk/src/provider/thornode/models/models/asset_saver_information.dart';

/// Returns all savers for the savers pool.
class ThorNodeRequestAssetSaversPosition extends ThorNodeRequestParam<
    List<AssetSaverPositionResponse>, List<Map<String, dynamic>>> {
  ThorNodeRequestAssetSaversPosition({required this.asset, this.height});

  /// optional block height, defaults to current tip
  final BigInt? height;

  /// Example: BTC.BTC
  final String asset;

  @override
  String get method => ThorNodeMethods.savers.url;

  @override
  List<String> get pathParameters => [asset];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};

  @override
  List<AssetSaverPositionResponse> onResonse(
      List<Map<String, dynamic>> result) {
    return result.map((e) => AssetSaverPositionResponse.fromJson(e)).toList();
  }
}
