import 'package:cosmos_sdk/src/crypto/types/types.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

import 'asset_list.dart';

class CCRPeer {
  final String id;
  final String address;
  final String? provider;

  CCRPeer({required this.id, required this.address, this.provider});

  factory CCRPeer.fromJson(Map<String, dynamic> json) => CCRPeer(
    id: json['id'],
    address: json['address'],
    provider: json['provider'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'address': address,
    'provider': provider,
  };
}

class CCREndpoint {
  final String address;
  final String? provider;
  final bool? archive;

  CCREndpoint({required this.address, this.provider, this.archive});

  factory CCREndpoint.fromJson(Map<String, dynamic> json) => CCREndpoint(
    address: json['address'],
    provider: json['provider'],
    archive: json['archive'],
  );

  Map<String, dynamic> toJson() =>
      {'address': address, 'provider': provider, 'archive': archive}
        ..removeWhere((k, v) => v == null);
}

class CCRExplorer {
  final String? kind;
  final String? url;
  final String? txPage;
  final String? accountPage;
  final String? validatorPage;
  final String? proposalPage;
  final String? blockPage;
  String? getTxUrl(String txId) {
    if (txPage == null) return null;
    return txPage!.replaceFirst("\${txHash}", txId);
  }

  String? getAccountUrl(String accountAddress) {
    if (accountPage == null) return null;
    return accountPage!.replaceFirst("\${accountAddress}", accountAddress);
  }

  CCRExplorer({
    this.kind,
    this.url,
    this.txPage,
    this.accountPage,
    this.validatorPage,
    this.proposalPage,
    this.blockPage,
  });

  factory CCRExplorer.fromJson(Map<String, dynamic> json) => CCRExplorer(
    kind: json['kind'],
    url: json['url'],
    txPage: (json['tx_page'] as String?)?.replaceAll(r"${txHash}", "#txId"),
    accountPage: (json['account_page'] as String?)?.replaceAll(
      r"${accountAddress}",
      "#address",
    ),
    // validatorPage: json['validator_page'],
    // proposalPage: json['proposal_page'],
    // blockPage: json['block_page'],
  );

  Map<String, dynamic> toJson() => {
    'kind': kind,
    'url': url,
    'tx_page': txPage,
    'account_page': accountPage,
    'validator_page': validatorPage,
    'proposal_page': proposalPage,
    'block_page': blockPage,
  };
}

class CCRFeeToken {
  final String denom;
  final double? fixedMinGasPrice;
  final double? lowGasPrice;
  final double? averageGasPrice;
  final double? highGasPrice;
  final CCRGasCosts? gasCosts;

  CCRFeeToken({
    required this.denom,
    this.fixedMinGasPrice,
    this.lowGasPrice,
    this.averageGasPrice,
    this.highGasPrice,
    this.gasCosts,
  });

  factory CCRFeeToken.fromJson(Map<String, dynamic> json) => CCRFeeToken(
    denom: json['denom'],
    fixedMinGasPrice: (json['fixed_min_gas_price'] as num?)?.toDouble(),
    lowGasPrice: (json['low_gas_price'] as num?)?.toDouble(),
    averageGasPrice: (json['average_gas_price'] as num?)?.toDouble(),
    highGasPrice: (json['high_gas_price'] as num?)?.toDouble(),
    gasCosts:
        json['gas_costs'] != null
            ? CCRGasCosts.fromJson(json['gas_costs'])
            : null,
  );

  Map<String, dynamic> toJson() => {
    'denom': denom,
    'fixed_min_gas_price': fixedMinGasPrice,
    'low_gas_price': lowGasPrice,
    'average_gas_price': averageGasPrice,
    'high_gas_price': highGasPrice,
    'gas_costs': gasCosts?.toJson(),
  }..removeWhere((k, v) => v == null);
}

class CCRGasCosts {
  final double? cosmosSend;
  final double? ibcTransfer;

  CCRGasCosts({this.cosmosSend, this.ibcTransfer});

