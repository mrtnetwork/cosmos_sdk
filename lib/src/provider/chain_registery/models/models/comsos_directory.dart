import 'package:cosmos_sdk/src/utils/quick.dart';

import 'chain.dart';

class CosmosDirectoryChain {
  final String name;
  final String path;
  final String chainName;
  final String networkType; // Supported chain types
  final String chainId;
  final String symbol;
  final String display;
  final String denom;
  final int decimals;
  final String? prettyName;
  final String? status; // "live", "upcoming", or "killed"
  final String bech32Prefix;
  final int slip44;
  final String? image;
  final List<CCRExplorer> explorers;
  final List<String>? keywords;
  final CCRApis bestApis;
  final List<CosmosDirectoryAsset> assets;
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "chainId": chainId,
      "bech32Prefix": bech32Prefix,
      "image": image,
      "native": {"symbol": symbol, "denom": denom, "decimals": decimals},
      "bestApis": bestApis.toJson(),
      "path": path,
    };
  }

  const CosmosDirectoryChain({
    required this.name,
    required this.path,
    required this.chainName,
    required this.networkType,
    required this.chainId,
    required this.symbol,
    required this.display,
    required this.denom,
    required this.decimals,
    required this.prettyName,
    required this.status,
    required this.bech32Prefix,
    required this.slip44,
    required this.image,
    required this.explorers,
    required this.keywords,
    required this.bestApis,
    required this.assets,
  });

  factory CosmosDirectoryChain.fromJson(Map<String, dynamic> json) {
    return CosmosDirectoryChain(
      name: json.as("name"),
      path: json.as("path"),
      chainName: json.as("chain_name"),
      networkType: json.as("network_type"),
      chainId: json.as("chain_id"),
      symbol: json.as("symbol"),
      display: json.as("display"),
      denom: json.as("denom"),
      decimals: json.as("decimals"),
      prettyName: json.as("pretty_name"),
      status: json.as("status"),
      bech32Prefix: json.as("bech32_prefix"),
      slip44: json.as("slip44"),
      image: json.as("image"),
      explorers:
          json
              .asListOfMap("explorers", throwOnNull: false)
              ?.map(CCRExplorer.fromJson)
              .toList() ??
          [],
      keywords: json.asListOfString("keywords", throwOnNull: false),
      bestApis: CCRApis.fromJson(json.asMap("best_apis")),
      assets:
          json
              .asListOfMap("assets")!
              .map(CosmosDirectoryAsset.fromJson)
              .toList(),
    );
  }
}
