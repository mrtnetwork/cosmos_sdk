import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';
import 'package:cosmos_sdk/src/provider/thornode/models/models/asset_information.dart';

/// Returns the pool information for the provided asset
class ThorNodeRequestAssetPoolInformation extends ThorNodeRequestParam<
    AssetPoolInformationResponse, Map<String, dynamic>> {
  ThorNodeRequestAssetPoolInformation({required this.asset, this.height});

  /// optional block height, defaults to current tip
  final BigInt? height;
  final String asset;
  @override
  String get method => ThorNodeMethods.assetPool.url;

  @override
  List<String> get pathParameters => [asset];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};

  @override
  AssetPoolInformationResponse onResonse(Map<String, dynamic> result) {
    return AssetPoolInformationResponse.fromJson(result);
  }
}
