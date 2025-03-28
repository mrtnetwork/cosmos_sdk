import 'package:cosmos_sdk/src/exception/exception.dart';
import 'chain.dart';

enum ChainRegistryChainType {
  testnets(pubPingPathSegment: "testnets"),
  mainnet();

  final String? pubPingPathSegment;
  const ChainRegistryChainType({this.pubPingPathSegment});
}

class CCRAsset {
  final bool? deprecated;
  final String? description;
  final String? extendedDescription;
  final List<CCRDenomUnit> denomUnits;
  final String? typeAsset;
  final String? address;
  final String base;
  final String name;
  final String display;
  final String symbol;
  final List<CCRIbcTransactionBase> traces;
  final CCRIbcData? ibc;
  final CCRLogoUris? logoURIs;
  final List<CCRImageData> images;
  final String? coingeckoId;
  final List<String>? keywords;
  final CCRSocials? socials;

  CCRAsset({
    this.deprecated,
    this.description,
    this.extendedDescription,
    required this.denomUnits,
    required this.typeAsset,
    this.address,
    required this.base,
    required this.name,
    required this.display,
    required this.symbol,
    required this.traces,
    this.ibc,
    this.logoURIs,
    required this.images,
    this.coingeckoId,
    this.keywords,
    this.socials,
  });

  // From JSON factory constructor
  factory CCRAsset.fromJson(Map<String, dynamic> json) {
    return CCRAsset(
      deprecated: json['deprecated'] as bool?,
      description: json['description'],
      extendedDescription: json['extended_description'],
      denomUnits: (json['denom_units'] as List)
          .map((item) => CCRDenomUnit.fromJson(item))
          .toList(),
      typeAsset: json['type_asset'],
      address: json['address'],
      base: json['base'],
      name: json['name'],
      display: json['display'],
      symbol: json['symbol'],
      traces: (json['traces'] as List?)
              ?.map((item) => CCRIbcTransactionBase.fromJson(item))
              .toList() ??
          [],
      ibc: json['ibc'] != null ? CCRIbcData.fromJson(json['ibc']) : null,
      logoURIs: json['logo_URIs'] != null
          ? CCRLogoUris.fromJson(json['logo_URIs'])
          : null,
      images: (json['images'] as List?)
              ?.map((item) => CCRImageData.fromJson(item))
              .toList() ??
          [],
      coingeckoId: json['coingecko_id'],
      keywords: (json['keywords'] as List?)?.cast(),
      socials:
          json['socials'] != null ? CCRSocials.fromJson(json['socials']) : null,
    );
  }

  List<String> get assetImageUrls =>
      images.where((e) => e.png != null).map((e) => e.png!).toList();

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'deprecated': deprecated,
      'description': description,
      'extended_description': extendedDescription,
      'denom_units': denomUnits.map((item) => item.toJson()).toList(),
      'type_asset': typeAsset,
      'address': address,
      'base': base,
      'name': name,
      'display': display,
      'symbol': symbol,
      'traces': traces.map((item) => item.toJson()).toList(),
      'ibc': ibc?.toJson(),
      'logo_URIs': logoURIs?.toJson(),
      'images': images.map((item) => item.toJson()).toList(),
      'coingecko_id': coingeckoId,
      'keywords': keywords,
      'socials': socials?.toJson(),
    };
  }
}

class CCRDenomUnit {
  final String denom;
  final int exponent;
  final List<String>? aliases;

  const CCRDenomUnit({
    required this.denom,
    required this.exponent,
    this.aliases,
  });
  factory CCRDenomUnit.fromJson(Map<String, dynamic> json) {
    return CCRDenomUnit(
        denom: json["denom"],
        exponent: json["exponent"],
        aliases: (json["aliases"] as List?)?.cast());
  }
  Map<String, dynamic> toJson() {
    return {
      'denom': denom,
      'exponent': exponent,
      'aliases': aliases,
    };
  }
}

class CCRIbcData {
  final String sourceChannel;
  final String dstChannel;
  final String sourceDenom;

  CCRIbcData(
      {required this.sourceChannel,
      required this.dstChannel,
      required this.sourceDenom});

  // From JSON factory constructor
  factory CCRIbcData.fromJson(Map<String, dynamic> json) {
    return CCRIbcData(
      sourceChannel: json['sourceChannel'],
      dstChannel: json['dstChannel'],
      sourceDenom: json['sourceDenom'],
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'sourceChannel': sourceChannel,
      'dstChannel': dstChannel,
      'sourceDenom': sourceDenom,
    };
  }
}

class CCRLogoUris {
  final String? png;
  final String? svg;

  CCRLogoUris({
    this.png,
    this.svg,
  });

  // From JSON factory constructor
  factory CCRLogoUris.fromJson(Map<String, dynamic> json) {
    return CCRLogoUris(
      png: json['png'],
      svg: json['svg'],
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'png': png,
      'svg': svg,
    };
  }
}

class CCRImageData {
  final CCRPointer? imageSync;
  final String? png;
  final String? svg;
  final CCRTheme? theme;

  CCRImageData({
    this.imageSync,
    this.png,
    this.svg,
    this.theme,
  });

