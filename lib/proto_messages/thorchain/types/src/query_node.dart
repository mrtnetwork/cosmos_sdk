import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/thorchain/common/src/common.dart"
    as common_common;

class QueryNodeRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryNodeResponse> {
  final String? address;

  final String? height;

  const QueryNodeRequest({this.address, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/node/{address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [address, height];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'address': address, 'height': height};
  }

  factory QueryNodeRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryNodeRequest(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      height: json.valueAsString<String?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryNodeRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryNodeRequest(
      address: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryNodeRequest;
  @override
  QueryNodeResponse onQueryResponse(List<int> bytes) {
    return QueryNodeResponse.deserialize(bytes);
  }

  @override
  QueryNodeResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryNodeResponse.fromJson(json);
  }
}

class QueryNodeResponse extends CosmosProtoMessage {
  final String? nodeAddress;

  final String? status;

  final common_common.PubKeySet? pubKeySet;

  /// the consensus pub key for the node
  final String? validatorConsPubKey;

  /// the P2PID (:6040/p2pid endpoint) of the node
  final String? peerId;

  /// the block height at which the node became active
  final BigInt? activeBlockHeight;

  /// the block height of the current provided information for the node
  final BigInt? statusSince;

  final String? nodeOperatorAddress;

  /// current node bond
  final String? totalBond;

  final NodeBondProviders? bondProviders;

  /// the set of vault public keys of which the node is a member
  final List<String> signerMembership;

  final bool? requestedToLeave;

  /// indicates whether the node has been forced to leave by the network,
  /// typically via ban
  final bool? forcedToLeave;

  final BigInt? leaveHeight;

  /// the currently set version of the node
  final String? ipAddress;

  final String? version;

  /// the accumulated slash points, reset at churn but excessive slash points may
  /// carry over
  final BigInt? slashPoints;

  final NodeJail? jail;

  final String? currentAward;

  /// the last observed heights for all chain by the node
  final List<ChainHeight> observeChains;

  final NodePreflightStatus? preflightStatus;

  /// if the node operator has placed the node in maintenance or not
  final bool? maintenance;

  final BigInt? missingBlocks;

  const QueryNodeResponse({
    this.nodeAddress,
    this.status,
    this.pubKeySet,
    this.validatorConsPubKey,
    this.peerId,
    this.activeBlockHeight,
    this.statusSince,
    this.nodeOperatorAddress,
    this.totalBond,
    this.bondProviders,
    this.signerMembership = const [],
    this.requestedToLeave,
    this.forcedToLeave,
    this.leaveHeight,
    this.ipAddress,
    this.version,
    this.slashPoints,
    this.jail,
    this.currentAward,
    this.observeChains = const [],
    this.preflightStatus,
    this.maintenance,
    this.missingBlocks,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.int64(6, options: const []),
        ProtoFieldConfig.int64(7, options: const []),
        ProtoFieldConfig.string(8, options: const []),
        ProtoFieldConfig.string(9, options: const []),
        ProtoFieldConfig.message(10, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 11,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
        ProtoFieldConfig.bool(12, options: const []),
        ProtoFieldConfig.bool(13, options: const []),
        ProtoFieldConfig.int64(14, options: const []),
        ProtoFieldConfig.string(15, options: const []),
        ProtoFieldConfig.string(16, options: const []),
        ProtoFieldConfig.int64(17, options: const []),
        ProtoFieldConfig.message(18, options: const []),
        ProtoFieldConfig.string(19, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 20,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.message(21, options: const []),
        ProtoFieldConfig.bool(22, options: const []),
        ProtoFieldConfig.int64(23, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    nodeAddress,
    status,
    pubKeySet,
    validatorConsPubKey,
    peerId,
    activeBlockHeight,
    statusSince,
    nodeOperatorAddress,
    totalBond,
    bondProviders,
    signerMembership,
    requestedToLeave,
    forcedToLeave,
    leaveHeight,
    ipAddress,
    version,
    slashPoints,
    jail,
    currentAward,
    observeChains,
    preflightStatus,
    maintenance,
    missingBlocks,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'node_address': nodeAddress,
      'status': status,
      'pub_key_set': config.encodeMessage(pubKeySet),
      'validator_cons_pub_key': validatorConsPubKey,
      'peer_id': peerId,
      'active_block_height': config.encodeBigint(activeBlockHeight),
      'status_since': config.encodeBigint(statusSince),
      'node_operator_address': nodeOperatorAddress,
      'total_bond': totalBond,
      'bond_providers': config.encodeMessage(bondProviders),
      'signer_membership': signerMembership.map((e) => e).toList(),
      'requested_to_leave': requestedToLeave,
      'forced_to_leave': forcedToLeave,
      'leave_height': config.encodeBigint(leaveHeight),
      'ip_address': ipAddress,
      'version': version,
      'slash_points': config.encodeBigint(slashPoints),
      'jail': config.encodeMessage(jail),
      'current_award': currentAward,
      'observe_chains':
          observeChains.map((e) => config.encodeMessage(e)).toList(),
      'preflight_status': config.encodeMessage(preflightStatus),
      'maintenance': maintenance,
      'missing_blocks': config.encodeBigint(missingBlocks),
    };
  }

  factory QueryNodeResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryNodeResponse(
      nodeAddress: json.valueAsString<String?>(
        'node_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      status: json.valueAsString<String?>(
        'status',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      pubKeySet: json.valueTo<common_common.PubKeySet?, Object>(
        key: 'pub_key_set',
        parse:
            (v) => common_common.PubKeySet.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      validatorConsPubKey: json.valueAsString<String?>(
        'validator_cons_pub_key',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      peerId: json.valueAsString<String?>(
        'peer_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      activeBlockHeight: json.valueAsBigInt<BigInt?>(
        'active_block_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      statusSince: json.valueAsBigInt<BigInt?>(
        'status_since',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      nodeOperatorAddress: json.valueAsString<String?>(
        'node_operator_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      totalBond: json.valueAsString<String?>(
        'total_bond',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      bondProviders: json.valueTo<NodeBondProviders?, Object>(
        key: 'bond_providers',
        parse:
            (v) => NodeBondProviders.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      signerMembership:
          (json.valueEnsureAsList<dynamic>(
            'signer_membership',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      requestedToLeave: json.valueAsBool<bool?>(
        'requested_to_leave',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      forcedToLeave: json.valueAsBool<bool?>(
        'forced_to_leave',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      leaveHeight: json.valueAsBigInt<BigInt?>(
        'leave_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      ipAddress: json.valueAsString<String?>(
        'ip_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      version: json.valueAsString<String?>(
        'version',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      slashPoints: json.valueAsBigInt<BigInt?>(
        'slash_points',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      jail: json.valueTo<NodeJail?, Object>(
        key: 'jail',
        parse: (v) => NodeJail.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      currentAward: json.valueAsString<String?>(
        'current_award',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      observeChains:
          (json.valueEnsureAsList<dynamic>(
                'observe_chains',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<ChainHeight, Object>(
                  value: e,
                  parse:
                      (v) => ChainHeight.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      preflightStatus: json.valueTo<NodePreflightStatus?, Object>(
        key: 'preflight_status',
        parse:
            (v) => NodePreflightStatus.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      maintenance: json.valueAsBool<bool?>(
        'maintenance',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      missingBlocks: json.valueAsBigInt<BigInt?>(
        'missing_blocks',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryNodeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryNodeResponse(
      nodeAddress: decode.getString<String?>(1),
      status: decode.getString<String?>(2),
      pubKeySet: decode.messageTo<common_common.PubKeySet?>(
        3,
        (b) => common_common.PubKeySet.deserialize(b),
      ),
      validatorConsPubKey: decode.getString<String?>(4),
      peerId: decode.getString<String?>(5),
      activeBlockHeight: decode.getBigInt<BigInt?>(6),
      statusSince: decode.getBigInt<BigInt?>(7),
      nodeOperatorAddress: decode.getString<String?>(8),
      totalBond: decode.getString<String?>(9),
      bondProviders: decode.messageTo<NodeBondProviders?>(
        10,
        (b) => NodeBondProviders.deserialize(b),
      ),
      signerMembership: decode.getListOrEmpty<String>(11),
      requestedToLeave: decode.getBool<bool?>(12),
      forcedToLeave: decode.getBool<bool?>(13),
      leaveHeight: decode.getBigInt<BigInt?>(14),
      ipAddress: decode.getString<String?>(15),
      version: decode.getString<String?>(16),
      slashPoints: decode.getBigInt<BigInt?>(17),
      jail: decode.messageTo<NodeJail?>(18, (b) => NodeJail.deserialize(b)),
      currentAward: decode.getString<String?>(19),
      observeChains:
          decode
              .getListOfBytes(20)
              .map((b) => ChainHeight.deserialize(b))
              .toList(),
      preflightStatus: decode.messageTo<NodePreflightStatus?>(
        21,
        (b) => NodePreflightStatus.deserialize(b),
      ),
      maintenance: decode.getBool<bool?>(22),
      missingBlocks: decode.getBigInt<BigInt?>(23),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryNodeResponse;
}

class QueryNodesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryNodesResponse> {
  final String? height;

  const QueryNodesRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/nodes",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [height];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'height': height};
  }

  factory QueryNodesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryNodesRequest(
      height: json.valueAsString<String?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryNodesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryNodesRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryNodesRequest;
  @override
  QueryNodesResponse onQueryResponse(List<int> bytes) {
    return QueryNodesResponse.deserialize(bytes);
  }

  @override
  QueryNodesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryNodesResponse.fromJson(json);
  }
}

class QueryNodesResponse extends CosmosProtoMessage {
  final List<QueryNodeResponse> nodes;

  const QueryNodesResponse({this.nodes = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [nodes];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'nodes': nodes.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QueryNodesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryNodesResponse(
      nodes:
          (json.valueEnsureAsList<dynamic>(
                'nodes',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<QueryNodeResponse, Object>(
                  value: e,
                  parse:
                      (v) => QueryNodeResponse.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryNodesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryNodesResponse(
      nodes:
          decode
              .getListOfBytes(1)
              .map((b) => QueryNodeResponse.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryNodesResponse;
}

class NodeBondProviders extends CosmosProtoMessage {
  final String? nodeOperatorFee;

  final List<NodeBondProvider> providers;

  const NodeBondProviders({this.nodeOperatorFee, this.providers = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [nodeOperatorFee, providers];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'node_operator_fee': nodeOperatorFee,
      'providers': providers.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory NodeBondProviders.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return NodeBondProviders(
      nodeOperatorFee: json.valueAsString<String?>(
        'node_operator_fee',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      providers:
          (json.valueEnsureAsList<dynamic>(
                'providers',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<NodeBondProvider, Object>(
                  value: e,
                  parse:
                      (v) => NodeBondProvider.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory NodeBondProviders.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return NodeBondProviders(
      nodeOperatorFee: decode.getString<String?>(1),
      providers:
          decode
              .getListOfBytes(2)
              .map((b) => NodeBondProvider.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesNodeBondProviders;
}

class NodeBondProvider extends CosmosProtoMessage {
  final String? bondAddress;

  final String? bond;

  const NodeBondProvider({this.bondAddress, this.bond});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [bondAddress, bond];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'bond_address': bondAddress, 'bond': bond};
  }

  factory NodeBondProvider.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return NodeBondProvider(
      bondAddress: json.valueAsString<String?>(
        'bond_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      bond: json.valueAsString<String?>(
        'bond',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory NodeBondProvider.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return NodeBondProvider(
      bondAddress: decode.getString<String?>(1),
      bond: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesNodeBondProvider;
}

class NodeJail extends CosmosProtoMessage {
  final BigInt? releaseHeight;

  final String? reason;

  const NodeJail({this.releaseHeight, this.reason});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.int64(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [releaseHeight, reason];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'release_height': config.encodeBigint(releaseHeight),
      'reason': reason,
    };
  }

  factory NodeJail.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return NodeJail(
      releaseHeight: json.valueAsBigInt<BigInt?>(
        'release_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      reason: json.valueAsString<String?>(
        'reason',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory NodeJail.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return NodeJail(
      releaseHeight: decode.getBigInt<BigInt?>(1),
      reason: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesNodeJail;
}

class ChainHeight extends CosmosProtoMessage {
  final String? chain;

  final BigInt? height;

  const ChainHeight({this.chain, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.int64(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [chain, height];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'chain': chain, 'height': config.encodeBigint(height)};
  }

  factory ChainHeight.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ChainHeight(
      chain: json.valueAsString<String?>(
        'chain',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      height: json.valueAsBigInt<BigInt?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory ChainHeight.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ChainHeight(
      chain: decode.getString<String?>(1),
      height: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesChainHeight;
}

class NodePreflightStatus extends CosmosProtoMessage {
  /// the next status of the node
  final String? status;

  /// the reason for the transition to the next status
  final String? reason;

  final BigInt? code;

  const NodePreflightStatus({this.status, this.reason, this.code});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.int64(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [status, reason, code];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'status': status,
      'reason': reason,
      'code': config.encodeBigint(code),
    };
  }

  factory NodePreflightStatus.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return NodePreflightStatus(
      status: json.valueAsString<String?>(
        'status',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      reason: json.valueAsString<String?>(
        'reason',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      code: json.valueAsBigInt<BigInt?>(
        'code',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory NodePreflightStatus.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return NodePreflightStatus(
      status: decode.getString<String?>(1),
      reason: decode.getString<String?>(2),
      code: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesNodePreflightStatus;
}
