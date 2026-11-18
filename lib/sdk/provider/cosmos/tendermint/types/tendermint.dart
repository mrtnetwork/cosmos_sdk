// GENERATED CODE - simple Dart models with fromJson/toJson
// Source: /home/mrhaydari/dev/cosmos_open_ai/a.yaml
import 'package:blockchain_utils/utils/utils.dart';

class TendermintProtocolVersion {
  final String? p2p;
  final String? block;
  final String? app;

  TendermintProtocolVersion({this.p2p, this.block, this.app});

  factory TendermintProtocolVersion.fromJson(Map<String, dynamic> json) {
    return TendermintProtocolVersion(
      p2p: json.valueAsString<String?>('p2p', normalizeKeyLookup: true),
      block: json.valueAsString<String?>('block', normalizeKeyLookup: true),
      app: json.valueAsString<String?>('app', normalizeKeyLookup: true),
    );
  }

  Map<String, dynamic> toJson() {
    return {'p2p': p2p, 'block': block, 'app': app};
  }
}

class TendermintPubKey {
  final String? type;
  final String? value;

  TendermintPubKey({this.type, this.value});

  factory TendermintPubKey.fromJson(Map<String, dynamic> json) {
    return TendermintPubKey(
      type: json.valueAsString<String?>('type', normalizeKeyLookup: true),
      value: json.valueAsString<String?>('value', normalizeKeyLookup: true),
    );
  }

  Map<String, dynamic> toJson() {
    return {'type': type, 'value': value};
  }
}

class TendermintNodeInfoOther {
  final String? txIndex;
  final String? rpcAddress;

  TendermintNodeInfoOther({this.txIndex, this.rpcAddress});

