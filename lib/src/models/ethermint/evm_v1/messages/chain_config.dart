import 'package:blockchain_utils/utils/numbers/utils/bigint_utils.dart';
import 'package:cosmos_sdk/src/models/ethermint/evm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ChainConfig defines the Ethereum ChainConfig parameters
class EVMV1ChainConfig extends CosmosMessage {
  // homesteadBlock switch (nil no fork, 0 = already homestead)
  final BigInt? homesteadBlock;
  // dao_forkBlock corresponds to TheDAO hard-fork switch block (nil no fork)
  final BigInt? daoForkBlock;
  // dao_fork_support defines whether the nodes supports or opposes the DAO hard-fork
  final bool daoForkSupport;
  // eip150Block: EIP150 implements the Gas price changes
  // (https://github.com/ethereum/EIPs/issues/150) EIP150 HF block (nil no fork)
  final BigInt? eip150Block;
  // eip150_hash: EIP150 HF hash (needed for header only clients as only gas pricing changed)
  final String? eip150Hash;
  // eip155Block: EIP155Block HF block
  final BigInt? eip155Block;
  // eip158Block: EIP158 HF block
  final BigInt? eip158Block;
  // byzantiumBlock: Byzantium switch block (nil no fork, 0 = already on byzantium)
  final BigInt? byzantiumBlock;
  // constantinopleBlock: Constantinople switch block (nil no fork, 0 = already activated)
  final BigInt? constantinopleBlock;
  // petersburgBlock: Petersburg switch block (nil same as Constantinople)
  final BigInt? petersburgBlock;
  // istanbulBlock: Istanbul switch block (nil no fork, 0 = already on istanbul)
  final BigInt? istanbulBlock;
  // muir_glacierBlock: Eip-2384 (bomb delay) switch block (nil no fork, 0 = already activated)
  final BigInt? muirGlacierBlock;
  // berlinBlock: Berlin switch block (nil = no fork, 0 = already on berlin)
  final BigInt? berlinBlock;
  // londonBlock: London switch block (nil = no fork, 0 = already on london)
  final BigInt? londonBlock;
  // arrow_glacierBlock: Eip-4345 (bomb delay) switch block (nil = no fork, 0 = already activated)
  final BigInt? arrowGlacierBlock;
  // gray_glacierBlock: EIP-5133 (bomb delay) switch block (nil = no fork, 0 = already activated)
  final BigInt? grayGlacierBlock;
  // merge_netsplitBlock: Virtual fork after The Merge to use as a network splitter
  final BigInt? mergeNetsplitBlock;
  // shanghaiBlock switch block (nil = no fork, 0 = already on shanghai)
  final BigInt? shanghaiBlock;
  // cancunBlock switch block (nil = no fork, 0 = already on cancun)
  final BigInt? cancunBlock;

  factory EVMV1ChainConfig.fromRpc(Map<String, dynamic> json) {
    return EVMV1ChainConfig(
      homesteadBlock: BigintUtils.tryParse(json["homestead_block"]),
      daoForkBlock: BigintUtils.tryParse(json["dao_fork_block"]),
      daoForkSupport: json["dao_fork_support"],
      eip150Block: BigintUtils.tryParse(json["eip150_block"]),
      eip150Hash: json["eip150_hash"],
      eip155Block: BigintUtils.tryParse(json["eip155_block"]),
      eip158Block: BigintUtils.tryParse(json["eip158_block"]),
      byzantiumBlock: BigintUtils.tryParse(json["byzantium_block"]),
      constantinopleBlock: BigintUtils.tryParse(json["constantinople_block"]),
      petersburgBlock: BigintUtils.tryParse(json["petersburg_block"]),
      istanbulBlock: BigintUtils.tryParse(json["istanbul_block"]),
      muirGlacierBlock: BigintUtils.tryParse(json["muir_glacier_block"]),
      berlinBlock: BigintUtils.tryParse(json["berlin_block"]),
      londonBlock: BigintUtils.tryParse(json["london_block"]),
      arrowGlacierBlock: BigintUtils.tryParse(json["arrow_glacier_block"]),
      grayGlacierBlock: BigintUtils.tryParse(json["gray_glacier_block"]),
      mergeNetsplitBlock: BigintUtils.tryParse(json["merge_netsplit_block"]),
      shanghaiBlock: BigintUtils.tryParse(json["shanghai_block"]),
      cancunBlock: BigintUtils.tryParse(json["cancun_block"]),
    );
  }

