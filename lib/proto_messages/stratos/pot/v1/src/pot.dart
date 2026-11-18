import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

/// Params defines the PoT module parameters
class Params extends CosmosProtoMessage {
  final String? bondDenom;

  final String? rewardDenom;

  final BigInt? matureEpoch;

  final List<MiningRewardParam> miningRewardParams;

  final String? communityTax;

  final cosmos_base_v1beta1_coin.Coin? initialTotalSupply;

  const Params({
    this.bondDenom,
    this.rewardDenom,
    this.matureEpoch,
    this.miningRewardParams = const [],
    this.communityTax,
    this.initialTotalSupply,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "stratos/x/pot/Params"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.int64(3, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(
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
    bondDenom,
    rewardDenom,
    matureEpoch,
    miningRewardParams,
    communityTax,
    initialTotalSupply,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'bond_denom': bondDenom,
      'reward_denom': rewardDenom,
      'mature_epoch': config.encodeBigint(matureEpoch),
      'mining_reward_params':
          miningRewardParams.map((e) => config.encodeMessage(e)).toList(),
      'community_tax': communityTax,
      'initial_total_supply': config.encodeMessage(initialTotalSupply),
    };
  }

  factory Params.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Params(
      bondDenom: json.valueAsString<String?>(
        'bond_denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      rewardDenom: json.valueAsString<String?>(
        'reward_denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      matureEpoch: json.valueAsBigInt<BigInt?>(
        'mature_epoch',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      miningRewardParams:
          (json.valueEnsureAsList<dynamic>(
                'mining_reward_params',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<MiningRewardParam, Object>(
                  value: e,
                  parse:
                      (v) => MiningRewardParam.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      communityTax: json.valueAsString<String?>(
        'community_tax',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      initialTotalSupply: json.valueTo<cosmos_base_v1beta1_coin.Coin?, Object>(
        key: 'initial_total_supply',
        parse:
            (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      bondDenom: decode.getString<String?>(1),
      rewardDenom: decode.getString<String?>(2),
      matureEpoch: decode.getBigInt<BigInt?>(3),
      miningRewardParams:
          decode
              .getListOfBytes(4)
              .map((b) => MiningRewardParam.deserialize(b))
              .toList(),
      communityTax: decode.getString<String?>(5),
      initialTotalSupply: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        6,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1Params;
}

class MiningRewardParam extends CosmosProtoMessage {
  final cosmos_base_v1beta1_coin.Coin? totalMinedValveStart;

  final cosmos_base_v1beta1_coin.Coin? totalMinedValveEnd;

  final cosmos_base_v1beta1_coin.Coin? miningReward;

  final String? blockChainPercentageInBp;

  final String? resourceNodePercentageInBp;

  final String? metaNodePercentageInBp;

  const MiningRewardParam({
    this.totalMinedValveStart,
    this.totalMinedValveEnd,
    this.miningReward,
    this.blockChainPercentageInBp,
    this.resourceNodePercentageInBp,
    this.metaNodePercentageInBp,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(
          1,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.message(
          2,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.message(
          3,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(
          4,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(
          5,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(
          6,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    totalMinedValveStart,
    totalMinedValveEnd,
    miningReward,
    blockChainPercentageInBp,
    resourceNodePercentageInBp,
    metaNodePercentageInBp,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'total_mined_valve_start': config.encodeMessage(totalMinedValveStart),
      'total_mined_valve_end': config.encodeMessage(totalMinedValveEnd),
      'mining_reward': config.encodeMessage(miningReward),
      'block_chain_percentage_in_bp': blockChainPercentageInBp,
      'resource_node_percentage_in_bp': resourceNodePercentageInBp,
      'meta_node_percentage_in_bp': metaNodePercentageInBp,
    };
  }

  factory MiningRewardParam.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MiningRewardParam(
      totalMinedValveStart: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Object>(
            key: 'total_mined_valve_start',
            parse:
                (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      totalMinedValveEnd: json.valueTo<cosmos_base_v1beta1_coin.Coin?, Object>(
        key: 'total_mined_valve_end',
        parse:
            (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      miningReward: json.valueTo<cosmos_base_v1beta1_coin.Coin?, Object>(
        key: 'mining_reward',
        parse:
            (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      blockChainPercentageInBp: json.valueAsString<String?>(
        'block_chain_percentage_in_bp',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      resourceNodePercentageInBp: json.valueAsString<String?>(
        'resource_node_percentage_in_bp',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      metaNodePercentageInBp: json.valueAsString<String?>(
        'meta_node_percentage_in_bp',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MiningRewardParam.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MiningRewardParam(
      totalMinedValveStart: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        1,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      totalMinedValveEnd: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        2,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      miningReward: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        3,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      blockChainPercentageInBp: decode.getString<String?>(4),
      resourceNodePercentageInBp: decode.getString<String?>(5),
      metaNodePercentageInBp: decode.getString<String?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1MiningRewardParam;
}

class Reward extends CosmosProtoMessage {
  final String? walletAddress;

  final List<cosmos_base_v1beta1_coin.Coin> rewardFromMiningPool;

  final List<cosmos_base_v1beta1_coin.Coin> rewardFromTrafficPool;

  const Reward({
    this.walletAddress,
    this.rewardFromMiningPool = const [],
    this.rewardFromTrafficPool = const [],
  });

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
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    walletAddress,
    rewardFromMiningPool,
    rewardFromTrafficPool,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'wallet_address': walletAddress,
      'reward_from_mining_pool':
          rewardFromMiningPool.map((e) => config.encodeMessage(e)).toList(),
      'reward_from_traffic_pool':
          rewardFromTrafficPool.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory Reward.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Reward(
      walletAddress: json.valueAsString<String?>(
        'wallet_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      rewardFromMiningPool:
          (json.valueEnsureAsList<dynamic>(
                'reward_from_mining_pool',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<cosmos_base_v1beta1_coin.Coin, Object>(
                      value: e,
                      parse:
                          (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
      rewardFromTrafficPool:
          (json.valueEnsureAsList<dynamic>(
                'reward_from_traffic_pool',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<cosmos_base_v1beta1_coin.Coin, Object>(
                      value: e,
                      parse:
                          (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
    );
  }

  factory Reward.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Reward(
      walletAddress: decode.getString<String?>(1),
      rewardFromMiningPool:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      rewardFromTrafficPool:
          decode
              .getListOfBytes(3)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1Reward;
}

class SingleWalletVolume extends CosmosProtoMessage {
  final String? walletAddress;

  final String? volume;

  const SingleWalletVolume({this.walletAddress, this.volume});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(
          2,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [walletAddress, volume];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'wallet_address': walletAddress, 'volume': volume};
  }

  factory SingleWalletVolume.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return SingleWalletVolume(
      walletAddress: json.valueAsString<String?>(
        'wallet_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      volume: json.valueAsString<String?>(
        'volume',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory SingleWalletVolume.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SingleWalletVolume(
      walletAddress: decode.getString<String?>(1),
      volume: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1SingleWalletVolume;
}

class TotalReward extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> miningReward;

  final List<cosmos_base_v1beta1_coin.Coin> trafficReward;

  const TotalReward({
    this.miningReward = const [],
    this.trafficReward = const [],
  });

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
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [miningReward, trafficReward];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'mining_reward':
          miningReward.map((e) => config.encodeMessage(e)).toList(),
      'traffic_reward':
          trafficReward.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory TotalReward.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return TotalReward(
      miningReward:
          (json.valueEnsureAsList<dynamic>(
                'mining_reward',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<cosmos_base_v1beta1_coin.Coin, Object>(
                      value: e,
                      parse:
                          (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
      trafficReward:
          (json.valueEnsureAsList<dynamic>(
                'traffic_reward',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<cosmos_base_v1beta1_coin.Coin, Object>(
                      value: e,
                      parse:
                          (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
    );
  }

  factory TotalReward.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TotalReward(
      miningReward:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      trafficReward:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1TotalReward;
}

class Metrics extends CosmosProtoMessage {
  final String? totalSupply;

  final String? totalMiningSupply;

  final String? totalMinedTokens;

  final String? totalResourceNodesDeposit;

  final String? totalBondedDelegation;

  final String? totalUnbondedDelegation;

  final String? totalUnbondingDelegation;

  final String? circulationSupply;

  final String? totalMiningReward;

  final String? chainMiningReward;

  final String? resourceMiningReward;

  final String? metaMiningReward;

  final String? resourceNodeDeposit;

  final String? metaNodeDeposit;

  final String? unissuedPrepay;

  const Metrics({
    this.totalSupply,
    this.totalMiningSupply,
    this.totalMinedTokens,
    this.totalResourceNodesDeposit,
    this.totalBondedDelegation,
    this.totalUnbondedDelegation,
    this.totalUnbondingDelegation,
    this.circulationSupply,
    this.totalMiningReward,
    this.chainMiningReward,
    this.resourceMiningReward,
    this.metaMiningReward,
    this.resourceNodeDeposit,
    this.metaNodeDeposit,
    this.unissuedPrepay,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(
          1,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(
          2,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(
          3,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(
          4,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(
          5,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(
          6,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(
          7,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(
          8,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(
          9,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(
          10,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(
          11,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(
          12,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(
          13,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(
          14,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(
          15,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    totalSupply,
    totalMiningSupply,
    totalMinedTokens,
    totalResourceNodesDeposit,
    totalBondedDelegation,
    totalUnbondedDelegation,
    totalUnbondingDelegation,
    circulationSupply,
    totalMiningReward,
    chainMiningReward,
    resourceMiningReward,
    metaMiningReward,
    resourceNodeDeposit,
    metaNodeDeposit,
    unissuedPrepay,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'total_supply': totalSupply,
      'total_mining_supply': totalMiningSupply,
      'total_mined_tokens': totalMinedTokens,
      'total_resource_nodes_deposit': totalResourceNodesDeposit,
      'total_bonded_delegation': totalBondedDelegation,
      'total_unbonded_delegation': totalUnbondedDelegation,
      'total_unbonding_delegation': totalUnbondingDelegation,
      'circulation_supply': circulationSupply,
      'total_mining_reward': totalMiningReward,
      'chain_mining_reward': chainMiningReward,
      'resource_mining_reward': resourceMiningReward,
      'meta_mining_reward': metaMiningReward,
      'resource_node_deposit': resourceNodeDeposit,
      'meta_node_deposit': metaNodeDeposit,
      'unissued_prepay': unissuedPrepay,
    };
  }

  factory Metrics.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Metrics(
      totalSupply: json.valueAsString<String?>(
        'total_supply',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      totalMiningSupply: json.valueAsString<String?>(
        'total_mining_supply',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      totalMinedTokens: json.valueAsString<String?>(
        'total_mined_tokens',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      totalResourceNodesDeposit: json.valueAsString<String?>(
        'total_resource_nodes_deposit',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      totalBondedDelegation: json.valueAsString<String?>(
        'total_bonded_delegation',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      totalUnbondedDelegation: json.valueAsString<String?>(
        'total_unbonded_delegation',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      totalUnbondingDelegation: json.valueAsString<String?>(
        'total_unbonding_delegation',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      circulationSupply: json.valueAsString<String?>(
        'circulation_supply',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      totalMiningReward: json.valueAsString<String?>(
        'total_mining_reward',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      chainMiningReward: json.valueAsString<String?>(
        'chain_mining_reward',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      resourceMiningReward: json.valueAsString<String?>(
        'resource_mining_reward',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      metaMiningReward: json.valueAsString<String?>(
        'meta_mining_reward',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      resourceNodeDeposit: json.valueAsString<String?>(
        'resource_node_deposit',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      metaNodeDeposit: json.valueAsString<String?>(
        'meta_node_deposit',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      unissuedPrepay: json.valueAsString<String?>(
        'unissued_prepay',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Metrics.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Metrics(
      totalSupply: decode.getString<String?>(1),
      totalMiningSupply: decode.getString<String?>(2),
      totalMinedTokens: decode.getString<String?>(3),
      totalResourceNodesDeposit: decode.getString<String?>(4),
      totalBondedDelegation: decode.getString<String?>(5),
      totalUnbondedDelegation: decode.getString<String?>(6),
      totalUnbondingDelegation: decode.getString<String?>(7),
      circulationSupply: decode.getString<String?>(8),
      totalMiningReward: decode.getString<String?>(9),
      chainMiningReward: decode.getString<String?>(10),
      resourceMiningReward: decode.getString<String?>(11),
      metaMiningReward: decode.getString<String?>(12),
      resourceNodeDeposit: decode.getString<String?>(13),
      metaNodeDeposit: decode.getString<String?>(14),
      unissuedPrepay: decode.getString<String?>(15),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1Metrics;
}
