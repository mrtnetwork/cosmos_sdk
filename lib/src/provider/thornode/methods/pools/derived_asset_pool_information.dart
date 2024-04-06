import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';
import 'package:cosmos_sdk/src/provider/thornode/models/models/derived_asset_information.dart';

/// Returns the pool information for the provided derived asset.
class ThorNodeRequestDerivedAssetPoolInformation extends ThorNodeRequestParam<
    DerivedAssetPoolInformationResponse, Map<String, dynamic>> {
  ThorNodeRequestDerivedAssetPoolInformation(
      {required this.asset, this.height});

  /// optional block height, defaults to current tip
  final BigInt? height;
  final String asset;
  @override
  String get method => ThorNodeMethods.dpool.url;

  @override
  List<String> get pathParameters => [asset];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};

  @override
  DerivedAssetPoolInformationResponse onResonse(Map<String, dynamic> result) {
    return DerivedAssetPoolInformationResponse.fromJson(result);
  }
}
