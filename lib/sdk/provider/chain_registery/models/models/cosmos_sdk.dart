import 'package:blockchain_utils/bip/bip/conf/core/coin_conf.dart'
    show ChainType;
import 'package:blockchain_utils/cbor/cbor.dart';
import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:blockchain_utils/utils/json/extension/json.dart';
import 'package:cosmos_sdk/sdk/crypto/types/types.dart';
import 'package:cosmos_sdk/sdk/provider/types/types.dart';
import 'package:cosmos_sdk/sdk/serialization/src/identifier.dart';

class CosmosSdkAsset with CborTagSerializable {
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
      name: json.valueAs("name"),
      decimals: json.valueAs("decimals"),
      denom: json.valueAs("denom"),
      imagePng: json.valueAs("png_logo"),
      imageSvg: json.valueAs("svg_logo"),
      coingeckoId: json.valueAs("coingecko_id"),
      symbol: json.valueAs("symbol"),
      fixedMinGasPrice: json.valueAs("fixed_min_gas_price"),
      lowGasPrice: json.valueAs("low_gas_price"),
      averageGasPrice: json.valueAs("average_gas_price"),
      highGasPrice: json.valueAs("high_gas_price"),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "decimals": decimals,
      "denom": denom,
      "png_logo": imagePng,
      "svg_logo": imageSvg,
      "coingecko_id": coingeckoId,
      "symbol": symbol,
      "fixed_min_gas_price": fixedMinGasPrice,
      "low_gas_price": lowGasPrice,
      "average_gas_price": averageGasPrice,
      "high_gas_price": highGasPrice,
    };
  }

  @override
  SerializationIdentifier get serializationIdentifier =>
      CosmosSerializationIdentifiers.defaultTag;

  factory CosmosSdkAsset.deserialize({List<int>? bytes, CborObject? obj}) {
    final values = CborTagSerializable.decodeTaggedValue(
      identifier: CosmosSerializationIdentifiers.defaultTag,
      cborBytes: bytes,
      cborObject: obj,
    );
    return CosmosSdkAsset(
      name: values.rawValueAt(0),
      decimals: values.rawValueAt(1),
      denom: values.rawValueAt(2),
      imagePng: values.rawValueAt(3),
      imageSvg: values.rawValueAt(4),
      coingeckoId: values.rawValueAt(5),
      symbol: values.rawValueAt(6),
      fixedMinGasPrice: values.rawValueAt(7),
      lowGasPrice: values.rawValueAt(8),
      averageGasPrice: values.rawValueAt(9),
      highGasPrice: values.rawValueAt(10),
    );
  }

  @override
  List<CborObject<Object?>?> get serializationItems => [
    name.toCbor(),
    decimals.toCbor(),
    denom.toCbor(),
    imagePng?.toCbor(),
    imageSvg?.toCbor(),
    coingeckoId?.toCbor(),
    symbol.toCbor(),
    fixedMinGasPrice?.toCbor(),
    lowGasPrice?.toCbor(),
    averageGasPrice?.toCbor(),
    highGasPrice?.toCbor(),
  ];
}

class CosmosSkdExplorer with CborTagSerializable {
  final String? accountPage;
  final String? txPage;
  factory CosmosSkdExplorer.deserialize({List<int>? bytes, CborObject? obj}) {
    final values = CborTagSerializable.decodeTaggedValue(
      identifier: CosmosSerializationIdentifiers.defaultTag,
      cborBytes: bytes,
      cborObject: obj,
    );
    return CosmosSkdExplorer(
      accountPage: values.rawValueAt(0),
      txPage: values.rawValueAt(1),
    );
  }

  CosmosSkdExplorer({required this.accountPage, required this.txPage});
  factory CosmosSkdExplorer.fromJson(Map<String, dynamic> json) {
    return CosmosSkdExplorer(
      accountPage: json.valueAs("account_page"),
      txPage: json.valueAs("tx_page"),
    );
  }
  Map<String, dynamic> toJson() {
    return {"account_page": accountPage, "tx_page": txPage};
  }