  factory CCRGasCosts.fromJson(Map<String, dynamic> json) => CCRGasCosts(
    cosmosSend: (json['cosmos_send'] as num?)?.toDouble(),
    ibcTransfer: (json['ibc_transfer'] as num?)?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'cosmos_send': cosmosSend,
    'ibc_transfer': ibcTransfer,
  };
}

class CCRLockDuration {
  final int? blocks;
  final String? time;

  CCRLockDuration({this.blocks, this.time});

  factory CCRLockDuration.fromJson(Map<String, dynamic> json) =>
      CCRLockDuration(blocks: json['blocks'] as int?, time: json['time']);

  Map<String, dynamic> toJson() => {'blocks': blocks, 'time': time};
}

class CCRStaking {
  final List<CCRStakingToken> stakingTokens;
  final CCRLockDuration? lockDuration;

  CCRStaking({required this.stakingTokens, this.lockDuration});

  factory CCRStaking.fromJson(Map<String, dynamic> json) {
    final List<CCRStakingToken> stakingTokensList =
        (json['staking_tokens'] as List?)
            ?.map((token) => CCRStakingToken.fromJson(token))
            .toList() ??
        [];

    final CCRLockDuration? lockDuration =
        json['lock_duration'] != null
            ? CCRLockDuration.fromJson(json['lock_duration'])
            : null;
    return CCRStaking(
      stakingTokens: stakingTokensList,
      lockDuration: lockDuration,
    );
  }

  Map<String, dynamic> toJson() => {
    'staking_tokens': stakingTokens.map((token) => token.toJson()).toList(),
    'lock_duration': lockDuration?.toJson(),
  };
}

class CCRStakingToken {
  final String denom;

  CCRStakingToken({required this.denom});

  factory CCRStakingToken.fromJson(Map<String, dynamic> json) =>
      CCRStakingToken(denom: json['denom']);

  Map<String, dynamic> toJson() => {'denom': denom};
}

class CCRSdk {
  final String type;
  final String? version;
  final String? repo;
  final String? tag;

  CCRSdk({required this.type, this.version, this.repo, this.tag});

  factory CCRSdk.fromJson(Map<String, dynamic> json) => CCRSdk(
    type: json['type'],
    version: json['version'],
    repo: json['repo'],
    tag: json['tag'],
  );

  Map<String, dynamic> toJson() => {
    'type': type,
    'version': version,
    'repo': repo,
    'tag': tag,
  };
}

class CCRIbc {
  final String type; // "go", "rust", or "other"
  final String? version;
  final String? repo;
  final String? tag;
  final List<String>? icsEnabled;

  CCRIbc({
    required this.type,
    this.version,
    this.repo,
    this.tag,
    this.icsEnabled,
  });

  factory CCRIbc.fromJson(Map<String, dynamic> json) => CCRIbc(
    type: json['type'],
    version: json['version'],
    repo: json['repo'],
    tag: json['tag'],
    icsEnabled: (json['ics_enabled'] as List?)?.cast(),
  );

  Map<String, dynamic> toJson() => {
    'type': type,
    'version': version,
    'repo': repo,
    'tag': tag,
    'ics_enabled': icsEnabled,
  };
}

class CCRCosmwasm {
  final String? version;
  final String? repo;
  final String? tag;
  final bool? enabled;
  final String? path;

  CCRCosmwasm({this.version, this.repo, this.tag, this.enabled, this.path});

  factory CCRCosmwasm.fromJson(Map<String, dynamic> json) => CCRCosmwasm(
    version: json['version'],
    repo: json['repo'],
    tag: json['tag'],
    enabled: json['enabled'],
    path: json['path'],
  );

  Map<String, dynamic> toJson() => {
    'version': version,
    'repo': repo,
    'tag': tag,
    'enabled': enabled,
    'path': path,
  };
}

class CCRConsensus {
  final String type; // "tendermint", "cometbft", or "sei-tendermint"
  final String? version;
  final String? repo;
  final String? tag;

