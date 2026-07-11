import 'dart:io';
import 'package:blockchain_utils/bip/bip/conf/core/coin_conf.dart';
import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:blockchain_utils/service/service.dart';
import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'package:http/http.dart' as http;

import 'key_algs.dart';

class ChainRegistryHTTPProvider with ChainRegistryServiceProvider {
  ChainRegistryHTTPProvider({
    this.url = CCRConst.chainRegisteryUri,
    http.Client? client,
    this.defaultRequestTimeout = const Duration(seconds: 30),
  }) : client = client ?? http.Client();

  final String url;
  final http.Client client;
  final Duration defaultRequestTimeout;

  @override
  Future<BaseServiceResponse> doRequest(
    ChainRegistryRequestRequestDetails params, {
    Duration? timeout,
  }) async {
    final uri = params.encodeUrl(url);
    final response = await client
        .get(uri, headers: {...params.headers})
        .timeout(timeout ?? defaultRequestTimeout);
    return params.toResponse(
      response.bodyBytes,
      statusCode: response.statusCode,
    );
  }
}

void main() async {
  Map<ChainType, List<CosmosSdkChain>> chainInfos = {
    ChainType.mainnet: [],
    ChainType.testnet: [],
  };

  String getUrl(ChainType type) {
    switch (type) {
      case ChainType.testnet:
        return CCRConst.cosmosTestnetDirectoryUri;
      case ChainType.mainnet:
        return CCRConst.cosmosDirectoryUri;
    }
  }

  List<String> unsupported = [];

  for (final cType in [ChainType.mainnet, ChainType.testnet]) {
    final provider = ChainRegistryProvider(
      ChainRegistryHTTPProvider(url: getUrl(cType)),
    );
    final chains = await provider.request(
      ChainRegistryRequestCosmosDirectoryChains(),
    );
    final List<CosmosSdkChain> infos = [];
    for (final i in chains) {
      await Future.delayed(const Duration(milliseconds: 500));
      final data = await provider.request(
        ChainRegistryRequestCosmosDirectoryChain(chainName: i.name),
        timeout: const Duration(minutes: 2),
      );

      final id = "${data.chainId}_${data.chainName}";
      final natvieAsset = data.assets?.firstWhere((e) => e.denom == i.denom);
      if (natvieAsset == null) {
        unsupported.add(id);
        continue;
      }
      List<String> accountPageUrls = [];
      List<String> txPageUrls = [];
      for (final e in i.explorers) {
        if (e.accountPage != null) {
          accountPageUrls.add(
            e.accountPage!
                .replaceFirst("\${accountAddress}", "#address")
                .replaceFirst(r"{$accountAddress}", "#address"),
          );
        }
        if (e.txPage != null) {
          txPageUrls.add(
            e.txPage!
                .replaceFirst("\${txHash}", "#txid")
                .replaceFirst("#txId", "#txid"),
          );
        }
      }

      final supportedAlgs =
          (keyAlgs[id] ?? [])
              .map((e) => CosmosKeysAlgs.fromPackageName(e))
              .toList();
      if (supportedAlgs.isEmpty) {
        unsupported.add(id);
        continue;
      }
      List<CosmosSdkAsset> fees = [];
      for (final i in data.fees.feeTokens) {
        final asset = data.assets?.firstWhere((e) => e.denom == i.denom);
        assert(asset != null);
        if (asset == null) continue;
        fees.add(
          CosmosSdkAsset(
            name: asset.name,
            decimals: asset.decimals,
            denom: asset.denom,
            imagePng: asset.logoURIs?.png,
            imageSvg: asset.logoURIs?.svg,
            coingeckoId: asset.coingeckoId,
            symbol: asset.symbol,
            averageGasPrice: i.averageGasPrice,
            fixedMinGasPrice: i.fixedMinGasPrice,
            highGasPrice: i.highGasPrice,
            lowGasPrice: i.lowGasPrice,
          ),
        );
      }
      if (fees.isEmpty) {
        unsupported.add(id);
        continue;
      }
      final chain = CosmosSdkChain(
        name: i.name,
        path: i.path,
        chainName: i.prettyName ?? i.chainName,
        bech32Prefix: i.bech32Prefix,
        slip44: i.slip44,
        explorers: CosmosSkdExplorer(
          accountPage: accountPageUrls.firstWhereNullable(
            (e) => !e.contains(r"${"),
          ),
          txPage: txPageUrls.firstWhereNullable((e) => !e.contains(r"${")),
        ),
        bestApis: i.bestApis.supportedApi(),
        native: CosmosSdkAsset(
          name: natvieAsset.name,
          decimals: natvieAsset.decimals,
          denom: natvieAsset.denom,
          imagePng: natvieAsset.logoURIs?.png,
          imageSvg: natvieAsset.logoURIs?.svg,
          coingeckoId: natvieAsset.coingeckoId,
          symbol: natvieAsset.symbol,
        ),
        chainId: i.chainId,
        type: cType,
        fees: fees,
        supportedAlgs: supportedAlgs,
        ibcChannels: [],
      );
      infos.add(chain);
      CosmosSdkChain.deserialize(bytes: chain.toCbor().encode());
    }

    chainInfos[cType] = infos;
  }
  final chains = CosmosSdkChainChains(
    mainnet: chainInfos[ChainType.mainnet]!,
    testnet: chainInfos[ChainType.testnet]!,
  );
  final bytes = chains.toCbor().encode().asImmutableBytes;
  CosmosSdkChainChains.deserialize(bytes: bytes);
  final file = File('./assets/chains.bin')..createSync(recursive: true);
  file.writeAsBytesSync(bytes);
}
