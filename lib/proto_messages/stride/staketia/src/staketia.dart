import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Status fields for a delegation record
/// Note: There is an important assumption here that tokens in the deposit
/// account should not be tracked by these records. The record is created as soon
/// as the tokens leave stride
/// Additionally, the GetActiveDelegationRecords query filters for records that
/// are either TRANSFER_IN_PROGERSS or DELEGATION_QUEUE. If a new active status
/// is added, the keeper must be modified
enum DelegationRecordStatus implements ProtoEnumVariant {
  /// TRANSFER_IN_PROGRESS indicates the native tokens are being sent from the
  /// deposit account to the delegation account
  transferInProgress(0, 'TRANSFER_IN_PROGRESS'),

  /// TRANSFER_FAILED indicates that the transfer either timed out or was an ack
  /// failure
  transferFailed(1, 'TRANSFER_FAILED'),

  /// DELEGATION_QUEUE indicates the tokens have landed on the host zone and are
  /// ready to be delegated
  delegationQueue(2, 'DELEGATION_QUEUE'),

  /// DELEGATION_COMPLETE indicates the delegation has been completed
  delegationComplete(3, 'DELEGATION_COMPLETE');

  const DelegationRecordStatus(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static DelegationRecordStatus fromValue(int? value) {
    return DelegationRecordStatus.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "DelegationRecordStatus",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static DelegationRecordStatus from(Object? value) {
    return DelegationRecordStatus.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "DelegationRecordStatus",
                value: value,
              ),
    );
  }
}

/// Status fields for an unbonding record
enum UnbondingRecordStatus implements ProtoEnumVariant {
  /// ACCUMULATING_REDEMPTIONS indicates redemptions are still being accumulated
  /// on this record
  accumulatingRedemptions(0, 'ACCUMULATING_REDEMPTIONS'),

  /// UNBONDING_QUEUE indicates the unbond amount for this epoch has been froze
  /// and the tokens are ready to be unbonded on the host zone
  unbondingQueue(1, 'UNBONDING_QUEUE'),

  /// UNBONDING_IN_PROGRESS indicates the unbonding is currently in progress on
  /// the host zone
  unbondingInProgress(2, 'UNBONDING_IN_PROGRESS'),

  /// UNBONDED indicates the unbonding is finished on the host zone and the
  /// tokens are still in the delegation account
  unbonded(3, 'UNBONDED'),

  /// CLAIMABLE indicates the unbonded tokens have been swept to stride and are
  /// ready to be distributed to users
  claimable(4, 'CLAIMABLE'),

  /// CLAIMED indicates the full unbonding cycle has been completed
  claimed(5, 'CLAIMED');

  const UnbondingRecordStatus(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static UnbondingRecordStatus fromValue(int? value) {
    return UnbondingRecordStatus.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "UnbondingRecordStatus",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static UnbondingRecordStatus from(Object? value) {
    return UnbondingRecordStatus.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "UnbondingRecordStatus",
                value: value,
              ),
    );
  }
}

class HostZone extends CosmosProtoMessage {
  /// Chain ID
  final String? chainId;

  /// Native token denom on the host zone (e.g. utia)
  final String? nativeTokenDenom;

  /// IBC denom of the native token as it lives on stride (e.g. ibc/...)
  final String? nativeTokenIbcDenom;

  /// Transfer channel ID from stride to the host zone
  final String? transferChannelId;

  /// Operator controlled delegation address on the host zone
  final String? delegationAddress;

  /// Operator controlled reward address on the host zone
  final String? rewardAddress;

  /// Deposit address on stride
  final String? depositAddress;

  /// Redemption address on stride
  final String? redemptionAddress;

  /// Claim address on stride
  final String? claimAddress;

  /// operator address set by safe, on stride
  final String? operatorAddressOnStride;

  /// admin address set upon host zone creation,  on stride
  final String? safeAddressOnStride;

  /// Total delegated balance on the host zone delegation account
  final String? remainingDelegatedBalance;

  /// The undelegation period for Celestia in days
  final BigInt? unbondingPeriodSeconds;

  /// Indicates whether the host zone has been halted
  final bool? halted;

