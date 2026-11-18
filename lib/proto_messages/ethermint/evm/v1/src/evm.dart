import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// AccessType defines the types of permissions for the operations
enum AccessType implements ProtoEnumVariant {
  /// ACCESS_TYPE_PERMISSIONLESS does not restrict the operation to anyone
  accessTypePermissionless(0, 'ACCESS_TYPE_PERMISSIONLESS'),

  /// ACCESS_TYPE_RESTRICTED restrict the operation to anyone
  accessTypeRestricted(1, 'ACCESS_TYPE_RESTRICTED'),

  /// ACCESS_TYPE_PERMISSIONED only allows the operation for specific addresses
  accessTypePermissioned(2, 'ACCESS_TYPE_PERMISSIONED');

  const AccessType(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static AccessType fromValue(int? value) {
    value ??= 0;
    return AccessType.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching AccessType found for the given value. $value",
                details: {"name": "AccessType", "value": value?.toString()},
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static AccessType from(Object? value) {
    value ??= 0;
    return AccessType.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching AccessType found for the given value. $value",
                details: {"name": "AccessType", "value": value?.toString()},
              ),
    );
  }
}

/// Copyright Tharsis Labs Ltd.(Evmos)
/// SPDX-License-Identifier:ENCL-1.0(https://github.com/evmos/evmos/blob/main/LICENSE)
/// Params defines the EVM module parameters
class Params extends CosmosProtoMessage {
  /// enable_create and enable call have been deprecated
  /// extra_eips defines the additional EIPs for the vm.Config
  final List<String> extraEips;

  /// allow_unprotected_txs defines if replay-protected (i.e non EIP155
  /// signed) transactions can be executed on the state machine.
  final bool? allowUnprotectedTxs;

  /// renamed active_precompiles to active_static_precompiles
  /// evm_channels is the list of channel identifiers from EVM compatible chains
  final List<String> evmChannels;

  /// access_control defines the permission policy of the EVM
  final AccessControl? accessControl;

  /// active_static_precompiles defines the slice of hex addresses of the precompiled
  /// contracts that are active
  final List<String> activeStaticPrecompiles;

  const Params({
    this.extraEips = const [],
    this.allowUnprotectedTxs,
    this.evmChannels = const [],
    this.accessControl,
    this.activeStaticPrecompiles = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "evmos/x/evm/Params"),
      ],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
        ProtoFieldConfig.bool(6),
        ProtoFieldConfig.repeated(
          fieldNumber: 8,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
        ProtoFieldConfig.message(9, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 10,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    extraEips,
    allowUnprotectedTxs,
    evmChannels,
    accessControl,
    activeStaticPrecompiles,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'extra_eips': extraEips.map((e) => e).toList(),
      'allow_unprotected_txs': allowUnprotectedTxs,
      'evm_channels': evmChannels.map((e) => e).toList(),
      'access_control': config.encodeMessage(accessControl),
      'active_static_precompiles':
          activeStaticPrecompiles.map((e) => e).toList(),
    };
  }