  factory TendermintNodeInfoOther.fromJson(Map<String, dynamic> json) {
    return TendermintNodeInfoOther(
      txIndex: json.valueAsString<String?>(
        'tx_index',
        normalizeKeyLookup: true,
      ),
      rpcAddress: json.valueAsString<String?>(
        'rpc_address',
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {'tx_index': txIndex, 'rpc_address': rpcAddress};
  }
}

class TendermintNodeInfo {
  final TendermintProtocolVersion? protocolVersion;
  final String? id;
  final String? listenAddr;
  final String? network;
  final String? version;
  final String? channels;
  final String? moniker;
  final TendermintNodeInfoOther? other;

  TendermintNodeInfo({
    this.protocolVersion,
    this.id,
    this.listenAddr,
    this.network,
    this.version,
    this.channels,
    this.moniker,
    this.other,
  });

  factory TendermintNodeInfo.fromJson(Map<String, dynamic> json) {
    return TendermintNodeInfo(
      protocolVersion: json
          .valueTo<TendermintProtocolVersion?, Map<String, dynamic>>(
            key: 'protocol_version',
            parse: (v) => TendermintProtocolVersion.fromJson(v),
            normalizeKeyLookup: true,
          ),
      id: json.valueAsString<String?>('id', normalizeKeyLookup: true),
      listenAddr: json.valueAsString<String?>(
        'listen_addr',
        normalizeKeyLookup: true,
      ),
      network: json.valueAsString<String?>('network', normalizeKeyLookup: true),
      version: json.valueAsString<String?>('version', normalizeKeyLookup: true),
      channels: json.valueAsString<String?>(
        'channels',
        normalizeKeyLookup: true,
      ),
      moniker: json.valueAsString<String?>('moniker', normalizeKeyLookup: true),
      other: json.valueTo<TendermintNodeInfoOther?, Map<String, dynamic>>(
        key: 'other',
        parse: (v) => TendermintNodeInfoOther.fromJson(v),
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'protocol_version': protocolVersion?.toJson(),
      'id': id,
      'listen_addr': listenAddr,
      'network': network,
      'version': version,
      'channels': channels,
      'moniker': moniker,
      'other': other?.toJson(),
    };
  }
}

class TendermintSyncInfo {
  final String? latestBlockHash;
  final String? latestAppHash;
  final String? latestBlockHeight;
  final String? latestBlockTime;
  final String? earliestBlockHash;
  final String? earliestAppHash;
  final String? earliestBlockHeight;
  final String? earliestBlockTime;
  final bool? catchingUp;

  TendermintSyncInfo({
    this.latestBlockHash,
    this.latestAppHash,
    this.latestBlockHeight,
    this.latestBlockTime,
    this.earliestBlockHash,
    this.earliestAppHash,
    this.earliestBlockHeight,
    this.earliestBlockTime,
    this.catchingUp,
  });

  factory TendermintSyncInfo.fromJson(Map<String, dynamic> json) {
    return TendermintSyncInfo(
      latestBlockHash: json.valueAsString<String?>(
        'latest_block_hash',
        normalizeKeyLookup: true,
      ),
      latestAppHash: json.valueAsString<String?>(
        'latest_app_hash',
        normalizeKeyLookup: true,
      ),
      latestBlockHeight: json.valueAsString<String?>(
        'latest_block_height',
        normalizeKeyLookup: true,
      ),
      latestBlockTime: json.valueAsString<String?>(
        'latest_block_time',
        normalizeKeyLookup: true,
      ),
      earliestBlockHash: json.valueAsString<String?>(
        'earliest_block_hash',
        normalizeKeyLookup: true,
      ),
      earliestAppHash: json.valueAsString<String?>(
        'earliest_app_hash',
        normalizeKeyLookup: true,
      ),
      earliestBlockHeight: json.valueAsString<String?>(
        'earliest_block_height',
        normalizeKeyLookup: true,
      ),
      earliestBlockTime: json.valueAsString<String?>(
        'earliest_block_time',
        normalizeKeyLookup: true,
      ),
      catchingUp: json.valueAsBool<bool?>(
        'catching_up',
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latest_block_hash': latestBlockHash,
      'latest_app_hash': latestAppHash,
      'latest_block_height': latestBlockHeight,
      'latest_block_time': latestBlockTime,
      'earliest_block_hash': earliestBlockHash,
      'earliest_app_hash': earliestAppHash,
      'earliest_block_height': earliestBlockHeight,
      'earliest_block_time': earliestBlockTime,
      'catching_up': catchingUp,
    };
  }
}

class TendermintValidatorInfo {
  final String? address;
  final TendermintPubKey? pubKey;
  final String? votingPower;

  TendermintValidatorInfo({this.address, this.pubKey, this.votingPower});

  factory TendermintValidatorInfo.fromJson(Map<String, dynamic> json) {
    return TendermintValidatorInfo(
      address: json.valueAsString<String?>('address', normalizeKeyLookup: true),
      pubKey: json.valueTo<TendermintPubKey?, Map<String, dynamic>>(
        key: 'pub_key',
        parse: (v) => TendermintPubKey.fromJson(v),
        normalizeKeyLookup: true,
      ),
      votingPower: json.valueAsString<String?>(
        'voting_power',
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'pub_key': pubKey?.toJson(),
      'voting_power': votingPower,
    };
  }
}

class TendermintStatus {
  final TendermintNodeInfo? nodeInfo;
  final TendermintSyncInfo? syncInfo;
  final TendermintValidatorInfo? validatorInfo;

  TendermintStatus({this.nodeInfo, this.syncInfo, this.validatorInfo});

  factory TendermintStatus.fromJson(Map<String, dynamic> json) {
    return TendermintStatus(
      nodeInfo: json.valueTo<TendermintNodeInfo?, Map<String, dynamic>>(
        key: 'node_info',
        parse: (v) => TendermintNodeInfo.fromJson(v),
        normalizeKeyLookup: true,
      ),
      syncInfo: json.valueTo<TendermintSyncInfo?, Map<String, dynamic>>(
        key: 'sync_info',
        parse: (v) => TendermintSyncInfo.fromJson(v),
        normalizeKeyLookup: true,
      ),
      validatorInfo: json
          .valueTo<TendermintValidatorInfo?, Map<String, dynamic>>(
            key: 'validator_info',
            parse: (v) => TendermintValidatorInfo.fromJson(v),
            normalizeKeyLookup: true,
          ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'node_info': nodeInfo?.toJson(),
      'sync_info': syncInfo?.toJson(),
      'validator_info': validatorInfo?.toJson(),
    };
  }
}

class TendermintMonitor {
  final bool? active;
  final String? start;
  final String? duration;
  final String? idle;
  final String? bytes;
  final String? samples;
  final String? instRate;
  final String? curRate;
  final String? avgRate;
  final String? peakRate;
  final String? bytesRem;
  final String? timeRem;
  final int? progress;

  TendermintMonitor({
    this.active,
    this.start,
    this.duration,
    this.idle,
    this.bytes,
    this.samples,
    this.instRate,
    this.curRate,
    this.avgRate,
    this.peakRate,
    this.bytesRem,
    this.timeRem,
    this.progress,
  });

  factory TendermintMonitor.fromJson(Map<String, dynamic> json) {
    return TendermintMonitor(
      active: json.valueAsBool<bool?>('Active', normalizeKeyLookup: true),
      start: json.valueAsString<String?>('Start', normalizeKeyLookup: true),
      duration: json.valueAsString<String?>(
        'Duration',
        normalizeKeyLookup: true,
      ),
      idle: json.valueAsString<String?>('Idle', normalizeKeyLookup: true),
      bytes: json.valueAsString<String?>('Bytes', normalizeKeyLookup: true),
      samples: json.valueAsString<String?>('Samples', normalizeKeyLookup: true),
      instRate: json.valueAsString<String?>(
        'InstRate',
        normalizeKeyLookup: true,
      ),
      curRate: json.valueAsString<String?>('CurRate', normalizeKeyLookup: true),
      avgRate: json.valueAsString<String?>('AvgRate', normalizeKeyLookup: true),
      peakRate: json.valueAsString<String?>(
        'PeakRate',
        normalizeKeyLookup: true,
      ),
      bytesRem: json.valueAsString<String?>(
        'BytesRem',
        normalizeKeyLookup: true,
      ),
      timeRem: json.valueAsString<String?>('TimeRem', normalizeKeyLookup: true),
      progress: json.valueAsInt<int?>('Progress', normalizeKeyLookup: true),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Active': active,
      'Start': start,
      'Duration': duration,
      'Idle': idle,
      'Bytes': bytes,
      'Samples': samples,
      'InstRate': instRate,
      'CurRate': curRate,
      'AvgRate': avgRate,
      'PeakRate': peakRate,
      'BytesRem': bytesRem,
      'TimeRem': timeRem,
      'Progress': progress,
    };
  }
}

class TendermintChannel {
  final int? id;
  final String? sendQueueCapacity;
  final String? sendQueueSize;
  final String? priority;
  final String? recentlySent;

  TendermintChannel({
    this.id,
    this.sendQueueCapacity,
    this.sendQueueSize,
    this.priority,
    this.recentlySent,
  });

  factory TendermintChannel.fromJson(Map<String, dynamic> json) {
    return TendermintChannel(
      id: json.valueAsInt<int?>('ID', normalizeKeyLookup: true),
      sendQueueCapacity: json.valueAsString<String?>(
        'SendQueueCapacity',
        normalizeKeyLookup: true,
      ),
      sendQueueSize: json.valueAsString<String?>(
        'SendQueueSize',
        normalizeKeyLookup: true,
      ),
      priority: json.valueAsString<String?>(
        'Priority',
        normalizeKeyLookup: true,
      ),
      recentlySent: json.valueAsString<String?>(
        'RecentlySent',
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'SendQueueCapacity': sendQueueCapacity,
      'SendQueueSize': sendQueueSize,
      'Priority': priority,
      'RecentlySent': recentlySent,
    };
  }
}

class TendermintConnectionStatus {
  final String? duration;
  final TendermintMonitor? sendMonitor;
  final TendermintMonitor? recvMonitor;
  final List<TendermintChannel>? channels;

  TendermintConnectionStatus({
    this.duration,
    this.sendMonitor,
    this.recvMonitor,
    this.channels,
  });

  factory TendermintConnectionStatus.fromJson(Map<String, dynamic> json) {
    return TendermintConnectionStatus(
      duration: json.valueAsString<String?>(
        'Duration',
        normalizeKeyLookup: true,
      ),
      sendMonitor: json.valueTo<TendermintMonitor?, Map<String, dynamic>>(
        key: 'SendMonitor',
        parse: (v) => TendermintMonitor.fromJson(v),
        normalizeKeyLookup: true,
      ),
      recvMonitor: json.valueTo<TendermintMonitor?, Map<String, dynamic>>(
        key: 'RecvMonitor',
        parse: (v) => TendermintMonitor.fromJson(v),
        normalizeKeyLookup: true,
      ),
      channels: json.valueTo<List<TendermintChannel>?, List>(
        key: 'Channels',
        parse:
            (v) =>
                v
                    .map(
                      (e) => TendermintChannel.fromJson(
                        Map<String, dynamic>.from(e),
                      ),
                    )
                    .toList(),
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Duration': duration,
      'SendMonitor': sendMonitor?.toJson(),
      'RecvMonitor': recvMonitor?.toJson(),
      'Channels': channels?.map((e) => e.toJson()).toList(),
    };
  }
}

class TendermintPeer {
  final TendermintNodeInfo? nodeInfo;
  final bool? isOutbound;
  final TendermintConnectionStatus? connectionStatus;
  final String? remoteIp;

  TendermintPeer({
    this.nodeInfo,
    this.isOutbound,
    this.connectionStatus,
    this.remoteIp,
  });

  factory TendermintPeer.fromJson(Map<String, dynamic> json) {
    return TendermintPeer(
      nodeInfo: json.valueTo<TendermintNodeInfo?, Map<String, dynamic>>(
        key: 'node_info',
        parse: (v) => TendermintNodeInfo.fromJson(v),
        normalizeKeyLookup: true,
      ),
      isOutbound: json.valueAsBool<bool?>(
        'is_outbound',
        normalizeKeyLookup: true,
      ),
      connectionStatus: json
          .valueTo<TendermintConnectionStatus?, Map<String, dynamic>>(
            key: 'connection_status',
            parse: (v) => TendermintConnectionStatus.fromJson(v),
            normalizeKeyLookup: true,
          ),
      remoteIp: json.valueAsString<String?>(
        'remote_ip',
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'node_info': nodeInfo?.toJson(),
      'is_outbound': isOutbound,
      'connection_status': connectionStatus?.toJson(),
      'remote_ip': remoteIp,
    };
  }
}

class TendermintNetInfo {
  final bool? listening;
  final List<String>? listeners;
  final String? nPeers;
  final List<TendermintPeer>? peers;

  TendermintNetInfo({this.listening, this.listeners, this.nPeers, this.peers});

  factory TendermintNetInfo.fromJson(Map<String, dynamic> json) {
    return TendermintNetInfo(
      listening: json.valueAsBool<bool?>('listening', normalizeKeyLookup: true),
      listeners: json.valueAsList<List<String>?>(
        'listeners',
        normalizeKeyLookup: true,
      ),
      nPeers: json.valueAsString<String?>('n_peers', normalizeKeyLookup: true),
      peers: json.valueTo<List<TendermintPeer>?, List>(
        key: 'peers',
        parse:
            (v) =>
                v
                    .map(
                      (e) =>
                          TendermintPeer.fromJson(Map<String, dynamic>.from(e)),
                    )
                    .toList(),
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'listening': listening,
      'listeners': listeners,
      'n_peers': nPeers,
      'peers': peers?.map((e) => e.toJson()).toList(),
    };
  }
}

class TendermintBlockMeta {
  final TendermintBlockID? blockId;
  final int? blockSize;
  final TendermintBlockHeader? header;
  final String? numTxs;

  TendermintBlockMeta({this.blockId, this.blockSize, this.header, this.numTxs});

  factory TendermintBlockMeta.fromJson(Map<String, dynamic> json) {
    return TendermintBlockMeta(
      blockId: json.valueTo<TendermintBlockID?, Map<String, dynamic>>(
        key: 'block_id',
        parse: (v) => TendermintBlockID.fromJson(v),
        normalizeKeyLookup: true,
      ),
      blockSize: json.valueAsInt<int?>('block_size', normalizeKeyLookup: true),
      header: json.valueTo<TendermintBlockHeader?, Map<String, dynamic>>(
        key: 'header',
        parse: (v) => TendermintBlockHeader.fromJson(v),
        normalizeKeyLookup: true,
      ),
      numTxs: json.valueAsString<String?>('num_txs', normalizeKeyLookup: true),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'block_id': blockId?.toJson(),
      'block_size': blockSize,
      'header': header?.toJson(),
      'num_txs': numTxs,
    };
  }
}

class TendermintBlockchain {
  final String lastHeight;
  final List<TendermintBlockMeta> blockMetas;

  TendermintBlockchain({required this.lastHeight, required this.blockMetas});

  factory TendermintBlockchain.fromJson(Map<String, dynamic> json) {
    return TendermintBlockchain(
      lastHeight: json.valueAsString<String>(
        'last_height',
        normalizeKeyLookup: true,
      ),
      blockMetas: json.valueTo<List<TendermintBlockMeta>, List>(
        key: 'block_metas',
        parse:
            (v) =>
                v
                    .map(
                      (e) => TendermintBlockMeta.fromJson(
                        Map<String, dynamic>.from(e),
                      ),
                    )
                    .toList(),
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'last_height': lastHeight,
      'block_metas': blockMetas.map((e) => e.toJson()).toList(),
    };
  }
}

class TendermintCommit {
  final int? type;
  final String height;
  final int round;
  final TendermintBlockID blockId;
  final String timestamp;
  final String validatorAddress;
  final int validatorIndex;
  final String signature;

  TendermintCommit({
    required this.type,
    required this.height,
    required this.round,
    required this.blockId,
    required this.timestamp,
    required this.validatorAddress,
    required this.validatorIndex,
    required this.signature,
  });

  factory TendermintCommit.fromJson(Map<String, dynamic> json) {
    return TendermintCommit(
      type: json.valueAsInt<int>('type', normalizeKeyLookup: true),
      height: json.valueAsString<String>('height', normalizeKeyLookup: true),
      round: json.valueAsInt<int>('round', normalizeKeyLookup: true),
      blockId: json.valueTo<TendermintBlockID, Map<String, dynamic>>(
        key: 'block_id',
        parse: (v) => TendermintBlockID.fromJson(v),
        normalizeKeyLookup: true,
      ),
      timestamp: json.valueAsString<String>(
        'timestamp',
        normalizeKeyLookup: true,
      ),
      validatorAddress: json.valueAsString<String>(
        'validator_address',
        normalizeKeyLookup: true,
      ),
      validatorIndex: json.valueAsInt<int>(
        'validator_index',
        normalizeKeyLookup: true,
      ),
      signature: json.valueAsString<String>(
        'signature',
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'height': height,
      'round': round,
      'block_id': blockId.toJson(),
      'timestamp': timestamp,
      'validator_address': validatorAddress,
      'validator_index': validatorIndex,
      'signature': signature,
    };
  }
}

// class TendermintBlockLastCommit {
//   final int? height;
//   final int? round;
//   final TendermintBlockID? blockId;
//   final List<TendermintCommit>? signatures;

//   TendermintBlockLastCommit({this.height, this.round, this.blockId, this.signatures});

//   factory TendermintBlockLastCommit.fromJson(Map<String, dynamic> json) {
//     return TendermintBlockLastCommit(
//       height: json.valueAsInt<int?>('height', normalizeKeyLookup: true),
//       round: json.valueAsInt<int?>('round', normalizeKeyLookup: true),
//       blockId: json.valueTo<TendermintBlockID?, Map<String, dynamic>>(
//         key: 'block_id',
//         parse: (v) => TendermintBlockID.fromJson(v),
//         normalizeKeyLookup: true
//       ),
//       signatures: json.valueTo<List<TendermintCommit>?, List>(
//         key: 'signatures',
//         parse:
//             (v) =>
//                 v
//                     .map((e) => TendermintCommit.fromJson(Map<String, dynamic>.from(e)))
//                     .toList(),
//         normalizeKeyLookup: true
//       ),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'height': height,
//       'round': round,
//       'block_id': blockId?.toJson(),
//       'signatures': signatures?.map((e) => e.toJson()).toList(),
//     };
//   }
// }

class TendermintBlock {
  final TendermintBlockHeader? header;
  final List<String>? data;
  final List<TendermintEvidence>? evidence;
  final TendermintCommitResponseResultSignedHeaderCommit? lastCommit;

  TendermintBlock({this.header, this.data, this.evidence, this.lastCommit});

  factory TendermintBlock.fromJson(Map<String, dynamic> json) {
    return TendermintBlock(
      header: json.valueTo<TendermintBlockHeader?, Map<String, dynamic>>(
        key: 'header',
        parse: (v) => TendermintBlockHeader.fromJson(v),
        normalizeKeyLookup: true,
      ),
      // data: json.valueAsList<List<String>?>('data', normalizeKeyLookup: true),
      // evidence: json.valueTo<List<TendermintEvidence>?, List>(
      //   key: 'evidence',
      //   parse:
      //       (v) =>
      //           v
      //               .map((e) => TendermintEvidence.fromJson(Map<String, dynamic>.from(e)))
      //               .toList(),
      //   normalizeKeyLookup: true
      // ),
      lastCommit: json.valueTo<
        TendermintCommitResponseResultSignedHeaderCommit?,
        Map<String, dynamic>
      >(
        key: 'last_commit',
        parse:
            (v) => TendermintCommitResponseResultSignedHeaderCommit.fromJson(v),
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'header': header?.toJson(),
      'data': data,
      'evidence': evidence?.map((e) => e.toJson()).toList(),
      'last_commit': lastCommit?.toJson(),
    };
  }
}

class TendermintEvidence {
  final String? type;
  final int? height;
  final int? time;
  final int? totalVotingPower;
  final TendermintValidator? validator;

  TendermintEvidence({
    this.type,
    this.height,
    this.time,
    this.totalVotingPower,
    this.validator,
  });

  factory TendermintEvidence.fromJson(Map<String, dynamic> json) {
    return TendermintEvidence(
      type: json.valueAsString<String?>('type', normalizeKeyLookup: true),
      height: json.valueAsInt<int?>('height', normalizeKeyLookup: true),
      time: json.valueAsInt<int?>('time', normalizeKeyLookup: true),
      totalVotingPower: json.valueAsInt<int?>(
        'total_voting_power',
        normalizeKeyLookup: true,
      ),
      validator: json.valueTo<TendermintValidator?, Map<String, dynamic>>(
        key: 'validator',
        parse: (v) => TendermintValidator.fromJson(v),
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'height': height,
      'time': time,
      'total_voting_power': totalVotingPower,
      'validator': validator?.toJson(),
    };
  }
}

class TendermintBlockComplete {
  final TendermintBlockID? blockId;
  final TendermintBlock? block;

  TendermintBlockComplete({this.blockId, this.block});

  factory TendermintBlockComplete.fromJson(Map<String, dynamic> json) {
    return TendermintBlockComplete(
      blockId: json.valueTo<TendermintBlockID?, Map<String, dynamic>>(
        key: 'block_id',
        parse: (v) => TendermintBlockID.fromJson(v),
        normalizeKeyLookup: true,
      ),
      block: json.valueTo<TendermintBlock?, Map<String, dynamic>>(
        key: 'block',
        parse: (v) => TendermintBlock.fromJson(v),
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {'block_id': blockId?.toJson(), 'block': block?.toJson()};
  }
}

class TendermintBlockResultsResponseResultTxsResultsEvents {
  final String? type;
  final List<TendermintEvent>? attributes;

  TendermintBlockResultsResponseResultTxsResultsEvents({
    this.type,
    this.attributes,
  });

  factory TendermintBlockResultsResponseResultTxsResultsEvents.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintBlockResultsResponseResultTxsResultsEvents(
      type: json.valueAsString<String?>('type', normalizeKeyLookup: true),
      attributes: json.valueTo<List<TendermintEvent>?, List>(
        key: 'attributes',
        parse:
            (v) =>
                v
                    .map(
                      (e) => TendermintEvent.fromJson(
                        Map<String, dynamic>.from(e),
                      ),
                    )
                    .toList(),
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'attributes': attributes?.map((e) => e.toJson()).toList(),
    };
  }
}

class TendermintBlockResultsResponseResultTxsResults {
  final int? code;
  final String? data;
  final String? log;
  final String? info;
  final String? gasWanted;
  final String? gasUsed;
  final List<TendermintBlockResultsResponseResultTxsResultsEvents>? events;
  final String? codespace;

  TendermintBlockResultsResponseResultTxsResults({
    this.code,
    this.data,
    this.log,
    this.info,
    this.gasWanted,
    this.gasUsed,
    this.events,
    this.codespace,
  });

  factory TendermintBlockResultsResponseResultTxsResults.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintBlockResultsResponseResultTxsResults(
      code: json.valueAsInt<int?>('code', normalizeKeyLookup: true),
      data: json.valueAsString<String?>('data', normalizeKeyLookup: true),
      log: json.valueAsString<String?>('log', normalizeKeyLookup: true),
      info: json.valueAsString<String?>('info', normalizeKeyLookup: true),
      gasWanted: json.valueAsString<String?>(
        'gas_wanted',
        normalizeKeyLookup: true,
      ),
      gasUsed: json.valueAsString<String?>(
        'gas_used',
        normalizeKeyLookup: true,
      ),
      events: json.valueTo<
        List<TendermintBlockResultsResponseResultTxsResultsEvents>?,
        List
      >(
        key: 'events',
        parse:
            (v) =>
                v
                    .map(
                      (e) =>
                          TendermintBlockResultsResponseResultTxsResultsEvents.fromJson(
                            Map<String, dynamic>.from(e),
                          ),
                    )
                    .toList(),
        normalizeKeyLookup: true,
      ),
      codespace: json.valueAsString<String?>(
        'codespace',
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'data': data,
      'log': log,
      'info': info,
      'gas_wanted': gasWanted,
      'gas_used': gasUsed,
      'events': events?.map((e) => e.toJson()).toList(),
      'codespace': codespace,
    };
  }
}

class TendermintBlockResultsResponseResultFinalizeBlockEvents {
  final String? type;
  final List<TendermintEvent>? attributes;

  TendermintBlockResultsResponseResultFinalizeBlockEvents({
    this.type,
    this.attributes,
  });

  factory TendermintBlockResultsResponseResultFinalizeBlockEvents.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintBlockResultsResponseResultFinalizeBlockEvents(
      type: json.valueAsString<String?>('type', normalizeKeyLookup: true),
      attributes: json.valueTo<List<TendermintEvent>?, List>(
        key: 'attributes',
        parse:
            (v) =>
                v
                    .map(
                      (e) => TendermintEvent.fromJson(
                        Map<String, dynamic>.from(e),
                      ),
                    )
                    .toList(),
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'attributes': attributes?.map((e) => e.toJson()).toList(),
    };
  }
}

class TendermintBlockResultsResponseResultValidatorUpdatesPubKey {
  final String type;
  final String value;

  TendermintBlockResultsResponseResultValidatorUpdatesPubKey({
    required this.type,
    required this.value,
  });

  factory TendermintBlockResultsResponseResultValidatorUpdatesPubKey.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintBlockResultsResponseResultValidatorUpdatesPubKey(
      type: json.valueAsString<String>('type', normalizeKeyLookup: true),
      value: json.valueAsString<String>('value', normalizeKeyLookup: true),
    );
  }

  Map<String, dynamic> toJson() {
    return {'type': type, 'value': value};
  }
}

class TendermintBlockResultsResponseResultValidatorUpdates {
  final TendermintBlockResultsResponseResultValidatorUpdatesPubKey? pubKey;
  final String? power;

  TendermintBlockResultsResponseResultValidatorUpdates({
    this.pubKey,
    this.power,
  });

  factory TendermintBlockResultsResponseResultValidatorUpdates.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintBlockResultsResponseResultValidatorUpdates(
      pubKey: json.valueTo<
        TendermintBlockResultsResponseResultValidatorUpdatesPubKey?,
        Map<String, dynamic>
      >(
        key: 'pub_key',
        parse:
            (v) =>
                TendermintBlockResultsResponseResultValidatorUpdatesPubKey.fromJson(
                  v,
                ),
        normalizeKeyLookup: true,
      ),
      power: json.valueAsString<String?>('power', normalizeKeyLookup: true),
    );
  }

  Map<String, dynamic> toJson() {
    return {'pub_key': pubKey?.toJson(), 'power': power};
  }
}

class TendermintBlockResultsResponseResult {
  final String height;
  final List<TendermintBlockResultsResponseResultTxsResults>? txsResults;
  final List<TendermintBlockResultsResponseResultFinalizeBlockEvents>?
  finalizeBlockEvents;
  final List<TendermintBlockResultsResponseResultValidatorUpdates>?
  validatorUpdates;
  final TendermintConsensusParams? consensusParamUpdates;

  TendermintBlockResultsResponseResult({
    required this.height,
    this.txsResults,
    this.finalizeBlockEvents,
    this.validatorUpdates,
    this.consensusParamUpdates,
  });

  factory TendermintBlockResultsResponseResult.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintBlockResultsResponseResult(
      height: json.valueAsString<String>('height', normalizeKeyLookup: true),
      txsResults: json.valueTo<
        List<TendermintBlockResultsResponseResultTxsResults>?,
        List
      >(
        key: 'txs_results',
        parse:
            (v) =>
                v
                    .map(
                      (e) =>
                          TendermintBlockResultsResponseResultTxsResults.fromJson(
                            Map<String, dynamic>.from(e),
                          ),
                    )
                    .toList(),
        normalizeKeyLookup: true,
      ),
      finalizeBlockEvents: json.valueTo<
        List<TendermintBlockResultsResponseResultFinalizeBlockEvents>?,
        List
      >(
        key: 'finalize_block_events',
        parse:
            (v) =>
                v
                    .map(
                      (e) =>
                          TendermintBlockResultsResponseResultFinalizeBlockEvents.fromJson(
                            Map<String, dynamic>.from(e),
                          ),
                    )
                    .toList(),
        normalizeKeyLookup: true,
      ),
      validatorUpdates: json.valueTo<
        List<TendermintBlockResultsResponseResultValidatorUpdates>?,
        List
      >(
        key: 'validator_updates',
        parse:
            (v) =>
                v
                    .map(
                      (e) =>
                          TendermintBlockResultsResponseResultValidatorUpdates.fromJson(
                            Map<String, dynamic>.from(e),
                          ),
                    )
                    .toList(),
        normalizeKeyLookup: true,
      ),
      consensusParamUpdates: json
          .valueTo<TendermintConsensusParams?, Map<String, dynamic>>(
            key: 'consensus_param_updates',
            parse: (v) => TendermintConsensusParams.fromJson(v),
            normalizeKeyLookup: true,
          ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'height': height,
      'txs_results': txsResults?.map((e) => e.toJson()).toList(),
      'finalize_block_events':
          finalizeBlockEvents?.map((e) => e.toJson()).toList(),
      'validator_updates': validatorUpdates?.map((e) => e.toJson()).toList(),
      'consensus_param_updates': consensusParamUpdates?.toJson(),
    };
  }
}

class TendermintCommitResponseResultSignedHeaderCommitSignatures {
  final int? blockIdFlag;
  final String? validatorAddress;
  final String? timestamp;
  final String? signature;

  TendermintCommitResponseResultSignedHeaderCommitSignatures({
    this.blockIdFlag,
    this.validatorAddress,
    this.timestamp,
    this.signature,
  });

  factory TendermintCommitResponseResultSignedHeaderCommitSignatures.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintCommitResponseResultSignedHeaderCommitSignatures(
      blockIdFlag: json.valueAsInt<int?>(
        'block_id_flag',
        normalizeKeyLookup: true,
      ),
      validatorAddress: json.valueAsString<String?>(
        'validator_address',
        normalizeKeyLookup: true,
      ),
      timestamp: json.valueAsString<String?>(
        'timestamp',
        normalizeKeyLookup: true,
      ),
      signature: json.valueAsString<String?>(
        'signature',
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'block_id_flag': blockIdFlag,
      'validator_address': validatorAddress,
      'timestamp': timestamp,
      'signature': signature,
    };
  }
}

class TendermintCommitResponseResultSignedHeaderCommit {
  final String height;
  final int round;
  final TendermintBlockID blockId;
  final List<TendermintCommitResponseResultSignedHeaderCommitSignatures>
  signatures;

  TendermintCommitResponseResultSignedHeaderCommit({
    required this.height,
    required this.round,
    required this.blockId,
    required this.signatures,
  });

  factory TendermintCommitResponseResultSignedHeaderCommit.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintCommitResponseResultSignedHeaderCommit(
      height: json.valueAsString<String>('height', normalizeKeyLookup: true),
      round: json.valueAsInt<int>('round', normalizeKeyLookup: true),
      blockId: json.valueTo<TendermintBlockID, Map<String, dynamic>>(
        key: 'block_id',
        parse: (v) => TendermintBlockID.fromJson(v),
        normalizeKeyLookup: true,
      ),
      signatures: json.valueTo<
        List<TendermintCommitResponseResultSignedHeaderCommitSignatures>,
        List
      >(
        key: 'signatures',
        parse:
            (v) =>
                v
                    .map(
                      (e) =>
                          TendermintCommitResponseResultSignedHeaderCommitSignatures.fromJson(
                            Map<String, dynamic>.from(e),
                          ),
                    )
                    .toList(),
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'height': height,
      'round': round,
      'block_id': blockId.toJson(),
      'signatures': signatures.map((e) => e.toJson()).toList(),
    };
  }
}

class TendermintCommitResponseResultSignedHeader {
  final TendermintBlockHeader header;
  final TendermintCommitResponseResultSignedHeaderCommit commit;

  TendermintCommitResponseResultSignedHeader({
    required this.header,
    required this.commit,
  });

  factory TendermintCommitResponseResultSignedHeader.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintCommitResponseResultSignedHeader(
      header: json.valueTo<TendermintBlockHeader, Map<String, dynamic>>(
        key: 'header',
        parse: (v) => TendermintBlockHeader.fromJson(v),
        normalizeKeyLookup: true,
      ),
      commit: json.valueTo<
        TendermintCommitResponseResultSignedHeaderCommit,
        Map<String, dynamic>
      >(
        key: 'commit',
        parse:
            (v) => TendermintCommitResponseResultSignedHeaderCommit.fromJson(v),
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {'header': header.toJson(), 'commit': commit.toJson()};
  }
}

class TendermintCommitResponseResult {
  final TendermintCommitResponseResultSignedHeader signedHeader;
  final bool canonical;

  TendermintCommitResponseResult({
    required this.signedHeader,
    required this.canonical,
  });

  factory TendermintCommitResponseResult.fromJson(Map<String, dynamic> json) {
    return TendermintCommitResponseResult(
      signedHeader: json.valueTo<
        TendermintCommitResponseResultSignedHeader,
        Map<String, dynamic>
      >(
        key: 'signed_header',
        parse: (v) => TendermintCommitResponseResultSignedHeader.fromJson(v),
        normalizeKeyLookup: true,
      ),
      canonical: json.valueAsBool<bool>('canonical', normalizeKeyLookup: true),
    );
  }

  Map<String, dynamic> toJson() {
    return {'signed_header': signedHeader.toJson(), 'canonical': canonical};
  }
}

class TendermintValidatorsResponseResult {
  final String blockHeight;
  final List<TendermintValidatorPriority> validators;
  final String? count;
  final String? total;

  TendermintValidatorsResponseResult({
    required this.blockHeight,
    required this.validators,
    this.count,
    this.total,
  });

  factory TendermintValidatorsResponseResult.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintValidatorsResponseResult(
      blockHeight: json.valueAsString<String>(
        'block_height',
        normalizeKeyLookup: true,
      ),
      validators: json.valueTo<List<TendermintValidatorPriority>, List>(
        key: 'validators',
        parse:
            (v) =>
                v
                    .map(
                      (e) => TendermintValidatorPriority.fromJson(
                        Map<String, dynamic>.from(e),
                      ),
                    )
                    .toList(),
        normalizeKeyLookup: true,
      ),
      count: json.valueAsString<String?>('count', normalizeKeyLookup: true),
      total: json.valueAsString<String?>('total', normalizeKeyLookup: true),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'block_height': blockHeight,
      'validators': validators.map((e) => e.toJson()).toList(),
      'count': count,
      'total': total,
    };
  }
}

class TendermintGenesisResponseResultGenesisValidatorsPubKey {
  final String type;
  final String value;

  TendermintGenesisResponseResultGenesisValidatorsPubKey({
    required this.type,
    required this.value,
  });

  factory TendermintGenesisResponseResultGenesisValidatorsPubKey.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintGenesisResponseResultGenesisValidatorsPubKey(
      type: json.valueAsString<String>('type', normalizeKeyLookup: true),
      value: json.valueAsString<String>('value', normalizeKeyLookup: true),
    );
  }

  Map<String, dynamic> toJson() {
    return {'type': type, 'value': value};
  }
}

class TendermintGenesisResponseResultGenesisValidators {
  final String? address;
  final TendermintGenesisResponseResultGenesisValidatorsPubKey? pubKey;
  final String? power;
  final String? name;

  TendermintGenesisResponseResultGenesisValidators({
    this.address,
    this.pubKey,
    this.power,
    this.name,
  });

  factory TendermintGenesisResponseResultGenesisValidators.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintGenesisResponseResultGenesisValidators(
      address: json.valueAsString<String?>('address', normalizeKeyLookup: true),
      pubKey: json.valueTo<
        TendermintGenesisResponseResultGenesisValidatorsPubKey?,
        Map<String, dynamic>
      >(
        key: 'pub_key',
        parse:
            (v) =>
                TendermintGenesisResponseResultGenesisValidatorsPubKey.fromJson(
                  v,
                ),
        normalizeKeyLookup: true,
      ),
      power: json.valueAsString<String?>('power', normalizeKeyLookup: true),
      name: json.valueAsString<String?>('name', normalizeKeyLookup: true),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'pub_key': pubKey?.toJson(),
      'power': power,
      'name': name,
    };
  }
}

class TendermintGenesisResponseResultGenesis {
  final String genesisTime;
  final String chainId;
  final String initialHeight;
  final TendermintConsensusParams consensusParams;
  final List<TendermintGenesisResponseResultGenesisValidators> validators;
  final String appHash;
  final Map<String, dynamic>? appState;

  TendermintGenesisResponseResultGenesis({
    required this.genesisTime,
    required this.chainId,
    required this.initialHeight,
    required this.consensusParams,
    required this.validators,
    required this.appHash,
    this.appState,
  });

  factory TendermintGenesisResponseResultGenesis.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintGenesisResponseResultGenesis(
      genesisTime: json.valueAsString<String>(
        'genesis_time',
        normalizeKeyLookup: true,
      ),
      chainId: json.valueAsString<String>('chain_id', normalizeKeyLookup: true),
      initialHeight: json.valueAsString<String>(
        'initial_height',
        normalizeKeyLookup: true,
      ),
      consensusParams: json
          .valueTo<TendermintConsensusParams, Map<String, dynamic>>(
            key: 'consensus_params',
            parse: (v) => TendermintConsensusParams.fromJson(v),
            normalizeKeyLookup: true,
          ),
      validators: json.valueTo<
        List<TendermintGenesisResponseResultGenesisValidators>,
        List
      >(
        key: 'validators',
        parse:
            (v) =>
                v
                    .map(
                      (e) =>
                          TendermintGenesisResponseResultGenesisValidators.fromJson(
                            Map<String, dynamic>.from(e),
                          ),
                    )
                    .toList(),
        normalizeKeyLookup: true,
      ),
      appHash: json.valueAsString<String>('app_hash', normalizeKeyLookup: true),
      appState: json.valueAsMap<Map<String, dynamic>?>(
        'app_state',
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'genesis_time': genesisTime,
      'chain_id': chainId,
      'initial_height': initialHeight,
      'consensus_params': consensusParams.toJson(),
      'validators': validators.map((e) => e.toJson()).toList(),
      'app_hash': appHash,
      'app_state': appState,
    };
  }
}

class TendermintGenesisResponseResult {
  final TendermintGenesisResponseResultGenesis genesis;

  TendermintGenesisResponseResult({required this.genesis});

  factory TendermintGenesisResponseResult.fromJson(Map<String, dynamic> json) {
    return TendermintGenesisResponseResult(
      genesis: json.valueTo<
        TendermintGenesisResponseResultGenesis,
        Map<String, dynamic>
      >(
        key: 'genesis',
        parse: (v) => TendermintGenesisResponseResultGenesis.fromJson(v),
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {'genesis': genesis.toJson()};
  }
}

class TendermintGenesisChunkedResponseResult {
  final int chunk;
  final int total;
  final String data;

  TendermintGenesisChunkedResponseResult({
    required this.chunk,
    required this.total,
    required this.data,
  });

  factory TendermintGenesisChunkedResponseResult.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintGenesisChunkedResponseResult(
      chunk: json.valueAsInt<int>('chunk', normalizeKeyLookup: true),
      total: json.valueAsInt<int>('total', normalizeKeyLookup: true),
      data: json.valueAsString<String>('data', normalizeKeyLookup: true),
    );
  }

  Map<String, dynamic> toJson() {
    return {'chunk': chunk, 'total': total, 'data': data};
  }
}

class TendermintDumpConsensusResponseResultPeersPeerStateRoundStateProposalBlockPartsHeader {
  final int total;
  final String hash;

  TendermintDumpConsensusResponseResultPeersPeerStateRoundStateProposalBlockPartsHeader({
    required this.total,
    required this.hash,
  });

  factory TendermintDumpConsensusResponseResultPeersPeerStateRoundStateProposalBlockPartsHeader.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintDumpConsensusResponseResultPeersPeerStateRoundStateProposalBlockPartsHeader(
      total: json.valueAsInt<int>('total', normalizeKeyLookup: true),
      hash: json.valueAsString<String>('hash', normalizeKeyLookup: true),
    );
  }

  Map<String, dynamic> toJson() {
    return {'total': total, 'hash': hash};
  }
}

class TendermintDumpConsensusResponseResultPeersPeerStateRoundState {
  final String height;
  final String round;
  final int step;
  final String startTime;
  final bool proposal;
  final TendermintDumpConsensusResponseResultPeersPeerStateRoundStateProposalBlockPartsHeader
  proposalBlockPartsHeader;
  final int? proposalPolRound;
  final String? proposalPol;
  final String? prevotes;
  final String? precommits;
  final int? lastCommitRound;
  final String? lastCommit;
  final int? catchupCommitRound;
  final String? catchupCommit;

  TendermintDumpConsensusResponseResultPeersPeerStateRoundState({
    required this.height,
    required this.round,
    required this.step,
    required this.startTime,
    required this.proposal,
    required this.proposalBlockPartsHeader,
    this.proposalPolRound,
    this.proposalPol,
    this.prevotes,
    this.precommits,
    this.lastCommitRound,
    this.lastCommit,
    this.catchupCommitRound,
    this.catchupCommit,
  });

  factory TendermintDumpConsensusResponseResultPeersPeerStateRoundState.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintDumpConsensusResponseResultPeersPeerStateRoundState(
      height: json.valueAsString<String>('height', normalizeKeyLookup: true),
      round: json.valueAsString<String>('round', normalizeKeyLookup: true),
      step: json.valueAsInt<int>('step', normalizeKeyLookup: true),
      startTime: json.valueAsString<String>(
        'start_time',
        normalizeKeyLookup: true,
      ),
      proposal: json.valueAsBool<bool>('proposal', normalizeKeyLookup: true),
      proposalBlockPartsHeader: json.valueTo<
        TendermintDumpConsensusResponseResultPeersPeerStateRoundStateProposalBlockPartsHeader,
        Map<String, dynamic>
      >(
        key: 'proposal_block_parts_header',
        parse:
            (v) =>
                TendermintDumpConsensusResponseResultPeersPeerStateRoundStateProposalBlockPartsHeader.fromJson(
                  v,
                ),
        normalizeKeyLookup: true,
      ),
      proposalPolRound: json.valueAsInt<int?>(
        'proposal_pol_round',
        normalizeKeyLookup: true,
      ),
      proposalPol: json.valueAsString<String?>(
        'proposal_pol',
        normalizeKeyLookup: true,
      ),
      prevotes: json.valueAsString<String?>(
        'prevotes',
        normalizeKeyLookup: true,
      ),
      precommits: json.valueAsString<String?>(
        'precommits',
        normalizeKeyLookup: true,
      ),
      lastCommitRound: json.valueAsInt<int?>(
        'last_commit_round',
        normalizeKeyLookup: true,
      ),
      lastCommit: json.valueAsString<String?>(
        'last_commit',
        normalizeKeyLookup: true,
      ),
      catchupCommitRound: json.valueAsInt<int?>(
        'catchup_commit_round',
        normalizeKeyLookup: true,
      ),
      catchupCommit: json.valueAsString<String?>(
        'catchup_commit',
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'height': height,
      'round': round,
      'step': step,
      'start_time': startTime,
      'proposal': proposal,
      'proposal_block_parts_header': proposalBlockPartsHeader.toJson(),
      'proposal_pol_round': proposalPolRound,
      'proposal_pol': proposalPol,
      'prevotes': prevotes,
      'precommits': precommits,
      'last_commit_round': lastCommitRound,
      'last_commit': lastCommit,
      'catchup_commit_round': catchupCommitRound,
      'catchup_commit': catchupCommit,
    };
  }
}

class TendermintDumpConsensusResponseResultPeersPeerStateStats {
  final String votes;
  final String blockParts;

  TendermintDumpConsensusResponseResultPeersPeerStateStats({
    required this.votes,
    required this.blockParts,
  });

  factory TendermintDumpConsensusResponseResultPeersPeerStateStats.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintDumpConsensusResponseResultPeersPeerStateStats(
      votes: json.valueAsString<String>('votes', normalizeKeyLookup: true),
      blockParts: json.valueAsString<String>(
        'block_parts',
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {'votes': votes, 'block_parts': blockParts};
  }
}

class TendermintDumpConsensusResponseResultPeers {
  final String? nodeAddress;
  final Map<String, dynamic>? peerState;

  TendermintDumpConsensusResponseResultPeers({
    this.nodeAddress,
    this.peerState,
  });

  factory TendermintDumpConsensusResponseResultPeers.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintDumpConsensusResponseResultPeers(
      nodeAddress: json.valueAsString<String?>(
        'node_address',
        normalizeKeyLookup: true,
      ),
      peerState: json.valueAsMap<Map<String, dynamic>?>("peer_state"),
    );
  }

  Map<String, dynamic> toJson() {
    return {'node_address': nodeAddress, 'peer_state': peerState};
  }
}

class TendermintDumpConsensusResponseResult {
  final Map<String, dynamic> roundState;
  final List<TendermintDumpConsensusResponseResultPeers> peers;

  TendermintDumpConsensusResponseResult({
    required this.roundState,
    required this.peers,
  });

  factory TendermintDumpConsensusResponseResult.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintDumpConsensusResponseResult(
      roundState: json.valueEnsureAsMap<String, dynamic>(
        "round_state",
        normalizeKeyLookup: true,
      ),
      peers: json.valueTo<
        List<TendermintDumpConsensusResponseResultPeers>,
        List
      >(
        key: 'peers',
        parse:
            (v) =>
                v
                    .map(
                      (e) =>
                          TendermintDumpConsensusResponseResultPeers.fromJson(
                            Map<String, dynamic>.from(e),
                          ),
                    )
                    .toList(),
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'round_state': roundState,
      'peers': peers.map((e) => e.toJson()).toList(),
    };
  }
}

class TendermintConsensusStateResponseResultRoundStateHeightVoteSet {
  final int? round;
  final List<String>? prevotes;
  final String? prevotesBitArray;
  final List<String>? precommits;
  final String? precommitsBitArray;

  TendermintConsensusStateResponseResultRoundStateHeightVoteSet({
    this.round,
    this.prevotes,
    this.prevotesBitArray,
    this.precommits,
    this.precommitsBitArray,
  });

  factory TendermintConsensusStateResponseResultRoundStateHeightVoteSet.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintConsensusStateResponseResultRoundStateHeightVoteSet(
      round: json.valueAsInt<int?>('round', normalizeKeyLookup: true),
      prevotes: json.valueAsList<List<String>?>(
        'prevotes',
        normalizeKeyLookup: true,
      ),
      prevotesBitArray: json.valueAsString<String?>(
        'prevotes_bit_array',
        normalizeKeyLookup: true,
      ),
      precommits: json.valueAsList<List<String>?>(
        'precommits',
        normalizeKeyLookup: true,
      ),
      precommitsBitArray: json.valueAsString<String?>(
        'precommits_bit_array',
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'round': round,
      'prevotes': prevotes,
      'prevotes_bit_array': prevotesBitArray,
      'precommits': precommits,
      'precommits_bit_array': precommitsBitArray,
    };
  }
}

class TendermintConsensusStateResponseResultRoundStateProposer {
  final String? address;
  final int? index;

  TendermintConsensusStateResponseResultRoundStateProposer({
    this.address,
    this.index,
  });

  factory TendermintConsensusStateResponseResultRoundStateProposer.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintConsensusStateResponseResultRoundStateProposer(
      address: json.valueAsString<String?>('address', normalizeKeyLookup: true),
      index: json.valueAsInt<int?>('index', normalizeKeyLookup: true),
    );
  }

  Map<String, dynamic> toJson() {
    return {'address': address, 'index': index};
  }
}

class TendermintConsensusStateResponseResultRoundState {
  final String heightRoundStep;
  final String startTime;
  final String proposalBlockHash;
  final String lockedBlockHash;
  final String validBlockHash;
  final List<TendermintConsensusStateResponseResultRoundStateHeightVoteSet>
  heightVoteSet;
  final TendermintConsensusStateResponseResultRoundStateProposer proposer;

  TendermintConsensusStateResponseResultRoundState({
    required this.heightRoundStep,
    required this.startTime,
    required this.proposalBlockHash,
    required this.lockedBlockHash,
    required this.validBlockHash,
    required this.heightVoteSet,
    required this.proposer,
  });

  factory TendermintConsensusStateResponseResultRoundState.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintConsensusStateResponseResultRoundState(
      heightRoundStep: json.valueAsString<String>(
        'height/round/step',
        normalizeKeyLookup: true,
      ),
      startTime: json.valueAsString<String>(
        'start_time',
        normalizeKeyLookup: true,
      ),
      proposalBlockHash: json.valueAsString<String>(
        'proposal_block_hash',
        normalizeKeyLookup: true,
      ),
      lockedBlockHash: json.valueAsString<String>(
        'locked_block_hash',
        normalizeKeyLookup: true,
      ),
      validBlockHash: json.valueAsString<String>(
        'valid_block_hash',
        normalizeKeyLookup: true,
      ),
      heightVoteSet: json.valueTo<
        List<TendermintConsensusStateResponseResultRoundStateHeightVoteSet>,
        List
      >(
        key: 'height_vote_set',
        parse:
            (v) =>
                v
                    .map(
                      (e) =>
                          TendermintConsensusStateResponseResultRoundStateHeightVoteSet.fromJson(
                            Map<String, dynamic>.from(e),
                          ),
                    )
                    .toList(),
        normalizeKeyLookup: true,
      ),
      proposer: json.valueTo<
        TendermintConsensusStateResponseResultRoundStateProposer,
        Map<String, dynamic>
      >(
        key: 'proposer',
        parse:
            (v) =>
                TendermintConsensusStateResponseResultRoundStateProposer.fromJson(
                  v,
                ),
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'height/round/step': heightRoundStep,
      'start_time': startTime,
      'proposal_block_hash': proposalBlockHash,
      'locked_block_hash': lockedBlockHash,
      'valid_block_hash': validBlockHash,
      'height_vote_set': heightVoteSet.map((e) => e.toJson()).toList(),
      'proposer': proposer.toJson(),
    };
  }
}

class TendermintConsensusStateResponseResult {
  final TendermintConsensusStateResponseResultRoundState roundState;

  TendermintConsensusStateResponseResult({required this.roundState});

  factory TendermintConsensusStateResponseResult.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintConsensusStateResponseResult(
      roundState: json.valueTo<
        TendermintConsensusStateResponseResultRoundState,
        Map<String, dynamic>
      >(
        key: 'round_state',
        parse:
            (v) => TendermintConsensusStateResponseResultRoundState.fromJson(v),
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {'round_state': roundState.toJson()};
  }
}

class TendermintConsensusParamsResponseResult {
  final String blockHeight;
  final TendermintConsensusParams consensusParams;

  TendermintConsensusParamsResponseResult({
    required this.blockHeight,
    required this.consensusParams,
  });

  factory TendermintConsensusParamsResponseResult.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintConsensusParamsResponseResult(
      blockHeight: json.valueAsString<String>(
        'block_height',
        normalizeKeyLookup: true,
      ),
      consensusParams: json
          .valueTo<TendermintConsensusParams, Map<String, dynamic>>(
            key: 'consensus_params',
            parse: (v) => TendermintConsensusParams.fromJson(v),
            normalizeKeyLookup: true,
          ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'block_height': blockHeight,
      'consensus_params': consensusParams.toJson(),
    };
  }
}

class TendermintNumUnconfirmedTransactionsResponseResult {
  final String nTxs;
  final String total;
  final String totalBytes;

  TendermintNumUnconfirmedTransactionsResponseResult({
    required this.nTxs,
    required this.total,
    required this.totalBytes,
  });

  factory TendermintNumUnconfirmedTransactionsResponseResult.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintNumUnconfirmedTransactionsResponseResult(
      nTxs: json.valueAsString<String>('n_txs', normalizeKeyLookup: true),
      total: json.valueAsString<String>('total', normalizeKeyLookup: true),
      totalBytes: json.valueAsString<String>(
        'total_bytes',
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {'n_txs': nTxs, 'total': total, 'total_bytes': totalBytes};
  }
}

class TendermintUnconfirmedTransactionsResponseResult {
  final String nTxs;
  final String total;
  final String totalBytes;
  final List<String>? txs;

  TendermintUnconfirmedTransactionsResponseResult({
    required this.nTxs,
    required this.total,
    required this.totalBytes,
    this.txs,
  });

  factory TendermintUnconfirmedTransactionsResponseResult.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintUnconfirmedTransactionsResponseResult(
      nTxs: json.valueAsString<String>('n_txs', normalizeKeyLookup: true),
      total: json.valueAsString<String>('total', normalizeKeyLookup: true),
      totalBytes: json.valueAsString<String>(
        'total_bytes',
        normalizeKeyLookup: true,
      ),
      txs: json.valueAsList<List<String>?>('txs', normalizeKeyLookup: true),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'n_txs': nTxs,
      'total': total,
      'total_bytes': totalBytes,
      'txs': txs,
    };
  }
}

// class TendermintTxSearchResponseResultTxsTxResult {
//   final String log;
//   final String gasWanted;
//   final String gasUsed;
//   final TendermintEvent tags;

//   TendermintTxSearchResponseResultTxsTxResult({
//     required this.log,
//     required this.gasWanted,
//     required this.gasUsed,
//     required this.tags,
//   });

//   factory TendermintTxSearchResponseResultTxsTxResult.fromJson(
//     Map<String, dynamic> json,
//   ) {
//     return TendermintTxSearchResponseResultTxsTxResult(
//       log: json.valueAsString<String>('log', normalizeKeyLookup: true),
//       gasWanted: json.valueAsString<String>('gas_wanted', normalizeKeyLookup: true),
//       gasUsed: json.valueAsString<String>('gas_used', normalizeKeyLookup: true),
//       tags: json.valueTo<TendermintEvent, Map<String, dynamic>>(
//         key: 'tags',
//         parse: (v) => TendermintEvent.fromJson(v),
//         normalizeKeyLookup: true
//       ),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'log': log,
//       'gas_wanted': gasWanted,
//       'gas_used': gasUsed,
//       'tags': tags.toJson(),
//     };
//   }
// }

class TendermintTxSearchResponseResultTxsProofProof {
  final String total;
  final String index;
  final String leafHash;
  final List<String> aunts;

  TendermintTxSearchResponseResultTxsProofProof({
    required this.total,
    required this.index,
    required this.leafHash,
    required this.aunts,
  });

  factory TendermintTxSearchResponseResultTxsProofProof.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintTxSearchResponseResultTxsProofProof(
      total: json.valueAsString<String>('total', normalizeKeyLookup: true),
      index: json.valueAsString<String>('index', normalizeKeyLookup: true),
      leafHash: json.valueAsString<String>(
        'leaf_hash',
        normalizeKeyLookup: true,
      ),
      aunts: json.valueAsList<List<String>>('aunts', normalizeKeyLookup: true),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'index': index,
      'leaf_hash': leafHash,
      'aunts': aunts,
    };
  }
}

class TendermintTxSearchResponseResultTxsProof {
  final String rootHash;
  final String data;
  final TendermintTxSearchResponseResultTxsProofProof proof;

  TendermintTxSearchResponseResultTxsProof({
    required this.rootHash,
    required this.data,
    required this.proof,
  });

  factory TendermintTxSearchResponseResultTxsProof.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintTxSearchResponseResultTxsProof(
      rootHash: json.valueAsString<String>(
        'RootHash',
        normalizeKeyLookup: true,
      ),
      data: json.valueAsString<String>('Data', normalizeKeyLookup: true),
      proof: json.valueTo<
        TendermintTxSearchResponseResultTxsProofProof,
        Map<String, dynamic>
      >(
        key: 'Proof',
        parse: (v) => TendermintTxSearchResponseResultTxsProofProof.fromJson(v),
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {'RootHash': rootHash, 'Data': data, 'Proof': proof.toJson()};
  }
}

class TendermintTxSearchResponseResultTxs {
  final String? hash;
  final String? height;
  final int? index;
  final TendermintCheckTxResponseResult? txResult;
  final String? tx;
  final TendermintTxSearchResponseResultTxsProof? proof;

  TendermintTxSearchResponseResultTxs({
    this.hash,
    this.height,
    this.index,
    this.txResult,
    this.tx,
    this.proof,
  });

  factory TendermintTxSearchResponseResultTxs.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintTxSearchResponseResultTxs(
      hash: json.valueAsString<String?>('hash', normalizeKeyLookup: true),
      height: json.valueAsString<String?>('height', normalizeKeyLookup: true),
      index: json.valueAsInt<int?>('index', normalizeKeyLookup: true),
      txResult: json
          .valueTo<TendermintCheckTxResponseResult?, Map<String, dynamic>>(
            key: 'tx_result',
            parse: (v) => TendermintCheckTxResponseResult.fromJson(v),
            normalizeKeyLookup: true,
          ),
      tx: json.valueAsString<String?>('tx', normalizeKeyLookup: true),
      proof: json.valueTo<
        TendermintTxSearchResponseResultTxsProof?,
        Map<String, dynamic>
      >(
        key: 'proof',
        parse: (v) => TendermintTxSearchResponseResultTxsProof.fromJson(v),
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hash': hash,
      'height': height,
      'index': index,
      'tx_result': txResult?.toJson(),
      'tx': tx,
      'proof': proof?.toJson(),
    };
  }
}

class TendermintTxSearchResponseResult {
  final List<TendermintTxSearchResponseResultTxs> txs;
  final String totalCount;

  TendermintTxSearchResponseResult({
    required this.txs,
    required this.totalCount,
  });

  factory TendermintTxSearchResponseResult.fromJson(Map<String, dynamic> json) {
    return TendermintTxSearchResponseResult(
      txs: json.valueTo<List<TendermintTxSearchResponseResultTxs>, List>(
        key: 'txs',
        parse:
            (v) =>
                v
                    .map(
                      (e) => TendermintTxSearchResponseResultTxs.fromJson(
                        Map<String, dynamic>.from(e),
                      ),
                    )
                    .toList(),
        normalizeKeyLookup: true,
      ),
      totalCount: json.valueAsString<String>(
        'total_count',
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'txs': txs.map((e) => e.toJson()).toList(),
      'total_count': totalCount,
    };
  }
}

// class TendermintTxResponseResultTxResult {
//   final String log;
//   final String gasWanted;
//   final String gasUsed;
//   final List<TendermintEvent> tags;

//   TendermintTxResponseResultTxResult({
//     required this.log,
//     required this.gasWanted,
//     required this.gasUsed,
//     required this.tags,
//   });

//   factory TendermintTxResponseResultTxResult.fromJson(Map<String, dynamic> json) {
//     return TendermintTxResponseResultTxResult(
//       log: json.valueAsString<String>('log', normalizeKeyLookup: true),
//       gasWanted: json.valueAsString<String>('gas_wanted', normalizeKeyLookup: true),
//       gasUsed: json.valueAsString<String>('gas_used', normalizeKeyLookup: true),
//       tags: json.valueTo<List<TendermintEvent>, List>(
//         key: 'tags',
//         parse:
//             (v) =>
//                 v
//                     .map((e) => TendermintEvent.fromJson(Map<String, dynamic>.from(e)))
//                     .toList(),
//         normalizeKeyLookup: true
//       ),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'log': log,
//       'gas_wanted': gasWanted,
//       'gas_used': gasUsed,
//       'tags': tags.map((e) => e.toJson()).toList(),
//     };
//   }
// }

class TendermintTxResponseResult {
  final String hash;
  final String height;
  final int index;
  final TendermintCheckTxResponseResult txResult;
  final String tx;

  TendermintTxResponseResult({
    required this.hash,
    required this.height,
    required this.index,
    required this.txResult,
    required this.tx,
  });

  factory TendermintTxResponseResult.fromJson(Map<String, dynamic> json) {
    return TendermintTxResponseResult(
      hash: json.valueAsString<String>('hash', normalizeKeyLookup: true),
      height: json.valueAsString<String>('height', normalizeKeyLookup: true),
      index: json.valueAsInt<int>('index', normalizeKeyLookup: true),
      txResult: json
          .valueTo<TendermintCheckTxResponseResult, Map<String, dynamic>>(
            key: 'tx_result',
            parse: (v) => TendermintCheckTxResponseResult.fromJson(v),
            normalizeKeyLookup: true,
          ),
      tx: json.valueAsString<String>('tx', normalizeKeyLookup: true),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hash': hash,
      'height': height,
      'index': index,
      'tx_result': txResult.toJson(),
      'tx': tx,
    };
  }
}

class TendermintABCIInfoResponseResultResponse {
  final String data;
  final String version;
  final String appVersion;
  final String lastBlockHeight;
  final String lastBlockAppHash;

  TendermintABCIInfoResponseResultResponse({
    required this.data,
    required this.version,
    required this.appVersion,
    required this.lastBlockHeight,
    required this.lastBlockAppHash,
  });

  factory TendermintABCIInfoResponseResultResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintABCIInfoResponseResultResponse(
      data: json.valueAsString<String>('data', normalizeKeyLookup: true),
      version: json.valueAsString<String>('version', normalizeKeyLookup: true),
      appVersion: json.valueAsString<String>(
        'app_version',
        normalizeKeyLookup: true,
      ),
      lastBlockHeight: json.valueAsString<String>(
        'last_block_height',
        normalizeKeyLookup: true,
      ),
      lastBlockAppHash: json.valueAsString<String>(
        'last_block_app_hash',
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'version': version,
      'app_version': appVersion,
      'last_block_height': lastBlockHeight,
      'last_block_app_hash': lastBlockAppHash,
    };
  }
}

class TendermintABCIInfoResponseResult {
  final TendermintABCIInfoResponseResultResponse response;

  TendermintABCIInfoResponseResult({required this.response});

  factory TendermintABCIInfoResponseResult.fromJson(Map<String, dynamic> json) {
    return TendermintABCIInfoResponseResult(
      response: json.valueTo<
        TendermintABCIInfoResponseResultResponse,
        Map<String, dynamic>
      >(
        key: 'response',
        parse: (v) => TendermintABCIInfoResponseResultResponse.fromJson(v),
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {'response': response.toJson()};
  }
}

class TendermintABCIQueryResponseResultResponse {
  final String log;
  final String height;
  final String? proof;
  final String? value;
  final String? key;
  final int? index;
  final int? code;

  TendermintABCIQueryResponseResultResponse({
    required this.log,
    required this.height,
    required this.proof,
    required this.value,
    required this.key,
    required this.index,
    required this.code,
  });

  factory TendermintABCIQueryResponseResultResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintABCIQueryResponseResultResponse(
      log: json.valueAsString<String>('log', normalizeKeyLookup: true),
      height: json.valueAsString<String>('height', normalizeKeyLookup: true),
      proof: json.valueAsString<String?>('proof', normalizeKeyLookup: true),
      value: json.valueAsString<String?>('value', normalizeKeyLookup: true),
      key: json.valueAsString<String?>('key', normalizeKeyLookup: true),
      index: json.valueAsInt<int?>('index', normalizeKeyLookup: true),
      code: json.valueAsInt<int?>('code', normalizeKeyLookup: true),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'log': log,
      'height': height,
      'proof': proof,
      'value': value,
      'key': key,
      'index': index,
      'code': code,
    };
  }
}

class TendermintABCIQueryResponseResult {
  final TendermintABCIQueryResponseResultResponse response;

  TendermintABCIQueryResponseResult({required this.response});

  factory TendermintABCIQueryResponseResult.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintABCIQueryResponseResult(
      response: json.valueTo<
        TendermintABCIQueryResponseResultResponse,
        Map<String, dynamic>
      >(
        key: 'response',
        parse: (v) => TendermintABCIQueryResponseResultResponse.fromJson(v),
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {'response': response.toJson()};
  }
}

class TendermintBroadcastTxCommitResponseResultDeliverTx {
  final String log;
  final String? data;
  final int code;

  TendermintBroadcastTxCommitResponseResultDeliverTx({
    required this.log,
    required this.data,
    required this.code,
  });

  factory TendermintBroadcastTxCommitResponseResultDeliverTx.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintBroadcastTxCommitResponseResultDeliverTx(
      log: json.valueAsString<String>('log', normalizeKeyLookup: true),
      data: json.valueAsString<String?>('data', normalizeKeyLookup: true),
      code: json.valueAsInt<int>('code', normalizeKeyLookup: true),
    );
  }

  Map<String, dynamic> toJson() {
    return {'log': log, 'data': data, 'code': code};
  }
}

class TendermintBroadcastTxCommitResponseResultCheckTx {
  final String? log;
  final String? data;
  final int code;

  TendermintBroadcastTxCommitResponseResultCheckTx({
    required this.log,
    required this.data,
    required this.code,
  });

  factory TendermintBroadcastTxCommitResponseResultCheckTx.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintBroadcastTxCommitResponseResultCheckTx(
      log: json.valueAsString<String?>('log', normalizeKeyLookup: true),
      data: json.valueAsString<String?>('data', normalizeKeyLookup: true),
      code: json.valueAsInt<int>('code', normalizeKeyLookup: true),
    );
  }

  Map<String, dynamic> toJson() {
    return {'log': log, 'data': data, 'code': code};
  }
}

class TendermintBroadcastTxCommitResponseResult {
  final String height;
  final String hash;
  final TendermintBroadcastTxCommitResponseResultDeliverTx? deliverTx;
  final TendermintCheckTxResponseResult? txResult;
  final TendermintBroadcastTxCommitResponseResultCheckTx checkTx;

  TendermintBroadcastTxCommitResponseResult({
    required this.height,
    required this.hash,
    required this.deliverTx,
    required this.checkTx,
    required this.txResult,
  });

  factory TendermintBroadcastTxCommitResponseResult.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintBroadcastTxCommitResponseResult(
      height: json.valueAsString<String>('height', normalizeKeyLookup: true),
      hash: json.valueAsString<String>('hash', normalizeKeyLookup: true),
      deliverTx: json.valueTo<
        TendermintBroadcastTxCommitResponseResultDeliverTx?,
        Map<String, dynamic>
      >(
        key: 'deliver_tx',
        parse:
            (v) =>
                TendermintBroadcastTxCommitResponseResultDeliverTx.fromJson(v),
        normalizeKeyLookup: true,
      ),
      txResult: json
          .valueTo<TendermintCheckTxResponseResult?, Map<String, dynamic>>(
            key: 'tx_result',
            parse: (v) => TendermintCheckTxResponseResult.fromJson(v),
            normalizeKeyLookup: true,
          ),
      checkTx: json.valueTo<
        TendermintBroadcastTxCommitResponseResultCheckTx,
        Map<String, dynamic>
      >(
        key: 'check_tx',
        parse:
            (v) => TendermintBroadcastTxCommitResponseResultCheckTx.fromJson(v),
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'height': height,
      'hash': hash,
      'deliver_tx': deliverTx?.toJson(),
      'check_tx': checkTx.toJson(),
      "tx_result": txResult?.toJson(),
    };
  }
}

class TendermintCheckTxResponseResultEvents {
  final String? type;
  final List<TendermintEvent>? attributes;

  TendermintCheckTxResponseResultEvents({this.type, this.attributes});

  factory TendermintCheckTxResponseResultEvents.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintCheckTxResponseResultEvents(
      type: json.valueAsString<String?>('type', normalizeKeyLookup: true),
      attributes: json.valueTo<List<TendermintEvent>?, List>(
        key: 'attributes',
        parse:
            (v) =>
                v
                    .map(
                      (e) => TendermintEvent.fromJson(
                        Map<String, dynamic>.from(e),
                      ),
                    )
                    .toList(),
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'attributes': attributes?.map((e) => e.toJson()).toList(),
    };
  }
}

class TendermintCheckTxResponseResult {
  final int code;
  final String? data;
  final String log;
  final String? info;
  final String? gasWanted;
  final String? gasUsed;
  final List<TendermintCheckTxResponseResultEvents>? events;
  final String? codespace;

  TendermintCheckTxResponseResult({
    required this.code,
    required this.data,
    required this.log,
    this.info,
    this.gasWanted,
    this.gasUsed,
    this.events,
    this.codespace,
  });

  factory TendermintCheckTxResponseResult.fromJson(Map<String, dynamic> json) {
    return TendermintCheckTxResponseResult(
      code: json.valueAsInt<int>('code', normalizeKeyLookup: true),
      data: json.valueAsString<String?>('data', normalizeKeyLookup: true),
      log: json.valueAsString<String>('log', normalizeKeyLookup: true),
      info: json.valueAsString<String?>('info', normalizeKeyLookup: true),
      gasWanted: json.valueAsString<String?>(
        'gas_wanted',
        normalizeKeyLookup: true,
      ),
      gasUsed: json.valueAsString<String?>(
        'gas_used',
        normalizeKeyLookup: true,
      ),
      events: json.valueTo<List<TendermintCheckTxResponseResultEvents>?, List>(
        key: 'events',
        parse:
            (v) =>
                v
                    .map(
                      (e) => TendermintCheckTxResponseResultEvents.fromJson(
                        Map<String, dynamic>.from(e),
                      ),
                    )
                    .toList(),
        normalizeKeyLookup: true,
      ),
      codespace: json.valueAsString<String?>(
        'codespace',
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'data': data,
      'log': log,
      'info': info,
      'gas_wanted': gasWanted,
      'gas_used': gasUsed,
      'events': events?.map((e) => e.toJson()).toList(),
      'codespace': codespace,
    };
  }
}

class TendermintBroadcastTxResponseResult {
  final int code;
  final String? data;
  final String log;
  final String? codespace;
  final String hash;

  TendermintBroadcastTxResponseResult({
    required this.code,
    required this.data,
    required this.log,
    this.codespace,
    required this.hash,
  });

  factory TendermintBroadcastTxResponseResult.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintBroadcastTxResponseResult(
      code: json.valueAsInt<int>('code', normalizeKeyLookup: true),
      data: json.valueAsString<String?>('data', normalizeKeyLookup: true),
      log: json.valueAsString<String>('log', normalizeKeyLookup: true),
      codespace: json.valueAsString<String?>(
        'codespace',
        normalizeKeyLookup: true,
      ),
      hash: json.valueAsString<String>('hash', normalizeKeyLookup: true),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'data': data,
      'log': log,
      'codespace': codespace,
      'hash': hash,
    };
  }
}

class TendermintdialResp {
  final String? log;

  TendermintdialResp({this.log});

  factory TendermintdialResp.fromJson(Map<String, dynamic> json) {
    return TendermintdialResp(
      log: json.valueAsString<String?>('Log', normalizeKeyLookup: true),
    );
  }

  Map<String, dynamic> toJson() {
    return {'Log': log};
  }
}

class TendermintBlockSearchResponseResult {
  final List<TendermintBlockComplete> blocks;
  final int totalCount;

  TendermintBlockSearchResponseResult({
    required this.blocks,
    required this.totalCount,
  });

  factory TendermintBlockSearchResponseResult.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintBlockSearchResponseResult(
      blocks: json.valueTo<List<TendermintBlockComplete>, List>(
        key: 'blocks',
        parse:
            (v) =>
                v
                    .map(
                      (e) => TendermintBlockComplete.fromJson(
                        Map<String, dynamic>.from(e),
                      ),
                    )
                    .toList(),
        normalizeKeyLookup: true,
      ),
      totalCount: json.valueAsInt<int>('total_count', normalizeKeyLookup: true),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'blocks': blocks.map((e) => e.toJson()).toList(),
      'total_count': totalCount,
    };
  }
}

class TendermintValidatorPriorityPubKey {
  final String type;
  final String value;

  TendermintValidatorPriorityPubKey({required this.type, required this.value});

  factory TendermintValidatorPriorityPubKey.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintValidatorPriorityPubKey(
      type: json.valueAsString<String>('type', normalizeKeyLookup: true),
      value: json.valueAsString<String>('value', normalizeKeyLookup: true),
    );
  }

  Map<String, dynamic> toJson() {
    return {'type': type, 'value': value};
  }
}

class TendermintValidatorPriority {
  final String? address;
  final TendermintValidatorPriorityPubKey? pubKey;
  final String? votingPower;
  final String? proposerPriority;

  TendermintValidatorPriority({
    this.address,
    this.pubKey,
    this.votingPower,
    this.proposerPriority,
  });

  factory TendermintValidatorPriority.fromJson(Map<String, dynamic> json) {
    return TendermintValidatorPriority(
      address: json.valueAsString<String?>('address', normalizeKeyLookup: true),
      pubKey: json
          .valueTo<TendermintValidatorPriorityPubKey?, Map<String, dynamic>>(
            key: 'pub_key',
            parse: (v) => TendermintValidatorPriorityPubKey.fromJson(v),
            normalizeKeyLookup: true,
          ),
      votingPower: json.valueAsString<String?>(
        'voting_power',
        normalizeKeyLookup: true,
      ),
      proposerPriority: json.valueAsString<String?>(
        'proposer_priority',
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'pub_key': pubKey?.toJson(),
      'voting_power': votingPower,
      'proposer_priority': proposerPriority,
    };
  }
}

class TendermintValidator {
  final TendermintPubKey? pubKey;
  final int? votingPower;
  final String? address;

  TendermintValidator({this.pubKey, this.votingPower, this.address});

  factory TendermintValidator.fromJson(Map<String, dynamic> json) {
    return TendermintValidator(
      pubKey: json.valueTo<TendermintPubKey?, Map<String, dynamic>>(
        key: 'pub_key',
        parse: (v) => TendermintPubKey.fromJson(v),
        normalizeKeyLookup: true,
      ),
      votingPower: json.valueAsInt<int?>(
        'voting_power',
        normalizeKeyLookup: true,
      ),
      address: json.valueAsString<String?>('address', normalizeKeyLookup: true),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pub_key': pubKey?.toJson(),
      'voting_power': votingPower,
      'address': address,
    };
  }
}

class TendermintConsensusParamsBlock {
  final String? maxBytes;
  final String? maxGas;
  final String? timeIotaMs;

  TendermintConsensusParamsBlock({
    required this.maxBytes,
    required this.maxGas,
    required this.timeIotaMs,
  });

  factory TendermintConsensusParamsBlock.fromJson(Map<String, dynamic> json) {
    return TendermintConsensusParamsBlock(
      maxBytes: json.valueAsString<String?>(
        'max_bytes',
        normalizeKeyLookup: true,
      ),
      maxGas: json.valueAsString<String?>('max_gas', normalizeKeyLookup: true),
      timeIotaMs: json.valueAsString<String?>(
        'time_iota_ms',
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'max_bytes': maxBytes,
      'max_gas': maxGas,
      'time_iota_ms': timeIotaMs,
    };
  }
}

class TendermintConsensusParamsEvidence {
  final String? maxAge;

  TendermintConsensusParamsEvidence({required this.maxAge});

  factory TendermintConsensusParamsEvidence.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintConsensusParamsEvidence(
      maxAge: json.valueAsString<String?>('max_age', normalizeKeyLookup: true),
    );
  }

  Map<String, dynamic> toJson() {
    return {'max_age': maxAge};
  }
}

class TendermintConsensusParamsValidator {
  final List<String> pubKeyTypes;

  TendermintConsensusParamsValidator({required this.pubKeyTypes});

  factory TendermintConsensusParamsValidator.fromJson(
    Map<String, dynamic> json,
  ) {
    return TendermintConsensusParamsValidator(
      pubKeyTypes: json.valueAsList<List<String>>(
        'pub_key_types',
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {'pub_key_types': pubKeyTypes};
  }
}

class TendermintConsensusParams {
  final TendermintConsensusParamsBlock block;
  final TendermintConsensusParamsEvidence evidence;
  final TendermintConsensusParamsValidator validator;

  TendermintConsensusParams({
    required this.block,
    required this.evidence,
    required this.validator,
  });

  factory TendermintConsensusParams.fromJson(Map<String, dynamic> json) {
    return TendermintConsensusParams(
      block: json.valueTo<TendermintConsensusParamsBlock, Map<String, dynamic>>(
        key: 'block',
        parse: (v) => TendermintConsensusParamsBlock.fromJson(v),
        normalizeKeyLookup: true,
      ),
      evidence: json
          .valueTo<TendermintConsensusParamsEvidence, Map<String, dynamic>>(
            key: 'evidence',
            parse: (v) => TendermintConsensusParamsEvidence.fromJson(v),
            normalizeKeyLookup: true,
          ),
      validator: json
          .valueTo<TendermintConsensusParamsValidator, Map<String, dynamic>>(
            key: 'validator',
            parse: (v) => TendermintConsensusParamsValidator.fromJson(v),
            normalizeKeyLookup: true,
          ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'block': block.toJson(),
      'evidence': evidence.toJson(),
      'validator': validator.toJson(),
    };
  }
}

class TendermintEvent {
  final String? key;
  final String? value;
  final bool? index;

  TendermintEvent({this.key, this.value, this.index});

  factory TendermintEvent.fromJson(Map<String, dynamic> json) {
    return TendermintEvent(
      key: json.valueAsString<String?>('key', normalizeKeyLookup: true),
      value: json.valueAsString<String?>('value', normalizeKeyLookup: true),
      index: json.valueAsBool<bool?>('index', normalizeKeyLookup: true),
    );
  }

  Map<String, dynamic> toJson() {
    return {'key': key, 'value': value, 'index': index};
  }
}

class TendermintBlockHeaderVersion {
  final String block;
  final String? app;

  TendermintBlockHeaderVersion({required this.block, required this.app});

  factory TendermintBlockHeaderVersion.fromJson(Map<String, dynamic> json) {
    return TendermintBlockHeaderVersion(
      block: json.valueAsString<String>('block', normalizeKeyLookup: true),
      app: json.valueAsString<String?>('app', normalizeKeyLookup: true),
    );
  }

  Map<String, dynamic> toJson() {
    return {'block': block, 'app': app};
  }
}

class TendermintBlockHeader {
  final TendermintBlockHeaderVersion version;
  final String chainId;
  final String height;
  final String time;
  final TendermintBlockID lastBlockId;
  final String lastCommitHash;
  final String dataHash;
  final String validatorsHash;
  final String nextValidatorsHash;
  final String consensusHash;
  final String appHash;
  final String lastResultsHash;
  final String evidenceHash;
  final String proposerAddress;

  TendermintBlockHeader({
    required this.version,
    required this.chainId,
    required this.height,
    required this.time,
    required this.lastBlockId,
    required this.lastCommitHash,
    required this.dataHash,
    required this.validatorsHash,
    required this.nextValidatorsHash,
    required this.consensusHash,
    required this.appHash,
    required this.lastResultsHash,
    required this.evidenceHash,
    required this.proposerAddress,
  });

  factory TendermintBlockHeader.fromJson(Map<String, dynamic> json) {
    return TendermintBlockHeader(
      version: json.valueTo<TendermintBlockHeaderVersion, Map<String, dynamic>>(
        key: 'version',
        parse: (v) => TendermintBlockHeaderVersion.fromJson(v),
        normalizeKeyLookup: true,
      ),
      chainId: json.valueAsString<String>('chain_id', normalizeKeyLookup: true),
      height: json.valueAsString<String>('height', normalizeKeyLookup: true),
      time: json.valueAsString<String>('time', normalizeKeyLookup: true),
      lastBlockId: json.valueTo<TendermintBlockID, Map<String, dynamic>>(
        key: 'last_block_id',
        parse: (v) => TendermintBlockID.fromJson(v),
        normalizeKeyLookup: true,
      ),
      lastCommitHash: json.valueAsString<String>(
        'last_commit_hash',
        normalizeKeyLookup: true,
      ),
      dataHash: json.valueAsString<String>(
        'data_hash',
        normalizeKeyLookup: true,
      ),
      validatorsHash: json.valueAsString<String>(
        'validators_hash',
        normalizeKeyLookup: true,
      ),
      nextValidatorsHash: json.valueAsString<String>(
        'next_validators_hash',
        normalizeKeyLookup: true,
      ),
      consensusHash: json.valueAsString<String>(
        'consensus_hash',
        normalizeKeyLookup: true,
      ),
      appHash: json.valueAsString<String>('app_hash', normalizeKeyLookup: true),
      lastResultsHash: json.valueAsString<String>(
        'last_results_hash',
        normalizeKeyLookup: true,
      ),
      evidenceHash: json.valueAsString<String>(
        'evidence_hash',
        normalizeKeyLookup: true,
      ),
      proposerAddress: json.valueAsString<String>(
        'proposer_address',
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'version': version.toJson(),
      'chain_id': chainId,
      'height': height,
      'time': time,
      'last_block_id': lastBlockId.toJson(),
      'last_commit_hash': lastCommitHash,
      'data_hash': dataHash,
      'validators_hash': validatorsHash,
      'next_validators_hash': nextValidatorsHash,
      'consensus_hash': consensusHash,
      'app_hash': appHash,
      'last_results_hash': lastResultsHash,
      'evidence_hash': evidenceHash,
      'proposer_address': proposerAddress,
    };
  }
}

class TendermintBlockIDParts {
  final int total;
  final String hash;

  TendermintBlockIDParts({required this.total, required this.hash});

  factory TendermintBlockIDParts.fromJson(Map<String, dynamic> json) {
    return TendermintBlockIDParts(
      total: json.valueAsInt<int>('total', normalizeKeyLookup: true),
      hash: json.valueAsString<String>('hash', normalizeKeyLookup: true),
    );
  }

  Map<String, dynamic> toJson() {
    return {'total': total, 'hash': hash};
  }
}

class TendermintBlockID {
  final String hash;
  final TendermintBlockIDParts parts;

  TendermintBlockID({required this.hash, required this.parts});

  factory TendermintBlockID.fromJson(Map<String, dynamic> json) {
    return TendermintBlockID(
      hash: json.valueAsString<String>('hash', normalizeKeyLookup: true),
      parts: json.valueTo<TendermintBlockIDParts, Map<String, dynamic>>(
        key: 'parts',
        parse: (v) => TendermintBlockIDParts.fromJson(v),
        normalizeKeyLookup: true,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {'hash': hash, 'parts': parts.toJson()};
  }
}

class TendermintRequestOrderingResponse {
  const TendermintRequestOrderingResponse._(this.name);
  final String name;
  static const TendermintRequestOrderingResponse asc =
      TendermintRequestOrderingResponse._("asc");
  static const TendermintRequestOrderingResponse desc =
      TendermintRequestOrderingResponse._("desc");
}