  @override
  SerializationIdentifier get serializationIdentifier =>
      CosmosSerializationIdentifiers.defaultTag;

  @override
  List<CborObject<Object?>?> get serializationItems => [
    accountPage?.toCbor(),
    txPage?.toCbor(),
  ];
}

class CosmosSdkChainChains with CborTagSerializable {
  final List<CosmosSdkChain> mainnet;
  final List<CosmosSdkChain> testnet;
  CosmosSdkChainChains({required this.mainnet, required this.testnet});
  List<CosmosSdkChain> fromNetworkType(ChainType networkType) {
    return switch (networkType) {
      ChainType.testnet => testnet,
      ChainType.mainnet => mainnet,
    };
  }

  CosmosSdkChain? getChain(ChainType networkType, String chainId) {
    final chains = fromNetworkType(networkType);
    return chains.firstWhereNullable((e) => e.chainId == chainId);
  }

  @override
  SerializationIdentifier get serializationIdentifier =>
      CosmosSerializationIdentifiers.defaultTag;
  factory CosmosSdkChainChains.deserialize({
    List<int>? bytes,
    CborObject? obj,
  }) {
    final values = CborTagSerializable.decodeTaggedValue(
      identifier: CosmosSerializationIdentifiers.defaultTag,
      cborBytes: bytes,
      cborObject: obj,
    );
    return CosmosSdkChainChains(
      mainnet:
          values
              .listAt<CborTagValue>(0)
              .map((e) => CosmosSdkChain.deserialize(obj: e))
              .toList(),
      testnet:
          values
              .listAt<CborTagValue>(1)
              .map((e) => CosmosSdkChain.deserialize(obj: e))
              .toList(),
    );
  }

  @override
  List<CborObject<Object?>?> get serializationItems => [
    CborTagSerializable.listFromDynamic(
      mainnet.map((e) => e.toCbor()).toList(),
    ),
    CborTagSerializable.listFromDynamic(
      testnet.map((e) => e.toCbor()).toList(),
    ),
  ];
}

class CosmosSdkChain with CborTagSerializable {
  final String name;
  final String path;
  final String chainName;
  final String chainId;
  final String bech32Prefix;
  final CosmosSdkAsset native;
  final int slip44;
  final CosmosSkdExplorer explorers;
  final List<CCRApi> bestApis;
  final List<CosmosSdkAsset> fees;
  final List<CosmosKeysAlgs> supportedAlgs;
  final ChainType type;
  final List<CosmosChannelInfo> ibcChannels;
  @override
  SerializationIdentifier get serializationIdentifier =>
      CosmosSerializationIdentifiers.defaultTag;
  factory CosmosSdkChain.deserialize({List<int>? bytes, CborObject? obj}) {
    final values = CborTagSerializable.decodeTaggedValue(
      identifier: CosmosSerializationIdentifiers.defaultTag,
      cborBytes: bytes,
      cborObject: obj,
    );
    return CosmosSdkChain(
      name: values.rawValueAt(0),
      path: values.rawValueAt(1),
      chainName: values.rawValueAt(2),
      bech32Prefix: values.rawValueAt(3),
      slip44: values.rawValueAt(4),
      explorers: CosmosSkdExplorer.deserialize(obj: values.objectAt(5)),
      bestApis:
          values
              .listAt<CborTagValue>(6)
              .map((e) => CCRApi.deserialize(obj: e))
              .toList(),
      native: CosmosSdkAsset.deserialize(obj: values.objectAt(7)),
      chainId: values.rawValueAt(8),
      type: ChainType.fromValue(values.rawValueAt(9)),
      fees:
          values
              .listAt<CborTagValue>(10)
              .map((e) => CosmosSdkAsset.deserialize(obj: e))
              .toList(),
      supportedAlgs:
          values
              .listAt<CborIntValue>(11)
              .map((e) => CosmosKeysAlgs.fromValue(e.value))
              .toList(),
      ibcChannels:
          values
              .listAt<CborTagValue>(12)
              .map((e) => CosmosChannelInfo.deserialize(obj: e))
              .toList(),
    );
  }

