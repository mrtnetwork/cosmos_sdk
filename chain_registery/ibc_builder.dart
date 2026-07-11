import 'dart:convert';
import 'dart:io';

import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:cosmos_sdk/sdk/provider/chain_registery/models/models/cosmos_sdk.dart';

/// =====================================================================
/// MODELS — raw chain-registry JSON shapes
/// =====================================================================

/// One side of a `_IBC/*.json` file's top-level `chain-1` / `chain-2` block.
class CosmosIbcChainEndpoint {
  final String chainName;
  final String clientId;
  final String connectionId;

  CosmosIbcChainEndpoint({
    required this.chainName,
    required this.clientId,
    required this.connectionId,
  });

  factory CosmosIbcChainEndpoint.fromJson(Map<String, dynamic> json) {
    return CosmosIbcChainEndpoint(
      chainName: json['chain_name'],
      clientId: json['chain_id'],
      connectionId: json['connection_id'],
    );
  }
}

/// One side of a single channel entry (port-id + channel-id).
class CosmosIbcChannelSide {
  final String channelId;
  final String portId;

  CosmosIbcChannelSide({required this.channelId, required this.portId});

  factory CosmosIbcChannelSide.fromJson(Map<String, dynamic> json) {
    return CosmosIbcChannelSide(
      channelId: json['channel_id'] as String,
      portId: json['port_id'] as String,
    );
  }
}

/// A single channel entry inside the `channels` array of a `_IBC/*.json` file.
class CosmosIbcChannel {
  final CosmosIbcChannelSide chain1;
  final CosmosIbcChannelSide chain2;
  final String? ordering;
  final String? version;
  final Map<String, dynamic>? tags;

  CosmosIbcChannel({
    required this.chain1,
    required this.chain2,
    this.ordering,
    this.version,
    this.tags,
  });

  factory CosmosIbcChannel.fromJson(Map<String, dynamic> json) {
    return CosmosIbcChannel(
      chain1: CosmosIbcChannelSide.fromJson(
        json['chain_1'] as Map<String, dynamic>,
      ),
      chain2: CosmosIbcChannelSide.fromJson(
        json['chain_2'] as Map<String, dynamic>,
      ),
      ordering: json['ordering'] as String?,
      version: json['version'] as String?,
      tags: json['tags'] as Map<String, dynamic>?,
    );
  }
}

/// A fully parsed `_IBC/<chain1>-<chain2>.json` file.
class CosmosIbcRegistryFile {
  final CosmosIbcChainEndpoint chain1;
  final CosmosIbcChainEndpoint chain2;
  final List<CosmosIbcChannel> channels;

  CosmosIbcRegistryFile({
    required this.chain1,
    required this.chain2,
    required this.channels,
  });

  factory CosmosIbcRegistryFile.fromJson(Map<String, dynamic> json) {
    return CosmosIbcRegistryFile(
      chain1: CosmosIbcChainEndpoint.fromJson(
        json['chain_1'] as Map<String, dynamic>,
      ),
      chain2: CosmosIbcChainEndpoint.fromJson(
        json['chain_2'] as Map<String, dynamic>,
      ),
      channels:
          (json['channels'] as List<dynamic>)
              .map((c) => CosmosIbcChannel.fromJson(c as Map<String, dynamic>))
              .toList(),
    );
  }
}

/// =====================================================================
/// BUILDERS
/// =====================================================================

/// Scans `<registryRootPath>/<chainFolder>/chain.json` for every chain folder
/// and builds a `chain-name -> chain-id` map (e.g. "osmosis" -> "osmosis-1").
Future<Map<String, CosmosSdkChain>> buildChainNameToIdMap(
  List<CosmosSdkChain> chains,
) async {
  final Map<String, CosmosSdkChain> nameToId = {};
  for (final i in chains) {
    final id = "${i.chainId}_${i.name}";
    nameToId[id] = i;
  }
  return nameToId;
}

/// Parses every `_IBC/*.json` file and builds a `chainId -> List<CosmosChannelInfo>`
/// index. Each channel produces TWO entries (one per direction), since IBC
/// channels are bidirectional.
Future<List<CosmosSdkChain>> buildChannelIndex(
  String ibcDirPath,
  Map<String, CosmosSdkChain> chainNameToId,
) async {
  final Map<String, CosmosSdkChain> index = chainNameToId.clone();
  final dir = Directory(ibcDirPath);

  if (!await dir.exists()) {
    throw ArgumentError('_IBC directory not found: $ibcDirPath');
  }

  final files = dir.listSync().whereType<File>().where(
    (f) => f.path.endsWith('.json'),
  );

  for (final file in files) {
    final chainName =
        file.path
            .split("/")
            .last
            .split(".json")
            .first
            .split("-")
            .map((e) => e.trim())
            .toList();
    final json = jsonDecode(await file.readAsString()) as Map<String, dynamic>;
    try {
      final registryFile = CosmosIbcRegistryFile.fromJson(json);
      final c1Id = "${registryFile.chain1.clientId}_${chainName[0]}";
      final c2Id = "${registryFile.chain2.clientId}_${chainName[1]}";
      final chain1Id = chainNameToId[c1Id];
      final chain2Id = chainNameToId[c2Id];

      if (chain1Id == null || chain2Id == null) {
        stderr.writeln(
          'Skipping '
          '${registryFile.chain1.chainName} or ${registryFile.chain2.chainName}',
        );
        continue;
      }

      for (final channel in registryFile.channels) {
        final isPreferred =
            channel.tags?['preferred'] == true ||
            channel.tags?['status'] == 'live';

        _addToIndex(
          index,
          localChainId: chain1Id,
          counterpartyChainId: chain2Id,
          localSide: channel.chain1,
          counterpartySide: channel.chain2,
          preferred: isPreferred,
        );

        _addToIndex(
          index,
          localChainId: chain2Id,
          counterpartyChainId: chain1Id,
          localSide: channel.chain2,
          counterpartySide: channel.chain1,
          preferred: isPreferred,
        );
      }
    } catch (e) {
      stderr.writeln('Skipping ${file.path}: $e $json');
      rethrow;
    }
  }

  return index.values.toList();
}

