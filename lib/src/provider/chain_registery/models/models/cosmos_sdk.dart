import 'package:blockchain_utils/bip/bip/conf/core/coin_conf.dart'
    show ChainType;
import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class CosmosSdkAsset {
  final String name;
  final String denom;
  final int decimals;
  final String symbol;
  final String? imagePng;
  final String? imageSvg;
  final String? coingeckoId;
  final double? fixedMinGasPrice;
  final double? lowGasPrice;
  final double? averageGasPrice;
  final double? highGasPrice;

  const CosmosSdkAsset({
    required this.name,
    required this.decimals,
    required this.denom,
    required this.imagePng,
    required this.imageSvg,
    required this.coingeckoId,
    required this.symbol,
    this.averageGasPrice,
    this.lowGasPrice,
    this.fixedMinGasPrice,
    this.highGasPrice,
  });
  factory CosmosSdkAsset.fromJson(Map<String, dynamic> json) {
    return CosmosSdkAsset(
      name: json.as("name"),
      decimals: json.as("decimals"),
      denom: json.as("denom"),
      imagePng: json.as("png_logo"),
      imageSvg: json.as("svg_logo"),
      coingeckoId: json.as("coingecko_id"),
      symbol: json.as("symbol"),
      fixedMinGasPrice: json.as("fixed_min_gas_price"),
      lowGasPrice: json.as("low_gas_price"),
      averageGasPrice: json.as("average_gas_price"),
      highGasPrice: json.as("high_gas_price"),
    );
  }
}

class CosmosSkdExplorer {
  final String? accountPage;
  final String? txPage;
  CosmosSkdExplorer({required this.accountPage, required this.txPage});
  factory CosmosSkdExplorer.fromJson(Map<String, dynamic> json) {
    return CosmosSkdExplorer(
      accountPage: json.as("account_page"),
      txPage: json.as("tx_page"),
    );
  }
}

class CosmosSdkChain {
  final String name;
  final String path;
  final String chainName;
  final String chainId;
  final String bech32Prefix;
  final CosmosSdkAsset native;
  final int slip44;
  final CosmosSkdExplorer explorers;
  final CCRApis bestApis;
  final List<CosmosSdkAsset> fees;
  final List<String>? algo;
  final ChainType type;

  CosmosSdkChain({
    required this.name,
    required this.path,
    required this.chainName,
    required this.bech32Prefix,
    required this.slip44,
    required this.explorers,
    required this.bestApis,
    required this.native,
    required this.chainId,
    required this.type,
    required List<CosmosSdkAsset> fees,
    List<String>? algo,
  }) : fees = fees.immutable,
       algo = algo?.emptyAsNull?.immutable;

  factory CosmosSdkChain.fromJson(Map<String, dynamic> json) {
    return CosmosSdkChain(
      name: json.as("name"),
      path: json.as("path"),
      chainName: json.as("chain_name"),
      chainId: json.as("chain_id"),
      native: CosmosSdkAsset.fromJson(json.asMap("native")),
      bech32Prefix: json.as("bech32_prefix"),
      slip44: json.as("slip44"),
      explorers: CosmosSkdExplorer.fromJson(json.asMap("explorers")),
      bestApis: CCRApis.fromJson(json.asMap("best_apis")),
      fees: json.asListOfMap("fees")!.map(CosmosSdkAsset.fromJson).toList(),
      algo: json.asListOfString("algs", throwOnNull: false),
      type: ChainType.fromValue(json.as<String>("type")),
    );
  }
}

class CosmosSdkChainChains {
  final List<CosmosSdkChain> mainnet;
  final List<CosmosSdkChain> testnet;
  CosmosSdkChainChains({required this.mainnet, required this.testnet});
  factory CosmosSdkChainChains.fromJson(Map<String, dynamic> json) {
    return CosmosSdkChainChains(
      mainnet:
          json
              .asListOfMap("mainnet", throwOnNull: true)!
              .map(CosmosSdkChain.fromJson)
              .toList(),
      testnet:
          json
              .asListOfMap("testnet", throwOnNull: true)!
              .map(CosmosSdkChain.fromJson)
              .toList(),
    );
  }
}
