import 'package:cosmos_sdk/sdk/provider/provider.dart';

class ChainInfo {
  final String? schema;
  final String? chainName;
  final String? status;
  final String? networkType;
  final String? website;
  final String? prettyName;
  final String? chainType;
  final String? chainId;
  final String? bech32Prefix;
  final String? nodeHome;
  final String? daemonName;
  final List<String> keyAlgos;
  final List<String> extraCodecs;
  final int? slip44;
  final Fees? fees;
  final Codebase? codebase;
  final List<ChainImage> images;
  final String? description;
  final Peers? peers;
  final Apis? apis;
  final List<Explorer> explorers;
  final List<String> keywords;

  ChainInfo({
    this.schema,
    this.chainName,
    this.status,
    this.networkType,
    this.website,
    this.prettyName,
    this.chainType,
    this.chainId,
    this.bech32Prefix,
    this.nodeHome,
    this.daemonName,
    this.slip44,
    this.fees,
    this.codebase,
    this.description,
    this.peers,
    this.apis,
    this.keyAlgos = const [],
    this.extraCodecs = const [],
    this.images = const [],
    this.explorers = const [],
    this.keywords = const [],
  });

  factory ChainInfo.fromJson(Map<String, dynamic> json) => ChainInfo(
    schema: json[r'$schema'],
    chainName: json['chain_name'],
    status: json['status'],
    networkType: json['network_type'],
    website: json['website'],
    prettyName: json['pretty_name'],
    chainType: json['chain_type'],
    chainId: json['chain_id'],
    bech32Prefix: json['bech32_prefix'],
    nodeHome: json['node_home'],
    daemonName: json['daemon_name'],
    slip44: json['slip44'],
    keyAlgos: List<String>.from(json['key_algos'] ?? []),
    extraCodecs: List<String>.from(json['extra_codecs'] ?? []),
    fees: json['fees'] == null ? null : Fees.fromJson(json['fees']),
    codebase:
        json['codebase'] == null ? null : Codebase.fromJson(json['codebase']),
    images:
        (json['images'] as List? ?? [])
            .map((e) => ChainImage.fromJson(e))
            .toList(),
    description: json['description'],
    peers: json['peers'] == null ? null : Peers.fromJson(json['peers']),
    apis: json['apis'] == null ? null : Apis.fromJson(json['apis']),
    explorers:
        (json['explorers'] as List? ?? [])
            .map((e) => Explorer.fromJson(e))
            .toList(),
    keywords: List<String>.from(json['keywords'] ?? []),
  );

  Map<String, dynamic> toJson() => {
    r'$schema': schema,
    'chain_name': chainName,
    'status': status,
    'network_type': networkType,
    'website': website,
    'pretty_name': prettyName,
    'chain_type': chainType,
    'chain_id': chainId,
    'bech32_prefix': bech32Prefix,
    'node_home': nodeHome,
    'daemon_name': daemonName,
    'key_algos': keyAlgos,
    'extra_codecs': extraCodecs,
    'slip44': slip44,
    'fees': fees?.toJson(),
    'codebase': codebase?.toJson(),
    'images': images.map((e) => e.toJson()).toList(),
    'description': description,
    'peers': peers?.toJson(),
    'apis': apis?.toJson(),
    'explorers': explorers.map((e) => e.toJson()).toList(),
    'keywords': keywords,
  };
}

class Fees {
  final List<FeeToken> feeTokens;

  Fees({this.feeTokens = const []});

  factory Fees.fromJson(Map<String, dynamic> json) => Fees(
    feeTokens:
        (json['fee_tokens'] as List? ?? [])
            .map((e) => FeeToken.fromJson(e))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'fee_tokens': feeTokens.map((e) => e.toJson()).toList(),
  };
}

class FeeToken {
  final String? denom;
  final num? fixedMinGasPrice;
  final num? lowGasPrice;
  final num? averageGasPrice;
  final num? highGasPrice;

  FeeToken({
    this.denom,
    this.fixedMinGasPrice,
    this.lowGasPrice,
    this.averageGasPrice,
    this.highGasPrice,
  });