void _addToIndex(
  Map<String, CosmosSdkChain> index, {
  required CosmosSdkChain localChainId,
  required CosmosSdkChain counterpartyChainId,
  required CosmosIbcChannelSide localSide,
  required CosmosIbcChannelSide counterpartySide,
  required bool preferred,
}) {
  final channel = CosmosChannelInfo(
    localChainId: localChainId.chainId,
    counterpartyChainId: counterpartyChainId.chainId,
    localChannelId: localSide.channelId,
    localPortId: localSide.portId,
    counterpartyChannelId: counterpartySide.channelId,
    counterpartyPortId: counterpartySide.portId,
    preferred: preferred,
  );
  final id = "${localChainId.chainId}_${localChainId.name}";
  final chain = index[id]!;
  index[id] = chain.copyWith(ibcChannels: [...chain.ibcChannels, channel]);
  // index
  //     .putIfAbsent(localChainId, () => [])
  //     .add(
  //       CosmosChannelInfo(
  //         localChainId: localChainId,
  //         counterpartyChainId: counterpartyChainId,
  //         localChannelId: localSide.channelId,
  //         localPortId: localSide.portId,
  //         counterpartyChannelId: counterpartySide.channelId,
  //         counterpartyPortId: counterpartySide.portId,
  //         preferred: preferred,
  //       ),
  //     );
}

/// Convenience one-shot: builds the name->id map and the full channel index
/// together, given the registry root (the folder containing both the
/// per-chain folders AND `_IBC/`).
Future<List<CosmosSdkChain>> loadIbcChannelIndex({
  required List<CosmosSdkChain> chains,
  required String ibcDir,
}) async {
  final chainNameToId = await buildChainNameToIdMap(chains);
  return buildChannelIndex(ibcDir, chainNameToId);
}

/// Look up all channels from `fromChainId` to `toChainId` (usually 0 or 1
/// result, but can be more than one if duplicate/legacy channels exist).
List<CosmosChannelInfo> findChannels(
  Map<String, List<CosmosChannelInfo>> index, {
  required String fromChainId,
  required String toChainId,
}) {
  final candidates = index[fromChainId] ?? [];
  return candidates.where((c) => c.counterpartyChainId == toChainId).toList();
}

/// Same as [findChannels] but returns only the preferred/canonical one(s),
/// if the registry tags provide that info; falls back to all candidates
/// if none are marked preferred.
List<CosmosChannelInfo> findPreferredChannels(
  Map<String, List<CosmosChannelInfo>> index, {
  required String fromChainId,
  required String toChainId,
}) {
  final all = findChannels(
    index,
    fromChainId: fromChainId,
    toChainId: toChainId,
  );
  final preferred = all.where((c) => c.preferred).toList();
  return preferred.isNotEmpty ? preferred : all;
}

/// =====================================================================
/// EXAMPLE USAGE
/// =====================================================================

Future<void> main(List<String> args) async {
  final file = File('./assets/chains.bin');
  if (!file.existsSync()) {
    stderr.writeln("File does not exists.");
    return;
  }
  final decode = CosmosSdkChainChains.deserialize(
    bytes: file.readAsBytesSync(),
  );
  final mainnet = await loadIbcChannelIndex(
    chains: decode.mainnet,
    ibcDir: '/home/mrhaydari/Downloads/chain-registry-master/_IBC',
  );
  final testnet = await loadIbcChannelIndex(
    chains: decode.testnet,
    ibcDir: '/home/mrhaydari/Downloads/chain-registry-master/testnets/_IBC',
  );
  final s = CosmosSdkChainChains(mainnet: mainnet, testnet: testnet);
  file.writeAsBytesSync(s.toCbor().encode());
  // print(ibc.expand((e) => e.ibcChannels).toList().length);
}

// CosmosSdkChainChains.deserialize(bytes: bytes);
// Loggg.log("unsupported ${unsupported.length}");
// final file = File('./assets/chains.bin')..createSync(recursive: true);
// file.writeAsBytesSync(bytes);
