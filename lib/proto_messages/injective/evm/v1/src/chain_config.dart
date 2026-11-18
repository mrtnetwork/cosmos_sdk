import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// ChainConfig defines the Ethereum ChainConfig parameters using *sdkmath.Int
/// values instead of *big.Int.
class ChainConfig extends CosmosProtoMessage {
  /// homestead_block switch (nil no fork, 0 = already homestead)
  final String? homesteadBlock;

  /// dao_fork_block corresponds to TheDAO hard-fork switch block (nil no fork)
  final String? daoForkBlock;

  /// dao_fork_support defines whether the nodes supports or opposes the DAO
  /// hard-fork
  final bool? daoForkSupport;

  /// eip150_block: EIP150 implements the Gas price changes
  /// (https://github.com/ethereum/EIPs/issues/150) EIP150 HF block (nil no fork)
  final String? eip150Block;

  /// eip150_hash: EIP150 HF hash (needed for header only clients as only gas
  /// pricing changed)
  final String? eip150Hash;

  /// eip155_block: EIP155Block HF block
  final String? eip155Block;

  /// eip158_block: EIP158 HF block
  final String? eip158Block;

  /// byzantium_block: Byzantium switch block (nil no fork, 0 = already on
  /// byzantium)
  final String? byzantiumBlock;

  /// constantinople_block: Constantinople switch block (nil no fork, 0 = already
  /// activated)
  final String? constantinopleBlock;

  /// petersburg_block: Petersburg switch block (nil same as Constantinople)
  final String? petersburgBlock;

  /// istanbul_block: Istanbul switch block (nil no fork, 0 = already on
  /// istanbul)
  final String? istanbulBlock;

  /// muir_glacier_block: Eip-2384 (bomb delay) switch block (nil no fork, 0 =
  /// already activated)
  final String? muirGlacierBlock;

  /// berlin_block: Berlin switch block (nil = no fork, 0 = already on berlin)
  final String? berlinBlock;

  /// DEPRECATED: EWASM, YOLOV3 and Catalyst block have been deprecated
  /// london_block: London switch block (nil = no fork, 0 = already on london)
  final String? londonBlock;

  /// arrow_glacier_block: Eip-4345 (bomb delay) switch block (nil = no fork, 0 =
  /// already activated)
  final String? arrowGlacierBlock;

  /// DEPRECATED: merge fork block was deprecated:
  /// https://github.com/ethereum/go-ethereum/pull/24904
  /// gray_glacier_block: EIP-5133 (bomb delay) switch block (nil = no fork, 0 =
  /// already activated)
  final String? grayGlacierBlock;

  /// merge_netsplit_block: Virtual fork after The Merge to use as a network
  /// splitter
  final String? mergeNetsplitBlock;

  /// shanghai switch time (nil = no fork, 0 = already on shanghai)
  final String? shanghaiTime;

  /// cancun switch time (nil = no fork, 0 = already on cancun)
  final String? cancunTime;

  /// prague switch time (nil = no fork, 0 = already on prague)
  final String? pragueTime;

  /// eip155_chain_id: identifies the chain and is used for replay protection
  final String? eip155ChainId;

  /// eip7840: per-fork schedule of max and target blob counts in client
  /// configuration files
  final BlobScheduleConfig? blobScheduleConfig;

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
    this.shanghaiTime,
    this.cancunTime,
    this.pragueTime,
    this.eip155ChainId,
    this.blobScheduleConfig,
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
        ProtoFieldConfig.string(24, options: const []),
        ProtoFieldConfig.string(25, options: const []),
        ProtoFieldConfig.message(26, options: const []),
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
    shanghaiTime,
    cancunTime,
    pragueTime,
    eip155ChainId,
    blobScheduleConfig,
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
      'shanghai_time': shanghaiTime,
      'cancun_time': cancunTime,
      'prague_time': pragueTime,
      'eip155_chain_id': eip155ChainId,
      'blob_schedule_config': config.encodeMessage(blobScheduleConfig),
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
      shanghaiTime: json.valueAsString<String?>(
        'shanghai_time',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      cancunTime: json.valueAsString<String?>(
        'cancun_time',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      pragueTime: json.valueAsString<String?>(
        'prague_time',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      eip155ChainId: json.valueAsString<String?>(
        'eip155_chain_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      blobScheduleConfig: json.valueTo<BlobScheduleConfig?, Object>(
        key: 'blob_schedule_config',
        parse:
            (v) => BlobScheduleConfig.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
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
      shanghaiTime: decode.getString<String?>(22),
      cancunTime: decode.getString<String?>(23),
      pragueTime: decode.getString<String?>(24),
      eip155ChainId: decode.getString<String?>(25),
      blobScheduleConfig: decode.messageTo<BlobScheduleConfig?>(
        26,
        (b) => BlobScheduleConfig.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveEvmV1ChainConfig;
}

class BlobScheduleConfig extends CosmosProtoMessage {
  final BlobConfig? cancun;

  final BlobConfig? prague;

  final BlobConfig? osaka;

  final BlobConfig? verkle;

  const BlobScheduleConfig({this.cancun, this.prague, this.osaka, this.verkle});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1),
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.message(3),
        ProtoFieldConfig.message(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [cancun, prague, osaka, verkle];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'cancun': config.encodeMessage(cancun),
      'prague': config.encodeMessage(prague),
      'osaka': config.encodeMessage(osaka),
      'verkle': config.encodeMessage(verkle),
    };
  }

  factory BlobScheduleConfig.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return BlobScheduleConfig(
      cancun: json.valueTo<BlobConfig?, Object>(
        key: 'cancun',
        parse:
            (v) => BlobConfig.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      prague: json.valueTo<BlobConfig?, Object>(
        key: 'prague',
        parse:
            (v) => BlobConfig.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      osaka: json.valueTo<BlobConfig?, Object>(
        key: 'osaka',
        parse:
            (v) => BlobConfig.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      verkle: json.valueTo<BlobConfig?, Object>(
        key: 'verkle',
        parse:
            (v) => BlobConfig.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory BlobScheduleConfig.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BlobScheduleConfig(
      cancun: decode.messageTo<BlobConfig?>(
        1,
        (b) => BlobConfig.deserialize(b),
      ),
      prague: decode.messageTo<BlobConfig?>(
        2,
        (b) => BlobConfig.deserialize(b),
      ),
      osaka: decode.messageTo<BlobConfig?>(3, (b) => BlobConfig.deserialize(b)),
      verkle: decode.messageTo<BlobConfig?>(
        4,
        (b) => BlobConfig.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveEvmV1BlobScheduleConfig;
}

class BlobConfig extends CosmosProtoMessage {
  final BigInt? target;

  final BigInt? max;

  final BigInt? baseFeeUpdateFraction;

  const BlobConfig({this.target, this.max, this.baseFeeUpdateFraction});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.uint64(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [target, max, baseFeeUpdateFraction];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'target': config.encodeBigint(target),
      'max': config.encodeBigint(max),
      'base_fee_update_fraction': config.encodeBigint(baseFeeUpdateFraction),
    };
  }

  factory BlobConfig.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return BlobConfig(
      target: json.valueAsBigInt<BigInt?>(
        'target',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      max: json.valueAsBigInt<BigInt?>(
        'max',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      baseFeeUpdateFraction: json.valueAsBigInt<BigInt?>(
        'base_fee_update_fraction',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory BlobConfig.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BlobConfig(
      target: decode.getBigInt<BigInt?>(1),
      max: decode.getBigInt<BigInt?>(2),
      baseFeeUpdateFraction: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveEvmV1BlobConfig;
}