  CCRConsensus({required this.type, this.version, this.repo, this.tag});

  factory CCRConsensus.fromJson(Map<String, dynamic> json) => CCRConsensus(
    type: json['type'],
    version: json['version'],
    repo: json['repo'],
    tag: json['tag'],
  );

  Map<String, dynamic> toJson() => {
    'type': type,
    'version': version,
    'repo': repo,
    'tag': tag,
  };
}

class CCRLanguage {
  final String type; // "go", "rust", "solidity", or "other"
  final String? version;
  final String? repo;
  final String? tag;

  CCRLanguage({required this.type, this.version, this.repo, this.tag});

  factory CCRLanguage.fromJson(Map<String, dynamic> json) => CCRLanguage(
    type: json['type'],
    version: json['version'],
    repo: json['repo'],
    tag: json['tag'],
  );

  Map<String, dynamic> toJson() => {
    'type': type,
    'version': version,
    'repo': repo,
    'tag': tag,
  };
}

class CCRBinaries {
  final String? linuxAmd64;
  final String? linuxArm64;
  final String? darwinAmd64;
  final String? darwinArm64;
  final String? windowsAmd64;
  final String? windowsArm64;

  CCRBinaries({
    this.linuxAmd64,
    this.linuxArm64,
    this.darwinAmd64,
    this.darwinArm64,
    this.windowsAmd64,
    this.windowsArm64,
  });

  factory CCRBinaries.fromJson(Map<String, dynamic> json) => CCRBinaries(
    linuxAmd64: json['linux/amd64'],
    linuxArm64: json['linux/arm64'],
    darwinAmd64: json['darwin/amd64'],
    darwinArm64: json['darwin/arm64'],
    windowsAmd64: json['windows/amd64'],
    windowsArm64: json['windows/arm64'],
  );

  Map<String, dynamic> toJson() => {
    'linux/amd64': linuxAmd64,
    'linux/arm64': linuxArm64,
    'darwin/amd64': darwinAmd64,
    'darwin/arm64': darwinArm64,
    'windows/amd64': windowsAmd64,
    'windows/arm64': windowsArm64,
  };
}

class CCRPointer {
  final String chainName;
  final String? baseDenom;

  CCRPointer({required this.chainName, this.baseDenom});

  factory CCRPointer.fromJson(Map<String, dynamic> json) =>
      CCRPointer(chainName: json['chain_name'], baseDenom: json['base_denom']);

  Map<String, dynamic> toJson() => {
    'chain_name': chainName,
    'base_denom': baseDenom,
  };
}

class CCRBech32Config {
  final String? bech32PrefixAccAddr;
  final String? bech32PrefixAccPub;
  final String? bech32PrefixValAddr;
  final String? bech32PrefixValPub;
  final String? bech32PrefixConsAddr;
  final String? bech32PrefixConsPub;

  CCRBech32Config({
    this.bech32PrefixAccAddr,
    this.bech32PrefixAccPub,
    this.bech32PrefixValAddr,
    this.bech32PrefixValPub,
    this.bech32PrefixConsAddr,
    this.bech32PrefixConsPub,
  });

  factory CCRBech32Config.fromJson(Map<String, dynamic> json) =>
      CCRBech32Config(
        bech32PrefixAccAddr: json['bech32PrefixAccAddr'],
        bech32PrefixAccPub: json['bech32PrefixAccPub'],
        bech32PrefixValAddr: json['bech32PrefixValAddr'],
        bech32PrefixValPub: json['bech32PrefixValPub'],
        bech32PrefixConsAddr: json['bech32PrefixConsAddr'],
        bech32PrefixConsPub: json['bech32PrefixConsPub'],
      );

