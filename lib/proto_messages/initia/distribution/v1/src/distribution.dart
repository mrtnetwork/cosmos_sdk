import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

/// Params defines the set of params for the distribution module.
class Params extends CosmosProtoMessage {
  final String? communityTax;

  final bool? withdrawAddrEnabled;

  final List<RewardWeight> rewardWeights;

  const Params({
    this.communityTax,
    this.withdrawAddrEnabled,
    this.rewardWeights = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "distribution/Params"),
      ],
      fields: [
        ProtoFieldConfig.string(
          1,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.bool(2, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    communityTax,
    withdrawAddrEnabled,
    rewardWeights,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'community_tax': communityTax,
      'withdraw_addr_enabled': withdrawAddrEnabled,
      'reward_weights': rewardWeights.map((e) => e.toJson()).toList(),
    };
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      communityTax: json.valueAsString<String?>(
        'community_tax',
        acceptCamelCase: true,
      ),
      withdrawAddrEnabled: json.valueAsBool<bool?>(
        'withdraw_addr_enabled',
        acceptCamelCase: true,
      ),
      rewardWeights:
          (json.valueEnsureAsList<dynamic>(
                'reward_weights',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<RewardWeight, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => RewardWeight.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      communityTax: decode.getString<String?>(1),
      withdrawAddrEnabled: decode.getBool<bool?>(2),
      rewardWeights:
          decode
              .getListOfBytes(3)
              .map((b) => RewardWeight.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaDistributionV1Params;
}

/// RewardWeight represents reward allocation ratio between
/// pools.
class RewardWeight extends CosmosProtoMessage {
  final String? denom;

  final String? weight;

  const RewardWeight({this.denom, this.weight});

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
  List<Object?> get protoValues => [denom, weight];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom, 'weight': weight};
  }

  factory RewardWeight.fromJson(Map<String, dynamic> json) {
    return RewardWeight(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      weight: json.valueAsString<String?>('weight', acceptCamelCase: true),
    );
  }

  factory RewardWeight.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RewardWeight(
      denom: decode.getString<String?>(1),
      weight: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaDistributionV1RewardWeight;
}

/// DecPool is a DecCoins wrapper with denom.
class DecPool extends CosmosProtoMessage {
  final String? denom;

  final List<cosmos_base_v1beta1_coin.DecCoin> decCoins;

  const DecPool({this.denom, this.decCoins = const []});

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
  List<Object?> get protoValues => [denom, decCoins];

  @override
  Map<String, dynamic> toJson() {
    return {
      'denom': denom,
      'dec_coins': decCoins.map((e) => e.toJson()).toList(),
    };
  }

  factory DecPool.fromJson(Map<String, dynamic> json) {
    return DecPool(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      decCoins:
          (json.valueEnsureAsList<dynamic>('dec_coins', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.DecCoin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.DecCoin.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory DecPool.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DecPool(
      denom: decode.getString<String?>(1),
      decCoins:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.DecCoin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaDistributionV1DecPool;
}

/// ValidatorAccumulatedCommission represents accumulated commission
/// for a validator kept as a running counter, can be withdrawn at any time.
class ValidatorAccumulatedCommission extends CosmosProtoMessage {
  final List<DecPool> commissions;

  const ValidatorAccumulatedCommission({this.commissions = const []});

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
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [commissions];

  @override
  Map<String, dynamic> toJson() {
    return {'commissions': commissions.map((e) => e.toJson()).toList()};
  }

  factory ValidatorAccumulatedCommission.fromJson(Map<String, dynamic> json) {
    return ValidatorAccumulatedCommission(
      commissions:
          (json.valueEnsureAsList<dynamic>(
                'commissions',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<DecPool, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => DecPool.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory ValidatorAccumulatedCommission.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ValidatorAccumulatedCommission(
      commissions:
          decode.getListOfBytes(1).map((b) => DecPool.deserialize(b)).toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .initiaDistributionV1ValidatorAccumulatedCommission;
}

/// ValidatorOutstandingRewards represents outstanding (un-withdrawn) rewards
/// for a validator inexpensive to track, allows simple sanity checks.
class ValidatorOutstandingRewards extends CosmosProtoMessage {
  final List<DecPool> rewards;

  const ValidatorOutstandingRewards({this.rewards = const []});

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
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [rewards];

  @override
  Map<String, dynamic> toJson() {
    return {'rewards': rewards.map((e) => e.toJson()).toList()};
  }

  factory ValidatorOutstandingRewards.fromJson(Map<String, dynamic> json) {
    return ValidatorOutstandingRewards(
      rewards:
          (json.valueEnsureAsList<dynamic>('rewards', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<DecPool, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => DecPool.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory ValidatorOutstandingRewards.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ValidatorOutstandingRewards(
      rewards:
          decode.getListOfBytes(1).map((b) => DecPool.deserialize(b)).toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaDistributionV1ValidatorOutstandingRewards;
}

/// ValidatorSlashEvent represents a validator slash event.
/// Height is implicit within the store key.
/// This is needed to calculate appropriate amount of staking tokens
/// for delegations which are withdrawn after a slash has occurred.
class ValidatorSlashEvent extends CosmosProtoMessage {
  final BigInt? validatorPeriod;

  final List<cosmos_base_v1beta1_coin.DecCoin> fractions;

  const ValidatorSlashEvent({this.validatorPeriod, this.fractions = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [validatorPeriod, fractions];

  @override
  Map<String, dynamic> toJson() {
    return {
      'validator_period': validatorPeriod?.toString(),
      'fractions': fractions.map((e) => e.toJson()).toList(),
    };
  }

  factory ValidatorSlashEvent.fromJson(Map<String, dynamic> json) {
    return ValidatorSlashEvent(
      validatorPeriod: json.valueAsBigInt<BigInt?>(
        'validator_period',
        acceptCamelCase: true,
      ),
      fractions:
          (json.valueEnsureAsList<dynamic>('fractions', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.DecCoin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.DecCoin.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory ValidatorSlashEvent.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ValidatorSlashEvent(
      validatorPeriod: decode.getBigInt<BigInt?>(1),
      fractions:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.DecCoin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaDistributionV1ValidatorSlashEvent;
}

/// DelegationDelegatorReward represents the properties
/// of a delegator's delegation reward.
class DelegationDelegatorReward extends CosmosProtoMessage {
  final String? validatorAddress;

  final List<DecPool> reward;

  const DelegationDelegatorReward({
    this.validatorAddress,
    this.reward = const [],
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
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [validatorAddress, reward];

  @override
  Map<String, dynamic> toJson() {
    return {
      'validator_address': validatorAddress,
      'reward': reward.map((e) => e.toJson()).toList(),
    };
  }

  factory DelegationDelegatorReward.fromJson(Map<String, dynamic> json) {
    return DelegationDelegatorReward(
      validatorAddress: json.valueAsString<String?>(
        'validator_address',
        acceptCamelCase: true,
      ),
      reward:
          (json.valueEnsureAsList<dynamic>('reward', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<DecPool, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => DecPool.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory DelegationDelegatorReward.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DelegationDelegatorReward(
      validatorAddress: decode.getString<String?>(1),
      reward:
          decode.getListOfBytes(2).map((b) => DecPool.deserialize(b)).toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaDistributionV1DelegationDelegatorReward;
}