  @override
  List<CborObject<Object?>?> get serializationItems => [
    name.toCbor(),
    path.toCbor(),
    chainName.toCbor(),
    bech32Prefix.toCbor(),
    slip44.toCbor(),
    explorers.toCbor(),
    CborTagSerializable.listFromDynamic(
      bestApis.map((e) => e.toCbor()).toList(),
    ),
    native.toCbor(),
    chainId.toCbor(),
    type.value.toCbor(),
    CborTagSerializable.listFromDynamic(fees.map((e) => e.toCbor()).toList()),
    CborTagSerializable.listFromDynamic(
      supportedAlgs.map((e) => e.value.toCbor()).toList(),
    ),
    CborTagSerializable.listFromDynamic(
      ibcChannels.map((e) => e.toCbor()).toList(),
    ),
  ];
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
    required List<CosmosKeysAlgs> supportedAlgs,
    required List<CosmosChannelInfo> ibcChannels,
  }) : fees = fees.immutable,
       supportedAlgs = supportedAlgs.immutable,
       ibcChannels = ibcChannels.immutable;
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "path": path,
      "chain_name": chainName,
      "chain_id": chainId,
      "native": native.toJson(),
      "bech32_prefix": bech32Prefix,
      "slip44": slip44,
      "explorers": explorers.toJson(),
      "ibc_channels": ibcChannels.map((e) => e.toJson()).toList(),
      "supported_algs": supportedAlgs.map((e) => e.package).toList(),
      "fees": fees.map((e) => e.toJson()).toList(),
      "type": type.name,
      "best_apis": bestApis.map((e) => e.toJson()).toList(),
    };
  }

  factory CosmosSdkChain.fromJson(Map<String, dynamic> json) {
    return CosmosSdkChain(
      name: json.valueAs("name"),
      path: json.valueAs("path"),
      chainName: json.valueAs("chain_name"),
      chainId: json.valueAs("chain_id"),
      native: CosmosSdkAsset.fromJson(
        json.valueEnsureAsMap<String, dynamic>("native"),
      ),
      bech32Prefix: json.valueAs("bech32_prefix"),
      slip44: json.valueAs("slip44"),
      explorers: CosmosSkdExplorer.fromJson(
        json.valueEnsureAsMap<String, dynamic>("explorers"),
      ),
      bestApis:
          json
              .valueEnsureAsList<Map<String, dynamic>>("best_apis")
              .map(CCRApi.fromJson)
              .toList(),
      fees:
          json
              .valueEnsureAsList<Map<String, dynamic>>("fees")
              .map(CosmosSdkAsset.fromJson)
              .toList(),
      supportedAlgs:
          json
              .valueAsList<List<String>>("supported_algs")
              .map(CosmosKeysAlgs.fromPackageName)
              .toList(),
      type: ChainType.fromValue(json.valueAs<String>("type")),
      ibcChannels:
          json
              .valueEnsureAsList<Map<String, dynamic>>("ibc_channels")
              .map(CosmosChannelInfo.fromJson)
              .toList(),
    );
  }
  CosmosSdkChain copyWith({List<CosmosChannelInfo>? ibcChannels}) {
    return CosmosSdkChain(
      name: name,
      path: path,
      chainName: chainName,
      bech32Prefix: bech32Prefix,
      slip44: slip44,
      explorers: explorers,
      bestApis: bestApis,
      native: native,
      chainId: chainId,
      type: type,
      fees: fees,
      supportedAlgs: supportedAlgs,
      ibcChannels: ibcChannels ?? this.ibcChannels,
    );
  }

  List<CosmosChannelInfo> getRoutes(String chainId) {
    return ibcChannels.where((e) => e.counterpartyChainId == chainId).toList();
  }
}

