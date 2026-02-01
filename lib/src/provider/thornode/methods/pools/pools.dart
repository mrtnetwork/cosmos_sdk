import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';
import 'package:cosmos_sdk/src/provider/thornode/models/models/asset_information.dart';

/// Returns the pool information for all assets.
class ThorNodeRequestPools
    extends
        ThorNodeRequestParam<
          List<AssetPoolInformationResponse>,
          List<Map<String, dynamic>>
        > {
  ThorNodeRequestPools({this.height});

  /// optional block height, defaults to current tip
  final BigInt? height;

  @override
  String get method => ThorNodeMethods.pools.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};

  @override
  List<AssetPoolInformationResponse> onResonse(
    List<Map<String, dynamic>> result,
  ) {
    return result.map((e) => AssetPoolInformationResponse.fromJson(e)).toList();
  }
}
