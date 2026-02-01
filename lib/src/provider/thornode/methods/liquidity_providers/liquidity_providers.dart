import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';
import 'package:cosmos_sdk/src/provider/thornode/models/models/asset_liquidity_provider_information.dart';

/// Returns all liquidity provider information for an asset..
class ThorNodeRequestAssetLiquidityProvidersInformation
    extends
        ThorNodeRequestParam<
          List<AssetLiquidityProviderInformationResponse>,
          List<Map<String, dynamic>>
        > {
  ThorNodeRequestAssetLiquidityProvidersInformation({
    required this.asset,
    this.height,
  });

  /// optional block height, defaults to current tip
  final BigInt? height;

  /// Example: BTC.BTC
  final String asset;

  @override
  String get method => ThorNodeMethods.liquidityProviders.url;

  @override
  List<String> get pathParameters => [asset];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};

  @override
  List<AssetLiquidityProviderInformationResponse> onResonse(
    List<Map<String, dynamic>> result,
  ) {
    return result
        .map((e) => AssetLiquidityProviderInformationResponse.fromJson(e))
        .toList();
  }
}