  // From JSON factory constructor
  factory CCRImageData.fromJson(Map<String, dynamic> json) {
    return CCRImageData(
      imageSync: json['imageSync'] != null
          ? CCRPointer.fromJson(json['imageSync'])
          : null,
      png: json['png'],
      svg: json['svg'],
      theme: json['theme'] != null ? CCRTheme.fromJson(json['theme']) : null,
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'imageSync': imageSync?.toJson(),
      'png': png,
      'svg': svg,
      'theme': theme?.toJson(),
    };
  }
}

class CCRSocials {
  final String? website;
  final String? twitter;
  final String? telegram;
  final String? discord;
  final String? github;
  final String? medium;
  final String? reddit;

  CCRSocials({
    this.website,
    this.twitter,
    this.telegram,
    this.discord,
    this.github,
    this.medium,
    this.reddit,
  });

  // From JSON factory constructor
  factory CCRSocials.fromJson(Map<String, dynamic> json) {
    return CCRSocials(
      website: json['website'],
      twitter: json['twitter'],
      telegram: json['telegram'],
      discord: json['discord'],
      github: json['github'],
      medium: json['medium'],
      reddit: json['reddit'],
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'website': website,
      'twitter': twitter,
      'telegram': telegram,
      'discord': discord,
      'github': github,
      'medium': medium,
      'reddit': reddit,
    };
  }
}

abstract class CCRIbcTransactionBase {
  final String type;
  const CCRIbcTransactionBase({required this.type});
  factory CCRIbcTransactionBase.fromJson(Map<String, dynamic> json) {
    switch (json["type"]) {
      case "ibc":
        return CCRIbcTransition.fromJson(json);
      case "ibc-cw20":
        return CCRIbcCw20Transition.fromJson(json);
      case "ibc-bridge":
        return CCRIbcBridgeTransition.fromJson(json);
      case "bridge":
      case "liquid-stake":
      case "synthetic":
      case "wrapped":
      case "additional-mintage":
      case "test-mintage":
      case "legacy-mintage":
        return CCRNonIbcTransition.fromJson(json);
      default:
        throw DartCosmosSdkPluginException("unknown ibc transaction type.",
            details: {"type": json["type"]});
    }
  }
  Map<String, dynamic> toJson();
}

class CCRIbcTransition extends CCRIbcTransactionBase {
  final CCRCounterparty counterparty;
  final CCRAssetChain? chain;

  CCRIbcTransition({
    required super.type,
    required this.counterparty,
    required this.chain,
  });

  // From JSON factory constructor
  factory CCRIbcTransition.fromJson(Map<String, dynamic> json) {
    return CCRIbcTransition(
      type: json['type'],
      counterparty: CCRCounterparty.fromJson(json['counterparty']),
      chain:
          json["chain"] == null ? null : CCRAssetChain.fromJson(json['chain']),
    );
  }

  // To JSON method
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'counterparty': counterparty.toJson(),
      'chain': chain?.toJson(),
    };
  }
}

class CCRCounterparty {
  final String chainName;
  final String baseDenom;
  final String? channelId;
  final String? port;

  CCRCounterparty({
    required this.chainName,
    required this.baseDenom,
    required this.channelId,
    required this.port,
  });

  // From JSON factory constructor
  factory CCRCounterparty.fromJson(Map<String, dynamic> json) {
    return CCRCounterparty(
        chainName: json['chain_name'],
        baseDenom: json['base_denom'],
        channelId: json['channel_id'],
        port: json["port"]);
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'chain_name': chainName,
      'base_denom': baseDenom,
      'channel_id': channelId,
      "port": port
    };
  }
}

class CCRAssetChain {
  final String channelId;
  final String? path;

  const CCRAssetChain({
    required this.channelId,
    this.path,
  });

  // From JSON factory constructor
  factory CCRAssetChain.fromJson(Map<String, dynamic> json) {
    return CCRAssetChain(
      channelId: json['channel_id'],
      path: json['path'],
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'channelId': channelId,
      'path': path,
    };
  }
}

class CCRIbcCw20Transition extends CCRIbcTransactionBase {
  final CCRCounterpartyCw20 counterparty;
  final CCRChainCw20 chain;

  CCRIbcCw20Transition({
    required super.type,
    required this.counterparty,
    required this.chain,
  });

  // From JSON factory constructor
  factory CCRIbcCw20Transition.fromJson(Map<String, dynamic> json) {
    return CCRIbcCw20Transition(
      type: json['type'],
      counterparty: CCRCounterpartyCw20.fromJson(json['counterparty']),
      chain: CCRChainCw20.fromJson(json['chain']),
    );
  }

  // To JSON method
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'counterparty': counterparty.toJson(),
      'chain': chain.toJson(),
    };
  }
}

class CCRCounterpartyCw20 {
  final String chainName;
  final String baseDenom;
  final String port;
  final String channelId;

  CCRCounterpartyCw20({
    required this.chainName,
    required this.baseDenom,
    required this.port,
    required this.channelId,
  });

