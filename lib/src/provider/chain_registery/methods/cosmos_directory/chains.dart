import 'package:cosmos_sdk/src/provider/chain_registery/core/core.dart';
import 'package:cosmos_sdk/src/provider/chain_registery/models/models/comsos_directory.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class ChainRegistryRequestCosmosDirectoryChains extends ChainRegistryRequest<
    List<CosmosDirectoryChain>, Map<String, dynamic>> {
  ChainRegistryRequestCosmosDirectoryChains();

  @override
  List<String?> get pathParameters => [];

  @override
  List<CosmosDirectoryChain> onResonse(Map<String, dynamic> result) {
    return result
        .asListOfMap("chains")!
        .map(CosmosDirectoryChain.fromJson)
        .toList();
  }
}
