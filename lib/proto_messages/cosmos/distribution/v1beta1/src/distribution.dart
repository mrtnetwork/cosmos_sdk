import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

/// Params defines the set of params for the distribution module.
class Params extends CosmosProtoMessage {
  final String? communityTax;

  /// Deprecated: The base_proposer_reward field is deprecated and is no longer used
  /// in the x/distribution module's reward mechanism.
  final String? baseProposerReward;

  /// Deprecated: The bonus_proposer_reward field is deprecated and is no longer used
  /// in the x/distribution module's reward mechanism.
  final String? bonusProposerReward;

  final bool? withdrawAddrEnabled;

  const Params({
    this.communityTax,
    this.baseProposerReward,
    this.bonusProposerReward,
    this.withdrawAddrEnabled,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/x/distribution/Params",
        ),
      ],
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
          options: [
            ProtoOptionBool(name: "amino.dont_omitempty", value: true),
            ProtoOptionBool(name: "deprecated", value: true),
          ],
        ),
        ProtoFieldConfig.bool(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    communityTax,
    baseProposerReward,
    bonusProposerReward,
    withdrawAddrEnabled,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'community_tax': communityTax,
      'base_proposer_reward': baseProposerReward,
      'bonus_proposer_reward': bonusProposerReward,
      'withdraw_addr_enabled': withdrawAddrEnabled,
    };
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      communityTax: json.valueAsString<String?>(
        'community_tax',
        acceptCamelCase: true,
      ),
      baseProposerReward: json.valueAsString<String?>(
        'base_proposer_reward',
        acceptCamelCase: true,
      ),
      bonusProposerReward: json.valueAsString<String?>(
        'bonus_proposer_reward',
        acceptCamelCase: true,
      ),
      withdrawAddrEnabled: json.valueAsBool<bool?>(
        'withdraw_addr_enabled',
        acceptCamelCase: true,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      communityTax: decode.getString<String?>(1),
      baseProposerReward: decode.getString<String?>(2),
      bonusProposerReward: decode.getString<String?>(3),
      withdrawAddrEnabled: decode.getBool<bool?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosDistributionV1beta1Params;
}