  Map<String, dynamic> toJson() => {
    'bech32PrefixAccAddr': bech32PrefixAccAddr,
    'bech32PrefixAccPub': bech32PrefixAccPub,
    'bech32PrefixValAddr': bech32PrefixValAddr,
    'bech32PrefixValPub': bech32PrefixValPub,
    'bech32PrefixConsAddr': bech32PrefixConsAddr,
    'bech32PrefixConsPub': bech32PrefixConsPub,
  };
}

class CCRFees {
  final List<CCRFeeToken> feeTokens;

  CCRFees({required this.feeTokens});

  factory CCRFees.fromJson(Map<String, dynamic> json) {
    final tokens =
        (json['fee_tokens'] as List?)
            ?.map((e) => CCRFeeToken.fromJson(e))
            .toList() ??
        [];
    return CCRFees(feeTokens: tokens);
  }

  Map<String, dynamic> toJson() => {
    'fee_tokens': feeTokens.map((token) => token.toJson()).toList(),
  };
}

class CCRGenesis {
  final String? name;
  final String genesisUrl;
  final String? icsCcvUrl;

  CCRGenesis({this.name, required this.genesisUrl, this.icsCcvUrl});

  factory CCRGenesis.fromJson(Map<String, dynamic> json) {
    return CCRGenesis(
      name: json['name'],
      genesisUrl: json['genesis_url'],
      icsCcvUrl: json['ics_ccv_url'],
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'genesis_url': genesisUrl,
    'ics_ccv_url': icsCcvUrl,
  };
}

class CCRCodebase {
  final String? gitRepo;
  final String? recommendedVersion;
  final List<String>? compatibleVersions;
  final CCRLanguage? language;
  final CCRBinaries? binaries;
  final String? cosmosSdkVersion;
  final CCRSdk? sdk;
  final CCRConsensus? consensus;
  final String? cosmwasmVersion;
  final bool? cosmwasmEnabled;
  final String? cosmwasmPath;
  final CCRCosmwasm? cosmwasm;
  final CCRIbc? ibc;
  final CCRGenesis? genesis;
  final List<CCRVersionInfo>? versions;

  CCRCodebase({
    this.gitRepo,
    this.recommendedVersion,
    this.compatibleVersions,
    this.language,
    this.binaries,
    this.cosmosSdkVersion,
    this.sdk,
    this.consensus,
    this.cosmwasmVersion,
    this.cosmwasmEnabled,
    this.cosmwasmPath,
    this.cosmwasm,
    this.ibc,
    this.genesis,
    this.versions,
  });

  factory CCRCodebase.fromJson(Map<String, dynamic> json) {
    final versionsJson = json['versions'] as List?;
    final List<CCRVersionInfo>? versionsList =
        versionsJson?.map((e) => CCRVersionInfo.fromJson(e)).toList();

    return CCRCodebase(
      gitRepo: json['git_repo'],
      recommendedVersion: json['recommended_version'],
      compatibleVersions: List<String>.from(json['compatible_versions'] ?? []),
      language:
          json['language'] != null
              ? CCRLanguage.fromJson(json['language'])
              : null,
      binaries:
          json['binaries'] != null
              ? CCRBinaries.fromJson(json['binaries'])
              : null,
      cosmosSdkVersion: json['cosmos_sdk_version'],
      sdk: json['sdk'] != null ? CCRSdk.fromJson(json['sdk']) : null,
      consensus:
          json['consensus'] != null
              ? CCRConsensus.fromJson(json['consensus'])
              : null,
      cosmwasmVersion: json['cosmwasm_version'],
      cosmwasmEnabled: json['cosmwasm_enabled'],
      cosmwasmPath: json['cosmwasm_path'],
      cosmwasm:
          json['cosmwasm'] != null
              ? CCRCosmwasm.fromJson(json['cosmwasm'])
              : null,
      ibc: json['ibc'] != null ? CCRIbc.fromJson(json['ibc']) : null,
      genesis:
          json['genesis'] != null ? CCRGenesis.fromJson(json['genesis']) : null,
      versions: versionsList,
    );
  }

