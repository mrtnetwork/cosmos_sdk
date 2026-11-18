import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class ProtocolVersion extends CosmosProtoMessage {
  final BigInt? p2p;

  final BigInt? block;

  final BigInt? app;

  const ProtocolVersion({this.p2p, this.block, this.app});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.uint64(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [p2p, block, app];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'p2p': config.encodeBigint(p2p),
      'block': config.encodeBigint(block),
      'app': config.encodeBigint(app),
    };
  }

  factory ProtocolVersion.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ProtocolVersion(
      p2p: json.valueAsBigInt<BigInt?>(
        'p2p',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      block: json.valueAsBigInt<BigInt?>(
        'block',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      app: json.valueAsBigInt<BigInt?>(
        'app',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory ProtocolVersion.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ProtocolVersion(
      p2p: decode.getBigInt<BigInt?>(1),
      block: decode.getBigInt<BigInt?>(2),
      app: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintP2pProtocolVersion;
}

class DefaultNodeInfo extends CosmosProtoMessage {
  final ProtocolVersion? protocolVersion;

  final String? defaultNodeId;

  final String? listenAddr;

  final String? network;

  final String? version;

  final BuBytes? channels;

  final String? moniker;

  final DefaultNodeInfoOther? other;

  DefaultNodeInfo({
    this.protocolVersion,
    this.defaultNodeId,
    this.listenAddr,
    this.network,
    this.version,
    List<int>? channels,
    this.moniker,
    this.other,
  }) : channels = channels?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.bytes(6),
        ProtoFieldConfig.string(7),
        ProtoFieldConfig.message(8, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    protocolVersion,
    defaultNodeId,
    listenAddr,
    network,
    version,
    channels,
    moniker,
    other,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'protocol_version': config.encodeMessage(protocolVersion),
      'default_node_id': defaultNodeId,
      'listen_addr': listenAddr,
      'network': network,
      'version': version,
      'channels': config.encodeBinary(channels),
      'moniker': moniker,
      'other': config.encodeMessage(other),
    };
  }

  factory DefaultNodeInfo.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return DefaultNodeInfo(
      protocolVersion: json.valueTo<ProtocolVersion?, Object>(
        key: 'protocol_version',
        parse:
            (v) =>
                ProtocolVersion.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      defaultNodeId: json.valueAsString<String?>(
        'default_node_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      listenAddr: json.valueAsString<String?>(
        'listen_addr',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      network: json.valueAsString<String?>(
        'network',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      version: json.valueAsString<String?>(
        'version',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      channels: config.decodeBinary<List<int>?>(
        json.valueAs('channels', normalizeKeyLookup: config.normalizeKeys),
      ),
      moniker: json.valueAsString<String?>(
        'moniker',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      other: json.valueTo<DefaultNodeInfoOther?, Object>(
        key: 'other',
        parse:
            (v) => DefaultNodeInfoOther.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory DefaultNodeInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DefaultNodeInfo(
      protocolVersion: decode.messageTo<ProtocolVersion?>(
        1,
        (b) => ProtocolVersion.deserialize(b),
      ),
      defaultNodeId: decode.getString<String?>(2),
      listenAddr: decode.getString<String?>(3),
      network: decode.getString<String?>(4),
      version: decode.getString<String?>(5),
      channels: decode.getBytes<List<int>?>(6),
      moniker: decode.getString<String?>(7),
      other: decode.messageTo<DefaultNodeInfoOther?>(
        8,
        (b) => DefaultNodeInfoOther.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintP2pDefaultNodeInfo;
}

class DefaultNodeInfoOther extends CosmosProtoMessage {
  final String? txIndex;

  final String? rpcAddress;

  const DefaultNodeInfoOther({this.txIndex, this.rpcAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [txIndex, rpcAddress];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'tx_index': txIndex, 'rpc_address': rpcAddress};
  }

  factory DefaultNodeInfoOther.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return DefaultNodeInfoOther(
      txIndex: json.valueAsString<String?>(
        'tx_index',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      rpcAddress: json.valueAsString<String?>(
        'rpc_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory DefaultNodeInfoOther.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DefaultNodeInfoOther(
      txIndex: decode.getString<String?>(1),
      rpcAddress: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintP2pDefaultNodeInfoOther;
}