  factory CCRCounterpartyCw20.fromJson(Map<String, dynamic> json) {
    return CCRCounterpartyCw20(
      chainName: json['chain_name'],
      baseDenom: json['base_denom'],
      port: json['port'],
      channelId: json['channel_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chainName': chainName,
      'baseDenom': baseDenom,
      'port': port,
      'channelId': channelId,
    };
  }
}

class CCRChainCw20 {
  final String port;
  final String channelId;
  final String? path;

  CCRChainCw20({
    required this.port,
    required this.channelId,
    this.path,
  });

  factory CCRChainCw20.fromJson(Map<String, dynamic> json) {
    return CCRChainCw20(
      port: json['port'],
      channelId: json['channel_id'],
      path: json['path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'port': port,
      'channel_id': channelId,
      'path': path,
    };
  }
}

class CCRIbcBridgeTransition extends CCRIbcTransactionBase {
  final CCRCounterpartyBridge counterparty;
  final CCRChainBridge chain;
  final String provider;

  CCRIbcBridgeTransition({
    required super.type,
    required this.counterparty,
    required this.chain,
    required this.provider,
  });

  // From JSON factory constructor
  factory CCRIbcBridgeTransition.fromJson(Map<String, dynamic> json) {
    return CCRIbcBridgeTransition(
      type: json['type'],
      counterparty: CCRCounterpartyBridge.fromJson(json['counterparty']),
      chain: CCRChainBridge.fromJson(json['chain']),
      provider: json['provider'],
    );
  }

  // To JSON method
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'counterparty': counterparty.toJson(),
      'chain': chain.toJson(),
      'provider': provider,
    };
  }
}

class CCRCounterpartyBridge {
  final String chainName;
  final String baseDenom;
  final String? port;
  final String channelId;

  const CCRCounterpartyBridge({
    required this.chainName,
    required this.baseDenom,
    this.port,
    required this.channelId,
  });

  // From JSON factory constructor
  factory CCRCounterpartyBridge.fromJson(Map<String, dynamic> json) {
    return CCRCounterpartyBridge(
      chainName: json['chain_name'],
      baseDenom: json['base_denom'],
      port: json['port'],
      channelId: json['channel_id'],
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'chain_name': chainName,
      'base_denom': baseDenom,
      'port': port,
      'channel_id': channelId,
    };
  }
}

class CCRChainBridge {
  final String? port;
  final String channelId;
  final String? path;

  CCRChainBridge({
    this.port,
    required this.channelId,
    this.path,
  });

  // From JSON factory constructor
  factory CCRChainBridge.fromJson(Map<String, dynamic> json) {
    return CCRChainBridge(
      port: json['port'],
      channelId: json['channel_id'],
      path: json['path'],
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'port': port,
      'channel_id': channelId,
      'path': path,
    };
  }
}

class CCRNonIbcTransition extends CCRIbcTransactionBase {
  final CCRCounterpartyNonIbc counterparty;
  final CCRChainNonIbc? chain;
  final String provider;

  CCRNonIbcTransition({
    required super.type,
    required this.counterparty,
    this.chain,
    required this.provider,
  });

  // From JSON factory constructor
  factory CCRNonIbcTransition.fromJson(Map<String, dynamic> json) {
    return CCRNonIbcTransition(
      type: json['type'],
      counterparty: CCRCounterpartyNonIbc.fromJson(json['counterparty']),
      chain:
          json['chain'] != null ? CCRChainNonIbc.fromJson(json['chain']) : null,
      provider: json['provider'],
    );
  }

  // To JSON method
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'counterparty': counterparty.toJson(),
      'chain': chain?.toJson(),
      'provider': provider,
    };
  }
}

class CCRCounterpartyNonIbc {
  final String chainName;
  final String baseDenom;
  final String? contract;

  CCRCounterpartyNonIbc({
    required this.chainName,
    required this.baseDenom,
    this.contract,
  });

  // From JSON factory constructor
  factory CCRCounterpartyNonIbc.fromJson(Map<String, dynamic> json) {
    return CCRCounterpartyNonIbc(
      chainName: json['chain_name'],
      baseDenom: json['base_denom'],
      contract: json['contract'],
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'chain_name': chainName,
      'base_denom': baseDenom,
      'contract': contract,
    };
  }
}

class CCRChainNonIbc {
  final String contract;

  CCRChainNonIbc({required this.contract});

  // From JSON factory constructor
  factory CCRChainNonIbc.fromJson(Map<String, dynamic> json) {
    return CCRChainNonIbc(
      contract: json['contract'],
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'contract': contract,
    };
  }
}

class CCRAssetList {
  final String? schema;
  final String chainName;
  final List<CCRAsset> assets;

  CCRAssetList({this.schema, required this.chainName, required this.assets});

  // From JSON factory constructor
  factory CCRAssetList.fromJson(Map<String, dynamic> json) {
    return CCRAssetList(
      schema: json['\$schema'],
      chainName: json['chain_name'],
      assets: (json['assets'] as List)
          .map((assetJson) => CCRAsset.fromJson(assetJson))
          .toList(),
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      '\$schema': schema,
      'chainName': chainName,
      'assets': assets.map((asset) => asset.toJson()).toList()
    };
  }
}
