import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';
import 'package:cosmos_sdk/src/provider/thornode/models/models/asset_liquidity_provider_information.dart';

/// Returns the liquidity provider information for an address and asset.
class ThorNodeRequestAddressAssetLiquidityProviderInformation
    extends ThorNodeRequestParam<AssetLiquidityProviderInformationResponse,
        Map<String, dynamic>> {
  ThorNodeRequestAddressAssetLiquidityProviderInformation(
      {required this.asset, required this.address, this.height});

  /// optional block height, defaults to current tip
  final BigInt? height;

  /// Example: BTC.BTC
  final String asset;

  /// Example: thor1zupk5lmc84r2dh738a9g3zscavannjy3nzplwt
  final String address;
  @override
  String get method => ThorNodeMethods.liquidityProvider.url;

  @override
  List<String> get pathParameters => [asset, address];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};

  @override
  AssetLiquidityProviderInformationResponse onResonse(
      Map<String, dynamic> result) {
    return AssetLiquidityProviderInformationResponse.fromJson(result);
  }
}