  Map<String, dynamic> toJson() => {
    'git_repo': gitRepo,
    'recommended_version': recommendedVersion,
    'compatible_versions': compatibleVersions,
    'language': language?.toJson(),
    'binaries': binaries?.toJson(),
    'cosmos_sdk_version': cosmosSdkVersion,
    'sdk': sdk?.toJson(),
    'consensus': consensus?.toJson(),
    'cosmwasm_version': cosmwasmVersion,
    'cosmwasm_enabled': cosmwasmEnabled,
    'cosmwasm_path': cosmwasmPath,
    'cosmwasm': cosmwasm?.toJson(),
    'ibc': ibc?.toJson(),
    'genesis': genesis?.toJson(),
    'versions': versions?.map((e) => e.toJson()).toList(),
  };
}

class CCRVersionInfo {
  final String name;
  final String? tag;
  final int? height;
  final int? proposal;
  final String? previousVersionName;
  final String? nextVersionName;
  final String? recommendedVersion;
  final List<String>? compatibleVersions;
  final CCRLanguage? language;
  final String? cosmosSdkVersion;
  final CCRSdk? sdk;
  final CCRConsensus? consensus;
  final String? cosmwasmVersion;
  final bool? cosmwasmEnabled;
  final String? cosmwasmPath;
  final CCRCosmwasm? cosmwasm;
  final CCRIbc? ibc;
  final CCRBinaries? binaries;
  final String? ibcGoVersion;
  final List<String>? icsEnabled;

  CCRVersionInfo({
    required this.name,
    this.tag,
    this.height,
    this.proposal,
    this.previousVersionName,
    this.nextVersionName,
    this.recommendedVersion,
    this.compatibleVersions,
    this.language,
    this.cosmosSdkVersion,
    this.sdk,
    this.consensus,
    this.cosmwasmVersion,
    this.cosmwasmEnabled,
    this.cosmwasmPath,
    this.cosmwasm,
    this.ibc,
    this.binaries,
    this.ibcGoVersion,
    this.icsEnabled,
  });

  factory CCRVersionInfo.fromJson(Map<String, dynamic> json) {
    return CCRVersionInfo(
      name: json['name'],
      tag: json['tag'],
      height: json['height'] as int?,
      proposal: json['proposal'] as int?,
      previousVersionName: json['previous_version_name'],
      nextVersionName: json['next_version_name'],
      recommendedVersion: json['recommended_version'],
      compatibleVersions: List<String>.from(json['compatible_versions'] ?? []),
      language:
          json['language'] != null
              ? CCRLanguage.fromJson(json['language'])
              : null,
      cosmosSdkVersion: json['cosmos_sdk_version'],
      sdk: json['sdk'] != null ? CCRSdk.fromJson(json['sdk']) : null,
      consensus:
          json['consensus'] != null
              ? CCRConsensus.fromJson(json['consensus'])
              : null,
      cosmwasmVersion: json['cosmwasm_version'],
      cosmwasmEnabled: json['cosmwasm_enabled'],
      cosmwasmPath: json['cosmwasm_path'],
      cosmwasm:
          json['cosmwasm'] != null
              ? CCRCosmwasm.fromJson(json['cosmwasm'])
              : null,
      ibc: json['ibc'] != null ? CCRIbc.fromJson(json['ibc']) : null,
      binaries:
          json['binaries'] != null
              ? CCRBinaries.fromJson(json['binaries'])
              : null,
      icsEnabled: (json["ics_enabled"] as List?)?.cast(),
      ibcGoVersion: json["ibc_go_version"],
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'tag': tag,
    'height': height,
    'proposal': proposal,
    'previous_version_name': previousVersionName,
    'next_version_name': nextVersionName,
    'recommended_version': recommendedVersion,
    'compatible_versions': compatibleVersions,
    'language': language?.toJson(),
    'cosmos_sdk_version': cosmosSdkVersion,
    'sdk': sdk?.toJson(),
    'consensus': consensus?.toJson(),
    'cosmwasm_version': cosmwasmVersion,
    'cosmwasm_enabled': cosmwasmEnabled,
    'cosmwasm_path': cosmwasmPath,
    'cosmwasm': cosmwasm?.toJson(),
    'ibc': ibc?.toJson(),
    'binaries': binaries?.toJson(),
  };
}

class CCRLogoURIs {
  final String? png;
  final String? svg;

