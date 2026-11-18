import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Copyright Tharsis Labs Ltd.(Evmos)
/// SPDX-License-Identifier:ENCL-1.0(https://github.com/evmos/evmos/blob/main/LICENSE)
/// InflationDistribution defines the distribution in which inflation is
/// allocated through minting on each epoch (staking, incentives, community). It
/// excludes the team vesting distribution, as this is minted once at genesis.
/// The initial InflationDistribution can be calculated from the Evmos Token
/// Model like this:
/// mintDistribution1 = distribution1 / (1 - teamVestingDistribution)
/// 0.5333333         = 40%           / (1 - 25%)
class InflationDistribution extends CosmosProtoMessage {
  /// staking_rewards defines the proportion of the minted minted_denom that is
  /// to be allocated as staking rewards
  final String? stakingRewards;

  /// protolint:disable FIELDS_HAVE_COMMENT
  /// Deprecated: usage_incentives defines the proportion of the minted minted_denom that is
  /// to be allocated to the incentives module address
  final String? usageIncentives;

  /// community_pool defines the proportion of the minted minted_denom that is to
  /// be allocated to the community pool
  final String? communityPool;

  const InflationDistribution({
    this.stakingRewards,
    this.usageIncentives,
    this.communityPool,
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
          options: [
            ProtoOptionBool(name: "amino.dont_omitempty", value: true),
            ProtoOptionBool(name: "deprecated", value: true),
          ],
        ),
        ProtoFieldConfig.string(
          3,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    stakingRewards,
    usageIncentives,
    communityPool,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'staking_rewards': stakingRewards,
      'usage_incentives': usageIncentives,
      'community_pool': communityPool,
    };
  }

  factory InflationDistribution.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return InflationDistribution(
      stakingRewards: json.valueAsString<String?>(
        'staking_rewards',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      usageIncentives: json.valueAsString<String?>(
        'usage_incentives',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      communityPool: json.valueAsString<String?>(
        'community_pool',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory InflationDistribution.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return InflationDistribution(
      stakingRewards: decode.getString<String?>(1),
      usageIncentives: decode.getString<String?>(2),
      communityPool: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosInflationV1InflationDistribution;
}

/// ExponentialCalculation holds factors to calculate exponential inflation on
/// each period. Calculation reference:
/// periodProvision = exponentialDecay       *  bondingIncentive
/// f(x)            = (a * (1 - r) ^ x + c)  *  (1 + max_variance - bondedRatio *
/// (max_variance / bonding_target))
class ExponentialCalculation extends CosmosProtoMessage {
  /// a defines the initial value
  final String? a;

  /// r defines the reduction factor
  final String? r;

  /// c defines the parameter for long term inflation
  final String? c;

  /// bonding_target
  final String? bondingTarget;

  /// max_variance
  final String? maxVariance;

  const ExponentialCalculation({
    this.a,
    this.r,
    this.c,
    this.bondingTarget,
    this.maxVariance,
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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [a, r, c, bondingTarget, maxVariance];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'a': a,
      'r': r,
      'c': c,
      'bonding_target': bondingTarget,
      'max_variance': maxVariance,
    };
  }

  factory ExponentialCalculation.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ExponentialCalculation(
      a: json.valueAsString<String?>(
        'a',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      r: json.valueAsString<String?>(
        'r',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      c: json.valueAsString<String?>(
        'c',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      bondingTarget: json.valueAsString<String?>(
        'bonding_target',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      maxVariance: json.valueAsString<String?>(
        'max_variance',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory ExponentialCalculation.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ExponentialCalculation(
      a: decode.getString<String?>(1),
      r: decode.getString<String?>(2),
      c: decode.getString<String?>(3),
      bondingTarget: decode.getString<String?>(4),
      maxVariance: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosInflationV1ExponentialCalculation;
}
