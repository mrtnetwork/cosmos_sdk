import 'package:cosmos_sdk/sdk/provider/chain_registery/core/core.dart';
import 'package:cosmos_sdk/sdk/provider/chain_registery/models/models/comsos_directory.dart';
import 'package:blockchain_utils/utils/json/extension/json.dart';

class ChainRegistryRequestCosmosDirectoryChains
    extends
        ChainRegistryRequest<List<CosmosDirectoryChain>, Map<String, dynamic>> {
  ChainRegistryRequestCosmosDirectoryChains();

  @override
  List<String?> get pathParameters => [];

  @override
  List<CosmosDirectoryChain> onResonse(Map<String, dynamic> result) {
    return result
        .valueEnsureAsList<Map<String, dynamic>>("chains")
        .map(CosmosDirectoryChain.fromJson)
        .toList();
  }
}