class CosmosChannelInfo with CborTagSerializable {
  final String localChainId;
  final String counterpartyChainId;
  final String localChannelId;
  final String localPortId;
  final String counterpartyChannelId;
  final String counterpartyPortId;
  final bool preferred;
  factory CosmosChannelInfo.fromJson(Map<String, dynamic> json) {
    return CosmosChannelInfo(
      localChainId: json.valueAs("local_chain_id"),
      counterpartyChainId: json.valueAs("counterparty_chain_id"),
      localChannelId: json.valueAs("local_channel_id"),
      localPortId: json.valueAs("local_port_id"),
      counterpartyChannelId: json.valueAs("counterparty_channel_id"),
      counterpartyPortId: json.valueAs("counterparty_port_id"),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "local_chain_id": localChainId,
      "counterparty_chain_id": counterpartyChainId,
      "local_channel_id": localChannelId,
      "local_port_id": localPortId,
      "counterparty_channel_id": counterpartyChannelId,
      "counterparty_port_id": counterpartyPortId,
    };
  }

  CosmosChannelInfo({
    required this.localChainId,
    required this.counterpartyChainId,
    required this.localChannelId,
    required this.localPortId,
    required this.counterpartyChannelId,
    required this.counterpartyPortId,
    this.preferred = false,
  });

  @override
  String toString() =>
      '$localChainId --($localChannelId)--> $counterpartyChainId ($counterpartyChannelId)'
      '${preferred ? " [preferred]" : ""}';

  @override
  SerializationIdentifier get serializationIdentifier =>
      CosmosSerializationIdentifiers.defaultTag;
  factory CosmosChannelInfo.deserialize({List<int>? bytes, CborObject? obj}) {
    final values = CborTagSerializable.decodeTaggedValue(
      identifier: CosmosSerializationIdentifiers.defaultTag,
      cborBytes: bytes,
      cborObject: obj,
    );
    return CosmosChannelInfo(
      localChainId: values.rawValueAt(0),
      counterpartyChainId: values.rawValueAt(1),
      localChannelId: values.rawValueAt(2),
      localPortId: values.rawValueAt(3),
      counterpartyChannelId: values.rawValueAt(4),
      counterpartyPortId: values.rawValueAt(5),
      preferred: values.rawValueAt(6),
    );
  }

  @override
  List<CborObject<Object?>?> get serializationItems => [
    localChainId.toCbor(),
    counterpartyChainId.toCbor(),
    localChannelId.toCbor(),
    localPortId.toCbor(),
    counterpartyChannelId.toCbor(),
    counterpartyPortId.toCbor(),
    preferred.toCbor(),
  ];
}

class CCRApi with CborTagSerializable {
  final String url;
  final CosmosProviderApi api;
  const CCRApi({required this.url, required this.api});
  factory CCRApi.deserialize({List<int>? bytes, CborObject? obj}) {
    final values = CborTagSerializable.decodeTaggedValue(
      identifier: CosmosSerializationIdentifiers.defaultTag,
      cborBytes: bytes,
      cborObject: obj,
    );
    return CCRApi(
      url: values.rawValueAt(0),
      api: CosmosProviderApi.fromValue(values.rawValueAt(1)),
    );
  }
  factory CCRApi.fromJson(Map<String, dynamic> json) {
    return CCRApi(
      url: json.valueAs("url"),
      api: CosmosProviderApi.fromName(json.valueAs("api")),
    );
  }
  Map<String, dynamic> toJson() {
    return {"url": url, "api": api.name};
  }

  @override
  SerializationIdentifier get serializationIdentifier =>
      CosmosSerializationIdentifiers.defaultTag;

  @override
  List<CborObject<Object?>?> get serializationItems => [
    url.toCbor(),
    api.value.toCbor(),
  ];
}