  const HostZone({
    this.chainId,
    this.nativeTokenDenom,
    this.nativeTokenIbcDenom,
    this.transferChannelId,
    this.delegationAddress,
    this.rewardAddress,
    this.depositAddress,
    this.redemptionAddress,
    this.claimAddress,
    this.operatorAddressOnStride,
    this.safeAddressOnStride,
    this.remainingDelegatedBalance,
    this.unbondingPeriodSeconds,
    this.halted,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(7, options: const []),
        ProtoFieldConfig.string(8, options: const []),
        ProtoFieldConfig.string(9, options: const []),
        ProtoFieldConfig.string(10, options: const []),
        ProtoFieldConfig.string(11, options: const []),
        ProtoFieldConfig.string(18, options: const []),
        ProtoFieldConfig.uint64(19),
        ProtoFieldConfig.bool(20),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    chainId,
    nativeTokenDenom,
    nativeTokenIbcDenom,
    transferChannelId,
    delegationAddress,
    rewardAddress,
    depositAddress,
    redemptionAddress,
    claimAddress,
    operatorAddressOnStride,
    safeAddressOnStride,
    remainingDelegatedBalance,
    unbondingPeriodSeconds,
    halted,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'chain_id': chainId,
      'native_token_denom': nativeTokenDenom,
      'native_token_ibc_denom': nativeTokenIbcDenom,
      'transfer_channel_id': transferChannelId,
      'delegation_address': delegationAddress,
      'reward_address': rewardAddress,
      'deposit_address': depositAddress,
      'redemption_address': redemptionAddress,
      'claim_address': claimAddress,
      'operator_address_on_stride': operatorAddressOnStride,
      'safe_address_on_stride': safeAddressOnStride,
      'remaining_delegated_balance': remainingDelegatedBalance,
      'unbonding_period_seconds': unbondingPeriodSeconds?.toString(),
      'halted': halted,
    };
  }

  factory HostZone.fromJson(Map<String, dynamic> json) {
    return HostZone(
      chainId: json.valueAsString<String?>('chain_id', acceptCamelCase: true),
      nativeTokenDenom: json.valueAsString<String?>(
        'native_token_denom',
        acceptCamelCase: true,
      ),
      nativeTokenIbcDenom: json.valueAsString<String?>(
        'native_token_ibc_denom',
        acceptCamelCase: true,
      ),
      transferChannelId: json.valueAsString<String?>(
        'transfer_channel_id',
        acceptCamelCase: true,
      ),
      delegationAddress: json.valueAsString<String?>(
        'delegation_address',
        acceptCamelCase: true,
      ),
      rewardAddress: json.valueAsString<String?>(
        'reward_address',
        acceptCamelCase: true,
      ),
      depositAddress: json.valueAsString<String?>(
        'deposit_address',
        acceptCamelCase: true,
      ),
      redemptionAddress: json.valueAsString<String?>(
        'redemption_address',
        acceptCamelCase: true,
      ),
      claimAddress: json.valueAsString<String?>(
        'claim_address',
        acceptCamelCase: true,
      ),
      operatorAddressOnStride: json.valueAsString<String?>(
        'operator_address_on_stride',
        acceptCamelCase: true,
      ),
      safeAddressOnStride: json.valueAsString<String?>(
        'safe_address_on_stride',
        acceptCamelCase: true,
      ),
      remainingDelegatedBalance: json.valueAsString<String?>(
        'remaining_delegated_balance',
        acceptCamelCase: true,
      ),
      unbondingPeriodSeconds: json.valueAsBigInt<BigInt?>(
        'unbonding_period_seconds',
        acceptCamelCase: true,
      ),
      halted: json.valueAsBool<bool?>('halted', acceptCamelCase: true),
    );
  }

  factory HostZone.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return HostZone(
      chainId: decode.getString<String?>(1),
      nativeTokenDenom: decode.getString<String?>(2),
      nativeTokenIbcDenom: decode.getString<String?>(3),
      transferChannelId: decode.getString<String?>(4),
      delegationAddress: decode.getString<String?>(5),
      rewardAddress: decode.getString<String?>(6),
      depositAddress: decode.getString<String?>(7),
      redemptionAddress: decode.getString<String?>(8),
      claimAddress: decode.getString<String?>(9),
      operatorAddressOnStride: decode.getString<String?>(10),
      safeAddressOnStride: decode.getString<String?>(11),
      remainingDelegatedBalance: decode.getString<String?>(18),
      unbondingPeriodSeconds: decode.getBigInt<BigInt?>(19),
      halted: decode.getBool<bool?>(20),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStaketiaHostZone;
}

/// DelegationRecords track the aggregate liquid stakes and delegations
/// for a given epoch
/// Note: There is an important assumption here that tokens in the deposit
/// account should not be tracked by these records. The record is created as soon
/// as the tokens leave stride
class DelegationRecord extends CosmosProtoMessage {
  /// Deposit record unique ID
  final BigInt? id;

