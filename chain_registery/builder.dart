import 'dart:convert';
import 'dart:io';
import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart' as http_io;

import 'key_algs.dart';
import 'multisig_supports.dart';

/// Builds an HTTP client honoring [proxyUrl] (`http://host:port`).
/// Without it, `dart:io` default proxy-from-environment applies, so
/// `https_proxy`/`http_proxy`/`no_proxy` env vars keep working.
http.Client buildHttpClient([String? proxyUrl]) {
  if (proxyUrl == null || proxyUrl.isEmpty) return http.Client();
  final hc = HttpClient()..findProxy = (_) => 'PROXY $proxyUrl';
  return http_io.IOClient(hc);
}

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

/// Registry `key_algos` entries are short names ("secp256k1",
/// "ethsecp256k1", "ed25519") or occasionally package names.
/// Map them to the package's [CosmosKeysAlgs]. Returns empty on unknown.
List<CosmosKeysAlgs> _algsFromRegistryNames(List<String> names) {
  final List<CosmosKeysAlgs> out = [];
  for (final raw in names) {
    final s = raw.trim();
    if (s.isEmpty) continue;
    CosmosKeysAlgs? alg;
    if (s.contains('.')) {
      alg = CosmosKeysAlgs.values.firstWhereNullable((e) => e.package == s);
    }
    alg ??= CosmosKeysAlgs.supportedAlgs.firstWhereNullable((e) => e.name == s);
    // Heuristic fallback for registry variants such as
    // "eth_secp256k1", "injective", "cosmos.evm", ...
    if (alg == null) {
      final l = s.toLowerCase();
      if (l.contains('injective')) {
        alg = CosmosKeysAlgs.injectiveEthsecp256k1;
      } else if (l.contains('cosmos.evm') ||
          l.contains('cosmos_evm') ||
          l.contains('evm')) {
        alg = CosmosKeysAlgs.comosEthsecp256k1;
      } else if (l.contains('stratos')) {
        alg = CosmosKeysAlgs.stratosEthsecp256k1;
      } else if (l.contains('initia')) {
        alg = CosmosKeysAlgs.intiaEthsecp256k1;
      } else if (l.contains('ethermint') || l.contains('ethsecp256k1')) {
        alg = CosmosKeysAlgs.ethsecp256k1;
      } else if (l.contains('ed25519')) {
        alg = CosmosKeysAlgs.ed25519;
      } else if (l.contains('secp256r1') || l.contains('p-256')) {
        alg = CosmosKeysAlgs.secp256r1;
      } else if (l.contains('secp256k1')) {
        alg = CosmosKeysAlgs.secp256k1;
      }
    }
    if (alg != null && !out.contains(alg)) out.add(alg);
  }
  return out;
}

/// Resolve signing algorithms for a chain.
///
/// 1. Manual `key_algs.dart` override (full `"${chainId}_${chainName}"`
///    key, then bare `chainName` fallback so upgrades don't break it).
///    Needed only to disambiguate the 5 eth variants.
/// 2. Registry `key_algos` via [_algsFromRegistryNames].
/// 3. Default `[secp256k1]` — the Cosmos default.
List<CosmosKeysAlgs> resolveAlgs({
  required CCRChain data,
  required String chainName,
  required String overrideKey,
}) {
  for (final key in [overrideKey, chainName]) {
    final override = keyAlgs[key];
    if (override != null && override.isNotEmpty) {
      final algs =
          override
              .map((e) {
                try {
                  return CosmosKeysAlgs.fromPackageName(e);
                } catch (_) {
                  return null;
                }
              })
              .whereType<CosmosKeysAlgs>()
              .toList();
      if (algs.isNotEmpty) return algs;
    }
  }
  final fromRegistry = _algsFromRegistryNames(data.keyAlgos);
  if (fromRegistry.isNotEmpty) return fromRegistry;
  return const [CosmosKeysAlgs.secp256k1];
}

/// Resolve multisig support for a chain.
///
/// 1. Curated `multisig_supports.dart` (full `"${chainId}_${chainName}"`
///    key, then bare chain name).
/// 2. `[CosmosMultisigSupport.unknown]` — never guessed.
List<CosmosMultisigSupport> resolveMultisig({
  required String chainName,
  required String overrideKey,
}) {
  for (final key in [overrideKey, chainName]) {
    final cached = multisigSupports[key];
    if (cached != null && cached.isNotEmpty) {
      return cached.map(CosmosMultisigSupport.fromName).toList();
    }
  }
  return const [CosmosMultisigSupport.unknown];
}

