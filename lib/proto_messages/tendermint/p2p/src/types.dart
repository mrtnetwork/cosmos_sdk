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
  Map<String, dynamic> toJson() {
    return {
      'p2p': p2p?.toString(),
      'block': block?.toString(),
      'app': app?.toString(),
    };
  }

  factory ProtocolVersion.fromJson(Map<String, dynamic> json) {
    return ProtocolVersion(
      p2p: json.valueAsBigInt<BigInt?>('p2p', acceptCamelCase: true),
      block: json.valueAsBigInt<BigInt?>('block', acceptCamelCase: true),
      app: json.valueAsBigInt<BigInt?>('app', acceptCamelCase: true),
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

  final List<int>? channels;

  final String? moniker;

  final DefaultNodeInfoOther? other;

  const DefaultNodeInfo({
    this.protocolVersion,
    this.defaultNodeId,
    this.listenAddr,
    this.network,
    this.version,
    this.channels,
    this.moniker,
    this.other,
  });

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
  Map<String, dynamic> toJson() {
    return {
      'protocol_version': protocolVersion?.toJson(),
      'default_node_id': defaultNodeId,
      'listen_addr': listenAddr,
      'network': network,
      'version': version,
      'channels': switch (channels) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'moniker': moniker,
      'other': other?.toJson(),
    };
  }

  factory DefaultNodeInfo.fromJson(Map<String, dynamic> json) {
    return DefaultNodeInfo(
      protocolVersion: json.valueTo<ProtocolVersion?, Map<String, dynamic>>(
        key: 'protocol_version',
        parse: (v) => ProtocolVersion.fromJson(v),
        acceptCamelCase: true,
      ),
      defaultNodeId: json.valueAsString<String?>(
        'default_node_id',
        acceptCamelCase: true,
      ),
      listenAddr: json.valueAsString<String?>(
        'listen_addr',
        acceptCamelCase: true,
      ),
      network: json.valueAsString<String?>('network', acceptCamelCase: true),
      version: json.valueAsString<String?>('version', acceptCamelCase: true),
      channels: json.valueAsBytes<List<int>?>(
        'channels',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      moniker: json.valueAsString<String?>('moniker', acceptCamelCase: true),
      other: json.valueTo<DefaultNodeInfoOther?, Map<String, dynamic>>(
        key: 'other',
        parse: (v) => DefaultNodeInfoOther.fromJson(v),
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'tx_index': txIndex, 'rpc_address': rpcAddress};
  }

  factory DefaultNodeInfoOther.fromJson(Map<String, dynamic> json) {
    return DefaultNodeInfoOther(
      txIndex: json.valueAsString<String?>('tx_index', acceptCamelCase: true),
      rpcAddress: json.valueAsString<String?>(
        'rpc_address',
        acceptCamelCase: true,
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
