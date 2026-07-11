import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// next id: 5
class DistributionProportions extends CosmosProtoMessage {
  /// staking defines the proportion of the minted minted_denom that is to be
  /// allocated as staking rewards.
  final String? staking;

  /// community_pool defines the proportion of the minted mint_denom that is
  /// to be allocated to the community pool: growth.
  final String? communityPoolGrowth;

  /// community_pool defines the proportion of the minted mint_denom that is
  /// to be allocated to the community pool: security budget.
  final String? communityPoolSecurityBudget;

  /// strategic_reserve defines the proportion of the minted mint_denom that is
  /// to be allocated to the pool: strategic reserve.
  final String? strategicReserve;

  const DistributionProportions({
    this.staking,
    this.communityPoolGrowth,
    this.communityPoolSecurityBudget,
    this.strategicReserve,
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
        ProtoFieldConfig.string(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    staking,
    communityPoolGrowth,
    communityPoolSecurityBudget,
    strategicReserve,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'staking': staking,
      'community_pool_growth': communityPoolGrowth,
      'community_pool_security_budget': communityPoolSecurityBudget,
      'strategic_reserve': strategicReserve,
    };
  }

  factory DistributionProportions.fromJson(Map<String, dynamic> json) {
    return DistributionProportions(
      staking: json.valueAsString<String?>('staking', acceptCamelCase: true),
      communityPoolGrowth: json.valueAsString<String?>(
        'community_pool_growth',
        acceptCamelCase: true,
      ),
      communityPoolSecurityBudget: json.valueAsString<String?>(
        'community_pool_security_budget',
        acceptCamelCase: true,
      ),
      strategicReserve: json.valueAsString<String?>(
        'strategic_reserve',
        acceptCamelCase: true,
      ),
    );
  }

  factory DistributionProportions.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DistributionProportions(
      staking: decode.getString<String?>(1),
      communityPoolGrowth: decode.getString<String?>(2),
      communityPoolSecurityBudget: decode.getString<String?>(3),
      strategicReserve: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideMintV1beta1DistributionProportions;
}

/// Params holds parameters for the mint module.
class Params extends CosmosProtoMessage {
  /// type of coin to mint
  final String? mintDenom;

  /// epoch provisions from the first epoch
  final String? genesisEpochProvisions;

  /// mint epoch identifier
  final String? epochIdentifier;

  /// number of epochs take to reduce rewards
  final BigInt? reductionPeriodInEpochs;

  /// reduction multiplier to execute on each period
  final String? reductionFactor;

  /// distribution_proportions defines the proportion of the minted denom
  final DistributionProportions? distributionProportions;

  /// start epoch to distribute minting rewards
  final BigInt? mintingRewardsDistributionStartEpoch;

  const Params({
    this.mintDenom,
    this.genesisEpochProvisions,
    this.epochIdentifier,
    this.reductionPeriodInEpochs,
    this.reductionFactor,
    this.distributionProportions,
    this.mintingRewardsDistributionStartEpoch,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.int64(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.message(6, options: const []),
        ProtoFieldConfig.int64(7, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    mintDenom,
    genesisEpochProvisions,
    epochIdentifier,
    reductionPeriodInEpochs,
    reductionFactor,
    distributionProportions,
    mintingRewardsDistributionStartEpoch,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'mint_denom': mintDenom,
      'genesis_epoch_provisions': genesisEpochProvisions,
      'epoch_identifier': epochIdentifier,
      'reduction_period_in_epochs': reductionPeriodInEpochs?.toString(),
      'reduction_factor': reductionFactor,
      'distribution_proportions': distributionProportions?.toJson(),
      'minting_rewards_distribution_start_epoch':
          mintingRewardsDistributionStartEpoch?.toString(),
    };
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      mintDenom: json.valueAsString<String?>(
        'mint_denom',
        acceptCamelCase: true,
      ),
      genesisEpochProvisions: json.valueAsString<String?>(
        'genesis_epoch_provisions',
        acceptCamelCase: true,
      ),
      epochIdentifier: json.valueAsString<String?>(
        'epoch_identifier',
        acceptCamelCase: true,
      ),
      reductionPeriodInEpochs: json.valueAsBigInt<BigInt?>(
        'reduction_period_in_epochs',
        acceptCamelCase: true,
      ),
      reductionFactor: json.valueAsString<String?>(
        'reduction_factor',
        acceptCamelCase: true,
      ),
      distributionProportions: json
          .valueTo<DistributionProportions?, Map<String, dynamic>>(
            key: 'distribution_proportions',
            parse: (v) => DistributionProportions.fromJson(v),
            acceptCamelCase: true,
          ),
      mintingRewardsDistributionStartEpoch: json.valueAsBigInt<BigInt?>(
        'minting_rewards_distribution_start_epoch',
        acceptCamelCase: true,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      mintDenom: decode.getString<String?>(1),
      genesisEpochProvisions: decode.getString<String?>(2),
      epochIdentifier: decode.getString<String?>(3),
      reductionPeriodInEpochs: decode.getBigInt<BigInt?>(4),
      reductionFactor: decode.getString<String?>(5),
      distributionProportions: decode.messageTo<DistributionProportions?>(
        6,
        (b) => DistributionProportions.deserialize(b),
      ),
      mintingRewardsDistributionStartEpoch: decode.getBigInt<BigInt?>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideMintV1beta1Params;
}
