import 'package:cosmos_sdk/src/provider/chain_registery/core/core.dart';
import 'package:cosmos_sdk/src/provider/chain_registery/models/models/asset_list.dart';
import 'package:cosmos_sdk/src/provider/chain_registery/models/models/registery_ping.dart';

class ChainRegistryRequestPingPubAssets
    extends ChainRegistryRequest<CCRAssetList, Map<String, dynamic>> {
  final String chainName;
  final ChainRegistryChainType chainType;
  ChainRegistryRequestPingPubAssets(
      {required this.chainType, required this.chainName});

  @override
  List<String?> get pathParameters => [
        chainType.pubPingPathSegment,
        chainName,
        CCRSchemaType.assetlist.pathSegments
      ];
  @override
  CCRAssetList onResonse(Map<String, dynamic> result) {
    return CCRAssetList.fromJson(result);
  }
}