  EVMV1ChainConfig(
      {required this.homesteadBlock,
      required this.daoForkBlock,
      required this.daoForkSupport,
      required this.eip150Block,
      required this.eip150Hash,
      required this.eip155Block,
      required this.eip158Block,
      required this.byzantiumBlock,
      required this.constantinopleBlock,
      required this.petersburgBlock,
      required this.istanbulBlock,
      required this.muirGlacierBlock,
      required this.berlinBlock,
      required this.londonBlock,
      required this.arrowGlacierBlock,
      required this.grayGlacierBlock,
      required this.mergeNetsplitBlock,
      required this.shanghaiBlock,
      required this.cancunBlock});
  factory EVMV1ChainConfig.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EVMV1ChainConfig(
      homesteadBlock: decode.getField(1),
      daoForkBlock: decode.getField(2),
      daoForkSupport: decode.getField(3),
      eip150Block: decode.getField(4),
      eip150Hash: decode.getField(5),
      eip155Block: decode.getField(6),
      eip158Block: decode.getField(7),
      byzantiumBlock: decode.getField(8),
      constantinopleBlock: decode.getField(9),
      petersburgBlock: decode.getField(10),
      istanbulBlock: decode.getField(11),
      muirGlacierBlock: decode.getField(12),
      berlinBlock: decode.getField(13),
      londonBlock: decode.getField(17),
      arrowGlacierBlock: decode.getField(18),
      grayGlacierBlock: decode.getField(20),
      mergeNetsplitBlock: decode.getField(21),
      shanghaiBlock: decode.getField(22),
      cancunBlock: decode.getField(23),
    );
  }

  @override
  List<int> get fieldIds =>
      [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 17, 18, 20, 21, 22, 23];

  @override
  Map<String, dynamic> toJson() {
    return {
      "homestead_block": homesteadBlock?.toString(),
      "dao_fork_block": daoForkBlock?.toString(),
      "dao_fork_support": daoForkSupport,
      "eip150_block": eip150Block?.toString(),
      "eip150_hash": eip150Hash,
      "eip155_block": eip155Block?.toString(),
      "eip158_block": eip158Block?.toString(),
      "byzantium_block": byzantiumBlock?.toString(),
      "constantinople_block": constantinopleBlock?.toString(),
      "petersburg_block": petersburgBlock?.toString(),
      "istanbul_block": istanbulBlock?.toString(),
      "muir_glacier_block": muirGlacierBlock?.toString(),
      "berlin_block": berlinBlock?.toString(),
      "london_block": londonBlock?.toString(),
      "arrow_glacier_block": arrowGlacierBlock?.toString(),
      "gray_glacier_block": grayGlacierBlock?.toString(),
      "merge_netsplit_block": mergeNetsplitBlock?.toString(),
      "shanghai_block": shanghaiBlock?.toString(),
      "cancun_block": cancunBlock?.toString(),
    };
  }

  @override
  TypeUrl get typeUrl => EvmV1Types.chainConfig;

  @override
  List get values => [
        homesteadBlock?.toString(),
        daoForkBlock?.toString(),
        daoForkSupport,
        eip150Block?.toString(),
        eip150Hash,
        eip155Block?.toString(),
        eip158Block?.toString(),
        byzantiumBlock?.toString(),
        constantinopleBlock?.toString(),
        petersburgBlock?.toString(),
        istanbulBlock?.toString(),
        muirGlacierBlock?.toString(),
        berlinBlock?.toString(),
        londonBlock?.toString(),
        arrowGlacierBlock?.toString(),
        grayGlacierBlock?.toString(),
        mergeNetsplitBlock?.toString(),
        shanghaiBlock?.toString(),
        cancunBlock?.toString(),
      ];
}