/// Monthly live probe for multisig detection.
///
/// A chain whose REST endpoint serves `node_info` (with an SDK app
/// version) and `auth params` runs the standard auth module, which
/// registers `LegacyAminoPubKey`. Returns true in that case; this is a
/// liveness/standard-SDK signal, curated entries stay authoritative.
Future<bool> probeStandardAuth(String restBaseUrl, {String? proxyUrl}) async {
  final client = buildHttpClient(proxyUrl);
  try {
    final base =
        restBaseUrl.endsWith('/')
            ? restBaseUrl.substring(0, restBaseUrl.length - 1)
            : restBaseUrl;
    Future<bool> ok(String path) async {
      final r = await client
          .get(Uri.parse('$base$path'))
          .timeout(const Duration(seconds: 15));
      return r.statusCode == 200;
    }

    if (!await ok('/cosmos/base/tendermint/v1beta1/node_info')) {
      return false;
    }
    return await ok('/cosmos/auth/v1beta1/params');
  } catch (_) {
    return false;
  } finally {
    client.close();
  }
}

CosmosSdkAsset _assetFromDirectory(
  CosmosDirectoryAsset a, {
  double? fixedMinGasPrice,
  double? lowGasPrice,
  double? averageGasPrice,
  double? highGasPrice,
}) {
  return CosmosSdkAsset(
    name: a.name,
    decimals: a.decimals,
    denom: a.denom,
    imagePng: a.logoURIs?.png,
    imageSvg: a.logoURIs?.svg,
    coingeckoId: a.coingeckoId,
    symbol: a.symbol,
    fixedMinGasPrice: fixedMinGasPrice,
    lowGasPrice: lowGasPrice,
    averageGasPrice: averageGasPrice,
    highGasPrice: highGasPrice,
  );
}

/// Minimal placeholder when the fee/native denom has no asset-list entry.
/// Keeps the chain instead of dropping it; prices come from the
/// chain.json fee entry, metadata can be refreshed later.
CosmosSdkAsset _syntheticAsset({
  required String denom,
  required int decimals,
  String? symbol,
  double? fixedMinGasPrice,
  double? lowGasPrice,
  double? averageGasPrice,
  double? highGasPrice,
}) {
  return CosmosSdkAsset(
    name: symbol ?? denom,
    decimals: decimals,
    denom: denom,
    imagePng: null,
    imageSvg: null,
    coingeckoId: null,
    symbol: symbol ?? denom,
    fixedMinGasPrice: fixedMinGasPrice,
    lowGasPrice: lowGasPrice,
    averageGasPrice: averageGasPrice,
    highGasPrice: highGasPrice,
  );
}

/// Complete a fee token's gas prices from whichever fields the registry
/// provides. Returns null when the registry entry carries no price at all —
/// the caller skips that token instead of inventing a scale, so the wallet
/// never has to guess at runtime.
({double? fixedMin, double? low, double? average, double? high})?
completeFeePrices(CCRFeeToken fee) {
  double? avg = fee.averageGasPrice;
  double? low = fee.lowGasPrice;
  double? high = fee.highGasPrice;
  double? fixed = fee.fixedMinGasPrice;
  if (avg == null && low == null && high == null && fixed == null) {
    return null;
  }
  avg ??= fixed ?? low ?? high;
  low ??= fixed ?? avg ?? high;
  high ??= avg ?? low ?? fixed;
  fixed ??= low ?? avg ?? high;
  return (fixedMin: fixed, low: low, average: avg, high: high);
}

/// Normalize explorer templates to the app's `#address` / `#txid` form.
/// Returns null when the template has no usable placeholder.
String? normalizeTemplate(String? template, String placeholder) {
  if (template == null || template.isEmpty) return null;
  var t = template
      .replaceAll(r'${accountAddress}', placeholder)
      .replaceAll(r'{$accountAddress}', placeholder)
      .replaceAll(r'${txHash}', placeholder)
      .replaceAll(r'{$txHash}', placeholder)
      .replaceAll(r'${account_address}', placeholder)
      .replaceAll(r'${tx_hash}', placeholder);
  if (t.contains(r'${')) return null;
  if (!t.contains(placeholder)) return null;
  return t;
}

