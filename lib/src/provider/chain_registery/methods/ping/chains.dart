import 'package:cosmos_sdk/src/provider/chain_registery/core/core.dart';
import 'package:cosmos_sdk/src/provider/chain_registery/models/models.dart';
import 'package:cosmos_sdk/src/provider/chain_registery/utility/utility.dart';

class ChainRegistryRequestPingPubChains
    extends
        ChainRegistryRequest<List<PingPubChain>, List<Map<String, dynamic>>> {
  final ChainRegistryChainType chainType;
  ChainRegistryRequestPingPubChains(this.chainType);

  @override
  List<String?> get pathParameters => [chainType.pubPingPathSegment];

  @override
  List<PingPubChain> onResonse(List<Map<String, dynamic>> result) {
    return CCRUtilities.readChainDirectories(result);
  }
}
