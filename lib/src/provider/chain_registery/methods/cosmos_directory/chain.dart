import 'package:cosmos_sdk/src/provider/chain_registery/core/core.dart';
import 'package:cosmos_sdk/src/provider/chain_registery/models/models/chain.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class ChainRegistryRequestCosmosDirectoryChain
    extends ChainRegistryRequest<CCRChain, Map<String, dynamic>> {
  final String chainName;
  ChainRegistryRequestCosmosDirectoryChain({required this.chainName});

  @override
  List<String?> get pathParameters => [chainName];

  @override
  CCRChain onResonse(Map<String, dynamic> result) {
    return CCRChain.fromJson(result.asMap("chain"));
  }
}
