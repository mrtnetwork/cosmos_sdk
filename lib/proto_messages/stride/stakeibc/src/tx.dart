import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/stride/stakeibc/src/validator.dart"
    as stride_stakeibc_validator;

enum AuthzPermissionChange implements ProtoEnumVariant {
  /// Grant the address trade permissions
  grant(0, 'GRANT'),

  /// Revoke trade permissions from the address
  revoke(1, 'REVOKE');

  const AuthzPermissionChange(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static AuthzPermissionChange fromValue(int? value) {
    return AuthzPermissionChange.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "AuthzPermissionChange",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static AuthzPermissionChange from(Object? value) {
    return AuthzPermissionChange.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "AuthzPermissionChange",
                value: value,
              ),
    );
  }
}

class MsgUpdateInnerRedemptionRateBounds extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateInnerRedemptionRateBoundsResponse>,
        ICosmosProtoAminoMessage {
  final String? creator;

  final String? chainId;

  final String? minInnerRedemptionRate;

  final String? maxInnerRedemptionRate;

  const MsgUpdateInnerRedemptionRateBounds({
    this.creator,
    this.chainId,
    this.minInnerRedemptionRate,
    this.maxInnerRedemptionRate,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "creator"),
        ProtoOptionString(
          name: "amino.name",
          value: "stakeibc/MsgUpdateRedemptionRateBounds",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    creator,
    chainId,
    minInnerRedemptionRate,
    maxInnerRedemptionRate,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'creator': creator,
      'chain_id': chainId,
      'min_inner_redemption_rate': minInnerRedemptionRate,
      'max_inner_redemption_rate': maxInnerRedemptionRate,
    };
  }

  factory MsgUpdateInnerRedemptionRateBounds.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateInnerRedemptionRateBounds(
      creator: json.valueAsString<String?>('creator', acceptCamelCase: true),
      chainId: json.valueAsString<String?>('chain_id', acceptCamelCase: true),
      minInnerRedemptionRate: json.valueAsString<String?>(
        'min_inner_redemption_rate',
        acceptCamelCase: true,
      ),
      maxInnerRedemptionRate: json.valueAsString<String?>(
        'max_inner_redemption_rate',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateInnerRedemptionRateBounds.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateInnerRedemptionRateBounds(
      creator: decode.getString<String?>(1),
      chainId: decode.getString<String?>(2),
      minInnerRedemptionRate: decode.getString<String?>(3),
      maxInnerRedemptionRate: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .strideStakeibcMsgUpdateInnerRedemptionRateBounds;
  @override
  MsgUpdateInnerRedemptionRateBoundsResponse onServiceResponse(
    List<int> bytes,
  ) {
    return MsgUpdateInnerRedemptionRateBoundsResponse.deserialize(bytes);
  }

  @override
  MsgUpdateInnerRedemptionRateBoundsResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateInnerRedemptionRateBoundsResponse.fromJson(json);
  }
}

class MsgUpdateInnerRedemptionRateBoundsResponse extends CosmosProtoMessage {
  const MsgUpdateInnerRedemptionRateBoundsResponse();

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

  factory MsgUpdateInnerRedemptionRateBoundsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateInnerRedemptionRateBoundsResponse();
  }

  factory MsgUpdateInnerRedemptionRateBoundsResponse.deserialize(
    List<int> bytes,
  ) {
    return MsgUpdateInnerRedemptionRateBoundsResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .strideStakeibcMsgUpdateInnerRedemptionRateBoundsResponse;
}

class MsgLiquidStake extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgLiquidStakeResponse>,
        ICosmosProtoAminoMessage {
  final String? creator;

  final String? amount;

  final String? hostDenom;

  const MsgLiquidStake({this.creator, this.amount, this.hostDenom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "creator"),
        ProtoOptionString(name: "amino.name", value: "stakeibc/MsgLiquidStake"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [creator, amount, hostDenom];

  @override
  Map<String, dynamic> toJson() {
    return {'creator': creator, 'amount': amount, 'host_denom': hostDenom};
  }

  factory MsgLiquidStake.fromJson(Map<String, dynamic> json) {
    return MsgLiquidStake(
      creator: json.valueAsString<String?>('creator', acceptCamelCase: true),
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
      hostDenom: json.valueAsString<String?>(
        'host_denom',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgLiquidStake.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgLiquidStake(
      creator: decode.getString<String?>(1),
      amount: decode.getString<String?>(2),
      hostDenom: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgLiquidStake;
  @override
  MsgLiquidStakeResponse onServiceResponse(List<int> bytes) {
    return MsgLiquidStakeResponse.deserialize(bytes);
  }

  @override
  MsgLiquidStakeResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgLiquidStakeResponse.fromJson(json);
  }
}

class MsgLiquidStakeResponse extends CosmosProtoMessage {
  final cosmos_base_v1beta1_coin.Coin? stToken;

  const MsgLiquidStakeResponse({this.stToken});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [stToken];

  @override
  Map<String, dynamic> toJson() {
    return {'st_token': stToken?.toJson()};
  }

  factory MsgLiquidStakeResponse.fromJson(Map<String, dynamic> json) {
    return MsgLiquidStakeResponse(
      stToken: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'st_token',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgLiquidStakeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgLiquidStakeResponse(
      stToken: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        1,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgLiquidStakeResponse;
}

class MsgLSMLiquidStake extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgLSMLiquidStakeResponse>,
        ICosmosProtoAminoMessage {
  final String? creator;

  final String? amount;

  final String? lsmTokenIbcDenom;

  const MsgLSMLiquidStake({this.creator, this.amount, this.lsmTokenIbcDenom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "creator"),
        ProtoOptionString(
          name: "amino.name",
          value: "stakeibc/MsgLSMLiquidStake",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [creator, amount, lsmTokenIbcDenom];

  @override
  Map<String, dynamic> toJson() {
    return {
      'creator': creator,
      'amount': amount,
      'lsm_token_ibc_denom': lsmTokenIbcDenom,
    };
  }

  factory MsgLSMLiquidStake.fromJson(Map<String, dynamic> json) {
    return MsgLSMLiquidStake(
      creator: json.valueAsString<String?>('creator', acceptCamelCase: true),
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
      lsmTokenIbcDenom: json.valueAsString<String?>(
        'lsm_token_ibc_denom',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgLSMLiquidStake.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgLSMLiquidStake(
      creator: decode.getString<String?>(1),
      amount: decode.getString<String?>(2),
      lsmTokenIbcDenom: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgLSMLiquidStake;
  @override
  MsgLSMLiquidStakeResponse onServiceResponse(List<int> bytes) {
    return MsgLSMLiquidStakeResponse.deserialize(bytes);
  }

  @override
  MsgLSMLiquidStakeResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgLSMLiquidStakeResponse.fromJson(json);
  }
}

class MsgLSMLiquidStakeResponse extends CosmosProtoMessage {
  final bool? transactionComplete;

  const MsgLSMLiquidStakeResponse({this.transactionComplete});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bool(1)],
    );
  }

  @override
  List<Object?> get protoValues => [transactionComplete];

  @override
  Map<String, dynamic> toJson() {
    return {'transaction_complete': transactionComplete};
  }

  factory MsgLSMLiquidStakeResponse.fromJson(Map<String, dynamic> json) {
    return MsgLSMLiquidStakeResponse(
      transactionComplete: json.valueAsBool<bool?>(
        'transaction_complete',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgLSMLiquidStakeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgLSMLiquidStakeResponse(
      transactionComplete: decode.getBool<bool?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgLSMLiquidStakeResponse;
}

class MsgClearBalance extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgClearBalanceResponse>,
        ICosmosProtoAminoMessage {
  final String? creator;

  final String? chainId;

  final String? amount;

  final String? channel;

  const MsgClearBalance({
    this.creator,
    this.chainId,
    this.amount,
    this.channel,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "creator"),
        ProtoOptionString(
          name: "amino.name",
          value: "stakeibc/MsgClearBalance",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [creator, chainId, amount, channel];

  @override
  Map<String, dynamic> toJson() {
    return {
      'creator': creator,
      'chain_id': chainId,
      'amount': amount,
      'channel': channel,
    };
  }

  factory MsgClearBalance.fromJson(Map<String, dynamic> json) {
    return MsgClearBalance(
      creator: json.valueAsString<String?>('creator', acceptCamelCase: true),
      chainId: json.valueAsString<String?>('chain_id', acceptCamelCase: true),
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
      channel: json.valueAsString<String?>('channel', acceptCamelCase: true),
    );
  }

  factory MsgClearBalance.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgClearBalance(
      creator: decode.getString<String?>(1),
      chainId: decode.getString<String?>(2),
      amount: decode.getString<String?>(3),
      channel: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgClearBalance;
  @override
  MsgClearBalanceResponse onServiceResponse(List<int> bytes) {
    return MsgClearBalanceResponse.deserialize(bytes);
  }

  @override
  MsgClearBalanceResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgClearBalanceResponse.fromJson(json);
  }
}

class MsgClearBalanceResponse extends CosmosProtoMessage {
  const MsgClearBalanceResponse();

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

  factory MsgClearBalanceResponse.fromJson(Map<String, dynamic> json) {
    return MsgClearBalanceResponse();
  }

  factory MsgClearBalanceResponse.deserialize(List<int> bytes) {
    return MsgClearBalanceResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgClearBalanceResponse;
}

class MsgRedeemStake extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRedeemStakeResponse>,
        ICosmosProtoAminoMessage {
  final String? creator;

  final String? amount;

  final String? hostZone;

  final String? receiver;

  const MsgRedeemStake({
    this.creator,
    this.amount,
    this.hostZone,
    this.receiver,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "creator"),
        ProtoOptionString(name: "amino.name", value: "stakeibc/MsgRedeemStake"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [creator, amount, hostZone, receiver];

  @override
  Map<String, dynamic> toJson() {
    return {
      'creator': creator,
      'amount': amount,
      'host_zone': hostZone,
      'receiver': receiver,
    };
  }

  factory MsgRedeemStake.fromJson(Map<String, dynamic> json) {
    return MsgRedeemStake(
      creator: json.valueAsString<String?>('creator', acceptCamelCase: true),
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
      hostZone: json.valueAsString<String?>('host_zone', acceptCamelCase: true),
      receiver: json.valueAsString<String?>('receiver', acceptCamelCase: true),
    );
  }

  factory MsgRedeemStake.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRedeemStake(
      creator: decode.getString<String?>(1),
      amount: decode.getString<String?>(2),
      hostZone: decode.getString<String?>(3),
      receiver: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgRedeemStake;
  @override
  MsgRedeemStakeResponse onServiceResponse(List<int> bytes) {
    return MsgRedeemStakeResponse.deserialize(bytes);
  }

  @override
  MsgRedeemStakeResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgRedeemStakeResponse.fromJson(json);
  }
}

class MsgRedeemStakeResponse extends CosmosProtoMessage {
  const MsgRedeemStakeResponse();

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

  factory MsgRedeemStakeResponse.fromJson(Map<String, dynamic> json) {
    return MsgRedeemStakeResponse();
  }

  factory MsgRedeemStakeResponse.deserialize(List<int> bytes) {
    return MsgRedeemStakeResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgRedeemStakeResponse;
}

/// next: 15
class MsgRegisterHostZone extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRegisterHostZoneResponse>,
        ICosmosProtoAminoMessage {
  final String? connectionId;

  final String? bech32prefix;

  final String? hostDenom;

  final String? ibcDenom;

  final String? creator;

  final String? transferChannelId;

  final BigInt? unbondingPeriod;

  final String? minRedemptionRate;

  final String? maxRedemptionRate;

  final bool? lsmLiquidStakeEnabled;

  final String? communityPoolTreasuryAddress;

  final BigInt? maxMessagesPerIcaTx;

  const MsgRegisterHostZone({
    this.connectionId,
    this.bech32prefix,
    this.hostDenom,
    this.ibcDenom,
    this.creator,
    this.transferChannelId,
    this.unbondingPeriod,
    this.minRedemptionRate,
    this.maxRedemptionRate,
    this.lsmLiquidStakeEnabled,
    this.communityPoolTreasuryAddress,
    this.maxMessagesPerIcaTx,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "creator"),
        ProtoOptionString(
          name: "amino.name",
          value: "stakeibc/MsgRegisterHostZone",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(12),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(10, options: const []),
        ProtoFieldConfig.uint64(11, options: const []),
        ProtoFieldConfig.string(13, options: const []),
        ProtoFieldConfig.string(14, options: const []),
        ProtoFieldConfig.bool(15),
        ProtoFieldConfig.string(16),
        ProtoFieldConfig.uint64(17),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    connectionId,
    bech32prefix,
    hostDenom,
    ibcDenom,
    creator,
    transferChannelId,
    unbondingPeriod,
    minRedemptionRate,
    maxRedemptionRate,
    lsmLiquidStakeEnabled,
    communityPoolTreasuryAddress,
    maxMessagesPerIcaTx,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'connection_id': connectionId,
      'bech32prefix': bech32prefix,
      'host_denom': hostDenom,
      'ibc_denom': ibcDenom,
      'creator': creator,
      'transfer_channel_id': transferChannelId,
      'unbonding_period': unbondingPeriod?.toString(),
      'min_redemption_rate': minRedemptionRate,
      'max_redemption_rate': maxRedemptionRate,
      'lsm_liquid_stake_enabled': lsmLiquidStakeEnabled,
      'community_pool_treasury_address': communityPoolTreasuryAddress,
      'max_messages_per_ica_tx': maxMessagesPerIcaTx?.toString(),
    };
  }

  factory MsgRegisterHostZone.fromJson(Map<String, dynamic> json) {
    return MsgRegisterHostZone(
      connectionId: json.valueAsString<String?>(
        'connection_id',
        acceptCamelCase: true,
      ),
      bech32prefix: json.valueAsString<String?>(
        'bech32prefix',
        acceptCamelCase: true,
      ),
      hostDenom: json.valueAsString<String?>(
        'host_denom',
        acceptCamelCase: true,
      ),
      ibcDenom: json.valueAsString<String?>('ibc_denom', acceptCamelCase: true),
      creator: json.valueAsString<String?>('creator', acceptCamelCase: true),
      transferChannelId: json.valueAsString<String?>(
        'transfer_channel_id',
        acceptCamelCase: true,
      ),
      unbondingPeriod: json.valueAsBigInt<BigInt?>(
        'unbonding_period',
        acceptCamelCase: true,
      ),
      minRedemptionRate: json.valueAsString<String?>(
        'min_redemption_rate',
        acceptCamelCase: true,
      ),
      maxRedemptionRate: json.valueAsString<String?>(
        'max_redemption_rate',
        acceptCamelCase: true,
      ),
      lsmLiquidStakeEnabled: json.valueAsBool<bool?>(
        'lsm_liquid_stake_enabled',
        acceptCamelCase: true,
      ),
      communityPoolTreasuryAddress: json.valueAsString<String?>(
        'community_pool_treasury_address',
        acceptCamelCase: true,
      ),
      maxMessagesPerIcaTx: json.valueAsBigInt<BigInt?>(
        'max_messages_per_ica_tx',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgRegisterHostZone.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRegisterHostZone(
      connectionId: decode.getString<String?>(2),
      bech32prefix: decode.getString<String?>(12),
      hostDenom: decode.getString<String?>(4),
      ibcDenom: decode.getString<String?>(5),
      creator: decode.getString<String?>(6),
      transferChannelId: decode.getString<String?>(10),
      unbondingPeriod: decode.getBigInt<BigInt?>(11),
      minRedemptionRate: decode.getString<String?>(13),
      maxRedemptionRate: decode.getString<String?>(14),
      lsmLiquidStakeEnabled: decode.getBool<bool?>(15),
      communityPoolTreasuryAddress: decode.getString<String?>(16),
      maxMessagesPerIcaTx: decode.getBigInt<BigInt?>(17),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgRegisterHostZone;
  @override
  MsgRegisterHostZoneResponse onServiceResponse(List<int> bytes) {
    return MsgRegisterHostZoneResponse.deserialize(bytes);
  }

  @override
  MsgRegisterHostZoneResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgRegisterHostZoneResponse.fromJson(json);
  }
}

class MsgRegisterHostZoneResponse extends CosmosProtoMessage {
  const MsgRegisterHostZoneResponse();

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

  factory MsgRegisterHostZoneResponse.fromJson(Map<String, dynamic> json) {
    return MsgRegisterHostZoneResponse();
  }

  factory MsgRegisterHostZoneResponse.deserialize(List<int> bytes) {
    return MsgRegisterHostZoneResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgRegisterHostZoneResponse;
}

class MsgClaimUndelegatedTokens extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgClaimUndelegatedTokensResponse>,
        ICosmosProtoAminoMessage {
  final String? creator;

  /// UserUnbondingRecords are keyed on {chain_id}.{epoch}.{receiver}
  final String? hostZoneId;

  final BigInt? epoch;

  final String? receiver;

  const MsgClaimUndelegatedTokens({
    this.creator,
    this.hostZoneId,
    this.epoch,
    this.receiver,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "creator"),
        ProtoOptionString(
          name: "amino.name",
          value: "stakeibc/MsgClaimUndelegatedTokens",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.string(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [creator, hostZoneId, epoch, receiver];

  @override
  Map<String, dynamic> toJson() {
    return {
      'creator': creator,
      'host_zone_id': hostZoneId,
      'epoch': epoch?.toString(),
      'receiver': receiver,
    };
  }

  factory MsgClaimUndelegatedTokens.fromJson(Map<String, dynamic> json) {
    return MsgClaimUndelegatedTokens(
      creator: json.valueAsString<String?>('creator', acceptCamelCase: true),
      hostZoneId: json.valueAsString<String?>(
        'host_zone_id',
        acceptCamelCase: true,
      ),
      epoch: json.valueAsBigInt<BigInt?>('epoch', acceptCamelCase: true),
      receiver: json.valueAsString<String?>('receiver', acceptCamelCase: true),
    );
  }

  factory MsgClaimUndelegatedTokens.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgClaimUndelegatedTokens(
      creator: decode.getString<String?>(1),
      hostZoneId: decode.getString<String?>(2),
      epoch: decode.getBigInt<BigInt?>(3),
      receiver: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgClaimUndelegatedTokens;
  @override
  MsgClaimUndelegatedTokensResponse onServiceResponse(List<int> bytes) {
    return MsgClaimUndelegatedTokensResponse.deserialize(bytes);
  }

  @override
  MsgClaimUndelegatedTokensResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgClaimUndelegatedTokensResponse.fromJson(json);
  }
}

class MsgClaimUndelegatedTokensResponse extends CosmosProtoMessage {
  const MsgClaimUndelegatedTokensResponse();

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

  factory MsgClaimUndelegatedTokensResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgClaimUndelegatedTokensResponse();
  }

  factory MsgClaimUndelegatedTokensResponse.deserialize(List<int> bytes) {
    return MsgClaimUndelegatedTokensResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgClaimUndelegatedTokensResponse;
}

class MsgRebalanceValidators extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRebalanceValidatorsResponse>,
        ICosmosProtoAminoMessage {
  final String? creator;

  final String? hostZone;

  final BigInt? numRebalance;

  const MsgRebalanceValidators({
    this.creator,
    this.hostZone,
    this.numRebalance,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "creator"),
        ProtoOptionString(
          name: "amino.name",
          value: "stakeibc/MsgRebalanceValidators",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.uint64(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [creator, hostZone, numRebalance];

  @override
  Map<String, dynamic> toJson() {
    return {
      'creator': creator,
      'host_zone': hostZone,
      'num_rebalance': numRebalance?.toString(),
    };
  }

  factory MsgRebalanceValidators.fromJson(Map<String, dynamic> json) {
    return MsgRebalanceValidators(
      creator: json.valueAsString<String?>('creator', acceptCamelCase: true),
      hostZone: json.valueAsString<String?>('host_zone', acceptCamelCase: true),
      numRebalance: json.valueAsBigInt<BigInt?>(
        'num_rebalance',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgRebalanceValidators.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRebalanceValidators(
      creator: decode.getString<String?>(1),
      hostZone: decode.getString<String?>(2),
      numRebalance: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgRebalanceValidators;
  @override
  MsgRebalanceValidatorsResponse onServiceResponse(List<int> bytes) {
    return MsgRebalanceValidatorsResponse.deserialize(bytes);
  }

  @override
  MsgRebalanceValidatorsResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgRebalanceValidatorsResponse.fromJson(json);
  }
}

class MsgRebalanceValidatorsResponse extends CosmosProtoMessage {
  const MsgRebalanceValidatorsResponse();

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

  factory MsgRebalanceValidatorsResponse.fromJson(Map<String, dynamic> json) {
    return MsgRebalanceValidatorsResponse();
  }

  factory MsgRebalanceValidatorsResponse.deserialize(List<int> bytes) {
    return MsgRebalanceValidatorsResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgRebalanceValidatorsResponse;
}

class MsgAddValidators extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgAddValidatorsResponse>,
        ICosmosProtoAminoMessage {
  final String? creator;

  final String? hostZone;

  final List<stride_stakeibc_validator.Validator> validators;

  const MsgAddValidators({
    this.creator,
    this.hostZone,
    this.validators = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "creator"),
        ProtoOptionString(
          name: "amino.name",
          value: "stakeibc/MsgAddValidators",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [creator, hostZone, validators];

  @override
  Map<String, dynamic> toJson() {
    return {
      'creator': creator,
      'host_zone': hostZone,
      'validators': validators.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgAddValidators.fromJson(Map<String, dynamic> json) {
    return MsgAddValidators(
      creator: json.valueAsString<String?>('creator', acceptCamelCase: true),
      hostZone: json.valueAsString<String?>('host_zone', acceptCamelCase: true),
      validators:
          (json.valueEnsureAsList<dynamic>('validators', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  stride_stakeibc_validator.Validator,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => stride_stakeibc_validator.Validator.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory MsgAddValidators.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgAddValidators(
      creator: decode.getString<String?>(1),
      hostZone: decode.getString<String?>(2),
      validators:
          decode
              .getListOfBytes(3)
              .map((b) => stride_stakeibc_validator.Validator.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgAddValidators;
  @override
  MsgAddValidatorsResponse onServiceResponse(List<int> bytes) {
    return MsgAddValidatorsResponse.deserialize(bytes);
  }

  @override
  MsgAddValidatorsResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgAddValidatorsResponse.fromJson(json);
  }
}

class MsgAddValidatorsResponse extends CosmosProtoMessage {
  const MsgAddValidatorsResponse();

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

  factory MsgAddValidatorsResponse.fromJson(Map<String, dynamic> json) {
    return MsgAddValidatorsResponse();
  }

  factory MsgAddValidatorsResponse.deserialize(List<int> bytes) {
    return MsgAddValidatorsResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgAddValidatorsResponse;
}

class ValidatorWeight extends CosmosProtoMessage {
  final String? address;

  final BigInt? weight;

  const ValidatorWeight({this.address, this.weight});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [address, weight];

  @override
  Map<String, dynamic> toJson() {
    return {'address': address, 'weight': weight?.toString()};
  }

  factory ValidatorWeight.fromJson(Map<String, dynamic> json) {
    return ValidatorWeight(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      weight: json.valueAsBigInt<BigInt?>('weight', acceptCamelCase: true),
    );
  }

  factory ValidatorWeight.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ValidatorWeight(
      address: decode.getString<String?>(1),
      weight: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcValidatorWeight;
}

class MsgChangeValidatorWeights extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgChangeValidatorWeightsResponse>,
        ICosmosProtoAminoMessage {
  final String? creator;

  final String? hostZone;

  final List<ValidatorWeight> validatorWeights;

  const MsgChangeValidatorWeights({
    this.creator,
    this.hostZone,
    this.validatorWeights = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "creator"),
        ProtoOptionString(
          name: "amino.name",
          value: "stakeibc/MsgChangeValidatorWeights",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [creator, hostZone, validatorWeights];

  @override
  Map<String, dynamic> toJson() {
    return {
      'creator': creator,
      'host_zone': hostZone,
      'validator_weights': validatorWeights.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgChangeValidatorWeights.fromJson(Map<String, dynamic> json) {
    return MsgChangeValidatorWeights(
      creator: json.valueAsString<String?>('creator', acceptCamelCase: true),
      hostZone: json.valueAsString<String?>('host_zone', acceptCamelCase: true),
      validatorWeights:
          (json.valueEnsureAsList<dynamic>(
                'validator_weights',
                acceptCamelCase: true,
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<ValidatorWeight, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => ValidatorWeight.fromJson(v),
                    ),
              )
              .toList(),
    );
  }

  factory MsgChangeValidatorWeights.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgChangeValidatorWeights(
      creator: decode.getString<String?>(1),
      hostZone: decode.getString<String?>(2),
      validatorWeights:
          decode
              .getListOfBytes(3)
              .map((b) => ValidatorWeight.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgChangeValidatorWeights;
  @override
  MsgChangeValidatorWeightsResponse onServiceResponse(List<int> bytes) {
    return MsgChangeValidatorWeightsResponse.deserialize(bytes);
  }

  @override
  MsgChangeValidatorWeightsResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgChangeValidatorWeightsResponse.fromJson(json);
  }
}

class MsgChangeValidatorWeightsResponse extends CosmosProtoMessage {
  const MsgChangeValidatorWeightsResponse();

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

  factory MsgChangeValidatorWeightsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgChangeValidatorWeightsResponse();
  }

  factory MsgChangeValidatorWeightsResponse.deserialize(List<int> bytes) {
    return MsgChangeValidatorWeightsResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgChangeValidatorWeightsResponse;
}

class MsgDeleteValidator extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgDeleteValidatorResponse>,
        ICosmosProtoAminoMessage {
  final String? creator;

  final String? hostZone;

  final String? valAddr;

  const MsgDeleteValidator({this.creator, this.hostZone, this.valAddr});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "creator"),
        ProtoOptionString(
          name: "amino.name",
          value: "stakeibc/MsgDeleteValidator",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [creator, hostZone, valAddr];

  @override
  Map<String, dynamic> toJson() {
    return {'creator': creator, 'host_zone': hostZone, 'val_addr': valAddr};
  }

  factory MsgDeleteValidator.fromJson(Map<String, dynamic> json) {
    return MsgDeleteValidator(
      creator: json.valueAsString<String?>('creator', acceptCamelCase: true),
      hostZone: json.valueAsString<String?>('host_zone', acceptCamelCase: true),
      valAddr: json.valueAsString<String?>('val_addr', acceptCamelCase: true),
    );
  }

  factory MsgDeleteValidator.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgDeleteValidator(
      creator: decode.getString<String?>(1),
      hostZone: decode.getString<String?>(2),
      valAddr: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgDeleteValidator;
  @override
  MsgDeleteValidatorResponse onServiceResponse(List<int> bytes) {
    return MsgDeleteValidatorResponse.deserialize(bytes);
  }

  @override
  MsgDeleteValidatorResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgDeleteValidatorResponse.fromJson(json);
  }
}

class MsgDeleteValidatorResponse extends CosmosProtoMessage {
  const MsgDeleteValidatorResponse();

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

  factory MsgDeleteValidatorResponse.fromJson(Map<String, dynamic> json) {
    return MsgDeleteValidatorResponse();
  }

  factory MsgDeleteValidatorResponse.deserialize(List<int> bytes) {
    return MsgDeleteValidatorResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgDeleteValidatorResponse;
}

class MsgRestoreInterchainAccount extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRestoreInterchainAccountResponse>,
        ICosmosProtoAminoMessage {
  final String? creator;

  final String? chainId;

  final String? connectionId;

  final String? accountOwner;

  const MsgRestoreInterchainAccount({
    this.creator,
    this.chainId,
    this.connectionId,
    this.accountOwner,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "creator"),
        ProtoOptionString(
          name: "amino.name",
          value: "stakeibc/MsgRestoreInterchainAcco",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    creator,
    chainId,
    connectionId,
    accountOwner,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'creator': creator,
      'chain_id': chainId,
      'connection_id': connectionId,
      'account_owner': accountOwner,
    };
  }

  factory MsgRestoreInterchainAccount.fromJson(Map<String, dynamic> json) {
    return MsgRestoreInterchainAccount(
      creator: json.valueAsString<String?>('creator', acceptCamelCase: true),
      chainId: json.valueAsString<String?>('chain_id', acceptCamelCase: true),
      connectionId: json.valueAsString<String?>(
        'connection_id',
        acceptCamelCase: true,
      ),
      accountOwner: json.valueAsString<String?>(
        'account_owner',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgRestoreInterchainAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRestoreInterchainAccount(
      creator: decode.getString<String?>(1),
      chainId: decode.getString<String?>(2),
      connectionId: decode.getString<String?>(3),
      accountOwner: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgRestoreInterchainAccount;
  @override
  MsgRestoreInterchainAccountResponse onServiceResponse(List<int> bytes) {
    return MsgRestoreInterchainAccountResponse.deserialize(bytes);
  }

  @override
  MsgRestoreInterchainAccountResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgRestoreInterchainAccountResponse.fromJson(json);
  }
}

class MsgRestoreInterchainAccountResponse extends CosmosProtoMessage {
  const MsgRestoreInterchainAccountResponse();

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

  factory MsgRestoreInterchainAccountResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgRestoreInterchainAccountResponse();
  }

  factory MsgRestoreInterchainAccountResponse.deserialize(List<int> bytes) {
    return MsgRestoreInterchainAccountResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .strideStakeibcMsgRestoreInterchainAccountResponse;
}

class MsgCloseDelegationChannel extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCloseDelegationChannelResponse>,
        ICosmosProtoAminoMessage {
  final String? creator;

  final String? chainId;

  const MsgCloseDelegationChannel({this.creator, this.chainId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "creator"),
        ProtoOptionString(
          name: "amino.name",
          value: "stakeibc/MsgCloseDelegationChanne",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [creator, chainId];

  @override
  Map<String, dynamic> toJson() {
    return {'creator': creator, 'chain_id': chainId};
  }

  factory MsgCloseDelegationChannel.fromJson(Map<String, dynamic> json) {
    return MsgCloseDelegationChannel(
      creator: json.valueAsString<String?>('creator', acceptCamelCase: true),
      chainId: json.valueAsString<String?>('chain_id', acceptCamelCase: true),
    );
  }

  factory MsgCloseDelegationChannel.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCloseDelegationChannel(
      creator: decode.getString<String?>(1),
      chainId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgCloseDelegationChannel;
  @override
  MsgCloseDelegationChannelResponse onServiceResponse(List<int> bytes) {
    return MsgCloseDelegationChannelResponse.deserialize(bytes);
  }

  @override
  MsgCloseDelegationChannelResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCloseDelegationChannelResponse.fromJson(json);
  }
}

class MsgCloseDelegationChannelResponse extends CosmosProtoMessage {
  const MsgCloseDelegationChannelResponse();

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

  factory MsgCloseDelegationChannelResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgCloseDelegationChannelResponse();
  }

  factory MsgCloseDelegationChannelResponse.deserialize(List<int> bytes) {
    return MsgCloseDelegationChannelResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgCloseDelegationChannelResponse;
}

class MsgUpdateValidatorSharesExchRate extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateValidatorSharesExchRateResponse>,
        ICosmosProtoAminoMessage {
  final String? creator;

  final String? chainId;

  final String? valoper;

  const MsgUpdateValidatorSharesExchRate({
    this.creator,
    this.chainId,
    this.valoper,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "creator"),
        ProtoOptionString(
          name: "amino.name",
          value: "stakeibc/MsgUpdateValSharesExchRate",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [creator, chainId, valoper];

  @override
  Map<String, dynamic> toJson() {
    return {'creator': creator, 'chain_id': chainId, 'valoper': valoper};
  }

  factory MsgUpdateValidatorSharesExchRate.fromJson(Map<String, dynamic> json) {
    return MsgUpdateValidatorSharesExchRate(
      creator: json.valueAsString<String?>('creator', acceptCamelCase: true),
      chainId: json.valueAsString<String?>('chain_id', acceptCamelCase: true),
      valoper: json.valueAsString<String?>('valoper', acceptCamelCase: true),
    );
  }

  factory MsgUpdateValidatorSharesExchRate.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateValidatorSharesExchRate(
      creator: decode.getString<String?>(1),
      chainId: decode.getString<String?>(2),
      valoper: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgUpdateValidatorSharesExchRate;
  @override
  MsgUpdateValidatorSharesExchRateResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateValidatorSharesExchRateResponse.deserialize(bytes);
  }

  @override
  MsgUpdateValidatorSharesExchRateResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateValidatorSharesExchRateResponse.fromJson(json);
  }
}

class MsgUpdateValidatorSharesExchRateResponse extends CosmosProtoMessage {
  const MsgUpdateValidatorSharesExchRateResponse();

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

  factory MsgUpdateValidatorSharesExchRateResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateValidatorSharesExchRateResponse();
  }

  factory MsgUpdateValidatorSharesExchRateResponse.deserialize(
    List<int> bytes,
  ) {
    return MsgUpdateValidatorSharesExchRateResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .strideStakeibcMsgUpdateValidatorSharesExchRateResponse;
}

class MsgCalibrateDelegation extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCalibrateDelegationResponse>,
        ICosmosProtoAminoMessage {
  final String? creator;

  final String? chainId;

  final String? valoper;

  const MsgCalibrateDelegation({this.creator, this.chainId, this.valoper});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "creator"),
        ProtoOptionString(
          name: "amino.name",
          value: "stakeibc/MsgCalibrateDelegation",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [creator, chainId, valoper];

  @override
  Map<String, dynamic> toJson() {
    return {'creator': creator, 'chain_id': chainId, 'valoper': valoper};
  }

  factory MsgCalibrateDelegation.fromJson(Map<String, dynamic> json) {
    return MsgCalibrateDelegation(
      creator: json.valueAsString<String?>('creator', acceptCamelCase: true),
      chainId: json.valueAsString<String?>('chain_id', acceptCamelCase: true),
      valoper: json.valueAsString<String?>('valoper', acceptCamelCase: true),
    );
  }

  factory MsgCalibrateDelegation.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCalibrateDelegation(
      creator: decode.getString<String?>(1),
      chainId: decode.getString<String?>(2),
      valoper: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgCalibrateDelegation;
  @override
  MsgCalibrateDelegationResponse onServiceResponse(List<int> bytes) {
    return MsgCalibrateDelegationResponse.deserialize(bytes);
  }

  @override
  MsgCalibrateDelegationResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCalibrateDelegationResponse.fromJson(json);
  }
}

class MsgCalibrateDelegationResponse extends CosmosProtoMessage {
  const MsgCalibrateDelegationResponse();

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

  factory MsgCalibrateDelegationResponse.fromJson(Map<String, dynamic> json) {
    return MsgCalibrateDelegationResponse();
  }

  factory MsgCalibrateDelegationResponse.deserialize(List<int> bytes) {
    return MsgCalibrateDelegationResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgCalibrateDelegationResponse;
}

class MsgResumeHostZone extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgResumeHostZoneResponse>,
        ICosmosProtoAminoMessage {
  final String? creator;

  final String? chainId;

  const MsgResumeHostZone({this.creator, this.chainId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "creator"),
        ProtoOptionString(
          name: "amino.name",
          value: "stakeibc/MsgResumeHostZone",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [creator, chainId];

  @override
  Map<String, dynamic> toJson() {
    return {'creator': creator, 'chain_id': chainId};
  }

  factory MsgResumeHostZone.fromJson(Map<String, dynamic> json) {
    return MsgResumeHostZone(
      creator: json.valueAsString<String?>('creator', acceptCamelCase: true),
      chainId: json.valueAsString<String?>('chain_id', acceptCamelCase: true),
    );
  }

  factory MsgResumeHostZone.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgResumeHostZone(
      creator: decode.getString<String?>(1),
      chainId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgResumeHostZone;
  @override
  MsgResumeHostZoneResponse onServiceResponse(List<int> bytes) {
    return MsgResumeHostZoneResponse.deserialize(bytes);
  }

  @override
  MsgResumeHostZoneResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgResumeHostZoneResponse.fromJson(json);
  }
}

class MsgResumeHostZoneResponse extends CosmosProtoMessage {
  const MsgResumeHostZoneResponse();

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

  factory MsgResumeHostZoneResponse.fromJson(Map<String, dynamic> json) {
    return MsgResumeHostZoneResponse();
  }

  factory MsgResumeHostZoneResponse.deserialize(List<int> bytes) {
    return MsgResumeHostZoneResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgResumeHostZoneResponse;
}

class MsgDeprecateHostZone extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgDeprecateHostZoneResponse>,
        ICosmosProtoAminoMessage {
  final String? authority;

  final String? chainId;

  const MsgDeprecateHostZone({this.authority, this.chainId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "stakeibc/MsgDeprecateHostZone",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, chainId];

  @override
  Map<String, dynamic> toJson() {
    return {'authority': authority, 'chain_id': chainId};
  }

  factory MsgDeprecateHostZone.fromJson(Map<String, dynamic> json) {
    return MsgDeprecateHostZone(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      chainId: json.valueAsString<String?>('chain_id', acceptCamelCase: true),
    );
  }

  factory MsgDeprecateHostZone.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgDeprecateHostZone(
      authority: decode.getString<String?>(1),
      chainId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgDeprecateHostZone;
  @override
  MsgDeprecateHostZoneResponse onServiceResponse(List<int> bytes) {
    return MsgDeprecateHostZoneResponse.deserialize(bytes);
  }

  @override
  MsgDeprecateHostZoneResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgDeprecateHostZoneResponse.fromJson(json);
  }
}

class MsgDeprecateHostZoneResponse extends CosmosProtoMessage {
  const MsgDeprecateHostZoneResponse();

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

  factory MsgDeprecateHostZoneResponse.fromJson(Map<String, dynamic> json) {
    return MsgDeprecateHostZoneResponse();
  }

  factory MsgDeprecateHostZoneResponse.deserialize(List<int> bytes) {
    return MsgDeprecateHostZoneResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgDeprecateHostZoneResponse;
}

/// Creates a new trade route
class MsgCreateTradeRoute extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreateTradeRouteResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module (defaults to x/gov unless
  /// overwritten).
  final String? authority;

  /// The chain ID of the host zone
  final String? hostChainId;

  /// Connection IDs between stride and the other zones
  final String? strideToRewardConnectionId;

  final String? strideToTradeConnectionId;

  /// Transfer channels between the host, reward, and trade zones
  final String? hostToRewardTransferChannelId;

  final String? rewardToTradeTransferChannelId;

  final String? tradeToHostTransferChannelId;

  /// ibc denom for the reward token on the host zone (e.g. ibc/usdc on dYdX)
  final String? rewardDenomOnHost;

  /// native denom of reward token on the reward zone (e.g. usdc on Noble)
  final String? rewardDenomOnReward;

  /// ibc denom of the reward token on the trade zone (e.g. ibc/usdc on Osmosis)
  final String? rewardDenomOnTrade;

  /// ibc denom of the host's token on the trade zone (e.g. ibc/dydx on Osmosis)
  final String? hostDenomOnTrade;

  /// the host zone's native denom (e.g. dydx on dYdX)
  final String? hostDenomOnHost;

  /// Deprecated, the trades are now executed off-chain via authz
  ///
  /// The osmosis pool ID
  final BigInt? poolId;

  /// Deprecated, the trades are now executed off-chain via authz
  ///
  /// Threshold defining the percentage of tokens that could be lost in the trade
  /// This captures both the loss from slippage and from a stale price on stride
  /// "0.05" means the output from the trade can be no less than a 5% deviation
  /// from the current value
  final String? maxAllowedSwapLossRate;

  /// Deprecated, the trades are now executed off-chain via authz
  ///
  /// minimum amount of reward tokens to initate a swap
  /// if not provided, defaults to 0
  final String? minSwapAmount;

  /// Deprecated, the trades are now executed off-chain via authz
  ///
  /// maximum amount of reward tokens in a single swap
  /// if not provided, defaults to 10e24
  final String? maxSwapAmount;

  /// Minimum amount of reward token that must be accumulated before
  /// the tokens are transferred to the trade ICA
  final String? minTransferAmount;

  const MsgCreateTradeRoute({
    this.authority,
    this.hostChainId,
    this.strideToRewardConnectionId,
    this.strideToTradeConnectionId,
    this.hostToRewardTransferChannelId,
    this.rewardToTradeTransferChannelId,
    this.tradeToHostTransferChannelId,
    this.rewardDenomOnHost,
    this.rewardDenomOnReward,
    this.rewardDenomOnTrade,
    this.hostDenomOnTrade,
    this.hostDenomOnHost,
    this.poolId,
    this.maxAllowedSwapLossRate,
    this.minSwapAmount,
    this.maxSwapAmount,
    this.minTransferAmount,
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
          value: "stakeibc/MsgCreateTradeRoute",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.string(6),
        ProtoFieldConfig.string(7),
        ProtoFieldConfig.string(8),
        ProtoFieldConfig.string(9),
        ProtoFieldConfig.string(10),
        ProtoFieldConfig.string(11),
        ProtoFieldConfig.string(12),
        ProtoFieldConfig.uint64(
          13,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.string(
          14,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.string(15, options: const []),
        ProtoFieldConfig.string(16, options: const []),
        ProtoFieldConfig.string(17, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    authority,
    hostChainId,
    strideToRewardConnectionId,
    strideToTradeConnectionId,
    hostToRewardTransferChannelId,
    rewardToTradeTransferChannelId,
    tradeToHostTransferChannelId,
    rewardDenomOnHost,
    rewardDenomOnReward,
    rewardDenomOnTrade,
    hostDenomOnTrade,
    hostDenomOnHost,
    poolId,
    maxAllowedSwapLossRate,
    minSwapAmount,
    maxSwapAmount,
    minTransferAmount,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'host_chain_id': hostChainId,
      'stride_to_reward_connection_id': strideToRewardConnectionId,
      'stride_to_trade_connection_id': strideToTradeConnectionId,
      'host_to_reward_transfer_channel_id': hostToRewardTransferChannelId,
      'reward_to_trade_transfer_channel_id': rewardToTradeTransferChannelId,
      'trade_to_host_transfer_channel_id': tradeToHostTransferChannelId,
      'reward_denom_on_host': rewardDenomOnHost,
      'reward_denom_on_reward': rewardDenomOnReward,
      'reward_denom_on_trade': rewardDenomOnTrade,
      'host_denom_on_trade': hostDenomOnTrade,
      'host_denom_on_host': hostDenomOnHost,
      'pool_id': poolId?.toString(),
      'max_allowed_swap_loss_rate': maxAllowedSwapLossRate,
      'min_swap_amount': minSwapAmount,
      'max_swap_amount': maxSwapAmount,
      'min_transfer_amount': minTransferAmount,
    };
  }

  factory MsgCreateTradeRoute.fromJson(Map<String, dynamic> json) {
    return MsgCreateTradeRoute(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      hostChainId: json.valueAsString<String?>(
        'host_chain_id',
        acceptCamelCase: true,
      ),
      strideToRewardConnectionId: json.valueAsString<String?>(
        'stride_to_reward_connection_id',
        acceptCamelCase: true,
      ),
      strideToTradeConnectionId: json.valueAsString<String?>(
        'stride_to_trade_connection_id',
        acceptCamelCase: true,
      ),
      hostToRewardTransferChannelId: json.valueAsString<String?>(
        'host_to_reward_transfer_channel_id',
        acceptCamelCase: true,
      ),
      rewardToTradeTransferChannelId: json.valueAsString<String?>(
        'reward_to_trade_transfer_channel_id',
        acceptCamelCase: true,
      ),
      tradeToHostTransferChannelId: json.valueAsString<String?>(
        'trade_to_host_transfer_channel_id',
        acceptCamelCase: true,
      ),
      rewardDenomOnHost: json.valueAsString<String?>(
        'reward_denom_on_host',
        acceptCamelCase: true,
      ),
      rewardDenomOnReward: json.valueAsString<String?>(
        'reward_denom_on_reward',
        acceptCamelCase: true,
      ),
      rewardDenomOnTrade: json.valueAsString<String?>(
        'reward_denom_on_trade',
        acceptCamelCase: true,
      ),
      hostDenomOnTrade: json.valueAsString<String?>(
        'host_denom_on_trade',
        acceptCamelCase: true,
      ),
      hostDenomOnHost: json.valueAsString<String?>(
        'host_denom_on_host',
        acceptCamelCase: true,
      ),
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
      maxAllowedSwapLossRate: json.valueAsString<String?>(
        'max_allowed_swap_loss_rate',
        acceptCamelCase: true,
      ),
      minSwapAmount: json.valueAsString<String?>(
        'min_swap_amount',
        acceptCamelCase: true,
      ),
      maxSwapAmount: json.valueAsString<String?>(
        'max_swap_amount',
        acceptCamelCase: true,
      ),
      minTransferAmount: json.valueAsString<String?>(
        'min_transfer_amount',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCreateTradeRoute.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateTradeRoute(
      authority: decode.getString<String?>(1),
      hostChainId: decode.getString<String?>(2),
      strideToRewardConnectionId: decode.getString<String?>(3),
      strideToTradeConnectionId: decode.getString<String?>(4),
      hostToRewardTransferChannelId: decode.getString<String?>(5),
      rewardToTradeTransferChannelId: decode.getString<String?>(6),
      tradeToHostTransferChannelId: decode.getString<String?>(7),
      rewardDenomOnHost: decode.getString<String?>(8),
      rewardDenomOnReward: decode.getString<String?>(9),
      rewardDenomOnTrade: decode.getString<String?>(10),
      hostDenomOnTrade: decode.getString<String?>(11),
      hostDenomOnHost: decode.getString<String?>(12),
      poolId: decode.getBigInt<BigInt?>(13),
      maxAllowedSwapLossRate: decode.getString<String?>(14),
      minSwapAmount: decode.getString<String?>(15),
      maxSwapAmount: decode.getString<String?>(16),
      minTransferAmount: decode.getString<String?>(17),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgCreateTradeRoute;
  @override
  MsgCreateTradeRouteResponse onServiceResponse(List<int> bytes) {
    return MsgCreateTradeRouteResponse.deserialize(bytes);
  }

  @override
  MsgCreateTradeRouteResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgCreateTradeRouteResponse.fromJson(json);
  }
}

class MsgCreateTradeRouteResponse extends CosmosProtoMessage {
  const MsgCreateTradeRouteResponse();

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

  factory MsgCreateTradeRouteResponse.fromJson(Map<String, dynamic> json) {
    return MsgCreateTradeRouteResponse();
  }

  factory MsgCreateTradeRouteResponse.deserialize(List<int> bytes) {
    return MsgCreateTradeRouteResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgCreateTradeRouteResponse;
}

/// Deletes a trade route
class MsgDeleteTradeRoute extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgDeleteTradeRouteResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module (defaults to x/gov unless
  /// overwritten).
  final String? authority;

  /// The reward denom of the route in it's native form (e.g. usdc)
  final String? rewardDenom;

  /// The host zone's denom in it's native form (e.g. dydx)
  final String? hostDenom;

  const MsgDeleteTradeRoute({this.authority, this.rewardDenom, this.hostDenom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "stakeibc/MsgDeleteTradeRoute",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, rewardDenom, hostDenom];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'reward_denom': rewardDenom,
      'host_denom': hostDenom,
    };
  }

  factory MsgDeleteTradeRoute.fromJson(Map<String, dynamic> json) {
    return MsgDeleteTradeRoute(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      rewardDenom: json.valueAsString<String?>(
        'reward_denom',
        acceptCamelCase: true,
      ),
      hostDenom: json.valueAsString<String?>(
        'host_denom',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgDeleteTradeRoute.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgDeleteTradeRoute(
      authority: decode.getString<String?>(1),
      rewardDenom: decode.getString<String?>(2),
      hostDenom: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgDeleteTradeRoute;
  @override
  MsgDeleteTradeRouteResponse onServiceResponse(List<int> bytes) {
    return MsgDeleteTradeRouteResponse.deserialize(bytes);
  }

  @override
  MsgDeleteTradeRouteResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgDeleteTradeRouteResponse.fromJson(json);
  }
}

class MsgDeleteTradeRouteResponse extends CosmosProtoMessage {
  const MsgDeleteTradeRouteResponse();

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

  factory MsgDeleteTradeRouteResponse.fromJson(Map<String, dynamic> json) {
    return MsgDeleteTradeRouteResponse();
  }

  factory MsgDeleteTradeRouteResponse.deserialize(List<int> bytes) {
    return MsgDeleteTradeRouteResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgDeleteTradeRouteResponse;
}

/// Updates the config of a trade route
class MsgUpdateTradeRoute extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateTradeRouteResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module (defaults to x/gov unless
  /// overwritten).
  final String? authority;

  /// The reward denom of the route in it's native form (e.g. usdc)
  final String? rewardDenom;

  /// The host zone's denom in it's native form (e.g. dydx)
  final String? hostDenom;

  /// Deprecated, the trades are now executed off-chain via authz
  ///
  /// The osmosis pool ID
  final BigInt? poolId;

  /// Deprecated, the trades are now executed off-chain via authz
  ///
  /// Threshold defining the percentage of tokens that could be lost in the trade
  /// This captures both the loss from slippage and from a stale price on stride
  /// "0.05" means the output from the trade can be no less than a 5% deviation
  /// from the current value
  final String? maxAllowedSwapLossRate;

  /// Deprecated, the trades are now executed off-chain via authz
  ///
  /// minimum amount of reward tokens to initate a swap
  /// if not provided, defaults to 0
  final String? minSwapAmount;

  /// Deprecated, the trades are now executed off-chain via authz
  ///
  /// maximum amount of reward tokens in a single swap
  /// if not provided, defaults to 10e24
  final String? maxSwapAmount;

  /// Minimum amount of reward token that must be accumulated before
  /// the tokens are transferred to the trade ICA
  final String? minTransferAmount;

  const MsgUpdateTradeRoute({
    this.authority,
    this.rewardDenom,
    this.hostDenom,
    this.poolId,
    this.maxAllowedSwapLossRate,
    this.minSwapAmount,
    this.maxSwapAmount,
    this.minTransferAmount,
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
          value: "stakeibc/MsgUpdateTradeRoute",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.uint64(
          4,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.string(
          5,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.string(
          6,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.string(
          7,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.string(17, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    authority,
    rewardDenom,
    hostDenom,
    poolId,
    maxAllowedSwapLossRate,
    minSwapAmount,
    maxSwapAmount,
    minTransferAmount,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'reward_denom': rewardDenom,
      'host_denom': hostDenom,
      'pool_id': poolId?.toString(),
      'max_allowed_swap_loss_rate': maxAllowedSwapLossRate,
      'min_swap_amount': minSwapAmount,
      'max_swap_amount': maxSwapAmount,
      'min_transfer_amount': minTransferAmount,
    };
  }

  factory MsgUpdateTradeRoute.fromJson(Map<String, dynamic> json) {
    return MsgUpdateTradeRoute(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      rewardDenom: json.valueAsString<String?>(
        'reward_denom',
        acceptCamelCase: true,
      ),
      hostDenom: json.valueAsString<String?>(
        'host_denom',
        acceptCamelCase: true,
      ),
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
      maxAllowedSwapLossRate: json.valueAsString<String?>(
        'max_allowed_swap_loss_rate',
        acceptCamelCase: true,
      ),
      minSwapAmount: json.valueAsString<String?>(
        'min_swap_amount',
        acceptCamelCase: true,
      ),
      maxSwapAmount: json.valueAsString<String?>(
        'max_swap_amount',
        acceptCamelCase: true,
      ),
      minTransferAmount: json.valueAsString<String?>(
        'min_transfer_amount',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateTradeRoute.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateTradeRoute(
      authority: decode.getString<String?>(1),
      rewardDenom: decode.getString<String?>(2),
      hostDenom: decode.getString<String?>(3),
      poolId: decode.getBigInt<BigInt?>(4),
      maxAllowedSwapLossRate: decode.getString<String?>(5),
      minSwapAmount: decode.getString<String?>(6),
      maxSwapAmount: decode.getString<String?>(7),
      minTransferAmount: decode.getString<String?>(17),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgUpdateTradeRoute;
  @override
  MsgUpdateTradeRouteResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateTradeRouteResponse.deserialize(bytes);
  }

  @override
  MsgUpdateTradeRouteResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateTradeRouteResponse.fromJson(json);
  }
}

class MsgUpdateTradeRouteResponse extends CosmosProtoMessage {
  const MsgUpdateTradeRouteResponse();

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

  factory MsgUpdateTradeRouteResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateTradeRouteResponse();
  }

  factory MsgUpdateTradeRouteResponse.deserialize(List<int> bytes) {
    return MsgUpdateTradeRouteResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgUpdateTradeRouteResponse;
}

/// Registers or updates a community pool rebate by specifying the amount liquid
/// staked
class MsgSetCommunityPoolRebate extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSetCommunityPoolRebateResponse>,
        ICosmosProtoAminoMessage {
  /// Message signer (admin only)
  final String? creator;

  /// Chain id of the chain whose community pool has a liquid staking rebate
  /// arrangement with stride
  final String? chainId;

  /// Rebate percentage represented as a decimal (e.g. 0.2 for 20%)
  final String? rebateRate;

  /// Number of stTokens recieved by the community pool after liquid staking
  final String? liquidStakedStTokenAmount;

  const MsgSetCommunityPoolRebate({
    this.creator,
    this.chainId,
    this.rebateRate,
    this.liquidStakedStTokenAmount,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "creator"),
        ProtoOptionString(
          name: "amino.name",
          value: "stakeibc/MsgSetCommunityPoolRebate",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    creator,
    chainId,
    rebateRate,
    liquidStakedStTokenAmount,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'creator': creator,
      'chain_id': chainId,
      'rebate_rate': rebateRate,
      'liquid_staked_st_token_amount': liquidStakedStTokenAmount,
    };
  }

  factory MsgSetCommunityPoolRebate.fromJson(Map<String, dynamic> json) {
    return MsgSetCommunityPoolRebate(
      creator: json.valueAsString<String?>('creator', acceptCamelCase: true),
      chainId: json.valueAsString<String?>('chain_id', acceptCamelCase: true),
      rebateRate: json.valueAsString<String?>(
        'rebate_rate',
        acceptCamelCase: true,
      ),
      liquidStakedStTokenAmount: json.valueAsString<String?>(
        'liquid_staked_st_token_amount',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgSetCommunityPoolRebate.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSetCommunityPoolRebate(
      creator: decode.getString<String?>(1),
      chainId: decode.getString<String?>(2),
      rebateRate: decode.getString<String?>(3),
      liquidStakedStTokenAmount: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgSetCommunityPoolRebate;
  @override
  MsgSetCommunityPoolRebateResponse onServiceResponse(List<int> bytes) {
    return MsgSetCommunityPoolRebateResponse.deserialize(bytes);
  }

  @override
  MsgSetCommunityPoolRebateResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgSetCommunityPoolRebateResponse.fromJson(json);
  }
}

class MsgSetCommunityPoolRebateResponse extends CosmosProtoMessage {
  const MsgSetCommunityPoolRebateResponse();

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

  factory MsgSetCommunityPoolRebateResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgSetCommunityPoolRebateResponse();
  }

  factory MsgSetCommunityPoolRebateResponse.deserialize(List<int> bytes) {
    return MsgSetCommunityPoolRebateResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgSetCommunityPoolRebateResponse;
}

/// Grants or revokes trade permissions to a given address via authz
class MsgToggleTradeController extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgToggleTradeControllerResponse>,
        ICosmosProtoAminoMessage {
  /// Message signer (admin only)
  final String? creator;

  /// Chain ID of the trade account
  final String? chainId;

  /// Permission change (either grant or revoke)
  final AuthzPermissionChange? permissionChange;

  /// Address of trade operator
  final String? address;

  /// Option to grant/revoke the legacy osmosis swap message
  final bool? legacy;

  const MsgToggleTradeController({
    this.creator,
    this.chainId,
    this.permissionChange,
    this.address,
    this.legacy,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "creator"),
        ProtoOptionString(
          name: "amino.name",
          value: "stakeibc/MsgToggleTradeController",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.enumType(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.bool(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    creator,
    chainId,
    permissionChange,
    address,
    legacy,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'creator': creator,
      'chain_id': chainId,
      'permission_change': permissionChange?.protoName,
      'address': address,
      'legacy': legacy,
    };
  }

  factory MsgToggleTradeController.fromJson(Map<String, dynamic> json) {
    return MsgToggleTradeController(
      creator: json.valueAsString<String?>('creator', acceptCamelCase: true),
      chainId: json.valueAsString<String?>('chain_id', acceptCamelCase: true),
      permissionChange: json.valueTo<AuthzPermissionChange?, Object?>(
        key: 'permission_change',
        parse: (v) => AuthzPermissionChange.from(v),
      ),
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      legacy: json.valueAsBool<bool?>('legacy', acceptCamelCase: true),
    );
  }

  factory MsgToggleTradeController.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgToggleTradeController(
      creator: decode.getString<String?>(1),
      chainId: decode.getString<String?>(2),
      permissionChange: decode.getEnum<AuthzPermissionChange?>(
        3,
        AuthzPermissionChange.values,
      ),
      address: decode.getString<String?>(4),
      legacy: decode.getBool<bool?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgToggleTradeController;
  @override
  MsgToggleTradeControllerResponse onServiceResponse(List<int> bytes) {
    return MsgToggleTradeControllerResponse.deserialize(bytes);
  }

  @override
  MsgToggleTradeControllerResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgToggleTradeControllerResponse.fromJson(json);
  }
}

class MsgToggleTradeControllerResponse extends CosmosProtoMessage {
  const MsgToggleTradeControllerResponse();

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

  factory MsgToggleTradeControllerResponse.fromJson(Map<String, dynamic> json) {
    return MsgToggleTradeControllerResponse();
  }

  factory MsgToggleTradeControllerResponse.deserialize(List<int> bytes) {
    return MsgToggleTradeControllerResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgToggleTradeControllerResponse;
}

/// Updates host zone params
class MsgUpdateHostZoneParams extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateHostZoneParamsResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module (defaults to x/gov unless
  /// overwritten).
  final String? authority;

  /// Chain ID of the host zone
  final String? chainId;

  /// Max messages that can be sent in a single ICA message
  final BigInt? maxMessagesPerIcaTx;

  const MsgUpdateHostZoneParams({
    this.authority,
    this.chainId,
    this.maxMessagesPerIcaTx,
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
          value: "stakeibc/MsgUpdateHostZoneParams",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.uint64(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, chainId, maxMessagesPerIcaTx];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'chain_id': chainId,
      'max_messages_per_ica_tx': maxMessagesPerIcaTx?.toString(),
    };
  }

  factory MsgUpdateHostZoneParams.fromJson(Map<String, dynamic> json) {
    return MsgUpdateHostZoneParams(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      chainId: json.valueAsString<String?>('chain_id', acceptCamelCase: true),
      maxMessagesPerIcaTx: json.valueAsBigInt<BigInt?>(
        'max_messages_per_ica_tx',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateHostZoneParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateHostZoneParams(
      authority: decode.getString<String?>(1),
      chainId: decode.getString<String?>(2),
      maxMessagesPerIcaTx: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgUpdateHostZoneParams;
  @override
  MsgUpdateHostZoneParamsResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateHostZoneParamsResponse.deserialize(bytes);
  }

  @override
  MsgUpdateHostZoneParamsResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateHostZoneParamsResponse.fromJson(json);
  }
}

class MsgUpdateHostZoneParamsResponse extends CosmosProtoMessage {
  const MsgUpdateHostZoneParamsResponse();

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

  factory MsgUpdateHostZoneParamsResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateHostZoneParamsResponse();
  }

  factory MsgUpdateHostZoneParamsResponse.deserialize(List<int> bytes) {
    return MsgUpdateHostZoneParamsResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcMsgUpdateHostZoneParamsResponse;
}
