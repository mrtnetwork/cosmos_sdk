import 'dart:io';

import 'package:blockchain_utils/bip/bip/conf/core/coin_conf.dart';
import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:blockchain_utils/service/service.dart';
import 'package:blockchain_utils/utils/string/string.dart';
import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'package:http/http.dart' as http;

class ChainRegistryHTTPProvider implements ChainRegistryServiceProvider {
  ChainRegistryHTTPProvider(
      {this.url = CCRConst.chainRegisteryUri,
      http.Client? client,
      this.defaultRequestTimeout = const Duration(seconds: 30)})
      : client = client ?? http.Client();

  final String url;
  final http.Client client;
  final Duration defaultRequestTimeout;

  @override
  Future<BaseServiceResponse<T>> doRequest<T>(
      ChainRegistryRequestRequestDetails params,
      {Duration? timeout}) async {
    final uri = params.toUri(url);
    final response = await client.get(uri,
        headers: {...params.headers}).timeout(timeout ?? defaultRequestTimeout);
    return params.parseResponse(response.bodyBytes, response.statusCode);
  }
}

void main() async {
  const List<ChainType> chains = [ChainType.mainnet, ChainType.testnet];

  Map<String, dynamic> chainInfos = {
    ChainType.mainnet.name: [],
    ChainType.testnet.name: []
  };

  String getUrl(ChainType type) {
    switch (type) {
      case ChainType.testnet:
        return CCRConst.cosmosTestnetDirectoryUri;
      case ChainType.mainnet:
        return CCRConst.cosmosDirectoryUri;
    }
  }

  for (final chain in chains) {
    final provider =
        ChainRegistryProvider(ChainRegistryHTTPProvider(url: getUrl(chain)));
    final chains =
        await provider.request(ChainRegistryRequestCosmosDirectoryChains());
    print("chains done!");
    final List<Map<String, dynamic>> infos = [];
    for (final i in chains) {
      final data = await provider
          .request(ChainRegistryRequestCosmosDirectoryChain(chainName: i.name));
      final natvieAsset = data.assets?.firstWhere((e) => e.denom == i.denom);
      if (natvieAsset == null) {
        print("native not found ${i.chainId}");
        continue;
      }
      List<String> accountPageUrls = [];
      List<String> txPageUrls = [];
      for (final e in i.explorers) {
        if (e.accountPage != null) {
          accountPageUrls.add(e.accountPage!
              .replaceFirst("\${accountAddress}", "#address")
              .replaceFirst(r"{$accountAddress}", "#address"));
        }
        if (e.txPage != null) {
          txPageUrls.add(e.txPage!
              .replaceFirst("\${txHash}", "#txid")
              .replaceFirst("#txId", "#txid"));
        }
      }
      final Map<String, dynamic> chainData = {
        "name": i.name,
        "chain_name": i.prettyName ?? i.chainName,
        "chain_id": i.chainId,
        "bech32_prefix": i.bech32Prefix,
        "type": chain.name,
        "native": {
          "name": natvieAsset.name,
          "denom": natvieAsset.denom,
          "decimals": natvieAsset.decimals,
          "symbol": natvieAsset.symbol,
          if (natvieAsset.logoURIs?.png != null)
            "png_logo": natvieAsset.logoURIs?.png,
          if (natvieAsset.logoURIs?.svg != null)
            "svg_logo": natvieAsset.logoURIs?.svg,
          if (natvieAsset.coingeckoId != null)
            "coingecko_id": natvieAsset.coingeckoId
        },
        "best_apis": i.bestApis.toJson(),
        "explorers": {
          "account_page":
              accountPageUrls.firstWhereNullable((e) => !e.contains(r"${")),
          "tx_page": txPageUrls.firstWhereNullable((e) => !e.contains(r"${"))
        },
        "slip44": i.slip44,
        "path": i.path
      };

      if (data.keyAlgos.isNotEmpty) {
        chainData["algs"] = data.keyAlgos;
      }
      List<Map<String, dynamic>> fees = [];
      for (final i in data.fees.feeTokens) {
        final asset = data.assets?.firstWhere((e) => e.denom == i.denom);
        assert(asset != null);
        if (asset == null) continue;
        final f = {
          "name": asset.name,
          "denom": asset.denom,
          "decimals": asset.decimals,
          "symbol": asset.symbol,
          if (asset.logoURIs?.png != null) "png_logo": asset.logoURIs?.png,
          if (asset.logoURIs?.svg != null) "svg_logo": asset.logoURIs?.svg,
          if (asset.coingeckoId != null) "coingecko_id": asset.coingeckoId
        }..removeWhere((k, v) => v == null);
        final fee = {...f, ...i.toJson()};
        fees.add(fee);
      }
      if (fees.isEmpty) {
        print("noo fee ${data.chainId}");
        continue;
      }
      chainData["fees"] = fees;
      infos.add(chainData);
      print("done ${data.chainId}");
    }
    chainInfos[chain.name] = infos;
  }
  final file = File('./assets/chains.json');
  await file.writeAsString(StringUtils.fromJson(chainInfos));
}
