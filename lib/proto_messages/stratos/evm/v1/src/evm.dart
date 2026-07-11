import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Params defines the EVM module parameters
class Params extends CosmosProtoMessage {
  /// evm denom represents the token denomination used to run the EVM state
  /// transitions.
  final String? evmDenom;

  /// enable create toggles state transitions that use the vm.Create function
  final bool? enableCreate;

  /// enable call toggles state transitions that use the vm.Call function
  final bool? enableCall;

  /// extra eips defines the additional EIPs for the vm.Config
  final List<BigInt> extraEips;

  /// chain config defines the EVM chain configuration parameters
  final ChainConfig? chainConfig;

  final FeeMarketParams? feeMarketParams;

  const Params({
    this.evmDenom,
    this.enableCreate,
    this.enableCall,
    this.extraEips = const [],
    this.chainConfig,
    this.feeMarketParams,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "stratos/x/evm/Params"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.bool(2, options: const []),
        ProtoFieldConfig.bool(3, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.int64,
          options: const [],
        ),
        ProtoFieldConfig.message(
          5,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.message(
          6,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    evmDenom,
    enableCreate,
    enableCall,
    extraEips,
    chainConfig,
    feeMarketParams,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'evm_denom': evmDenom,
      'enable_create': enableCreate,
      'enable_call': enableCall,
      'extra_eips': extraEips.map((e) => e.toString()).toList(),
      'chain_config': chainConfig?.toJson(),
      'fee_market_params': feeMarketParams?.toJson(),
    };
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      evmDenom: json.valueAsString<String?>('evm_denom', acceptCamelCase: true),
      enableCreate: json.valueAsBool<bool?>(
        'enable_create',
        acceptCamelCase: true,
      ),
      enableCall: json.valueAsBool<bool?>('enable_call', acceptCamelCase: true),
      extraEips:
          (json.valueEnsureAsList<dynamic>(
            'extra_eips',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
      chainConfig: json.valueTo<ChainConfig?, Map<String, dynamic>>(
        key: 'chain_config',
        parse: (v) => ChainConfig.fromJson(v),
        acceptCamelCase: true,
      ),
      feeMarketParams: json.valueTo<FeeMarketParams?, Map<String, dynamic>>(
        key: 'fee_market_params',
        parse: (v) => FeeMarketParams.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      evmDenom: decode.getString<String?>(1),
      enableCreate: decode.getBool<bool?>(2),
      enableCall: decode.getBool<bool?>(3),
      extraEips: decode.getListOrEmpty<BigInt>(4),
      chainConfig: decode.messageTo<ChainConfig?>(
        5,
        (b) => ChainConfig.deserialize(b),
      ),
      feeMarketParams: decode.messageTo<FeeMarketParams?>(
        6,
        (b) => FeeMarketParams.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosEvmV1Params;
}

/// ChainConfig defines the Ethereum ChainConfig parameters using *sdkmath.Int values
/// instead of *big.Int.
class ChainConfig extends CosmosProtoMessage {
  /// chainId identifies the current chain and is used for replay protection
  final String? chainId;

  /// Homestead switch block (nil no fork, 0 = already homestead)
  final String? homesteadBlock;

  /// TheDAO hard-fork switch block (nil no fork)
  final String? daoForkBlock;

  /// Whether the nodes supports or opposes the DAO hard-fork
  final bool? daoForkSupport;

  /// EIP150 implements the Gas price changes
  /// (https://github.com/ethereum/EIPs/issues/150) EIP150 HF block (nil no fork)
  final String? eip150Block;

  /// EIP150 HF hash (needed for header only clients as only gas pricing changed)
  final String? eip150Hash;

  /// EIP155Block HF block
  final String? eip155Block;

  /// EIP158 HF block
  final String? eip158Block;

  /// Byzantium switch block (nil no fork, 0 = already on byzantium)
  final String? byzantiumBlock;

  /// Constantinople switch block (nil no fork, 0 = already activated)
  final String? constantinopleBlock;

  /// Petersburg switch block (nil same as Constantinople)
  final String? petersburgBlock;

  /// Istanbul switch block (nil no fork, 0 = already on istanbul)
  final String? istanbulBlock;

  /// Eip-2384 (bomb delay) switch block (nil no fork, 0 = already activated)
  final String? muirGlacierBlock;

  /// Berlin switch block (nil = no fork, 0 = already on berlin)
  final String? berlinBlock;

  /// DEPRECATED: EWASM, YOLOV3 and Catalyst block have been deprecated
  /// London switch block (nil = no fork, 0 = already on london)
  final String? londonBlock;

  /// Eip-4345 (bomb delay) switch block (nil = no fork, 0 = already activated)
  final String? arrowGlacierBlock;

  /// EIP-3675 (TheMerge) switch block (nil = no fork, 0 = already in merge proceedings)
  final String? mergeForkBlock;

  const ChainConfig({
    this.chainId,
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
    this.mergeForkBlock,
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
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.bool(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(7, options: const []),
        ProtoFieldConfig.string(8, options: const []),
        ProtoFieldConfig.string(9, options: const []),
        ProtoFieldConfig.string(10, options: const []),
        ProtoFieldConfig.string(11, options: const []),
        ProtoFieldConfig.string(12, options: const []),
        ProtoFieldConfig.string(13, options: const []),
        ProtoFieldConfig.string(14, options: const []),
        ProtoFieldConfig.string(18, options: const []),
        ProtoFieldConfig.string(19, options: const []),
        ProtoFieldConfig.string(20, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    chainId,
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
    mergeForkBlock,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'chain_id': chainId,
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
      'merge_fork_block': mergeForkBlock,
    };
  }

  factory ChainConfig.fromJson(Map<String, dynamic> json) {
    return ChainConfig(
      chainId: json.valueAsString<String?>('chain_id', acceptCamelCase: true),
      homesteadBlock: json.valueAsString<String?>(
        'homestead_block',
        acceptCamelCase: true,
      ),
      daoForkBlock: json.valueAsString<String?>(
        'dao_fork_block',
        acceptCamelCase: true,
      ),
      daoForkSupport: json.valueAsBool<bool?>(
        'dao_fork_support',
        acceptCamelCase: true,
      ),
      eip150Block: json.valueAsString<String?>(
        'eip150_block',
        acceptCamelCase: true,
      ),
      eip150Hash: json.valueAsString<String?>(
        'eip150_hash',
        acceptCamelCase: true,
      ),
      eip155Block: json.valueAsString<String?>(
        'eip155_block',
        acceptCamelCase: true,
      ),
      eip158Block: json.valueAsString<String?>(
        'eip158_block',
        acceptCamelCase: true,
      ),
      byzantiumBlock: json.valueAsString<String?>(
        'byzantium_block',
        acceptCamelCase: true,
      ),
      constantinopleBlock: json.valueAsString<String?>(
        'constantinople_block',
        acceptCamelCase: true,
      ),
      petersburgBlock: json.valueAsString<String?>(
        'petersburg_block',
        acceptCamelCase: true,
      ),
      istanbulBlock: json.valueAsString<String?>(
        'istanbul_block',
        acceptCamelCase: true,
      ),
      muirGlacierBlock: json.valueAsString<String?>(
        'muir_glacier_block',
        acceptCamelCase: true,
      ),
      berlinBlock: json.valueAsString<String?>(
        'berlin_block',
        acceptCamelCase: true,
      ),
      londonBlock: json.valueAsString<String?>(
        'london_block',
        acceptCamelCase: true,
      ),
      arrowGlacierBlock: json.valueAsString<String?>(
        'arrow_glacier_block',
        acceptCamelCase: true,
      ),
      mergeForkBlock: json.valueAsString<String?>(
        'merge_fork_block',
        acceptCamelCase: true,
      ),
    );
  }

  factory ChainConfig.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ChainConfig(
      chainId: decode.getString<String?>(1),
      homesteadBlock: decode.getString<String?>(2),
      daoForkBlock: decode.getString<String?>(3),
      daoForkSupport: decode.getBool<bool?>(4),
      eip150Block: decode.getString<String?>(5),
      eip150Hash: decode.getString<String?>(6),
      eip155Block: decode.getString<String?>(7),
      eip158Block: decode.getString<String?>(8),
      byzantiumBlock: decode.getString<String?>(9),
      constantinopleBlock: decode.getString<String?>(10),
      petersburgBlock: decode.getString<String?>(11),
      istanbulBlock: decode.getString<String?>(12),
      muirGlacierBlock: decode.getString<String?>(13),
      berlinBlock: decode.getString<String?>(14),
      londonBlock: decode.getString<String?>(18),
      arrowGlacierBlock: decode.getString<String?>(19),
      mergeForkBlock: decode.getString<String?>(20),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosEvmV1ChainConfig;
}

/// Log represents an protobuf compatible Ethereum Log that defines a contract
/// log event. These events are generated by the LOG opcode and stored/indexed by
/// the node.
class Log extends CosmosProtoMessage {
  /// Consensus fields:
  /// address of the contract that generated the event
  final String? address;

  /// list of topics provided by the contract.
  final List<String> topics;

  /// supplied by the contract, usually ABI-encoded
  final List<int>? data;

  /// Derived fields. These fields are filled in by the node
  /// but not secured by consensus.
  /// block in which the transaction was included
  final BigInt? blockNumber;

  /// hash of the transaction
  final String? txHash;

  /// index of the transaction in the block
  final BigInt? txIndex;

  /// hash of the block in which the transaction was included
  final String? blockHash;

  /// index of the log in the block
  final BigInt? index;

  /// The Removed field is true if this log was reverted due to a chain
  /// reorganisation. You must pay attention to this field if you receive logs
  /// through a filter query.
  final bool? removed;

  const Log({
    this.address,
    this.topics = const [],
    this.data,
    this.blockNumber,
    this.txHash,
    this.txIndex,
    this.blockHash,
    this.index,
    this.removed,
  });

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
  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'topics': topics.map((e) => e).toList(),
      'data': switch (data) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'block_number': blockNumber?.toString(),
      'tx_hash': txHash,
      'tx_index': txIndex?.toString(),
      'block_hash': blockHash,
      'index': index?.toString(),
      'removed': removed,
    };
  }

  factory Log.fromJson(Map<String, dynamic> json) {
    return Log(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      topics:
          (json.valueEnsureAsList<dynamic>(
            'topics',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      data: json.valueAsBytes<List<int>?>(
        'data',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      blockNumber: json.valueAsBigInt<BigInt?>(
        'block_number',
        acceptCamelCase: true,
      ),
      txHash: json.valueAsString<String?>('tx_hash', acceptCamelCase: true),
      txIndex: json.valueAsBigInt<BigInt?>('tx_index', acceptCamelCase: true),
      blockHash: json.valueAsString<String?>(
        'block_hash',
        acceptCamelCase: true,
      ),
      index: json.valueAsBigInt<BigInt?>('index', acceptCamelCase: true),
      removed: json.valueAsBool<bool?>('removed', acceptCamelCase: true),
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
      DefaultCosmosProtoTypeUrl.stratosEvmV1Log;
}

/// TraceConfig holds extra parameters to trace functions.
class TraceConfig extends CosmosProtoMessage {
  /// DEPRECATED: DisableMemory and DisableReturnData have been renamed to
  /// Enable*.
  /// custom javascript tracer
  final String? tracer;

  /// overrides the default timeout of 5 seconds for JavaScript-based tracing
  /// calls
  final String? timeout;

  /// number of blocks the tracer is willing to go back
  final BigInt? reexec;

  /// disable stack capture
  final bool? disableStack;

  /// disable storage capture
  final bool? disableStorage;

  /// print output during capture end
  final bool? debug;

  /// maximum length of output, but zero means unlimited
  final int? limit;

  /// Chain overrides, can be used to execute a trace using future fork rules
  final ChainConfig? overrides;

  /// enable memory capture
  final bool? enableMemory;

  /// enable return data capture
  final bool? enableReturnData;

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
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'tracer': tracer,
      'timeout': timeout,
      'reexec': reexec?.toString(),
      'disable_stack': disableStack,
      'disable_storage': disableStorage,
      'debug': debug,
      'limit': limit,
      'overrides': overrides?.toJson(),
      'enable_memory': enableMemory,
      'enable_return_data': enableReturnData,
    };
  }

  factory TraceConfig.fromJson(Map<String, dynamic> json) {
    return TraceConfig(
      tracer: json.valueAsString<String?>('tracer', acceptCamelCase: true),
      timeout: json.valueAsString<String?>('timeout', acceptCamelCase: true),
      reexec: json.valueAsBigInt<BigInt?>('reexec', acceptCamelCase: true),
      disableStack: json.valueAsBool<bool?>(
        'disable_stack',
        acceptCamelCase: true,
      ),
      disableStorage: json.valueAsBool<bool?>(
        'disable_storage',
        acceptCamelCase: true,
      ),
      debug: json.valueAsBool<bool?>('debug', acceptCamelCase: true),
      limit: json.valueAsInt<int?>('limit', acceptCamelCase: true),
      overrides: json.valueTo<ChainConfig?, Map<String, dynamic>>(
        key: 'overrides',
        parse: (v) => ChainConfig.fromJson(v),
        acceptCamelCase: true,
      ),
      enableMemory: json.valueAsBool<bool?>(
        'enable_memory',
        acceptCamelCase: true,
      ),
      enableReturnData: json.valueAsBool<bool?>(
        'enable_return_data',
        acceptCamelCase: true,
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
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosEvmV1TraceConfig;
}

/// Params defines the EVM module parameters
class FeeMarketParams extends CosmosProtoMessage {
  /// no base fee forces the EIP-1559 base fee to 0 (needed for 0 price calls)
  final bool? noBaseFee;

  /// base fee change denominator bounds the amount the base fee can change
  /// between blocks.
  final int? baseFeeChangeDenominator;

  /// elasticity multiplier bounds the maximum gas limit an EIP-1559 block may
  /// have.
  final int? elasticityMultiplier;

  /// DEPRECATED: initial base fee for EIP-1559 blocks.
  /// height at which the base fee calculation is enabled.
  final BigInt? enableHeight;

  /// base fee for EIP-1559 blocks.
  final String? baseFee;

  const FeeMarketParams({
    this.noBaseFee,
    this.baseFeeChangeDenominator,
    this.elasticityMultiplier,
    this.enableHeight,
    this.baseFee,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bool(1),
        ProtoFieldConfig.uint32(2),
        ProtoFieldConfig.uint32(3),
        ProtoFieldConfig.int64(5),
        ProtoFieldConfig.string(
          6,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    noBaseFee,
    baseFeeChangeDenominator,
    elasticityMultiplier,
    enableHeight,
    baseFee,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'no_base_fee': noBaseFee,
      'base_fee_change_denominator': baseFeeChangeDenominator,
      'elasticity_multiplier': elasticityMultiplier,
      'enable_height': enableHeight?.toString(),
      'base_fee': baseFee,
    };
  }

  factory FeeMarketParams.fromJson(Map<String, dynamic> json) {
    return FeeMarketParams(
      noBaseFee: json.valueAsBool<bool?>('no_base_fee', acceptCamelCase: true),
      baseFeeChangeDenominator: json.valueAsInt<int?>(
        'base_fee_change_denominator',
        acceptCamelCase: true,
      ),
      elasticityMultiplier: json.valueAsInt<int?>(
        'elasticity_multiplier',
        acceptCamelCase: true,
      ),
      enableHeight: json.valueAsBigInt<BigInt?>(
        'enable_height',
        acceptCamelCase: true,
      ),
      baseFee: json.valueAsString<String?>('base_fee', acceptCamelCase: true),
    );
  }

  factory FeeMarketParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return FeeMarketParams(
      noBaseFee: decode.getBool<bool?>(1),
      baseFeeChangeDenominator: decode.getInt<int?>(2),
      elasticityMultiplier: decode.getInt<int?>(3),
      enableHeight: decode.getBigInt<BigInt?>(5),
      baseFee: decode.getString<String?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosEvmV1FeeMarketParams;
}