  factory Params.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Params(
      extraEips:
          (json.valueEnsureAsList<dynamic>(
            'extra_eips',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      allowUnprotectedTxs: json.valueAsBool<bool?>(
        'allow_unprotected_txs',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      evmChannels:
          (json.valueEnsureAsList<dynamic>(
            'evm_channels',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      accessControl: json.valueTo<AccessControl?, Object>(
        key: 'access_control',
        parse:
            (v) =>
                AccessControl.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      activeStaticPrecompiles:
          (json.valueEnsureAsList<dynamic>(
            'active_static_precompiles',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      extraEips: decode.getListOrEmpty<String>(4),
      allowUnprotectedTxs: decode.getBool<bool?>(6),
      evmChannels: decode.getListOrEmpty<String>(8),
      accessControl: decode.messageTo<AccessControl?>(
        9,
        (b) => AccessControl.deserialize(b),
      ),
      activeStaticPrecompiles: decode.getListOrEmpty<String>(10),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ethermintEvmV1Params;
}

/// AccessControl defines the permission policy of the EVM
/// for creating and calling contracts
class AccessControl extends CosmosProtoMessage {
  /// create defines the permission policy for creating contracts
  final AccessControlType? create;

  /// call defines the permission policy for calling contracts
  final AccessControlType? call;

  const AccessControl({this.create, this.call});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [create, call];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'create': config.encodeMessage(create),
      'call': config.encodeMessage(call),
    };
  }

  factory AccessControl.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return AccessControl(
      create: json.valueTo<AccessControlType?, Object>(
        key: 'create',
        parse:
            (v) => AccessControlType.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      call: json.valueTo<AccessControlType?, Object>(
        key: 'call',
        parse:
            (v) => AccessControlType.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory AccessControl.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AccessControl(
      create: decode.messageTo<AccessControlType?>(
        1,
        (b) => AccessControlType.deserialize(b),
      ),
      call: decode.messageTo<AccessControlType?>(
        2,
        (b) => AccessControlType.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ethermintEvmV1AccessControl;
}

/// AccessControlType defines the permission type for policies
class AccessControlType extends CosmosProtoMessage {
  /// access_type defines which type of permission is required for the operation
  final AccessType? accessType;

  /// access_control_list defines defines different things depending on the AccessType:
  /// - ACCESS_TYPE_PERMISSIONLESS: list of addresses that are blocked from performing the operation
  /// - ACCESS_TYPE_RESTRICTED: ignored
  /// - ACCESS_TYPE_PERMISSIONED: list of addresses that are allowed to perform the operation
  final List<String> accessControlList;

  const AccessControlType({this.accessType, this.accessControlList = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.enumType(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [accessType, accessControlList];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'access_type': config.encodeEnum(accessType),
      'access_control_list': accessControlList.map((e) => e).toList(),
    };
  }

  factory AccessControlType.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return AccessControlType(
      accessType: json.valueTo<AccessType?, Object?>(
        key: 'access_type',
        parse: (v) => AccessType.from(v),
      ),
      accessControlList:
          (json.valueEnsureAsList<dynamic>(
            'access_control_list',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory AccessControlType.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AccessControlType(
      accessType: decode.getEnum<AccessType?>(1, AccessType.values),
      accessControlList: decode.getListOrEmpty<String>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ethermintEvmV1AccessControlType;
}

/// ChainConfig defines the Ethereum ChainConfig parameters using *sdk.Int values
/// instead of *big.Int.
class ChainConfig extends CosmosProtoMessage {
  /// homestead_block switch (nil no fork, 0 = already homestead)
  final String? homesteadBlock;

  /// dao_fork_block corresponds to TheDAO hard-fork switch block (nil no fork)
  final String? daoForkBlock;

  /// dao_fork_support defines whether the nodes supports or opposes the DAO hard-fork
  final bool? daoForkSupport;

  /// eip150_block: EIP150 implements the Gas price changes
  /// (https://github.com/ethereum/EIPs/issues/150) EIP150 HF block (nil no fork)
  final String? eip150Block;

  /// eip150_hash: EIP150 HF hash (needed for header only clients as only gas pricing changed)
  final String? eip150Hash;

  /// eip155_block: EIP155Block HF block
  final String? eip155Block;

  /// eip158_block: EIP158 HF block
  final String? eip158Block;

  /// byzantium_block: Byzantium switch block (nil no fork, 0 = already on byzantium)
  final String? byzantiumBlock;

  /// constantinople_block: Constantinople switch block (nil no fork, 0 = already activated)
  final String? constantinopleBlock;

  /// petersburg_block: Petersburg switch block (nil same as Constantinople)
  final String? petersburgBlock;

  /// istanbul_block: Istanbul switch block (nil no fork, 0 = already on istanbul)
  final String? istanbulBlock;

  /// muir_glacier_block: Eip-2384 (bomb delay) switch block (nil no fork, 0 = already activated)
  final String? muirGlacierBlock;

  /// berlin_block: Berlin switch block (nil = no fork, 0 = already on berlin)
  final String? berlinBlock;

  /// DEPRECATED: EWASM, YOLOV3 and Catalyst block have been deprecated
  /// london_block: London switch block (nil = no fork, 0 = already on london)
  final String? londonBlock;

  /// arrow_glacier_block: Eip-4345 (bomb delay) switch block (nil = no fork, 0 = already activated)
  final String? arrowGlacierBlock;

  /// DEPRECATED: merge fork block was deprecated: https://github.com/ethereum/go-ethereum/pull/24904
  /// gray_glacier_block: EIP-5133 (bomb delay) switch block (nil = no fork, 0 = already activated)
  final String? grayGlacierBlock;

  /// merge_netsplit_block: Virtual fork after The Merge to use as a network splitter
  final String? mergeNetsplitBlock;

  /// shanghai_block switch block (nil = no fork, 0 = already on shanghai)
  final String? shanghaiBlock;

  /// cancun_block switch block (nil = no fork, 0 = already on cancun)
  final String? cancunBlock;

  /// chain_id is the id of the chain (EIP-155)
  final BigInt? chainId;

  /// denom is the denomination used on the EVM
  final String? denom;

  /// decimals is the real decimal precision of the denomination used on the EVM
  final BigInt? decimals;

  const ChainConfig({
    this.homesteadBlock,
    this.daoForkBlock,
    this.daoForkSupport,
    this.eip150Block,
    this.eip150Hash,
    this.eip155Block,
    this.eip158Block,
    this.byzantiumBlock,
    this.constantinopleBlock,
    this.petersburgBlock,
    this.istanbulBlock,
    this.muirGlacierBlock,
    this.berlinBlock,
    this.londonBlock,
    this.arrowGlacierBlock,
    this.grayGlacierBlock,
    this.mergeNetsplitBlock,
    this.shanghaiBlock,
    this.cancunBlock,
    this.chainId,
    this.denom,
    this.decimals,
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
        ProtoFieldConfig.bool(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(7, options: const []),
        ProtoFieldConfig.string(8, options: const []),
        ProtoFieldConfig.string(9, options: const []),
        ProtoFieldConfig.string(10, options: const []),
        ProtoFieldConfig.string(11, options: const []),
        ProtoFieldConfig.string(12, options: const []),
        ProtoFieldConfig.string(13, options: const []),
        ProtoFieldConfig.string(17, options: const []),
        ProtoFieldConfig.string(18, options: const []),
        ProtoFieldConfig.string(20, options: const []),
        ProtoFieldConfig.string(21, options: const []),
        ProtoFieldConfig.string(22, options: const []),
        ProtoFieldConfig.string(23, options: const []),
        ProtoFieldConfig.uint64(24),
        ProtoFieldConfig.string(25),
        ProtoFieldConfig.uint64(26),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    homesteadBlock,
    daoForkBlock,
    daoForkSupport,
    eip150Block,
    eip150Hash,
    eip155Block,
    eip158Block,
    byzantiumBlock,
    constantinopleBlock,
    petersburgBlock,
    istanbulBlock,
    muirGlacierBlock,
    berlinBlock,
    londonBlock,
    arrowGlacierBlock,
    grayGlacierBlock,
    mergeNetsplitBlock,
    shanghaiBlock,
    cancunBlock,
    chainId,
    denom,
    decimals,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'homestead_block': homesteadBlock,
      'dao_fork_block': daoForkBlock,
      'dao_fork_support': daoForkSupport,
      'eip150_block': eip150Block,
      'eip150_hash': eip150Hash,
      'eip155_block': eip155Block,
      'eip158_block': eip158Block,
      'byzantium_block': byzantiumBlock,
      'constantinople_block': constantinopleBlock,
      'petersburg_block': petersburgBlock,
      'istanbul_block': istanbulBlock,
      'muir_glacier_block': muirGlacierBlock,
      'berlin_block': berlinBlock,
      'london_block': londonBlock,
      'arrow_glacier_block': arrowGlacierBlock,
      'gray_glacier_block': grayGlacierBlock,
      'merge_netsplit_block': mergeNetsplitBlock,
      'shanghai_block': shanghaiBlock,
      'cancun_block': cancunBlock,
      'chain_id': config.encodeBigint(chainId),
      'denom': denom,
      'decimals': config.encodeBigint(decimals),
    };
  }

  factory ChainConfig.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ChainConfig(
      homesteadBlock: json.valueAsString<String?>(
        'homestead_block',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      daoForkBlock: json.valueAsString<String?>(
        'dao_fork_block',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      daoForkSupport: json.valueAsBool<bool?>(
        'dao_fork_support',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      eip150Block: json.valueAsString<String?>(
        'eip150_block',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      eip150Hash: json.valueAsString<String?>(
        'eip150_hash',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      eip155Block: json.valueAsString<String?>(
        'eip155_block',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      eip158Block: json.valueAsString<String?>(
        'eip158_block',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      byzantiumBlock: json.valueAsString<String?>(
        'byzantium_block',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      constantinopleBlock: json.valueAsString<String?>(
        'constantinople_block',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      petersburgBlock: json.valueAsString<String?>(
        'petersburg_block',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      istanbulBlock: json.valueAsString<String?>(
        'istanbul_block',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      muirGlacierBlock: json.valueAsString<String?>(
        'muir_glacier_block',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      berlinBlock: json.valueAsString<String?>(
        'berlin_block',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      londonBlock: json.valueAsString<String?>(
        'london_block',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      arrowGlacierBlock: json.valueAsString<String?>(
        'arrow_glacier_block',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      grayGlacierBlock: json.valueAsString<String?>(
        'gray_glacier_block',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      mergeNetsplitBlock: json.valueAsString<String?>(
        'merge_netsplit_block',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      shanghaiBlock: json.valueAsString<String?>(
        'shanghai_block',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      cancunBlock: json.valueAsString<String?>(
        'cancun_block',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      chainId: json.valueAsBigInt<BigInt?>(
        'chain_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      denom: json.valueAsString<String?>(
        'denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      decimals: json.valueAsBigInt<BigInt?>(
        'decimals',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory ChainConfig.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ChainConfig(
      homesteadBlock: decode.getString<String?>(1),
      daoForkBlock: decode.getString<String?>(2),
      daoForkSupport: decode.getBool<bool?>(3),
      eip150Block: decode.getString<String?>(4),
      eip150Hash: decode.getString<String?>(5),
      eip155Block: decode.getString<String?>(6),
      eip158Block: decode.getString<String?>(7),
      byzantiumBlock: decode.getString<String?>(8),
      constantinopleBlock: decode.getString<String?>(9),
      petersburgBlock: decode.getString<String?>(10),
      istanbulBlock: decode.getString<String?>(11),
      muirGlacierBlock: decode.getString<String?>(12),
      berlinBlock: decode.getString<String?>(13),
      londonBlock: decode.getString<String?>(17),
      arrowGlacierBlock: decode.getString<String?>(18),
      grayGlacierBlock: decode.getString<String?>(20),
      mergeNetsplitBlock: decode.getString<String?>(21),
      shanghaiBlock: decode.getString<String?>(22),
      cancunBlock: decode.getString<String?>(23),
      chainId: decode.getBigInt<BigInt?>(24),
      denom: decode.getString<String?>(25),
      decimals: decode.getBigInt<BigInt?>(26),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ethermintEvmV1ChainConfig;
}

/// Log represents an protobuf compatible Ethereum Log that defines a contract
/// log event. These events are generated by the LOG opcode and stored/indexed by
/// the node.
///
/// NOTE: address, topics and data are consensus fields. The rest of the fields
/// are derived, i.e. filled in by the nodes, but not secured by consensus.
class Log extends CosmosProtoMessage {
  /// address of the contract that generated the event
  final String? address;

  /// topics is a list of topics provided by the contract.
  final List<String> topics;

  /// data which is supplied by the contract, usually ABI-encoded
  final BuBytes? data;

  /// block_number of the block in which the transaction was included
  final BigInt? blockNumber;

  /// tx_hash is the transaction hash
  final String? txHash;

  /// tx_index of the transaction in the block
  final BigInt? txIndex;

  /// block_hash of the block in which the transaction was included
  final String? blockHash;

  /// index of the log in the block
  final BigInt? index;

  /// removed is true if this log was reverted due to a chain
  /// reorganisation. You must pay attention to this field if you receive logs
  /// through a filter query.
  final bool? removed;

  Log({
    this.address,
    this.topics = const [],
    List<int>? data,
    this.blockNumber,
    this.txHash,
    this.txIndex,
    this.blockHash,
    this.index,
    this.removed,
  }) : data = data?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.bytes(3),
        ProtoFieldConfig.uint64(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.uint64(6, options: const []),
        ProtoFieldConfig.string(7, options: const []),
        ProtoFieldConfig.uint64(8, options: const []),
        ProtoFieldConfig.bool(9),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    address,
    topics,
    data,
    blockNumber,
    txHash,
    txIndex,
    blockHash,
    index,
    removed,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'address': address,
      'topics': topics.map((e) => e).toList(),
      'data': config.encodeBinary(data),
      'block_number': config.encodeBigint(blockNumber),
      'tx_hash': txHash,
      'tx_index': config.encodeBigint(txIndex),
      'block_hash': blockHash,
      'index': config.encodeBigint(index),
      'removed': removed,
    };
  }

  factory Log.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Log(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      topics:
          (json.valueEnsureAsList<dynamic>(
            'topics',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      data: config.decodeBinary<List<int>?>(
        json.valueAs('data', normalizeKeyLookup: config.normalizeKeys),
      ),
      blockNumber: json.valueAsBigInt<BigInt?>(
        'block_number',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      txHash: json.valueAsString<String?>(
        'tx_hash',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      txIndex: json.valueAsBigInt<BigInt?>(
        'tx_index',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      blockHash: json.valueAsString<String?>(
        'block_hash',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      index: json.valueAsBigInt<BigInt?>(
        'index',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      removed: json.valueAsBool<bool?>(
        'removed',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Log.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Log(
      address: decode.getString<String?>(1),
      topics: decode.getListOrEmpty<String>(2),
      data: decode.getBytes<List<int>?>(3),
      blockNumber: decode.getBigInt<BigInt?>(4),
      txHash: decode.getString<String?>(5),
      txIndex: decode.getBigInt<BigInt?>(6),
      blockHash: decode.getString<String?>(7),
      index: decode.getBigInt<BigInt?>(8),
      removed: decode.getBool<bool?>(9),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ethermintEvmV1Log;
}

/// TraceConfig holds extra parameters to trace functions.
class TraceConfig extends CosmosProtoMessage {
  /// DEPRECATED: DisableMemory and DisableReturnData have been renamed to
  /// Enable*.
  /// tracer is a custom javascript tracer
  final String? tracer;

  /// timeout overrides the default timeout of 5 seconds for JavaScript-based tracing
  /// calls
  final String? timeout;

  /// reexec defines the number of blocks the tracer is willing to go back
  final BigInt? reexec;

  /// disable_stack switches stack capture
  final bool? disableStack;

  /// disable_storage switches storage capture
  final bool? disableStorage;

  /// debug can be used to print output during capture end
  final bool? debug;

  /// limit defines the maximum length of output, but zero means unlimited
  final int? limit;

  /// overrides can be used to execute a trace using future fork rules
  final ChainConfig? overrides;

  /// enable_memory switches memory capture
  final bool? enableMemory;

  /// enable_return_data switches the capture of return data
  final bool? enableReturnData;

  /// tracer_json_config configures the tracer using a JSON string
  final String? tracerJsonConfig;

  const TraceConfig({
    this.tracer,
    this.timeout,
    this.reexec,
    this.disableStack,
    this.disableStorage,
    this.debug,
    this.limit,
    this.overrides,
    this.enableMemory,
    this.enableReturnData,
    this.tracerJsonConfig,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.bool(5, options: const []),
        ProtoFieldConfig.bool(6, options: const []),
        ProtoFieldConfig.bool(8),
        ProtoFieldConfig.int32(9),
        ProtoFieldConfig.message(10),
        ProtoFieldConfig.bool(11, options: const []),
        ProtoFieldConfig.bool(12, options: const []),
        ProtoFieldConfig.string(13, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    tracer,
    timeout,
    reexec,
    disableStack,
    disableStorage,
    debug,
    limit,
    overrides,
    enableMemory,
    enableReturnData,
    tracerJsonConfig,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'tracer': tracer,
      'timeout': timeout,
      'reexec': config.encodeBigint(reexec),
      'disable_stack': disableStack,
      'disable_storage': disableStorage,
      'debug': debug,
      'limit': limit,
      'overrides': config.encodeMessage(overrides),
      'enable_memory': enableMemory,
      'enable_return_data': enableReturnData,
      'tracer_json_config': tracerJsonConfig,
    };
  }

  factory TraceConfig.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return TraceConfig(
      tracer: json.valueAsString<String?>(
        'tracer',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      timeout: json.valueAsString<String?>(
        'timeout',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      reexec: json.valueAsBigInt<BigInt?>(
        'reexec',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      disableStack: json.valueAsBool<bool?>(
        'disable_stack',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      disableStorage: json.valueAsBool<bool?>(
        'disable_storage',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      debug: json.valueAsBool<bool?>(
        'debug',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      limit: json.valueAsInt<int?>(
        'limit',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      overrides: json.valueTo<ChainConfig?, Object>(
        key: 'overrides',
        parse:
            (v) => ChainConfig.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      enableMemory: json.valueAsBool<bool?>(
        'enable_memory',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      enableReturnData: json.valueAsBool<bool?>(
        'enable_return_data',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      tracerJsonConfig: json.valueAsString<String?>(
        'tracer_json_config',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory TraceConfig.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TraceConfig(
      tracer: decode.getString<String?>(1),
      timeout: decode.getString<String?>(2),
      reexec: decode.getBigInt<BigInt?>(3),
      disableStack: decode.getBool<bool?>(5),
      disableStorage: decode.getBool<bool?>(6),
      debug: decode.getBool<bool?>(8),
      limit: decode.getInt<int?>(9),
      overrides: decode.messageTo<ChainConfig?>(
        10,
        (b) => ChainConfig.deserialize(b),
      ),
      enableMemory: decode.getBool<bool?>(11),
      enableReturnData: decode.getBool<bool?>(12),
      tracerJsonConfig: decode.getString<String?>(13),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ethermintEvmV1TraceConfig;
}