  factory FeeToken.fromJson(Map<String, dynamic> json) => FeeToken(
    denom: json['denom'],
    fixedMinGasPrice: json['fixed_min_gas_price'],
    lowGasPrice: json['low_gas_price'],
    averageGasPrice: json['average_gas_price'],
    highGasPrice: json['high_gas_price'],
  );

  Map<String, dynamic> toJson() => {
    'denom': denom,
    'fixed_min_gas_price': fixedMinGasPrice,
    'low_gas_price': lowGasPrice,
    'average_gas_price': averageGasPrice,
    'high_gas_price': highGasPrice,
  };
}

class Codebase {
  final String? gitRepo;
  final String? recommendedVersion;
  final List<String> compatibleVersions;
  final Consensus? consensus;
  final Map<String, String> binaries;
  final Genesis? genesis;
  final Sdk? sdk;
  final Ibc? ibc;
  final String? tag;
  final Language? language;

  Codebase({
    this.gitRepo,
    this.recommendedVersion,
    this.consensus,
    this.genesis,
    this.sdk,
    this.ibc,
    this.tag,
    this.language,
    this.compatibleVersions = const [],
    this.binaries = const {},
  });

  factory Codebase.fromJson(Map<String, dynamic> json) => Codebase(
    gitRepo: json['git_repo'],
    recommendedVersion: json['recommended_version'],
    compatibleVersions: List<String>.from(json['compatible_versions'] ?? []),
    consensus:
        json['consensus'] == null
            ? null
            : Consensus.fromJson(json['consensus']),
    binaries: Map<String, String>.from(json['binaries'] ?? {}),
    genesis: json['genesis'] == null ? null : Genesis.fromJson(json['genesis']),
    sdk: json['sdk'] == null ? null : Sdk.fromJson(json['sdk']),
    ibc: json['ibc'] == null ? null : Ibc.fromJson(json['ibc']),
    tag: json['tag'],
    language:
        json['language'] == null ? null : Language.fromJson(json['language']),
  );

  Map<String, dynamic> toJson() => {
    'git_repo': gitRepo,
    'recommended_version': recommendedVersion,
    'compatible_versions': compatibleVersions,
    'consensus': consensus?.toJson(),
    'binaries': binaries,
    'genesis': genesis?.toJson(),
    'sdk': sdk?.toJson(),
    'ibc': ibc?.toJson(),
    'tag': tag,
    'language': language?.toJson(),
  };
}

class Consensus {
  final String? type;
  final String? version;

  Consensus({this.type, this.version});

  factory Consensus.fromJson(Map<String, dynamic> json) =>
      Consensus(type: json['type'], version: json['version']);

  Map<String, dynamic> toJson() => {'type': type, 'version': version};
}

class Genesis {
  final String? genesisUrl;

  Genesis({this.genesisUrl});

  factory Genesis.fromJson(Map<String, dynamic> json) =>
      Genesis(genesisUrl: json['genesis_url']);

  Map<String, dynamic> toJson() => {'genesis_url': genesisUrl};
}

class Sdk {
  final String? type;
  final String? repo;
  final String? version;
  final String? tag;

  Sdk({this.type, this.repo, this.version, this.tag});

  factory Sdk.fromJson(Map<String, dynamic> json) => Sdk(
    type: json['type'],
    repo: json['repo'],
    version: json['version'],
    tag: json['tag'],
  );

  Map<String, dynamic> toJson() => {
    'type': type,
    'repo': repo,
    'version': version,
    'tag': tag,
  };
}

class Ibc {
  final String? type;
  final String? version;

  Ibc({this.type, this.version});

  factory Ibc.fromJson(Map<String, dynamic> json) =>
      Ibc(type: json['type'], version: json['version']);

  Map<String, dynamic> toJson() => {'type': type, 'version': version};
}

class Language {
  final String? type;
  final String? version;

  Language({this.type, this.version});

  factory Language.fromJson(Map<String, dynamic> json) =>
      Language(type: json['type'], version: json['version']);

  Map<String, dynamic> toJson() => {'type': type, 'version': version};
}

class ChainImage {
  final String? png;
  final String? svg;
  final ThemeData? theme;

  ChainImage({this.png, this.svg, this.theme});

  factory ChainImage.fromJson(Map<String, dynamic> json) => ChainImage(
    png: json['png'],
    svg: json['svg'],
    theme: json['theme'] == null ? null : ThemeData.fromJson(json['theme']),
  );

