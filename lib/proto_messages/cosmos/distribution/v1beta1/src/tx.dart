import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/cosmos/distribution/v1beta1/src/distribution.dart"
    as cosmos_distribution_v1beta1_distribution;

/// MsgSetWithdrawAddress sets the withdraw address for
/// a delegator (or validator self-delegation).
class MsgSetWithdrawAddress extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSetWithdrawAddressResponse>,
        ICosmosProtoAminoMessage {
  final String? delegatorAddress;

  final String? withdrawAddress;

  const MsgSetWithdrawAddress({this.delegatorAddress, this.withdrawAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "cosmos.msg.v1.signer",
          value: "delegator_address",
        ),
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/MsgModifyWithdrawAddress",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [delegatorAddress, withdrawAddress];

  @override
  Map<String, dynamic> toJson() {
    return {
      'delegator_address': delegatorAddress,
      'withdraw_address': withdrawAddress,
    };
  }

  factory MsgSetWithdrawAddress.fromJson(Map<String, dynamic> json) {
    return MsgSetWithdrawAddress(
      delegatorAddress: json.valueAsString<String?>(
        'delegator_address',
        acceptCamelCase: true,
      ),
      withdrawAddress: json.valueAsString<String?>(
        'withdraw_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgSetWithdrawAddress.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSetWithdrawAddress(
      delegatorAddress: decode.getString<String?>(1),
      withdrawAddress: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosDistributionV1beta1MsgSetWithdrawAddress;
  @override
  MsgSetWithdrawAddressResponse onServiceResponse(List<int> bytes) {
    return MsgSetWithdrawAddressResponse.deserialize(bytes);
  }

  @override
  MsgSetWithdrawAddressResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgSetWithdrawAddressResponse.fromJson(json);
  }
}

/// MsgSetWithdrawAddressResponse defines the Msg/SetWithdrawAddress response
/// type.
class MsgSetWithdrawAddressResponse extends CosmosProtoMessage {
  const MsgSetWithdrawAddressResponse();

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

  factory MsgSetWithdrawAddressResponse.fromJson(Map<String, dynamic> json) {
    return MsgSetWithdrawAddressResponse();
  }

  factory MsgSetWithdrawAddressResponse.deserialize(List<int> bytes) {
    return MsgSetWithdrawAddressResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosDistributionV1beta1MsgSetWithdrawAddressResponse;
}

/// MsgWithdrawDelegatorReward represents delegation withdrawal to a delegator
/// from a single validator.
class MsgWithdrawDelegatorReward extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgWithdrawDelegatorRewardResponse>,
        ICosmosProtoAminoMessage {
  final String? delegatorAddress;

  final String? validatorAddress;

  const MsgWithdrawDelegatorReward({
    this.delegatorAddress,
    this.validatorAddress,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "cosmos.msg.v1.signer",
          value: "delegator_address",
        ),
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/MsgWithdrawDelegationReward",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [delegatorAddress, validatorAddress];

  @override
  Map<String, dynamic> toJson() {
    return {
      'delegator_address': delegatorAddress,
      'validator_address': validatorAddress,
    };
  }

  factory MsgWithdrawDelegatorReward.fromJson(Map<String, dynamic> json) {
    return MsgWithdrawDelegatorReward(
      delegatorAddress: json.valueAsString<String?>(
        'delegator_address',
        acceptCamelCase: true,
      ),
      validatorAddress: json.valueAsString<String?>(
        'validator_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgWithdrawDelegatorReward.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgWithdrawDelegatorReward(
      delegatorAddress: decode.getString<String?>(1),
      validatorAddress: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosDistributionV1beta1MsgWithdrawDelegatorReward;
  @override
  MsgWithdrawDelegatorRewardResponse onServiceResponse(List<int> bytes) {
    return MsgWithdrawDelegatorRewardResponse.deserialize(bytes);
  }

  @override
  MsgWithdrawDelegatorRewardResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgWithdrawDelegatorRewardResponse.fromJson(json);
  }
}

/// MsgWithdrawDelegatorRewardResponse defines the Msg/WithdrawDelegatorReward
/// response type.
class MsgWithdrawDelegatorRewardResponse extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> amount;

  const MsgWithdrawDelegatorRewardResponse({this.amount = const []});

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
          options: [
            ProtoOptionBool(name: "amino.dont_omitempty", value: true),
            ProtoOptionString(name: "amino.encoding", value: "legacy_coins"),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [amount];

  @override
  Map<String, dynamic> toJson() {
    return {'amount': amount.map((e) => e.toJson()).toList()};
  }

  factory MsgWithdrawDelegatorRewardResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgWithdrawDelegatorRewardResponse(
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

  factory MsgWithdrawDelegatorRewardResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgWithdrawDelegatorRewardResponse(
      amount:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosDistributionV1beta1MsgWithdrawDelegatorRewardResponse;
}

/// MsgWithdrawValidatorCommission withdraws the full commission to the validator
/// address.
class MsgWithdrawValidatorCommission extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgWithdrawValidatorCommissionResponse>,
        ICosmosProtoAminoMessage {
  final String? validatorAddress;

  const MsgWithdrawValidatorCommission({this.validatorAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "cosmos.msg.v1.signer",
          value: "validator_address",
        ),
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/MsgWithdrawValCommission",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [validatorAddress];

  @override
  Map<String, dynamic> toJson() {
    return {'validator_address': validatorAddress};
  }

  factory MsgWithdrawValidatorCommission.fromJson(Map<String, dynamic> json) {
    return MsgWithdrawValidatorCommission(
      validatorAddress: json.valueAsString<String?>(
        'validator_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgWithdrawValidatorCommission.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgWithdrawValidatorCommission(
      validatorAddress: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosDistributionV1beta1MsgWithdrawValidatorCommission;
  @override
  MsgWithdrawValidatorCommissionResponse onServiceResponse(List<int> bytes) {
    return MsgWithdrawValidatorCommissionResponse.deserialize(bytes);
  }

  @override
  MsgWithdrawValidatorCommissionResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgWithdrawValidatorCommissionResponse.fromJson(json);
  }
}

/// MsgWithdrawValidatorCommissionResponse defines the
/// Msg/WithdrawValidatorCommission response type.
class MsgWithdrawValidatorCommissionResponse extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> amount;

  const MsgWithdrawValidatorCommissionResponse({this.amount = const []});

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
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.46",
            ),
            ProtoOptionBool(name: "amino.dont_omitempty", value: true),
            ProtoOptionString(name: "amino.encoding", value: "legacy_coins"),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [amount];

  @override
  Map<String, dynamic> toJson() {
    return {'amount': amount.map((e) => e.toJson()).toList()};
  }

  factory MsgWithdrawValidatorCommissionResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgWithdrawValidatorCommissionResponse(
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

  factory MsgWithdrawValidatorCommissionResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgWithdrawValidatorCommissionResponse(
      amount:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosDistributionV1beta1MsgWithdrawValidatorCommissionResponse;
}

/// MsgFundCommunityPool allows an account to directly
/// fund the community pool.
class MsgFundCommunityPool extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgFundCommunityPoolResponse>,
        ICosmosProtoAminoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> amount;

  final String? depositor;

  const MsgFundCommunityPool({this.amount = const [], this.depositor});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "depositor"),
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/MsgFundCommunityPool",
        ),
      ],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
          options: [
            ProtoOptionBool(name: "amino.dont_omitempty", value: true),
            ProtoOptionString(name: "amino.encoding", value: "legacy_coins"),
          ],
        ),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [amount, depositor];

  @override
  Map<String, dynamic> toJson() {
    return {
      'amount': amount.map((e) => e.toJson()).toList(),
      'depositor': depositor,
    };
  }

  factory MsgFundCommunityPool.fromJson(Map<String, dynamic> json) {
    return MsgFundCommunityPool(
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
      depositor: json.valueAsString<String?>(
        'depositor',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgFundCommunityPool.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgFundCommunityPool(
      amount:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      depositor: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosDistributionV1beta1MsgFundCommunityPool;
  @override
  MsgFundCommunityPoolResponse onServiceResponse(List<int> bytes) {
    return MsgFundCommunityPoolResponse.deserialize(bytes);
  }

  @override
  MsgFundCommunityPoolResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgFundCommunityPoolResponse.fromJson(json);
  }
}

/// MsgFundCommunityPoolResponse defines the Msg/FundCommunityPool response type.
class MsgFundCommunityPoolResponse extends CosmosProtoMessage {
  const MsgFundCommunityPoolResponse();

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

  factory MsgFundCommunityPoolResponse.fromJson(Map<String, dynamic> json) {
    return MsgFundCommunityPoolResponse();
  }

  factory MsgFundCommunityPoolResponse.deserialize(List<int> bytes) {
    return MsgFundCommunityPoolResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosDistributionV1beta1MsgFundCommunityPoolResponse;
}

/// MsgUpdateParams is the Msg/UpdateParams request type.
class MsgUpdateParams extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateParamsResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten).
  final String? authority;

  /// params defines the x/distribution parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final cosmos_distribution_v1beta1_distribution.Params? params;

  const MsgUpdateParams({this.authority, this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/distribution/MsgUpdateParams",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(
          2,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, params];

  @override
  Map<String, dynamic> toJson() {
    return {'authority': authority, 'params': params?.toJson()};
  }

  factory MsgUpdateParams.fromJson(Map<String, dynamic> json) {
    return MsgUpdateParams(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      params: json.valueTo<
        cosmos_distribution_v1beta1_distribution.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse:
            (v) => cosmos_distribution_v1beta1_distribution.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      authority: decode.getString<String?>(1),
      params: decode
          .messageTo<cosmos_distribution_v1beta1_distribution.Params?>(
            2,
            (b) =>
                cosmos_distribution_v1beta1_distribution.Params.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosDistributionV1beta1MsgUpdateParams;
  @override
  MsgUpdateParamsResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateParamsResponse.deserialize(bytes);
  }

  @override
  MsgUpdateParamsResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateParamsResponse.fromJson(json);
  }
}

/// MsgUpdateParamsResponse defines the response structure for executing a
/// MsgUpdateParams message.
class MsgUpdateParamsResponse extends CosmosProtoMessage {
  const MsgUpdateParamsResponse();

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

  factory MsgUpdateParamsResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateParamsResponse();
  }

  factory MsgUpdateParamsResponse.deserialize(List<int> bytes) {
    return MsgUpdateParamsResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosDistributionV1beta1MsgUpdateParamsResponse;
}

/// MsgCommunityPoolSpend defines a message for sending tokens from the community
/// pool to another account. This message is typically executed via a governance
/// proposal with the governance module being the executing authority.
class MsgCommunityPoolSpend extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCommunityPoolSpendResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten).
  final String? authority;

  final String? recipient;

  final List<cosmos_base_v1beta1_coin.Coin> amount;

  const MsgCommunityPoolSpend({
    this.authority,
    this.recipient,
    this.amount = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/distr/MsgCommunityPoolSpend",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
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
  List<Object?> get protoValues => [authority, recipient, amount];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'recipient': recipient,
      'amount': amount.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgCommunityPoolSpend.fromJson(Map<String, dynamic> json) {
    return MsgCommunityPoolSpend(
      authority: json.valueAsString<String?>(
        'authority',
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

  factory MsgCommunityPoolSpend.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCommunityPoolSpend(
      authority: decode.getString<String?>(1),
      recipient: decode.getString<String?>(2),
      amount:
          decode
              .getListOfBytes(3)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosDistributionV1beta1MsgCommunityPoolSpend;
  @override
  MsgCommunityPoolSpendResponse onServiceResponse(List<int> bytes) {
    return MsgCommunityPoolSpendResponse.deserialize(bytes);
  }

  @override
  MsgCommunityPoolSpendResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCommunityPoolSpendResponse.fromJson(json);
  }
}

/// MsgCommunityPoolSpendResponse defines the response to executing a
/// MsgCommunityPoolSpend message.
class MsgCommunityPoolSpendResponse extends CosmosProtoMessage {
  const MsgCommunityPoolSpendResponse();

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

  factory MsgCommunityPoolSpendResponse.fromJson(Map<String, dynamic> json) {
    return MsgCommunityPoolSpendResponse();
  }

  factory MsgCommunityPoolSpendResponse.deserialize(List<int> bytes) {
    return MsgCommunityPoolSpendResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosDistributionV1beta1MsgCommunityPoolSpendResponse;
}

/// DepositValidatorRewardsPool defines the request structure to provide
/// additional rewards to delegators from a specific validator.
class MsgDepositValidatorRewardsPool extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgDepositValidatorRewardsPoolResponse>,
        ICosmosProtoAminoMessage {
  final String? depositor;

  final String? validatorAddress;

  final List<cosmos_base_v1beta1_coin.Coin> amount;

  const MsgDepositValidatorRewardsPool({
    this.depositor,
    this.validatorAddress,
    this.amount = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/distr/MsgDepositValRewards",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "depositor"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: [
            ProtoOptionString(name: "amino.encoding", value: "legacy_coins"),
            ProtoOptionBool(name: "amino.dont_omitempty", value: true),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [depositor, validatorAddress, amount];

  @override
  Map<String, dynamic> toJson() {
    return {
      'depositor': depositor,
      'validator_address': validatorAddress,
      'amount': amount.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgDepositValidatorRewardsPool.fromJson(Map<String, dynamic> json) {
    return MsgDepositValidatorRewardsPool(
      depositor: json.valueAsString<String?>(
        'depositor',
        acceptCamelCase: true,
      ),
      validatorAddress: json.valueAsString<String?>(
        'validator_address',
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

  factory MsgDepositValidatorRewardsPool.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgDepositValidatorRewardsPool(
      depositor: decode.getString<String?>(1),
      validatorAddress: decode.getString<String?>(2),
      amount:
          decode
              .getListOfBytes(3)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosDistributionV1beta1MsgDepositValidatorRewardsPool;
  @override
  MsgDepositValidatorRewardsPoolResponse onServiceResponse(List<int> bytes) {
    return MsgDepositValidatorRewardsPoolResponse.deserialize(bytes);
  }

  @override
  MsgDepositValidatorRewardsPoolResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgDepositValidatorRewardsPoolResponse.fromJson(json);
  }
}

/// MsgDepositValidatorRewardsPoolResponse defines the response to executing a
/// MsgDepositValidatorRewardsPool message.
class MsgDepositValidatorRewardsPoolResponse extends CosmosProtoMessage {
  const MsgDepositValidatorRewardsPoolResponse();

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

  factory MsgDepositValidatorRewardsPoolResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgDepositValidatorRewardsPoolResponse();
  }

  factory MsgDepositValidatorRewardsPoolResponse.deserialize(List<int> bytes) {
    return MsgDepositValidatorRewardsPoolResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosDistributionV1beta1MsgDepositValidatorRewardsPoolResponse;
}
