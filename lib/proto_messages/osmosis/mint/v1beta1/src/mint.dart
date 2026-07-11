import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// WeightedAddress represents an address with a weight assigned to it.
/// The weight is used to determine the proportion of the total minted
/// tokens to be minted to the address.
class WeightedAddress extends CosmosProtoMessage {
  final String? address;

  final String? weight;

  const WeightedAddress({this.address, this.weight});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [address, weight];

  @override
  Map<String, dynamic> toJson() {
    return {'address': address, 'weight': weight};
  }

  factory WeightedAddress.fromJson(Map<String, dynamic> json) {
    return WeightedAddress(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      weight: json.valueAsString<String?>('weight', acceptCamelCase: true),
    );
  }

  factory WeightedAddress.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return WeightedAddress(
      address: decode.getString<String?>(1),
      weight: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisMintV1beta1WeightedAddress;
}

/// DistributionProportions defines the distribution proportions of the minted
/// denom. In other words, defines which stakeholders will receive the minted
/// denoms and how much.
class DistributionProportions extends CosmosProtoMessage {
  /// staking defines the proportion of the minted mint_denom that is to be
  /// allocated as staking rewards.
  final String? staking;

  /// pool_incentives defines the proportion of the minted mint_denom that is
  /// to be allocated as pool incentives.
  final String? poolIncentives;

  /// developer_rewards defines the proportion of the minted mint_denom that is
  /// to be allocated to developer rewards address.
  final String? developerRewards;

  /// community_pool defines the proportion of the minted mint_denom that is
  /// to be allocated to the community pool.
  final String? communityPool;

  const DistributionProportions({
    this.staking,
    this.poolIncentives,
    this.developerRewards,
    this.communityPool,
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
    poolIncentives,
    developerRewards,
    communityPool,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'staking': staking,
      'pool_incentives': poolIncentives,
      'developer_rewards': developerRewards,
      'community_pool': communityPool,
    };
  }

  factory DistributionProportions.fromJson(Map<String, dynamic> json) {
    return DistributionProportions(
      staking: json.valueAsString<String?>('staking', acceptCamelCase: true),
      poolIncentives: json.valueAsString<String?>(
        'pool_incentives',
        acceptCamelCase: true,
      ),
      developerRewards: json.valueAsString<String?>(
        'developer_rewards',
        acceptCamelCase: true,
      ),
      communityPool: json.valueAsString<String?>(
        'community_pool',
        acceptCamelCase: true,
      ),
    );
  }

  factory DistributionProportions.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DistributionProportions(
      staking: decode.getString<String?>(1),
      poolIncentives: decode.getString<String?>(2),
      developerRewards: decode.getString<String?>(3),
      communityPool: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisMintV1beta1DistributionProportions;
}

/// Params holds parameters for the x/mint module.
class Params extends CosmosProtoMessage {
  /// mint_denom is the denom of the coin to mint.
  final String? mintDenom;

  /// genesis_epoch_provisions epoch provisions from the first epoch.
  final String? genesisEpochProvisions;

  /// epoch_identifier mint epoch identifier e.g. (day, week).
  final String? epochIdentifier;

  /// reduction_period_in_epochs the number of epochs it takes
  /// to reduce the rewards.
  final BigInt? reductionPeriodInEpochs;

  /// reduction_factor is the reduction multiplier to execute
  /// at the end of each period set by reduction_period_in_epochs.
  final String? reductionFactor;

  /// distribution_proportions defines the distribution proportions of the minted
  /// denom. In other words, defines which stakeholders will receive the minted
  /// denoms and how much.
  final DistributionProportions? distributionProportions;

  /// weighted_developer_rewards_receivers is the address to receive developer
  /// rewards with weights assignedt to each address. The final amount that each
  /// address receives is: epoch_provisions *
  /// distribution_proportions.developer_rewards * Address's Weight.
  final List<WeightedAddress> weightedDeveloperRewardsReceivers;

  /// minting_rewards_distribution_start_epoch start epoch to distribute minting
  /// rewards
  final BigInt? mintingRewardsDistributionStartEpoch;

  const Params({
    this.mintDenom,
    this.genesisEpochProvisions,
    this.epochIdentifier,
    this.reductionPeriodInEpochs,
    this.reductionFactor,
    this.distributionProportions,
    this.weightedDeveloperRewardsReceivers = const [],
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
        ProtoFieldConfig.repeated(
          fieldNumber: 7,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.int64(8, options: const []),
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
    weightedDeveloperRewardsReceivers,
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
      'weighted_developer_rewards_receivers':
          weightedDeveloperRewardsReceivers.map((e) => e.toJson()).toList(),
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
      weightedDeveloperRewardsReceivers:
          (json.valueEnsureAsList<dynamic>(
                'weighted_developer_rewards_receivers',
                acceptCamelCase: true,
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<WeightedAddress, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => WeightedAddress.fromJson(v),
                    ),
              )
              .toList(),
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
      weightedDeveloperRewardsReceivers:
          decode
              .getListOfBytes(7)
              .map((b) => WeightedAddress.deserialize(b))
              .toList(),
      mintingRewardsDistributionStartEpoch: decode.getBigInt<BigInt?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisMintV1beta1Params;
}
