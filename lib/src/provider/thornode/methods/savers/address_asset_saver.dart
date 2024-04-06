import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';
import 'package:cosmos_sdk/src/provider/thornode/models/models/asset_saver_information.dart';

/// Returns the saver position given then savers pool and address.
class ThorNodeRequestAddressAssetSaverPosition extends ThorNodeRequestParam<
    AssetSaverPositionResponse, Map<String, dynamic>> {
  ThorNodeRequestAddressAssetSaverPosition(
      {required this.asset, required this.address, this.height});

  /// optional block height, defaults to current tip
  final BigInt? height;

  /// Example: BTC.BTC
  final String asset;

  /// Example: thor1zupk5lmc84r2dh738a9g3zscavannjy3nzplwt
  final String address;
  @override
  String get method => ThorNodeMethods.saverPosition.url;

  @override
  List<String> get pathParameters => [asset, address];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};

  @override
  AssetSaverPositionResponse onResonse(Map<String, dynamic> result) {
    return AssetSaverPositionResponse.fromJson(result);
  }
}
