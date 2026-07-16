import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/osmosis/valsetpref/v1beta1/src/state.dart"
    as osmosis_valsetpref_v1beta1_state;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

/// MsgCreateValidatorSetPreference is a list that holds validator-set.
class MsgSetValidatorSetPreference extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSetValidatorSetPreferenceResponse>,
        ICosmosProtoAminoMessage {
  /// delegator is the user who is trying to create a validator-set.
  final String? delegator;

  /// list of {valAddr, weight} to delegate to
  final List<osmosis_valsetpref_v1beta1_state.ValidatorPreference> preferences;

  const MsgSetValidatorSetPreference({
    this.delegator,
    this.preferences = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/MsgSetValidatorSetPreference",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "delegator"),
      ],
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
  List<Object?> get protoValues => [delegator, preferences];

  @override
  Map<String, dynamic> toJson() {
    return {
      'delegator': delegator,
      'preferences': preferences.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgSetValidatorSetPreference.fromJson(Map<String, dynamic> json) {
    return MsgSetValidatorSetPreference(
      delegator: json.valueAsString<String?>(
        'delegator',
        acceptCamelCase: true,
      ),
      preferences:
          (json.valueEnsureAsList<dynamic>(
                'preferences',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_valsetpref_v1beta1_state.ValidatorPreference,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => osmosis_valsetpref_v1beta1_state
                          .ValidatorPreference.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory MsgSetValidatorSetPreference.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSetValidatorSetPreference(
      delegator: decode.getString<String?>(1),
      preferences:
          decode
              .getListOfBytes(2)
              .map(
                (b) => osmosis_valsetpref_v1beta1_state
                    .ValidatorPreference.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisValsetprefV1beta1MsgSetValidatorSetPreference;
  @override
  MsgSetValidatorSetPreferenceResponse onServiceResponse(List<int> bytes) {
    return MsgSetValidatorSetPreferenceResponse.deserialize(bytes);
  }

  @override
  MsgSetValidatorSetPreferenceResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgSetValidatorSetPreferenceResponse.fromJson(json);
  }
}

class MsgSetValidatorSetPreferenceResponse extends CosmosProtoMessage {
  const MsgSetValidatorSetPreferenceResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgSetValidatorSetPreferenceResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgSetValidatorSetPreferenceResponse();
  }

  factory MsgSetValidatorSetPreferenceResponse.deserialize(List<int> bytes) {
    return MsgSetValidatorSetPreferenceResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisValsetprefV1beta1MsgSetValidatorSetPreferenceResponse;
}

/// MsgDelegateToValidatorSet allows users to delegate to an existing
/// validator-set
class MsgDelegateToValidatorSet extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgDelegateToValidatorSetResponse>,
        ICosmosProtoAminoMessage {
  /// delegator is the user who is trying to delegate.
  final String? delegator;

  /// the amount of tokens the user is trying to delegate.
  /// For ex: delegate 10osmo with validator-set {ValA -&gt; 0.5, ValB -&gt; 0.3, ValC
  /// -&gt; 0.2} our staking logic would attempt to delegate 5osmo to A , 3osmo to
  /// B, 2osmo to C.
  final cosmos_base_v1beta1_coin.Coin? coin;

  const MsgDelegateToValidatorSet({this.delegator, this.coin});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/MsgDelegateToValidatorSet",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "delegator"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [delegator, coin];

  @override
  Map<String, dynamic> toJson() {
    return {'delegator': delegator, 'coin': coin?.toJson()};
  }

  factory MsgDelegateToValidatorSet.fromJson(Map<String, dynamic> json) {
    return MsgDelegateToValidatorSet(
      delegator: json.valueAsString<String?>(
        'delegator',
        acceptCamelCase: true,
      ),
      coin: json.valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
        key: 'coin',
        parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgDelegateToValidatorSet.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgDelegateToValidatorSet(
      delegator: decode.getString<String?>(1),
      coin: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        2,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisValsetprefV1beta1MsgDelegateToValidatorSet;
  @override
  MsgDelegateToValidatorSetResponse onServiceResponse(List<int> bytes) {
    return MsgDelegateToValidatorSetResponse.deserialize(bytes);
  }

  @override
  MsgDelegateToValidatorSetResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgDelegateToValidatorSetResponse.fromJson(json);
  }
}

class MsgDelegateToValidatorSetResponse extends CosmosProtoMessage {
  const MsgDelegateToValidatorSetResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgDelegateToValidatorSetResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgDelegateToValidatorSetResponse();
  }

  factory MsgDelegateToValidatorSetResponse.deserialize(List<int> bytes) {
    return MsgDelegateToValidatorSetResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisValsetprefV1beta1MsgDelegateToValidatorSetResponse;
}

class MsgUndelegateFromValidatorSet extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUndelegateFromValidatorSetResponse>,
        ICosmosProtoAminoMessage {
  /// delegator is the user who is trying to undelegate.
  final String? delegator;

  /// the amount the user wants to undelegate
  /// For ex: Undelegate 10osmo with validator-set {ValA -&gt; 0.5, ValB -&gt; 0.3,
  /// ValC
  /// -&gt; 0.2} our undelegate logic would attempt to undelegate 5osmo from A ,
  /// 3osmo from B, 2osmo from C
  final cosmos_base_v1beta1_coin.Coin? coin;

  const MsgUndelegateFromValidatorSet({this.delegator, this.coin});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/MsgUndelegateFromValidatorSet",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "delegator"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [delegator, coin];

  @override
  Map<String, dynamic> toJson() {
    return {'delegator': delegator, 'coin': coin?.toJson()};
  }

  factory MsgUndelegateFromValidatorSet.fromJson(Map<String, dynamic> json) {
    return MsgUndelegateFromValidatorSet(
      delegator: json.valueAsString<String?>(
        'delegator',
        acceptCamelCase: true,
      ),
      coin: json.valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
        key: 'coin',
        parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUndelegateFromValidatorSet.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUndelegateFromValidatorSet(
      delegator: decode.getString<String?>(1),
      coin: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        3,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisValsetprefV1beta1MsgUndelegateFromValidatorSet;
  @override
  MsgUndelegateFromValidatorSetResponse onServiceResponse(List<int> bytes) {
    return MsgUndelegateFromValidatorSetResponse.deserialize(bytes);
  }

  @override
  MsgUndelegateFromValidatorSetResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUndelegateFromValidatorSetResponse.fromJson(json);
  }
}

class MsgUndelegateFromValidatorSetResponse extends CosmosProtoMessage {
  const MsgUndelegateFromValidatorSetResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgUndelegateFromValidatorSetResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgUndelegateFromValidatorSetResponse();
  }

  factory MsgUndelegateFromValidatorSetResponse.deserialize(List<int> bytes) {
    return MsgUndelegateFromValidatorSetResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisValsetprefV1beta1MsgUndelegateFromValidatorSetResponse;
}

class MsgUndelegateFromRebalancedValidatorSet extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<
          MsgUndelegateFromRebalancedValidatorSetResponse
        >,
        ICosmosProtoAminoMessage {
  /// delegator is the user who is trying to undelegate.
  final String? delegator;

  /// the amount the user wants to undelegate
  /// For ex: Undelegate 50 osmo with validator-set {ValA -&gt; 0.5, ValB -&gt; 0.5}
  /// Our undelegate logic would first check the current delegation balance.
  /// If the user has 90 osmo delegated to ValA and 10 osmo delegated to ValB,
  /// the rebalanced validator set would be {ValA -&gt; 0.9, ValB -&gt; 0.1}
  /// So now the 45 osmo would be undelegated from ValA and 5 osmo would be
  /// undelegated from ValB.
  final cosmos_base_v1beta1_coin.Coin? coin;

  const MsgUndelegateFromRebalancedValidatorSet({this.delegator, this.coin});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/MsgUndelegateFromRebalValset",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "delegator"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [delegator, coin];

  @override
  Map<String, dynamic> toJson() {
    return {'delegator': delegator, 'coin': coin?.toJson()};
  }

  factory MsgUndelegateFromRebalancedValidatorSet.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgUndelegateFromRebalancedValidatorSet(
      delegator: json.valueAsString<String?>(
        'delegator',
        acceptCamelCase: true,
      ),
      coin: json.valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
        key: 'coin',
        parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUndelegateFromRebalancedValidatorSet.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUndelegateFromRebalancedValidatorSet(
      delegator: decode.getString<String?>(1),
      coin: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        2,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisValsetprefV1beta1MsgUndelegateFromRebalancedValidatorSet;
  @override
  MsgUndelegateFromRebalancedValidatorSetResponse onServiceResponse(
    List<int> bytes,
  ) {
    return MsgUndelegateFromRebalancedValidatorSetResponse.deserialize(bytes);
  }

  @override
  MsgUndelegateFromRebalancedValidatorSetResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUndelegateFromRebalancedValidatorSetResponse.fromJson(json);
  }
}

class MsgUndelegateFromRebalancedValidatorSetResponse
    extends CosmosProtoMessage {
  const MsgUndelegateFromRebalancedValidatorSetResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgUndelegateFromRebalancedValidatorSetResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgUndelegateFromRebalancedValidatorSetResponse();
  }

  factory MsgUndelegateFromRebalancedValidatorSetResponse.deserialize(
    List<int> bytes,
  ) {
    return MsgUndelegateFromRebalancedValidatorSetResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisValsetprefV1beta1MsgUndelegateFromRebalancedValidatorSetResponse;
}

class MsgRedelegateValidatorSet extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRedelegateValidatorSetResponse>,
        ICosmosProtoAminoMessage {
  /// delegator is the user who is trying to create a validator-set.
  final String? delegator;

  /// list of {valAddr, weight} to delegate to
  final List<osmosis_valsetpref_v1beta1_state.ValidatorPreference> preferences;

  const MsgRedelegateValidatorSet({
    this.delegator,
    this.preferences = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/MsgRedelegateValidatorSet",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "delegator"),
      ],
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
  List<Object?> get protoValues => [delegator, preferences];

  @override
  Map<String, dynamic> toJson() {
    return {
      'delegator': delegator,
      'preferences': preferences.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgRedelegateValidatorSet.fromJson(Map<String, dynamic> json) {
    return MsgRedelegateValidatorSet(
      delegator: json.valueAsString<String?>(
        'delegator',
        acceptCamelCase: true,
      ),
      preferences:
          (json.valueEnsureAsList<dynamic>(
                'preferences',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_valsetpref_v1beta1_state.ValidatorPreference,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => osmosis_valsetpref_v1beta1_state
                          .ValidatorPreference.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory MsgRedelegateValidatorSet.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRedelegateValidatorSet(
      delegator: decode.getString<String?>(1),
      preferences:
          decode
              .getListOfBytes(2)
              .map(
                (b) => osmosis_valsetpref_v1beta1_state
                    .ValidatorPreference.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisValsetprefV1beta1MsgRedelegateValidatorSet;
  @override
  MsgRedelegateValidatorSetResponse onServiceResponse(List<int> bytes) {
    return MsgRedelegateValidatorSetResponse.deserialize(bytes);
  }

  @override
  MsgRedelegateValidatorSetResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgRedelegateValidatorSetResponse.fromJson(json);
  }
}

class MsgRedelegateValidatorSetResponse extends CosmosProtoMessage {
  const MsgRedelegateValidatorSetResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgRedelegateValidatorSetResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgRedelegateValidatorSetResponse();
  }

  factory MsgRedelegateValidatorSetResponse.deserialize(List<int> bytes) {
    return MsgRedelegateValidatorSetResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisValsetprefV1beta1MsgRedelegateValidatorSetResponse;
}

/// MsgWithdrawDelegationRewards allows user to claim staking rewards from the
/// validator set.
class MsgWithdrawDelegationRewards extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgWithdrawDelegationRewardsResponse>,
        ICosmosProtoAminoMessage {
  /// delegator is the user who is trying to claim staking rewards.
  final String? delegator;

  const MsgWithdrawDelegationRewards({this.delegator});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/MsgWithdrawDelegationRewards",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "delegator"),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [delegator];

  @override
  Map<String, dynamic> toJson() {
    return {'delegator': delegator};
  }

  factory MsgWithdrawDelegationRewards.fromJson(Map<String, dynamic> json) {
    return MsgWithdrawDelegationRewards(
      delegator: json.valueAsString<String?>(
        'delegator',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgWithdrawDelegationRewards.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgWithdrawDelegationRewards(
      delegator: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisValsetprefV1beta1MsgWithdrawDelegationRewards;
  @override
  MsgWithdrawDelegationRewardsResponse onServiceResponse(List<int> bytes) {
    return MsgWithdrawDelegationRewardsResponse.deserialize(bytes);
  }

  @override
  MsgWithdrawDelegationRewardsResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgWithdrawDelegationRewardsResponse.fromJson(json);
  }
}

class MsgWithdrawDelegationRewardsResponse extends CosmosProtoMessage {
  const MsgWithdrawDelegationRewardsResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgWithdrawDelegationRewardsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgWithdrawDelegationRewardsResponse();
  }

  factory MsgWithdrawDelegationRewardsResponse.deserialize(List<int> bytes) {
    return MsgWithdrawDelegationRewardsResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisValsetprefV1beta1MsgWithdrawDelegationRewardsResponse;
}

/// MsgDelegateBondedTokens breaks bonded lockup (by ID) of osmo, of
/// length &lt;= 2 weeks and takes all that osmo and delegates according to
/// delegator's current validator set preference.
class MsgDelegateBondedTokens extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgDelegateBondedTokensResponse>,
        ICosmosProtoAminoMessage {
  /// delegator is the user who is trying to force unbond osmo and delegate.
  final String? delegator;

  /// lockup id of osmo in the pool
  final BigInt? lockID;

  const MsgDelegateBondedTokens({this.delegator, this.lockID});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/MsgDelegateBondedTokens",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "delegator"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [delegator, lockID];

  @override
  Map<String, dynamic> toJson() {
    return {'delegator': delegator, 'lockID': lockID?.toString()};
  }

  factory MsgDelegateBondedTokens.fromJson(Map<String, dynamic> json) {
    return MsgDelegateBondedTokens(
      delegator: json.valueAsString<String?>(
        'delegator',
        acceptCamelCase: true,
      ),
      lockID: json.valueAsBigInt<BigInt?>('lockID', acceptCamelCase: true),
    );
  }

  factory MsgDelegateBondedTokens.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgDelegateBondedTokens(
      delegator: decode.getString<String?>(1),
      lockID: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisValsetprefV1beta1MsgDelegateBondedTokens;
  @override
  MsgDelegateBondedTokensResponse onServiceResponse(List<int> bytes) {
    return MsgDelegateBondedTokensResponse.deserialize(bytes);
  }

  @override
  MsgDelegateBondedTokensResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgDelegateBondedTokensResponse.fromJson(json);
  }
}

class MsgDelegateBondedTokensResponse extends CosmosProtoMessage {
  const MsgDelegateBondedTokensResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgDelegateBondedTokensResponse.fromJson(Map<String, dynamic> json) {
    return MsgDelegateBondedTokensResponse();
  }

  factory MsgDelegateBondedTokensResponse.deserialize(List<int> bytes) {
    return MsgDelegateBondedTokensResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisValsetprefV1beta1MsgDelegateBondedTokensResponse;
}