void main(List<String> args) async {
  String outPath = './assets/chains.bin';
  String? proxyUrl;
  bool resume = false;
  bool detectMultisig = false;
  for (final a in args) {
    if (a.startsWith('--out=')) {
      outPath = a.substring('--out='.length);
    } else if (a.startsWith('--proxy=')) {
      proxyUrl = a.substring('--proxy='.length);
    } else if (a == '--resume') {
      resume = true;
    } else if (a == '--detect-multisig') {
      detectMultisig = true;
    }
  }
  final http.Client sharedClient = buildHttpClient(proxyUrl);
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

  String checkpointPath(ChainType t) => './build_cache/progress_${t.name}.json';

  // chainKey -> reason, for the end-of-run report.
  final Map<String, String> skipped = {};

  // chainKey -> fee denoms that used baked-in default gas prices.
  final Map<String, List<String>> defaulted = {};

  // chainKey -> detected multisig names (monthly live probe only;
  // curated `multisig_supports.dart` stays authoritative).
  final Map<String, List<String>> multisigDetected = {};

  void loadCheckpoint(ChainType t) {
    if (!resume) return;
    final f = File(checkpointPath(t));
    if (!f.existsSync()) return;
    try {
      final Map<String, dynamic> json =
          jsonDecode(f.readAsStringSync()) as Map<String, dynamic>;
      for (final c in (json['chains'] as List? ?? [])) {
        chainInfos[t]!.add(CosmosSdkChain.fromJson(c as Map<String, dynamic>));
      }
      for (final e in (json['skipped'] as Map? ?? {}).entries) {
        skipped[e.key as String] = e.value as String;
      }
      for (final e in (json['defaulted'] as Map? ?? {}).entries) {
        defaulted[e.key as String] =
            (e.value as List).map((v) => v as String).toList();
      }
      // ignore: avoid_print
      print(
        'resumed ${t.name}: ${chainInfos[t]!.length} chains, '
        '${skipped.length} skipped total',
      );
    } catch (e) {
      // ignore: avoid_print
      print('ignoring corrupt checkpoint ${checkpointPath(t)}: $e');
    }
  }

  void flushCheckpoint(ChainType t) {
    final f = File(checkpointPath(t))..createSync(recursive: true);
    f.writeAsStringSync(
      jsonEncode({
        'chains': chainInfos[t]!.map((e) => e.toJson()).toList(),
        'skipped': skipped,
        'defaulted': defaulted,
      }),
    );
  }

  for (final cType in [ChainType.mainnet, ChainType.testnet]) {
    loadCheckpoint(cType);
    final done = chainInfos[cType]!.map((e) => e.name).toSet();
    final provider = ChainRegistryProvider(
      ChainRegistryHTTPProvider(url: getUrl(cType), client: sharedClient),
    );
    final chains = await provider.request(
      ChainRegistryRequestCosmosDirectoryChains(),
    );
    final List<CosmosSdkChain> infos = chainInfos[cType]!;
    for (final i in chains) {
      if (done.contains(i.name)) continue;
      await Future.delayed(const Duration(milliseconds: 500));
      try {
        late CCRChain data;
        try {
          data = await provider.request(
            ChainRegistryRequestCosmosDirectoryChain(chainName: i.name),
            timeout: const Duration(minutes: 2),
          );
        } catch (e) {
          skipped['${i.chainId}_${i.name}'] = 'fetch failed: $e';
          flushCheckpoint(cType);
          continue;
        }

        final String chainId = data.chainId ?? i.chainId;
        if (chainId.isEmpty) {
          skipped['${i.chainId}_${i.name}'] = 'missing chain_id';
          continue;
        }
        final status = data.status ?? i.status;
        if (status == 'killed') {
          skipped['${chainId}_${i.name}'] = 'status=killed';
          continue;
        }
        final String bech32Prefix = data.bech32Prefix ?? i.bech32Prefix;
        if (bech32Prefix.isEmpty) {
          skipped['${chainId}_${i.name}'] = 'missing bech32_prefix';
          continue;
        }

        final overrideKey = '${chainId}_${i.name}';
        final supportedAlgs = resolveAlgs(
          data: data,
          chainName: i.name,
          overrideKey: overrideKey,
        );
        if (supportedAlgs.isEmpty) {
          skipped[overrideKey] = 'no supported key alg';
          continue;
        }
        final bool ethOnly = supportedAlgs.every((e) => e.isEthereum);
        final int slip44 =
            data.slip44 ?? (i.slip44 == 0 ? (ethOnly ? 60 : 118) : i.slip44);

        // Fees first: every fee token must carry a usable gas price so the
        // wallet can use the snapshot without runtime lookup. Missing fields
        // are derived from whichever price the registry provides. When the
        // registry entry carries no price at all, the wallet's standard
        // defaults are baked in (average 0.025 / low 0.01 / high 0.04) and
        // reported — same values the wallet would otherwise fall back to.
        final List<CosmosDirectoryAsset> directoryAssets =
            data.assets ?? i.assets;
        final List<CosmosSdkAsset> fees = [];
        final List<String> defaultedFees = [];
        for (final fee in data.fees.feeTokens) {
          final registryPrices = completeFeePrices(fee);
          // Same defaults the wallet falls back to; baked in at build time.
          final prices =
              registryPrices ??
              (fixedMin: 0.01, low: 0.01, average: 0.025, high: 0.04);
          if (registryPrices == null) defaultedFees.add(fee.denom);
          final asset = directoryAssets.firstWhereNullable(
            (e) => e.denom == fee.denom,
          );
          if (asset != null) {
            fees.add(
              _assetFromDirectory(
                asset,
                fixedMinGasPrice: prices.fixedMin,
                lowGasPrice: prices.low,
                averageGasPrice: prices.average,
                highGasPrice: prices.high,
              ),
            );
          } else {
            fees.add(
              _syntheticAsset(
                denom: fee.denom,
                decimals: i.decimals == 0 ? 6 : i.decimals,
                fixedMinGasPrice: prices.fixedMin,
                lowGasPrice: prices.low,
                averageGasPrice: prices.average,
                highGasPrice: prices.high,
              ),
            );
          }
        }
        if (fees.isEmpty) {
          skipped[overrideKey] =
              'no usable fee token (all gas prices null or no fee entry)';
          continue;
        }

        // Native asset: directory denom -> staking denom -> first fee denom.
        // Gas prices are copied from the matching fee token so the wallet
        // can use the snapshot without runtime lookup.
        CosmosDirectoryAsset? nativeDir;
        final candidates =
            <String>[
              i.denom,
              ...data.staking.stakingTokens.map((e) => e.denom),
              ...fees.map((e) => e.denom),
            ].where((e) => e.isNotEmpty).toList();
        for (final denom in candidates) {
          nativeDir = directoryAssets.firstWhereNullable(
            (e) => e.denom == denom,
          );
          if (nativeDir != null) break;
        }
        nativeDir ??= directoryAssets.firstOrNull;
        final CCRFeeToken? nativeFee =
            nativeDir == null
                ? null
                : data.fees.feeTokens.firstWhereNullable(
                  (e) => e.denom == nativeDir!.denom,
                );
        final nativePrices =
            nativeFee == null ? null : completeFeePrices(nativeFee);
        final CosmosSdkAsset native;
        if (nativeDir != null) {
          native = _assetFromDirectory(
            nativeDir,
            fixedMinGasPrice: nativePrices?.fixedMin,
            lowGasPrice: nativePrices?.low,
            averageGasPrice: nativePrices?.average,
            highGasPrice: nativePrices?.high,
          );
        } else if (i.denom.isNotEmpty) {
          final fallbackFee = data.fees.feeTokens.firstWhereNullable(
            (e) => e.denom == i.denom,
          );
          final fallbackPrices =
              fallbackFee == null ? null : completeFeePrices(fallbackFee);
          if (fallbackPrices == null) {
            skipped[overrideKey] = 'no native asset metadata and no fee price';
            continue;
          }
          native = _syntheticAsset(
            denom: i.denom,
            decimals: i.decimals == 0 ? 6 : i.decimals,
            fixedMinGasPrice: fallbackPrices.fixedMin,
            lowGasPrice: fallbackPrices.low,
            averageGasPrice: fallbackPrices.average,
            highGasPrice: fallbackPrices.high,
          );
        } else {
          skipped[overrideKey] = 'no native denom at all';
          continue;
        }

        // Explorers: chain.json first, directory fallback.
        String? accountPage;
        String? txPage;
        final explorers = [
          ...data.explorers,
          ...i.explorers.map(
            (e) => CCRExplorer(
              kind: null,
              url: null,
              txPage: e.txPage,
              accountPage: e.accountPage,
            ),
          ),
        ];
        for (final e in explorers) {
          accountPage ??= normalizeTemplate(e.accountPage, '#address');
          txPage ??= normalizeTemplate(e.txPage, '#txid');
          if (accountPage != null && txPage != null) break;
        }

        // APIs: chain.json best_apis -> chain.json apis -> directory best_apis.
        // Deduplicate to keep chains.bin small.
        CCRApis apis = data.bestApis;
        if (apis.supportedApi().isEmpty) apis = data.apis;
        List<CCRApi> bestApis = apis.supportedApi();
        if (bestApis.isEmpty) bestApis = i.bestApis.supportedApi();
        final seen = <String>{};
        bestApis =
            bestApis
                .where((e) => e.url.isNotEmpty && seen.add('${e.api}:${e.url}'))
                .toList();
        if (bestApis.isEmpty) {
          skipped[overrideKey] = 'no rpc/rest/grpc endpoint';
          continue;
        }

        // Multisig: curated cache first, never guessed. With
        // --detect-multisig, an unknown chain whose REST endpoint serves the
        // standard auth module is recorded as a *candidate* for monthly
        // review (it does not rewrite the curated file).
        List<CosmosMultisigSupport> multisig = resolveMultisig(
          chainName: i.name,
          overrideKey: overrideKey,
        );
        if (detectMultisig &&
            multisig.length == 1 &&
            multisig.first == CosmosMultisigSupport.unknown) {
          final restUrl =
              bestApis
                  .firstWhereNullable((e) => e.api == CosmosProviderApi.rest)
                  ?.url;
          if (restUrl != null &&
              await probeStandardAuth(restUrl, proxyUrl: proxyUrl)) {
            multisig = const [CosmosMultisigSupport.legacyAminoThreshold];
            multisigDetected[overrideKey] =
                multisig.map((e) => e.name).toList();
          }
        }

        final chain = CosmosSdkChain(
          name: i.name,
          path: i.path,
          chainName: data.prettyName ?? i.prettyName ?? i.chainName,
          bech32Prefix: bech32Prefix,
          slip44: slip44,
          explorers: CosmosSkdExplorer(
            accountPage: accountPage,
            txPage: txPage,
          ),
          bestApis: bestApis,
          native: native,
          chainId: chainId,
          type: cType,
          fees: fees,
          supportedAlgs: supportedAlgs,
          ibcChannels: [],
          multisigSupports: multisig,
        );
        infos.add(chain);
        if (defaultedFees.isNotEmpty) defaulted[overrideKey] = defaultedFees;
        CosmosSdkChain.deserialize(bytes: chain.toCbor().encode());
      } catch (e) {
        skipped['${i.chainId}_${i.name}'] = 'unexpected error: $e';
      } finally {
        flushCheckpoint(cType);
      }
    }

    chainInfos[cType] = infos;
  }
  final chains = CosmosSdkChainChains(
    mainnet: chainInfos[ChainType.mainnet]!,
    testnet: chainInfos[ChainType.testnet]!,
  );
  final bytes = chains.toCbor().encode().asImmutableBytes;
  CosmosSdkChainChains.deserialize(bytes: bytes);
  final file = File(outPath)..createSync(recursive: true);
  file.writeAsBytesSync(bytes);
  // ignore: avoid_print
  print(
    'done mainnet=${chainInfos[ChainType.mainnet]!.length} '
    'testnet=${chainInfos[ChainType.testnet]!.length} '
    'skipped=${skipped.length}',
  );
  for (final e in skipped.entries) {
    // ignore: avoid_print
    print('skip ${e.key}: ${e.value}');
  }
  for (final e in defaulted.entries) {
    // ignore: avoid_print
    print('default-fee ${e.key}: ${e.value.join(",")}');
  }
  if (multisigDetected.isNotEmpty) {
    final f = File('./build_cache/multisig_detected.json')
      ..createSync(recursive: true);
    Map<String, dynamic> prev = {};
    try {
      prev = jsonDecode(f.readAsStringSync()) as Map<String, dynamic>;
    } catch (_) {}
    prev.addAll(multisigDetected);
    f.writeAsStringSync(jsonEncode(prev));
    // ignore: avoid_print
    print(
      'multisig detected candidates: ${multisigDetected.length} '
      '(review build_cache/multisig_detected.json monthly)',
    );
  }
  sharedClient.close();
}