  /// The amount of native tokens that should be delegated
  final String? nativeAmount;

  /// The status indicating the point in the delegation's lifecycle
  final DelegationRecordStatus? status;

  /// The tx hash of the delegation on the host zone
  final String? txHash;

  const DelegationRecord({
    this.id,
    this.nativeAmount,
    this.status,
    this.txHash,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.enumType(3),
        ProtoFieldConfig.string(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [id, nativeAmount, status, txHash];

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id?.toString(),
      'native_amount': nativeAmount,
      'status': status?.protoName,
      'tx_hash': txHash,
    };
  }

  factory DelegationRecord.fromJson(Map<String, dynamic> json) {
    return DelegationRecord(
      id: json.valueAsBigInt<BigInt?>('id', acceptCamelCase: true),
      nativeAmount: json.valueAsString<String?>(
        'native_amount',
        acceptCamelCase: true,
      ),
      status: json.valueTo<DelegationRecordStatus?, Object?>(
        key: 'status',
        parse: (v) => DelegationRecordStatus.from(v),
      ),
      txHash: json.valueAsString<String?>('tx_hash', acceptCamelCase: true),
    );
  }

  factory DelegationRecord.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DelegationRecord(
      id: decode.getBigInt<BigInt?>(1),
      nativeAmount: decode.getString<String?>(2),
      status: decode.getEnum<DelegationRecordStatus?>(
        3,
        DelegationRecordStatus.values,
      ),
      txHash: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStaketiaDelegationRecord;
}

/// UnbondingRecords track the aggregate unbondings across an epoch
class UnbondingRecord extends CosmosProtoMessage {
  /// Unbonding record ID
  final BigInt? id;

  /// The status indicating the point in the delegation's lifecycle
  final UnbondingRecordStatus? status;

  /// The amount of stTokens that were redeemed
  final String? stTokenAmount;

  /// The corresponding amount of native tokens that should be unbonded
  final String? nativeAmount;

  /// The Unix timestamp (in seconds) at which the unbonding completes
  final BigInt? unbondingCompletionTimeSeconds;

  /// The tx hash of the undelegation on the host zone
  final String? undelegationTxHash;

  /// The tx hash of the unbonded token sweep on the host zone
  final String? unbondedTokenSweepTxHash;

  const UnbondingRecord({
    this.id,
    this.status,
    this.stTokenAmount,
    this.nativeAmount,
    this.unbondingCompletionTimeSeconds,
    this.undelegationTxHash,
    this.unbondedTokenSweepTxHash,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.enumType(2),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.uint64(5),
        ProtoFieldConfig.string(6),
        ProtoFieldConfig.string(7),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    id,
    status,
    stTokenAmount,
    nativeAmount,
    unbondingCompletionTimeSeconds,
    undelegationTxHash,
    unbondedTokenSweepTxHash,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id?.toString(),
      'status': status?.protoName,
      'st_token_amount': stTokenAmount,
      'native_amount': nativeAmount,
      'unbonding_completion_time_seconds':
          unbondingCompletionTimeSeconds?.toString(),
      'undelegation_tx_hash': undelegationTxHash,
      'unbonded_token_sweep_tx_hash': unbondedTokenSweepTxHash,
    };
  }

  factory UnbondingRecord.fromJson(Map<String, dynamic> json) {
    return UnbondingRecord(
      id: json.valueAsBigInt<BigInt?>('id', acceptCamelCase: true),
      status: json.valueTo<UnbondingRecordStatus?, Object?>(
        key: 'status',
        parse: (v) => UnbondingRecordStatus.from(v),
      ),
      stTokenAmount: json.valueAsString<String?>(
        'st_token_amount',
        acceptCamelCase: true,
      ),
      nativeAmount: json.valueAsString<String?>(
        'native_amount',
        acceptCamelCase: true,
      ),
      unbondingCompletionTimeSeconds: json.valueAsBigInt<BigInt?>(
        'unbonding_completion_time_seconds',
        acceptCamelCase: true,
      ),
      undelegationTxHash: json.valueAsString<String?>(
        'undelegation_tx_hash',
        acceptCamelCase: true,
      ),
      unbondedTokenSweepTxHash: json.valueAsString<String?>(
        'unbonded_token_sweep_tx_hash',
        acceptCamelCase: true,
      ),
    );
  }

  factory UnbondingRecord.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return UnbondingRecord(
      id: decode.getBigInt<BigInt?>(1),
      status: decode.getEnum<UnbondingRecordStatus?>(
        2,
        UnbondingRecordStatus.values,
      ),
      stTokenAmount: decode.getString<String?>(3),
      nativeAmount: decode.getString<String?>(4),
      unbondingCompletionTimeSeconds: decode.getBigInt<BigInt?>(5),
      undelegationTxHash: decode.getString<String?>(6),
      unbondedTokenSweepTxHash: decode.getString<String?>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStaketiaUnbondingRecord;
}

/// RedemptionRecords track an individual user's redemption claims
class RedemptionRecord extends CosmosProtoMessage {
  /// Unbonding record ID
  final BigInt? unbondingRecordId;

  /// Redeemer
  final String? redeemer;

  /// The amount of stTokens that were redeemed
  final String? stTokenAmount;

  /// The corresponding amount of native tokens that should be unbonded
  final String? nativeAmount;

  const RedemptionRecord({
    this.unbondingRecordId,
    this.redeemer,
    this.stTokenAmount,
    this.nativeAmount,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    unbondingRecordId,
    redeemer,
    stTokenAmount,
    nativeAmount,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'unbonding_record_id': unbondingRecordId?.toString(),
      'redeemer': redeemer,
      'st_token_amount': stTokenAmount,
      'native_amount': nativeAmount,
    };
  }

  factory RedemptionRecord.fromJson(Map<String, dynamic> json) {
    return RedemptionRecord(
      unbondingRecordId: json.valueAsBigInt<BigInt?>(
        'unbonding_record_id',
        acceptCamelCase: true,
      ),
      redeemer: json.valueAsString<String?>('redeemer', acceptCamelCase: true),
      stTokenAmount: json.valueAsString<String?>(
        'st_token_amount',
        acceptCamelCase: true,
      ),
      nativeAmount: json.valueAsString<String?>(
        'native_amount',
        acceptCamelCase: true,
      ),
    );
  }

  factory RedemptionRecord.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RedemptionRecord(
      unbondingRecordId: decode.getBigInt<BigInt?>(1),
      redeemer: decode.getString<String?>(2),
      stTokenAmount: decode.getString<String?>(3),
      nativeAmount: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStaketiaRedemptionRecord;
}

/// SlashRecords log adjustments to the delegated balance
class SlashRecord extends CosmosProtoMessage {
  /// The slash record monotonically increasing ID
  final BigInt? id;

  /// The Unix timestamp (in seconds) when the slash adjustment was processed on
  /// stride
  final BigInt? time;

  /// The delta by which the total delegated amount changed from slash
  final String? nativeAmount;

  /// The address (or addresses) of the validator that was slashed
  final String? validatorAddress;

  const SlashRecord({
    this.id,
    this.time,
    this.nativeAmount,
    this.validatorAddress,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [id, time, nativeAmount, validatorAddress];

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id?.toString(),
      'time': time?.toString(),
      'native_amount': nativeAmount,
      'validator_address': validatorAddress,
    };
  }

  factory SlashRecord.fromJson(Map<String, dynamic> json) {
    return SlashRecord(
      id: json.valueAsBigInt<BigInt?>('id', acceptCamelCase: true),
      time: json.valueAsBigInt<BigInt?>('time', acceptCamelCase: true),
      nativeAmount: json.valueAsString<String?>(
        'native_amount',
        acceptCamelCase: true,
      ),
      validatorAddress: json.valueAsString<String?>(
        'validator_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory SlashRecord.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SlashRecord(
      id: decode.getBigInt<BigInt?>(1),
      time: decode.getBigInt<BigInt?>(2),
      nativeAmount: decode.getString<String?>(3),
      validatorAddress: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStaketiaSlashRecord;
}
