import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';
import 'package:cosmos_sdk/src/provider/thornode/models/models/derived_asset_information.dart';

/// Returns the pool information for all derived assets.
class ThorNodeRequestDerivedPools extends ThorNodeRequestParam<
    List<DerivedAssetPoolInformationResponse>, List<Map<String, dynamic>>> {
  ThorNodeRequestDerivedPools({this.height});

  /// optional block height, defaults to current tip
  final BigInt? height;

  @override
  String get method => ThorNodeMethods.dpools.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};

  @override
  List<DerivedAssetPoolInformationResponse> onResonse(
      List<Map<String, dynamic>> result) {
    return result
        .map((e) => DerivedAssetPoolInformationResponse.fromJson(e))
        .toList();
  }
}