  CCRLogoURIs({this.png, this.svg});

  factory CCRLogoURIs.fromJson(Map<String, dynamic> json) {
    return CCRLogoURIs(png: json['png'], svg: json['svg']);
  }

  Map<String, dynamic> toJson() => {'png': png, 'svg': svg};
}

class CCRTheme {
  final String? primaryColorHex;
  final String? backgroundColorHex;
  final bool? circle;
  final bool? darkMode;
  final bool? monochrome;

  CCRTheme({
    this.primaryColorHex,
    this.backgroundColorHex,
    this.circle,
    this.darkMode,
    this.monochrome,
  });

  factory CCRTheme.fromJson(Map<String, dynamic> json) {
    return CCRTheme(
      primaryColorHex: json['primary_color_hex'],
      backgroundColorHex: json['background_color_hex'],
      circle: json['circle'],
      darkMode: json['dark_mode'],
      monochrome: json['monochrome'],
    );
  }

  Map<String, dynamic> toJson() => {
    'primary_color_hex': primaryColorHex,
    'background_color_hex': backgroundColorHex,
    'circle': circle,
    'dark_mode': darkMode,
    'monochrome': monochrome,
  };
}

class CCRImageResource {
  final CCRPointer? imageSync;
  final String? png;
  final String? svg;
  final CCRTheme? theme;

  CCRImageResource({this.imageSync, this.png, this.svg, this.theme});

