import 'package:cosmos_sdk/src/provider/chain_registery/core/core.dart';
import 'package:cosmos_sdk/src/provider/chain_registery/models/models.dart';

class ChainRegistryRequestPingPubChain
    extends ChainRegistryRequest<CCRChain, Map<String, dynamic>> {
  final String chainName;
  final ChainRegistryChainType chainType;
  ChainRegistryRequestPingPubChain(
      {required this.chainType, required this.chainName});

  @override
  List<String?> get pathParameters => [
        chainType.pubPingPathSegment,
        chainName,
        CCRSchemaType.chain.pathSegments
      ];
  @override
  CCRChain onResonse(Map<String, dynamic> result) {
    return CCRChain.fromJson(result);
  }
}
