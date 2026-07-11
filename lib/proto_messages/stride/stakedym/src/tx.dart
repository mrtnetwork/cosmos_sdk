import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/stride/stakedym/src/stakedym.dart"
    as stride_stakedym_stakedym;

/// LiquidStake
class MsgLiquidStake extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgLiquidStakeResponse>,
        ICosmosProtoAminoMessage {
  final String? staker;

  final String? nativeAmount;

  const MsgLiquidStake({this.staker, this.nativeAmount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "staker"),
        ProtoOptionString(name: "amino.name", value: "stakedym/MsgLiquidStake"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [staker, nativeAmount];

  @override
  Map<String, dynamic> toJson() {
    return {'staker': staker, 'native_amount': nativeAmount};
  }

  factory MsgLiquidStake.fromJson(Map<String, dynamic> json) {
    return MsgLiquidStake(
      staker: json.valueAsString<String?>('staker', acceptCamelCase: true),
      nativeAmount: json.valueAsString<String?>(
        'native_amount',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgLiquidStake.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgLiquidStake(
      staker: decode.getString<String?>(1),
      nativeAmount: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakedymMsgLiquidStake;
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
      DefaultCosmosProtoTypeUrl.strideStakedymMsgLiquidStakeResponse;
}

/// RedeemStake
class MsgRedeemStake extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRedeemStakeResponse>,
        ICosmosProtoAminoMessage {
  final String? redeemer;

  final String? stTokenAmount;

  const MsgRedeemStake({this.redeemer, this.stTokenAmount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "redeemer"),
        ProtoOptionString(name: "amino.name", value: "stakedym/MsgRedeemStake"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [redeemer, stTokenAmount];

  @override
  Map<String, dynamic> toJson() {
    return {'redeemer': redeemer, 'st_token_amount': stTokenAmount};
  }

  factory MsgRedeemStake.fromJson(Map<String, dynamic> json) {
    return MsgRedeemStake(
      redeemer: json.valueAsString<String?>('redeemer', acceptCamelCase: true),
      stTokenAmount: json.valueAsString<String?>(
        'st_token_amount',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgRedeemStake.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRedeemStake(
      redeemer: decode.getString<String?>(1),
      stTokenAmount: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakedymMsgRedeemStake;
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
  final cosmos_base_v1beta1_coin.Coin? nativeToken;

  const MsgRedeemStakeResponse({this.nativeToken});

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
  List<Object?> get protoValues => [nativeToken];

  @override
  Map<String, dynamic> toJson() {
    return {'native_token': nativeToken?.toJson()};
  }

  factory MsgRedeemStakeResponse.fromJson(Map<String, dynamic> json) {
    return MsgRedeemStakeResponse(
      nativeToken: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'native_token',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgRedeemStakeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRedeemStakeResponse(
      nativeToken: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        1,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakedymMsgRedeemStakeResponse;
}

/// ConfirmDelegation
class MsgConfirmDelegation extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgConfirmDelegationResponse>,
        ICosmosProtoAminoMessage {
  final String? operator_;

  final BigInt? recordId;

  final String? txHash;

  const MsgConfirmDelegation({this.operator_, this.recordId, this.txHash});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "operator"),
        ProtoOptionString(
          name: "amino.name",
          value: "stakedym/MsgConfirmDelegation",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [operator_, recordId, txHash];

  @override
  Map<String, dynamic> toJson() {
    return {
      'operator': operator_,
      'record_id': recordId?.toString(),
      'tx_hash': txHash,
    };
  }

  factory MsgConfirmDelegation.fromJson(Map<String, dynamic> json) {
    return MsgConfirmDelegation(
      operator_: json.valueAsString<String?>('operator', acceptCamelCase: true),
      recordId: json.valueAsBigInt<BigInt?>('record_id', acceptCamelCase: true),
      txHash: json.valueAsString<String?>('tx_hash', acceptCamelCase: true),
    );
  }

  factory MsgConfirmDelegation.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgConfirmDelegation(
      operator_: decode.getString<String?>(1),
      recordId: decode.getBigInt<BigInt?>(2),
      txHash: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakedymMsgConfirmDelegation;
  @override
  MsgConfirmDelegationResponse onServiceResponse(List<int> bytes) {
    return MsgConfirmDelegationResponse.deserialize(bytes);
  }

  @override
  MsgConfirmDelegationResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgConfirmDelegationResponse.fromJson(json);
  }
}

class MsgConfirmDelegationResponse extends CosmosProtoMessage {
  const MsgConfirmDelegationResponse();

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

  factory MsgConfirmDelegationResponse.fromJson(Map<String, dynamic> json) {
    return MsgConfirmDelegationResponse();
  }

  factory MsgConfirmDelegationResponse.deserialize(List<int> bytes) {
    return MsgConfirmDelegationResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakedymMsgConfirmDelegationResponse;
}

/// ConfirmUndelegation
class MsgConfirmUndelegation extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgConfirmUndelegationResponse>,
        ICosmosProtoAminoMessage {
  final String? operator_;

  final BigInt? recordId;

  final String? txHash;

  const MsgConfirmUndelegation({this.operator_, this.recordId, this.txHash});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "operator"),
        ProtoOptionString(
          name: "amino.name",
          value: "stakedym/MsgConfirmUndelegation",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [operator_, recordId, txHash];

  @override
  Map<String, dynamic> toJson() {
    return {
      'operator': operator_,
      'record_id': recordId?.toString(),
      'tx_hash': txHash,
    };
  }

  factory MsgConfirmUndelegation.fromJson(Map<String, dynamic> json) {
    return MsgConfirmUndelegation(
      operator_: json.valueAsString<String?>('operator', acceptCamelCase: true),
      recordId: json.valueAsBigInt<BigInt?>('record_id', acceptCamelCase: true),
      txHash: json.valueAsString<String?>('tx_hash', acceptCamelCase: true),
    );
  }

  factory MsgConfirmUndelegation.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgConfirmUndelegation(
      operator_: decode.getString<String?>(1),
      recordId: decode.getBigInt<BigInt?>(2),
      txHash: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakedymMsgConfirmUndelegation;
  @override
  MsgConfirmUndelegationResponse onServiceResponse(List<int> bytes) {
    return MsgConfirmUndelegationResponse.deserialize(bytes);
  }

  @override
  MsgConfirmUndelegationResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgConfirmUndelegationResponse.fromJson(json);
  }
}

class MsgConfirmUndelegationResponse extends CosmosProtoMessage {
  const MsgConfirmUndelegationResponse();

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

  factory MsgConfirmUndelegationResponse.fromJson(Map<String, dynamic> json) {
    return MsgConfirmUndelegationResponse();
  }

  factory MsgConfirmUndelegationResponse.deserialize(List<int> bytes) {
    return MsgConfirmUndelegationResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakedymMsgConfirmUndelegationResponse;
}

/// ConfirmUnbondedTokenSweep
class MsgConfirmUnbondedTokenSweep extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgConfirmUnbondedTokenSweepResponse>,
        ICosmosProtoAminoMessage {
  final String? operator_;

  final BigInt? recordId;

  final String? txHash;

  const MsgConfirmUnbondedTokenSweep({
    this.operator_,
    this.recordId,
    this.txHash,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "operator"),
        ProtoOptionString(
          name: "amino.name",
          value: "stakedym/MsgConfirmUnbondedTokenSweep",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [operator_, recordId, txHash];

  @override
  Map<String, dynamic> toJson() {
    return {
      'operator': operator_,
      'record_id': recordId?.toString(),
      'tx_hash': txHash,
    };
  }

  factory MsgConfirmUnbondedTokenSweep.fromJson(Map<String, dynamic> json) {
    return MsgConfirmUnbondedTokenSweep(
      operator_: json.valueAsString<String?>('operator', acceptCamelCase: true),
      recordId: json.valueAsBigInt<BigInt?>('record_id', acceptCamelCase: true),
      txHash: json.valueAsString<String?>('tx_hash', acceptCamelCase: true),
    );
  }

  factory MsgConfirmUnbondedTokenSweep.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgConfirmUnbondedTokenSweep(
      operator_: decode.getString<String?>(1),
      recordId: decode.getBigInt<BigInt?>(2),
      txHash: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakedymMsgConfirmUnbondedTokenSweep;
  @override
  MsgConfirmUnbondedTokenSweepResponse onServiceResponse(List<int> bytes) {
    return MsgConfirmUnbondedTokenSweepResponse.deserialize(bytes);
  }

  @override
  MsgConfirmUnbondedTokenSweepResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgConfirmUnbondedTokenSweepResponse.fromJson(json);
  }
}

class MsgConfirmUnbondedTokenSweepResponse extends CosmosProtoMessage {
  const MsgConfirmUnbondedTokenSweepResponse();

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

  factory MsgConfirmUnbondedTokenSweepResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgConfirmUnbondedTokenSweepResponse();
  }

  factory MsgConfirmUnbondedTokenSweepResponse.deserialize(List<int> bytes) {
    return MsgConfirmUnbondedTokenSweepResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .strideStakedymMsgConfirmUnbondedTokenSweepResponse;
}

/// AdjustDelegatedBalance
class MsgAdjustDelegatedBalance extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgAdjustDelegatedBalanceResponse>,
        ICosmosProtoAminoMessage {
  final String? operator_;

  final String? delegationOffset;

  final String? validatorAddress;

  const MsgAdjustDelegatedBalance({
    this.operator_,
    this.delegationOffset,
    this.validatorAddress,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "operator"),
        ProtoOptionString(
          name: "amino.name",
          value: "stakedym/MsgAdjustDelegatedBalance",
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
  List<Object?> get protoValues => [
    operator_,
    delegationOffset,
    validatorAddress,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'operator': operator_,
      'delegation_offset': delegationOffset,
      'validator_address': validatorAddress,
    };
  }

  factory MsgAdjustDelegatedBalance.fromJson(Map<String, dynamic> json) {
    return MsgAdjustDelegatedBalance(
      operator_: json.valueAsString<String?>('operator', acceptCamelCase: true),
      delegationOffset: json.valueAsString<String?>(
        'delegation_offset',
        acceptCamelCase: true,
      ),
      validatorAddress: json.valueAsString<String?>(
        'validator_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgAdjustDelegatedBalance.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgAdjustDelegatedBalance(
      operator_: decode.getString<String?>(1),
      delegationOffset: decode.getString<String?>(2),
      validatorAddress: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakedymMsgAdjustDelegatedBalance;
  @override
  MsgAdjustDelegatedBalanceResponse onServiceResponse(List<int> bytes) {
    return MsgAdjustDelegatedBalanceResponse.deserialize(bytes);
  }

  @override
  MsgAdjustDelegatedBalanceResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgAdjustDelegatedBalanceResponse.fromJson(json);
  }
}

class MsgAdjustDelegatedBalanceResponse extends CosmosProtoMessage {
  const MsgAdjustDelegatedBalanceResponse();

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

  factory MsgAdjustDelegatedBalanceResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgAdjustDelegatedBalanceResponse();
  }

  factory MsgAdjustDelegatedBalanceResponse.deserialize(List<int> bytes) {
    return MsgAdjustDelegatedBalanceResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakedymMsgAdjustDelegatedBalanceResponse;
}

/// UpdateInnerRedemptionRate
class MsgUpdateInnerRedemptionRateBounds extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateInnerRedemptionRateBoundsResponse>,
        ICosmosProtoAminoMessage {
  final String? creator;

  final String? minInnerRedemptionRate;

  final String? maxInnerRedemptionRate;

  const MsgUpdateInnerRedemptionRateBounds({
    this.creator,
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
          value: "stakedym/MsgUpdateRedemptionRateBounds",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    creator,
    minInnerRedemptionRate,
    maxInnerRedemptionRate,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'creator': creator,
      'min_inner_redemption_rate': minInnerRedemptionRate,
      'max_inner_redemption_rate': maxInnerRedemptionRate,
    };
  }

  factory MsgUpdateInnerRedemptionRateBounds.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateInnerRedemptionRateBounds(
      creator: json.valueAsString<String?>('creator', acceptCamelCase: true),
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
      minInnerRedemptionRate: decode.getString<String?>(2),
      maxInnerRedemptionRate: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .strideStakedymMsgUpdateInnerRedemptionRateBounds;
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
          .strideStakedymMsgUpdateInnerRedemptionRateBoundsResponse;
}

/// ResumeHostZone
class MsgResumeHostZone extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgResumeHostZoneResponse>,
        ICosmosProtoAminoMessage {
  final String? creator;

  const MsgResumeHostZone({this.creator});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "creator"),
        ProtoOptionString(
          name: "amino.name",
          value: "stakedym/MsgResumeHostZone",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [creator];

  @override
  Map<String, dynamic> toJson() {
    return {'creator': creator};
  }

  factory MsgResumeHostZone.fromJson(Map<String, dynamic> json) {
    return MsgResumeHostZone(
      creator: json.valueAsString<String?>('creator', acceptCamelCase: true),
    );
  }

  factory MsgResumeHostZone.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgResumeHostZone(creator: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakedymMsgResumeHostZone;
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
      DefaultCosmosProtoTypeUrl.strideStakedymMsgResumeHostZoneResponse;
}

/// RefreshRedemptionRate
class MsgRefreshRedemptionRate extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRefreshRedemptionRateResponse>,
        ICosmosProtoAminoMessage {
  final String? creator;

  const MsgRefreshRedemptionRate({this.creator});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "creator"),
        ProtoOptionString(
          name: "amino.name",
          value: "stakedym/MsgRefreshRedemptionRate",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [creator];

  @override
  Map<String, dynamic> toJson() {
    return {'creator': creator};
  }

  factory MsgRefreshRedemptionRate.fromJson(Map<String, dynamic> json) {
    return MsgRefreshRedemptionRate(
      creator: json.valueAsString<String?>('creator', acceptCamelCase: true),
    );
  }

  factory MsgRefreshRedemptionRate.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRefreshRedemptionRate(creator: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakedymMsgRefreshRedemptionRate;
  @override
  MsgRefreshRedemptionRateResponse onServiceResponse(List<int> bytes) {
    return MsgRefreshRedemptionRateResponse.deserialize(bytes);
  }

  @override
  MsgRefreshRedemptionRateResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgRefreshRedemptionRateResponse.fromJson(json);
  }
}

class MsgRefreshRedemptionRateResponse extends CosmosProtoMessage {
  const MsgRefreshRedemptionRateResponse();

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

  factory MsgRefreshRedemptionRateResponse.fromJson(Map<String, dynamic> json) {
    return MsgRefreshRedemptionRateResponse();
  }

  factory MsgRefreshRedemptionRateResponse.deserialize(List<int> bytes) {
    return MsgRefreshRedemptionRateResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakedymMsgRefreshRedemptionRateResponse;
}

/// OverwriteDelegationRecord
class MsgOverwriteDelegationRecord extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgOverwriteDelegationRecordResponse>,
        ICosmosProtoAminoMessage {
  final String? creator;

  final stride_stakedym_stakedym.DelegationRecord? delegationRecord;

  const MsgOverwriteDelegationRecord({this.creator, this.delegationRecord});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "creator"),
        ProtoOptionString(
          name: "amino.name",
          value: "stakedym/MsgOverwriteDelegationRecord",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [creator, delegationRecord];

  @override
  Map<String, dynamic> toJson() {
    return {
      'creator': creator,
      'delegation_record': delegationRecord?.toJson(),
    };
  }

  factory MsgOverwriteDelegationRecord.fromJson(Map<String, dynamic> json) {
    return MsgOverwriteDelegationRecord(
      creator: json.valueAsString<String?>('creator', acceptCamelCase: true),
      delegationRecord: json.valueTo<
        stride_stakedym_stakedym.DelegationRecord?,
        Map<String, dynamic>
      >(
        key: 'delegation_record',
        parse: (v) => stride_stakedym_stakedym.DelegationRecord.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgOverwriteDelegationRecord.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgOverwriteDelegationRecord(
      creator: decode.getString<String?>(1),
      delegationRecord: decode
          .messageTo<stride_stakedym_stakedym.DelegationRecord?>(
            2,
            (b) => stride_stakedym_stakedym.DelegationRecord.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakedymMsgOverwriteDelegationRecord;
  @override
  MsgOverwriteDelegationRecordResponse onServiceResponse(List<int> bytes) {
    return MsgOverwriteDelegationRecordResponse.deserialize(bytes);
  }

  @override
  MsgOverwriteDelegationRecordResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgOverwriteDelegationRecordResponse.fromJson(json);
  }
}

class MsgOverwriteDelegationRecordResponse extends CosmosProtoMessage {
  const MsgOverwriteDelegationRecordResponse();

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

  factory MsgOverwriteDelegationRecordResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgOverwriteDelegationRecordResponse();
  }

  factory MsgOverwriteDelegationRecordResponse.deserialize(List<int> bytes) {
    return MsgOverwriteDelegationRecordResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .strideStakedymMsgOverwriteDelegationRecordResponse;
}

/// OverwriteUnbondingRecord
class MsgOverwriteUnbondingRecord extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgOverwriteUnbondingRecordResponse>,
        ICosmosProtoAminoMessage {
  final String? creator;

  final stride_stakedym_stakedym.UnbondingRecord? unbondingRecord;

  const MsgOverwriteUnbondingRecord({this.creator, this.unbondingRecord});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "creator"),
        ProtoOptionString(
          name: "amino.name",
          value: "stakedym/MsgOverwriteUnbondingRecord",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [creator, unbondingRecord];

  @override
  Map<String, dynamic> toJson() {
    return {'creator': creator, 'unbonding_record': unbondingRecord?.toJson()};
  }

  factory MsgOverwriteUnbondingRecord.fromJson(Map<String, dynamic> json) {
    return MsgOverwriteUnbondingRecord(
      creator: json.valueAsString<String?>('creator', acceptCamelCase: true),
      unbondingRecord: json.valueTo<
        stride_stakedym_stakedym.UnbondingRecord?,
        Map<String, dynamic>
      >(
        key: 'unbonding_record',
        parse: (v) => stride_stakedym_stakedym.UnbondingRecord.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgOverwriteUnbondingRecord.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgOverwriteUnbondingRecord(
      creator: decode.getString<String?>(1),
      unbondingRecord: decode
          .messageTo<stride_stakedym_stakedym.UnbondingRecord?>(
            2,
            (b) => stride_stakedym_stakedym.UnbondingRecord.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakedymMsgOverwriteUnbondingRecord;
  @override
  MsgOverwriteUnbondingRecordResponse onServiceResponse(List<int> bytes) {
    return MsgOverwriteUnbondingRecordResponse.deserialize(bytes);
  }

  @override
  MsgOverwriteUnbondingRecordResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgOverwriteUnbondingRecordResponse.fromJson(json);
  }
}

class MsgOverwriteUnbondingRecordResponse extends CosmosProtoMessage {
  const MsgOverwriteUnbondingRecordResponse();

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

  factory MsgOverwriteUnbondingRecordResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgOverwriteUnbondingRecordResponse();
  }

  factory MsgOverwriteUnbondingRecordResponse.deserialize(List<int> bytes) {
    return MsgOverwriteUnbondingRecordResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .strideStakedymMsgOverwriteUnbondingRecordResponse;
}

/// OverwriteRedemptionRecord
class MsgOverwriteRedemptionRecord extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgOverwriteRedemptionRecordResponse>,
        ICosmosProtoAminoMessage {
  final String? creator;

  final stride_stakedym_stakedym.RedemptionRecord? redemptionRecord;

  const MsgOverwriteRedemptionRecord({this.creator, this.redemptionRecord});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "creator"),
        ProtoOptionString(
          name: "amino.name",
          value: "stakedym/MsgOverwriteRedemptionRecord",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [creator, redemptionRecord];

  @override
  Map<String, dynamic> toJson() {
    return {
      'creator': creator,
      'redemption_record': redemptionRecord?.toJson(),
    };
  }

  factory MsgOverwriteRedemptionRecord.fromJson(Map<String, dynamic> json) {
    return MsgOverwriteRedemptionRecord(
      creator: json.valueAsString<String?>('creator', acceptCamelCase: true),
      redemptionRecord: json.valueTo<
        stride_stakedym_stakedym.RedemptionRecord?,
        Map<String, dynamic>
      >(
        key: 'redemption_record',
        parse: (v) => stride_stakedym_stakedym.RedemptionRecord.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgOverwriteRedemptionRecord.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgOverwriteRedemptionRecord(
      creator: decode.getString<String?>(1),
      redemptionRecord: decode
          .messageTo<stride_stakedym_stakedym.RedemptionRecord?>(
            2,
            (b) => stride_stakedym_stakedym.RedemptionRecord.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakedymMsgOverwriteRedemptionRecord;
  @override
  MsgOverwriteRedemptionRecordResponse onServiceResponse(List<int> bytes) {
    return MsgOverwriteRedemptionRecordResponse.deserialize(bytes);
  }

  @override
  MsgOverwriteRedemptionRecordResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgOverwriteRedemptionRecordResponse.fromJson(json);
  }
}

class MsgOverwriteRedemptionRecordResponse extends CosmosProtoMessage {
  const MsgOverwriteRedemptionRecordResponse();

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

  factory MsgOverwriteRedemptionRecordResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgOverwriteRedemptionRecordResponse();
  }

  factory MsgOverwriteRedemptionRecordResponse.deserialize(List<int> bytes) {
    return MsgOverwriteRedemptionRecordResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .strideStakedymMsgOverwriteRedemptionRecordResponse;
}

/// SetOperatorAddress
class MsgSetOperatorAddress extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSetOperatorAddressResponse>,
        ICosmosProtoAminoMessage {
  final String? signer;

  final String? operator_;

  const MsgSetOperatorAddress({this.signer, this.operator_});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "signer"),
        ProtoOptionString(
          name: "amino.name",
          value: "stakedym/MsgSetOperatorAddress",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [signer, operator_];

  @override
  Map<String, dynamic> toJson() {
    return {'signer': signer, 'operator': operator_};
  }

  factory MsgSetOperatorAddress.fromJson(Map<String, dynamic> json) {
    return MsgSetOperatorAddress(
      signer: json.valueAsString<String?>('signer', acceptCamelCase: true),
      operator_: json.valueAsString<String?>('operator', acceptCamelCase: true),
    );
  }

  factory MsgSetOperatorAddress.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSetOperatorAddress(
      signer: decode.getString<String?>(1),
      operator_: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakedymMsgSetOperatorAddress;
  @override
  MsgSetOperatorAddressResponse onServiceResponse(List<int> bytes) {
    return MsgSetOperatorAddressResponse.deserialize(bytes);
  }

  @override
  MsgSetOperatorAddressResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgSetOperatorAddressResponse.fromJson(json);
  }
}

class MsgSetOperatorAddressResponse extends CosmosProtoMessage {
  const MsgSetOperatorAddressResponse();

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

  factory MsgSetOperatorAddressResponse.fromJson(Map<String, dynamic> json) {
    return MsgSetOperatorAddressResponse();
  }

  factory MsgSetOperatorAddressResponse.deserialize(List<int> bytes) {
    return MsgSetOperatorAddressResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakedymMsgSetOperatorAddressResponse;
}