/// ValidatorHistoricalRewards represents historical rewards for a validator.
/// Height is implicit within the store key.
/// Cumulative reward ratio is the sum from the zeroeth period
/// until this period of rewards / tokens, per the spec.
/// The reference count indicates the number of objects
/// which might need to reference this historical entry at any point.
/// ReferenceCount =
/// number of outstanding delegations which ended the associated period (and
/// might need to read that record)
/// + number of slashes which ended the associated period (and might need to
/// read that record)
/// + one per validator for the zeroeth period, set on initialization
class ValidatorHistoricalRewards extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.DecCoin> cumulativeRewardRatio;

  final int? referenceCount;

  const ValidatorHistoricalRewards({
    this.cumulativeRewardRatio = const [],
    this.referenceCount,
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
        ProtoFieldConfig.uint32(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [cumulativeRewardRatio, referenceCount];

  @override
  Map<String, dynamic> toJson() {
    return {
      'cumulative_reward_ratio':
          cumulativeRewardRatio.map((e) => e.toJson()).toList(),
      'reference_count': referenceCount,
    };
  }

  factory ValidatorHistoricalRewards.fromJson(Map<String, dynamic> json) {
    return ValidatorHistoricalRewards(
      cumulativeRewardRatio:
          (json.valueEnsureAsList<dynamic>(
                'cumulative_reward_ratio',
                acceptCamelCase: true,
              ))
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
      referenceCount: json.valueAsInt<int?>(
        'reference_count',
        acceptCamelCase: true,
      ),
    );
  }

  factory ValidatorHistoricalRewards.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ValidatorHistoricalRewards(
      cumulativeRewardRatio:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.DecCoin.deserialize(b))
              .toList(),
      referenceCount: decode.getInt<int?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosDistributionV1beta1ValidatorHistoricalRewards;
}

/// ValidatorCurrentRewards represents current rewards and current
/// period for a validator kept as a running counter and incremented
/// each block as long as the validator's tokens remain constant.
class ValidatorCurrentRewards extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.DecCoin> rewards;

  final BigInt? period;

  const ValidatorCurrentRewards({this.rewards = const [], this.period});

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
        ProtoFieldConfig.uint64(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [rewards, period];

  @override
  Map<String, dynamic> toJson() {
    return {
      'rewards': rewards.map((e) => e.toJson()).toList(),
      'period': period?.toString(),
    };
  }

  factory ValidatorCurrentRewards.fromJson(Map<String, dynamic> json) {
    return ValidatorCurrentRewards(
      rewards:
          (json.valueEnsureAsList<dynamic>('rewards', acceptCamelCase: true))
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
      period: json.valueAsBigInt<BigInt?>('period', acceptCamelCase: true),
    );
  }

  factory ValidatorCurrentRewards.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ValidatorCurrentRewards(
      rewards:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.DecCoin.deserialize(b))
              .toList(),
      period: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosDistributionV1beta1ValidatorCurrentRewards;
}

/// ValidatorAccumulatedCommission represents accumulated commission
/// for a validator kept as a running counter, can be withdrawn at any time.
class ValidatorAccumulatedCommission extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.DecCoin> commission;

  const ValidatorAccumulatedCommission({this.commission = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [commission];

  @override
  Map<String, dynamic> toJson() {
    return {'commission': commission.map((e) => e.toJson()).toList()};
  }

  factory ValidatorAccumulatedCommission.fromJson(Map<String, dynamic> json) {
    return ValidatorAccumulatedCommission(
      commission:
          (json.valueEnsureAsList<dynamic>('commission', acceptCamelCase: true))
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

  factory ValidatorAccumulatedCommission.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ValidatorAccumulatedCommission(
      commission:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.DecCoin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosDistributionV1beta1ValidatorAccumulatedCommission;
}

/// ValidatorOutstandingRewards represents outstanding (un-withdrawn) rewards
/// for a validator inexpensive to track, allows simple sanity checks.
class ValidatorOutstandingRewards extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.DecCoin> rewards;

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
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
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

  factory ValidatorOutstandingRewards.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ValidatorOutstandingRewards(
      rewards:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.DecCoin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosDistributionV1beta1ValidatorOutstandingRewards;
}

/// ValidatorSlashEvent represents a validator slash event.
/// Height is implicit within the store key.
/// This is needed to calculate appropriate amount of staking tokens
/// for delegations which are withdrawn after a slash has occurred.
class ValidatorSlashEvent extends CosmosProtoMessage {
  final BigInt? validatorPeriod;

  final String? fraction;

  const ValidatorSlashEvent({this.validatorPeriod, this.fraction});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [validatorPeriod, fraction];

  @override
  Map<String, dynamic> toJson() {
    return {
      'validator_period': validatorPeriod?.toString(),
      'fraction': fraction,
    };
  }

  factory ValidatorSlashEvent.fromJson(Map<String, dynamic> json) {
    return ValidatorSlashEvent(
      validatorPeriod: json.valueAsBigInt<BigInt?>(
        'validator_period',
        acceptCamelCase: true,
      ),
      fraction: json.valueAsString<String?>('fraction', acceptCamelCase: true),
    );
  }

  factory ValidatorSlashEvent.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ValidatorSlashEvent(
      validatorPeriod: decode.getBigInt<BigInt?>(1),
      fraction: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosDistributionV1beta1ValidatorSlashEvent;
}

/// CommunityPoolSpendProposal details a proposal for use of community funds,
/// together with how many coins are proposed to be spent, and to which
/// recipient account.
///
/// Deprecated: Do not use. As of the Cosmos SDK release v0.47.x, there is no
/// longer a need for an explicit CommunityPoolSpendProposal. To spend community
/// pool funds, a simple MsgCommunityPoolSpend can be invoked from the x/gov
/// module via a v1 governance proposal.
class CommunityPoolSpendProposal extends CosmosProtoMessage {
  final String? title;

  final String? description;

  final String? recipient;

  final List<cosmos_base_v1beta1_coin.Coin> amount;

  const CommunityPoolSpendProposal({
    this.title,
    this.description,
    this.recipient,
    this.amount = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [ProtoOptionBool(name: "deprecated", value: true)],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
          options: [
            ProtoOptionBool(name: "amino.dont_omitempty", value: true),
            ProtoOptionString(name: "amino.encoding", value: "legacy_coins"),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [title, description, recipient, amount];

  @override
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'recipient': recipient,
      'amount': amount.map((e) => e.toJson()).toList(),
    };
  }

  factory CommunityPoolSpendProposal.fromJson(Map<String, dynamic> json) {
    return CommunityPoolSpendProposal(
      title: json.valueAsString<String?>('title', acceptCamelCase: true),
      description: json.valueAsString<String?>(
        'description',
        acceptCamelCase: true,
      ),
      recipient: json.valueAsString<String?>(
        'recipient',
        acceptCamelCase: true,
      ),
      amount:
          (json.valueEnsureAsList<dynamic>('amount', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.Coin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory CommunityPoolSpendProposal.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return CommunityPoolSpendProposal(
      title: decode.getString<String?>(1),
      description: decode.getString<String?>(2),
      recipient: decode.getString<String?>(3),
      amount:
          decode
              .getListOfBytes(4)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosDistributionV1beta1CommunityPoolSpendProposal;
}

/// DelegatorStartingInfo represents the starting info for a delegator reward
/// period. It tracks the previous validator period, the delegation's amount of
/// staking token, and the creation height (to check later on if any slashes have
/// occurred). NOTE: Even though validators are slashed to whole staking tokens,
/// the delegators within the validator may be left with less than a full token,
/// thus sdk.Dec is used.
class DelegatorStartingInfo extends CosmosProtoMessage {
  final BigInt? previousPeriod;

  final String? stake;

  final BigInt? height;

  const DelegatorStartingInfo({this.previousPeriod, this.stake, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.string(
          2,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.uint64(
          3,
          options: [
            ProtoOptionString(
              name: "amino.field_name",
              value: "creation_height",
            ),
            ProtoOptionBool(name: "amino.dont_omitempty", value: true),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [previousPeriod, stake, height];

  @override
  Map<String, dynamic> toJson() {
    return {
      'previous_period': previousPeriod?.toString(),
      'stake': stake,
      'height': height?.toString(),
    };
  }

  factory DelegatorStartingInfo.fromJson(Map<String, dynamic> json) {
    return DelegatorStartingInfo(
      previousPeriod: json.valueAsBigInt<BigInt?>(
        'previous_period',
        acceptCamelCase: true,
      ),
      stake: json.valueAsString<String?>('stake', acceptCamelCase: true),
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
    );
  }

  factory DelegatorStartingInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DelegatorStartingInfo(
      previousPeriod: decode.getBigInt<BigInt?>(1),
      stake: decode.getString<String?>(2),
      height: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosDistributionV1beta1DelegatorStartingInfo;
}

/// DelegationDelegatorReward represents the properties
/// of a delegator's delegation reward.
class DelegationDelegatorReward extends CosmosProtoMessage {
  final String? validatorAddress;

  final List<cosmos_base_v1beta1_coin.DecCoin> reward;

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
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
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

  factory DelegationDelegatorReward.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DelegationDelegatorReward(
      validatorAddress: decode.getString<String?>(1),
      reward:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.DecCoin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosDistributionV1beta1DelegationDelegatorReward;
}