  factory CCRImageResource.fromJson(Map<String, dynamic> json) {
    return CCRImageResource(
      imageSync:
          json['image_sync'] != null
              ? CCRPointer.fromJson(json['image_sync'])
              : null,
      png: json['png'],
      svg: json['svg'],
      theme: json['theme'] != null ? CCRTheme.fromJson(json['theme']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'image_sync': imageSync?.toJson(),
    'png': png,
    'svg': svg,
    'theme': theme?.toJson(),
  };
}

class CCRChain {
  final String? schema;
  final String chainName;
  final String chainType; // Supported chain types
  final String? chainId;
  final String? preForkChainName;
  final String? prettyName;
  final String? website;
  final String? status; // "live", "upcoming", or "killed"
  final String? networkType; // "mainnet", "testnet", or "devnet"
  final String? bech32Prefix;
  final CCRBech32Config? bech32Config;
  final String? daemonName;
  final String? nodeHome;
  final List<String> keyAlgos;
  final int? slip44;
  final List<int>? alternativeSlip44s;
  final CCRFees fees;
  final CCRStaking staking;
  final CCRCodebase? codebase;
  final List<CCRImageResource>? images;
  final CCRLogoURIs? logoURIs;
  final String? description;
  final CCRPeers? peers;
  final CCRApis apis;
  final CCRApis bestApis;
  final List<CCRExplorer> explorers;
  final List<String>? keywords;
  final List<String>? extraCodecs;
  final List<CosmosDirectoryAsset>? assets;

  CCRChain({
    this.schema,
    required this.chainName,
    required this.chainType,
    required this.bestApis,
    this.chainId,
    this.preForkChainName,
    this.prettyName,
    this.website,
    this.status,
    this.networkType,
    this.bech32Prefix,
    this.bech32Config,
    this.daemonName,
    this.nodeHome,
    required this.keyAlgos,
    this.slip44,
    this.alternativeSlip44s,
    required this.fees,
    required this.staking,
    this.codebase,
    this.images,
    this.logoURIs,
    this.description,
    this.peers,
    required this.apis,
    required this.explorers,
    this.keywords,
    this.extraCodecs,
    this.assets,
  });

  factory CCRChain.fromJson(Map<String, dynamic> json) => CCRChain(
    schema: json['\$schema'],
    chainName: json['chain_name'],
    chainType: json['chain_type'],
    chainId: json['chain_id'],
    preForkChainName: json['pre_fork_chain_name'],
    prettyName: json['pretty_name'],
    website: json['website'],
    status: json['status'],
    networkType: json['network_type'],
    bech32Prefix: json['bech32_prefix'],
    bech32Config:
        json['bech32_config'] != null
            ? CCRBech32Config.fromJson(json['bech32_config'])
            : null,
    daemonName: json['daemon_name'],
    nodeHome: json['node_home'],
    keyAlgos: (json['key_algos'] as List?)?.cast() ?? [],
    slip44: json['slip44'] as int?,
    alternativeSlip44s:
        (json['alternative_slip44s'] as List?)?.map((e) => e as int).toList(),
    fees: CCRFees.fromJson(json['fees'] ?? {}),
    staking: CCRStaking.fromJson(json['staking'] ?? {}),
    codebase:
        json['codebase'] != null
            ? CCRCodebase.fromJson(json['codebase'])
            : null,
    images:
        (json['images'] as List?)
            ?.map((e) => CCRImageResource.fromJson(e))
            .toList(),
    logoURIs:
        json['logo_URIs'] != null
            ? CCRLogoURIs.fromJson(json['logo_URIs'])
            : null,
    description: json['description'],
    peers: json['peers'] != null ? CCRPeers.fromJson(json['peers']) : null,
    apis: CCRApis.fromJson(json['apis'] ?? {}),
    bestApis: CCRApis.fromJson(json['best_apis'] ?? {}),
    explorers:
        (json['explorers'] as List?)
            ?.map((e) => CCRExplorer.fromJson(e))
            .toList() ??
        [],
    keywords: (json['keywords'] as List?)?.cast(),
    extraCodecs: (json['extra_codecs'] as List?)?.cast(),
    assets:
        (json['assets'] as List?)
            ?.map((e) => CosmosDirectoryAsset.fromJson(e))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    // '\$schema': schema,
    'chain_name': chainName,
    'chain_type': chainType,
    'chain_id': chainId,
    'pre_fork_chain_name': preForkChainName,
    'pretty_name': prettyName,
    'website': website,
    'status': status,
    'network_type': networkType,
    'bech32_prefix': bech32Prefix,
    'bech32_config': bech32Config?.toJson(),
    'daemon_name': daemonName,
    // 'node_home': nodeHome,
    'key_algos': keyAlgos,
    'slip44': slip44,
    'alternative_slip44s': alternativeSlip44s,
    'fees': fees.toJson(),
    'staking': staking.toJson(),
    'codebase': codebase?.toJson(),
    'images': images?.map((e) => e.toJson()).toList(),
    'logo_URIs': logoURIs?.toJson(),
    'description': description,
    'peers': peers?.toJson(),
    'apis': apis.toJson(),
    'explorers': explorers.map((e) => e.toJson()).toList(),
    'keywords': keywords,
    'extra_codecs': extraCodecs,
    "assets": assets?.map((e) => e.toJson()).toList(),
    "best_apis": bestApis.toJson(),
  };

  List<CosmosKeysAlgs> supportKeyAlgos() {
    if (keyAlgos.isEmpty) return CosmosKeysAlgs.supportedAlgs;
    return CosmosKeysAlgs.supportedAlgs
        .where((e) => keyAlgos.contains(e.name))
        .toList();
  }
}

class CCRPeers {
  final List<CCRPeer>? seeds;
  final List<CCRPeer>? persistentPeers;

  CCRPeers({this.seeds, this.persistentPeers});

  factory CCRPeers.fromJson(Map<String, dynamic> json) {
    return CCRPeers(
      seeds: (json['seeds'] as List?)?.map((e) => CCRPeer.fromJson(e)).toList(),
      persistentPeers:
          (json['persistent_peers'] as List?)
              ?.map((e) => CCRPeer.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'seeds': seeds?.map((e) => e.toJson()).toList(),
    'persistent_peers': persistentPeers?.map((e) => e.toJson()).toList(),
  };
}

class CCRApis {
  final List<CCREndpoint> rpc;
  final List<CCREndpoint> rest;
  final List<CCREndpoint> grpc;
  final List<CCREndpoint> wss;
  final List<CCREndpoint> grpcWeb;
  final List<CCREndpoint> evmHttpJsonRpc;

  CCRApis({
    required this.rpc,
    required this.rest,
    required this.grpc,
    required this.wss,
    required this.grpcWeb,
    required this.evmHttpJsonRpc,
  });

  factory CCRApis.fromJson(Map<String, dynamic> json) {
    return CCRApis(
      rpc:
          (json['rpc'] as List?)
              ?.map((e) => CCREndpoint.fromJson(e))
              .toList() ??
          [],
      rest:
          (json['rest'] as List?)
              ?.map((e) => CCREndpoint.fromJson(e))
              .toList() ??
          [],
      grpc:
          (json['grpc'] as List?)
              ?.map((e) => CCREndpoint.fromJson(e))
              .toList() ??
          [],
      wss:
          (json['wss'] as List?)
              ?.map((e) => CCREndpoint.fromJson(e))
              .toList() ??
          [],
      grpcWeb:
          (json['grpc-web'] as List?)
              ?.map((e) => CCREndpoint.fromJson(e))
              .toList() ??
          [],
      evmHttpJsonRpc:
          (json['evm-http-jsonrpc'] as List?)
              ?.map((e) => CCREndpoint.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, List<Map<String, dynamic>>> toJson() => {
    'rpc': rpc.map((e) => e.toJson()).toList(),
    'rest': rest.map((e) => e.toJson()).toList(),
    'grpc': grpc.map((e) => e.toJson()).toList(),
    'wss': wss.map((e) => e.toJson()).toList(),
    'grpc-web': grpcWeb.map((e) => e.toJson()).toList(),
    'evm-http-jsonrpc': evmHttpJsonRpc.map((e) => e.toJson()).toList(),
  }..removeWhere((k, v) => v.isEmpty);
}

class CosmosDirectoryAsset {
  final String name;
  final String? description;
  final String symbol;
  final String denom;
  final int decimals;
  final CCRDenomUnit base;
  final CCRDenomUnit? display;
  final List<CCRDenomUnit> denomUnits;
  final CCRLogoUris? logoURIs;
  final String? coingeckoId;

  CosmosDirectoryAsset({
    this.description,
    required this.denomUnits,
    required this.base,
    required this.name,
    required this.display,
    required this.symbol,
    this.logoURIs,
    required this.decimals,
    required this.denom,
    this.coingeckoId,
  });

  // From JSON factory constructor
  factory CosmosDirectoryAsset.fromJson(Map<String, dynamic> json) {
    return CosmosDirectoryAsset(
      description: json.as("description"),
      denomUnits:
          json.asListOfMap("denom_units")!.map(CCRDenomUnit.fromJson).toList(),
      base: CCRDenomUnit.fromJson(json.asMap("base")),
      name: json.as("name"),
      display: json.maybeAs(key: "display", onValue: CCRDenomUnit.fromJson),
      symbol: json.as("symbol"),
      logoURIs:
          json['logo_URIs'] != null
              ? CCRLogoUris.fromJson(json['logo_URIs'])
              : null,
      decimals: json.as("decimals"),
      denom: json.as("denom"),
      coingeckoId: json.as("coingecko_id"),
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'denom_units': denomUnits.map((item) => item.toJson()).toList(),
      'base': base.toJson(),
      'name': name,
      'display': display?.toJson(),
      'symbol': symbol,
      'logo_URIs': logoURIs?.toJson(),
      "dicimals": decimals,
      "coingecko_id": coingeckoId,
    };
  }
}
