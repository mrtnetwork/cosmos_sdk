import 'package:cosmos_sdk/sdk/provider/chain_registery/core/core.dart';
import 'package:cosmos_sdk/sdk/provider/chain_registery/models/models/chain.dart';
import 'package:blockchain_utils/utils/json/extension/json.dart';

class ChainRegistryRequestCosmosDirectoryChain
    extends ChainRegistryRequest<CCRChain, Map<String, dynamic>> {
  final String chainName;
  ChainRegistryRequestCosmosDirectoryChain({required this.chainName});

  @override
  List<String?> get pathParameters => [chainName];

  @override
  CCRChain onResonse(Map<String, dynamic> result) {
    return CCRChain.fromJson(result.valueEnsureAsMap<String, dynamic>("chain"));
  }
}