  Map<String, dynamic> toJson() => {
    'png': png,
    'svg': svg,
    'theme': theme?.toJson(),
  };
}

class ThemeData {
  final bool? circle;

  ThemeData({this.circle});

  factory ThemeData.fromJson(Map<String, dynamic> json) =>
      ThemeData(circle: json['circle']);

  Map<String, dynamic> toJson() => {'circle': circle};
}

class Peers {
  final List<Peer> seeds;
  final List<Peer> persistentPeers;

  Peers({this.seeds = const [], this.persistentPeers = const []});

  factory Peers.fromJson(Map<String, dynamic> json) => Peers(
    seeds: (json['seeds'] as List? ?? []).map((e) => Peer.fromJson(e)).toList(),
    persistentPeers:
        (json['persistent_peers'] as List? ?? [])
            .map((e) => Peer.fromJson(e))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'seeds': seeds.map((e) => e.toJson()).toList(),
    'persistent_peers': persistentPeers.map((e) => e.toJson()).toList(),
  };
}

class Peer {
  final String? id;
  final String? address;
  final String? provider;

  Peer({this.id, this.address, this.provider});

  factory Peer.fromJson(Map<String, dynamic> json) => Peer(
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

class Apis {
  final List<ApiEndpoint> rpc;
  final List<ApiEndpoint> rest;
  final List<ApiEndpoint> grpc;
  final List<ApiEndpoint> evmHttpJsonrpc;

  List<BaseApis> getBestApis() {
    List<BaseApis?> apis = [
      ...rpc.map((e) {
        final url = e.address;
        if (url == null) return null;
        return BaseApis(url: url, api: CosmosProviderApi.tendermint);
      }),
      ...rest.map((e) {
        final url = e.address;
        if (url == null) return null;
        return BaseApis(url: url, api: CosmosProviderApi.rest);
      }),
      ...grpc.map((e) {
        final url = e.address;
        if (url == null) return null;
        return BaseApis(url: url, api: CosmosProviderApi.grpc);
      }),
    ];
    return apis.whereType<BaseApis>().toList();
  }

  Apis({
    this.rpc = const [],
    this.rest = const [],
    this.grpc = const [],
    this.evmHttpJsonrpc = const [],
  });

  factory Apis.fromJson(Map<String, dynamic> json) => Apis(
    rpc:
        (json['rpc'] as List? ?? [])
            .map((e) => ApiEndpoint.fromJson(e))
            .toList(),
    rest:
        (json['rest'] as List? ?? [])
            .map((e) => ApiEndpoint.fromJson(e))
            .toList(),
    grpc:
        (json['grpc'] as List? ?? [])
            .map((e) => ApiEndpoint.fromJson(e))
            .toList(),
    evmHttpJsonrpc:
        (json['evm-http-jsonrpc'] as List? ?? [])
            .map((e) => ApiEndpoint.fromJson(e))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'rpc': rpc.map((e) => e.toJson()).toList(),
    'rest': rest.map((e) => e.toJson()).toList(),
    'grpc': grpc.map((e) => e.toJson()).toList(),
    'evm-http-jsonrpc': evmHttpJsonrpc.map((e) => e.toJson()).toList(),
  };
}

class ApiEndpoint {
  final String? address;
  final String? provider;

  ApiEndpoint({this.address, this.provider});

  factory ApiEndpoint.fromJson(Map<String, dynamic> json) =>
      ApiEndpoint(address: json['address'], provider: json['provider']);

  Map<String, dynamic> toJson() => {'address': address, 'provider': provider};
}

class Explorer {
  final String? kind;
  final String? url;
  final String? txPage;
  final String? accountPage;

  Explorer({this.kind, this.url, this.txPage, this.accountPage});

  factory Explorer.fromJson(Map<String, dynamic> json) => Explorer(
    kind: json['kind'],
    url: json['url'],
    txPage: json['tx_page'],
    accountPage: json['account_page'],
  );

  Map<String, dynamic> toJson() => {
    'kind': kind,
    'url': url,
    'tx_page': txPage,
    'account_page': accountPage,
  };
}

class BaseApis {
  final String url;
  final CosmosProviderApi api;
  const BaseApis({required this.url, required this.api});
}
