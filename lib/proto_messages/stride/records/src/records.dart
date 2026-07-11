import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

enum DepositRecordStatus implements ProtoEnumVariant {
  /// in transfer queue to be sent to the delegation ICA
  transferQueue(0, 'TRANSFER_QUEUE'),

  /// transfer in progress (IBC packet sent, ack not received)
  transferInProgress(2, 'TRANSFER_IN_PROGRESS'),

  /// in staking queue on delegation ICA
  delegationQueue(1, 'DELEGATION_QUEUE'),

  /// staking in progress (ICA packet sent, ack not received)
  delegationInProgress(3, 'DELEGATION_IN_PROGRESS');

  const DepositRecordStatus(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static DepositRecordStatus fromValue(int? value) {
    return DepositRecordStatus.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "DepositRecordStatus",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static DepositRecordStatus from(Object? value) {
    return DepositRecordStatus.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "DepositRecordStatus",
                value: value,
              ),
    );
  }
}

enum DepositRecordSource implements ProtoEnumVariant {
  stride(0, 'STRIDE'),
  withdrawalIca(1, 'WITHDRAWAL_ICA');

  const DepositRecordSource(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static DepositRecordSource fromValue(int? value) {
    return DepositRecordSource.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "DepositRecordSource",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static DepositRecordSource from(Object? value) {
    return DepositRecordSource.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "DepositRecordSource",
                value: value,
              ),
    );
  }
}

enum HostZoneUnbondingStatus implements ProtoEnumVariant {
  /// tokens bonded on delegate account
  unbondingQueue(0, 'UNBONDING_QUEUE'),

  /// unbonding ICA has been submitted
  unbondingInProgress(3, 'UNBONDING_IN_PROGRESS'),

  /// unbonding ICA failed for at least one batch and need to be retried
  unbondingRetryQueue(5, 'UNBONDING_RETRY_QUEUE'),

  /// unbonding completed on delegate account
  exitTransferQueue(1, 'EXIT_TRANSFER_QUEUE'),

  /// redemption sweep has been submitted
  exitTransferInProgress(4, 'EXIT_TRANSFER_IN_PROGRESS'),

  /// transfer success
  claimable(2, 'CLAIMABLE');

  const HostZoneUnbondingStatus(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static HostZoneUnbondingStatus fromValue(int? value) {
    return HostZoneUnbondingStatus.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "HostZoneUnbondingStatus",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static HostZoneUnbondingStatus from(Object? value) {
    return HostZoneUnbondingStatus.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "HostZoneUnbondingStatus",
                value: value,
              ),
    );
  }
}

enum LSMTokenDepositStatus implements ProtoEnumVariant {
  depositPending(0, 'DEPOSIT_PENDING'),
  transferQueue(1, 'TRANSFER_QUEUE'),
  transferInProgress(2, 'TRANSFER_IN_PROGRESS'),
  transferFailed(3, 'TRANSFER_FAILED'),
  detokenizationQueue(4, 'DETOKENIZATION_QUEUE'),
  detokenizationInProgress(5, 'DETOKENIZATION_IN_PROGRESS'),
  detokenizationFailed(6, 'DETOKENIZATION_FAILED');

  const LSMTokenDepositStatus(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static LSMTokenDepositStatus fromValue(int? value) {
    return LSMTokenDepositStatus.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "LSMTokenDepositStatus",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static LSMTokenDepositStatus from(Object? value) {
    return LSMTokenDepositStatus.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "LSMTokenDepositStatus",
                value: value,
              ),
    );
  }
}

class UserRedemptionRecord extends CosmosProtoMessage {
  final String? id;

  /// {chain_id}.{epoch}.{receiver}
  final String? receiver;

  final String? nativeTokenAmount;

  final String? denom;

  final String? hostZoneId;

  final BigInt? epochNumber;

  final bool? claimIsPending;

  final String? stTokenAmount;

  const UserRedemptionRecord({
    this.id,
    this.receiver,
    this.nativeTokenAmount,
    this.denom,
    this.hostZoneId,
    this.epochNumber,
    this.claimIsPending,
    this.stTokenAmount,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.string(6),
        ProtoFieldConfig.uint64(7),
        ProtoFieldConfig.bool(8),
        ProtoFieldConfig.string(9, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    id,
    receiver,
    nativeTokenAmount,
    denom,
    hostZoneId,
    epochNumber,
    claimIsPending,
    stTokenAmount,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'receiver': receiver,
      'native_token_amount': nativeTokenAmount,
      'denom': denom,
      'host_zone_id': hostZoneId,
      'epoch_number': epochNumber?.toString(),
      'claim_is_pending': claimIsPending,
      'st_token_amount': stTokenAmount,
    };
  }

  factory UserRedemptionRecord.fromJson(Map<String, dynamic> json) {
    return UserRedemptionRecord(
      id: json.valueAsString<String?>('id', acceptCamelCase: true),
      receiver: json.valueAsString<String?>('receiver', acceptCamelCase: true),
      nativeTokenAmount: json.valueAsString<String?>(
        'native_token_amount',
        acceptCamelCase: true,
      ),
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      hostZoneId: json.valueAsString<String?>(
        'host_zone_id',
        acceptCamelCase: true,
      ),
      epochNumber: json.valueAsBigInt<BigInt?>(
        'epoch_number',
        acceptCamelCase: true,
      ),
      claimIsPending: json.valueAsBool<bool?>(
        'claim_is_pending',
        acceptCamelCase: true,
      ),
      stTokenAmount: json.valueAsString<String?>(
        'st_token_amount',
        acceptCamelCase: true,
      ),
    );
  }

  factory UserRedemptionRecord.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return UserRedemptionRecord(
      id: decode.getString<String?>(1),
      receiver: decode.getString<String?>(3),
      nativeTokenAmount: decode.getString<String?>(4),
      denom: decode.getString<String?>(5),
      hostZoneId: decode.getString<String?>(6),
      epochNumber: decode.getBigInt<BigInt?>(7),
      claimIsPending: decode.getBool<bool?>(8),
      stTokenAmount: decode.getString<String?>(9),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideRecordsUserRedemptionRecord;
}

class DepositRecord extends CosmosProtoMessage {
  final BigInt? id;

  final String? amount;

  final String? denom;

  final String? hostZoneId;

  final DepositRecordStatus? status;

  final BigInt? depositEpochNumber;

  final DepositRecordSource? source;

  final BigInt? delegationTxsInProgress;

  const DepositRecord({
    this.id,
    this.amount,
    this.denom,
    this.hostZoneId,
    this.status,
    this.depositEpochNumber,
    this.source,
    this.delegationTxsInProgress,
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
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.enumType(6),
        ProtoFieldConfig.uint64(7),
        ProtoFieldConfig.enumType(8),
        ProtoFieldConfig.uint64(9),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    id,
    amount,
    denom,
    hostZoneId,
    status,
    depositEpochNumber,
    source,
    delegationTxsInProgress,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id?.toString(),
      'amount': amount,
      'denom': denom,
      'host_zone_id': hostZoneId,
      'status': status?.protoName,
      'deposit_epoch_number': depositEpochNumber?.toString(),
      'source': source?.protoName,
      'delegation_txs_in_progress': delegationTxsInProgress?.toString(),
    };
  }

  factory DepositRecord.fromJson(Map<String, dynamic> json) {
    return DepositRecord(
      id: json.valueAsBigInt<BigInt?>('id', acceptCamelCase: true),
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      hostZoneId: json.valueAsString<String?>(
        'host_zone_id',
        acceptCamelCase: true,
      ),
      status: json.valueTo<DepositRecordStatus?, Object?>(
        key: 'status',
        parse: (v) => DepositRecordStatus.from(v),
      ),
      depositEpochNumber: json.valueAsBigInt<BigInt?>(
        'deposit_epoch_number',
        acceptCamelCase: true,
      ),
      source: json.valueTo<DepositRecordSource?, Object?>(
        key: 'source',
        parse: (v) => DepositRecordSource.from(v),
      ),
      delegationTxsInProgress: json.valueAsBigInt<BigInt?>(
        'delegation_txs_in_progress',
        acceptCamelCase: true,
      ),
    );
  }

  factory DepositRecord.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DepositRecord(
      id: decode.getBigInt<BigInt?>(1),
      amount: decode.getString<String?>(2),
      denom: decode.getString<String?>(3),
      hostZoneId: decode.getString<String?>(4),
      status: decode.getEnum<DepositRecordStatus?>(
        6,
        DepositRecordStatus.values,
      ),
      depositEpochNumber: decode.getBigInt<BigInt?>(7),
      source: decode.getEnum<DepositRecordSource?>(
        8,
        DepositRecordSource.values,
      ),
      delegationTxsInProgress: decode.getBigInt<BigInt?>(9),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideRecordsDepositRecord;
}

class HostZoneUnbonding extends CosmosProtoMessage {
  final String? stTokenAmount;

  final String? nativeTokenAmount;

  final String? stTokensToBurn;

  final String? nativeTokensToUnbond;

  final String? claimableNativeTokens;

  final BigInt? undelegationTxsInProgress;

  final String? denom;

  final String? hostZoneId;

  final BigInt? unbondingTime;

  final HostZoneUnbondingStatus? status;

  final List<String> userRedemptionRecords;

  const HostZoneUnbonding({
    this.stTokenAmount,
    this.nativeTokenAmount,
    this.stTokensToBurn,
    this.nativeTokensToUnbond,
    this.claimableNativeTokens,
    this.undelegationTxsInProgress,
    this.denom,
    this.hostZoneId,
    this.unbondingTime,
    this.status,
    this.userRedemptionRecords = const [],
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
        ProtoFieldConfig.string(8, options: const []),
        ProtoFieldConfig.string(9, options: const []),
        ProtoFieldConfig.string(10, options: const []),
        ProtoFieldConfig.uint64(11),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.uint64(5),
        ProtoFieldConfig.enumType(6),
        ProtoFieldConfig.repeated(
          fieldNumber: 7,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    stTokenAmount,
    nativeTokenAmount,
    stTokensToBurn,
    nativeTokensToUnbond,
    claimableNativeTokens,
    undelegationTxsInProgress,
    denom,
    hostZoneId,
    unbondingTime,
    status,
    userRedemptionRecords,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'st_token_amount': stTokenAmount,
      'native_token_amount': nativeTokenAmount,
      'st_tokens_to_burn': stTokensToBurn,
      'native_tokens_to_unbond': nativeTokensToUnbond,
      'claimable_native_tokens': claimableNativeTokens,
      'undelegation_txs_in_progress': undelegationTxsInProgress?.toString(),
      'denom': denom,
      'host_zone_id': hostZoneId,
      'unbonding_time': unbondingTime?.toString(),
      'status': status?.protoName,
      'user_redemption_records': userRedemptionRecords.map((e) => e).toList(),
    };
  }

  factory HostZoneUnbonding.fromJson(Map<String, dynamic> json) {
    return HostZoneUnbonding(
      stTokenAmount: json.valueAsString<String?>(
        'st_token_amount',
        acceptCamelCase: true,
      ),
      nativeTokenAmount: json.valueAsString<String?>(
        'native_token_amount',
        acceptCamelCase: true,
      ),
      stTokensToBurn: json.valueAsString<String?>(
        'st_tokens_to_burn',
        acceptCamelCase: true,
      ),
      nativeTokensToUnbond: json.valueAsString<String?>(
        'native_tokens_to_unbond',
        acceptCamelCase: true,
      ),
      claimableNativeTokens: json.valueAsString<String?>(
        'claimable_native_tokens',
        acceptCamelCase: true,
      ),
      undelegationTxsInProgress: json.valueAsBigInt<BigInt?>(
        'undelegation_txs_in_progress',
        acceptCamelCase: true,
      ),
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      hostZoneId: json.valueAsString<String?>(
        'host_zone_id',
        acceptCamelCase: true,
      ),
      unbondingTime: json.valueAsBigInt<BigInt?>(
        'unbonding_time',
        acceptCamelCase: true,
      ),
      status: json.valueTo<HostZoneUnbondingStatus?, Object?>(
        key: 'status',
        parse: (v) => HostZoneUnbondingStatus.from(v),
      ),
      userRedemptionRecords:
          (json.valueEnsureAsList<dynamic>(
            'user_redemption_records',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory HostZoneUnbonding.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return HostZoneUnbonding(
      stTokenAmount: decode.getString<String?>(1),
      nativeTokenAmount: decode.getString<String?>(2),
      stTokensToBurn: decode.getString<String?>(8),
      nativeTokensToUnbond: decode.getString<String?>(9),
      claimableNativeTokens: decode.getString<String?>(10),
      undelegationTxsInProgress: decode.getBigInt<BigInt?>(11),
      denom: decode.getString<String?>(3),
      hostZoneId: decode.getString<String?>(4),
      unbondingTime: decode.getBigInt<BigInt?>(5),
      status: decode.getEnum<HostZoneUnbondingStatus?>(
        6,
        HostZoneUnbondingStatus.values,
      ),
      userRedemptionRecords: decode.getListOrEmpty<String>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideRecordsHostZoneUnbonding;
}

class EpochUnbondingRecord extends CosmosProtoMessage {
  final BigInt? epochNumber;

  final List<HostZoneUnbonding> hostZoneUnbondings;

  const EpochUnbondingRecord({
    this.epochNumber,
    this.hostZoneUnbondings = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [epochNumber, hostZoneUnbondings];

  @override
  Map<String, dynamic> toJson() {
    return {
      'epoch_number': epochNumber?.toString(),
      'host_zone_unbondings':
          hostZoneUnbondings.map((e) => e.toJson()).toList(),
    };
  }

  factory EpochUnbondingRecord.fromJson(Map<String, dynamic> json) {
    return EpochUnbondingRecord(
      epochNumber: json.valueAsBigInt<BigInt?>(
        'epoch_number',
        acceptCamelCase: true,
      ),
      hostZoneUnbondings:
          (json.valueEnsureAsList<dynamic>(
                'host_zone_unbondings',
                acceptCamelCase: true,
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<HostZoneUnbonding, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => HostZoneUnbonding.fromJson(v),
                    ),
              )
              .toList(),
    );
  }

  factory EpochUnbondingRecord.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return EpochUnbondingRecord(
      epochNumber: decode.getBigInt<BigInt?>(1),
      hostZoneUnbondings:
          decode
              .getListOfBytes(3)
              .map((b) => HostZoneUnbonding.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideRecordsEpochUnbondingRecord;
}

class LSMTokenDeposit extends CosmosProtoMessage {
  final String? depositId;

  final String? chainId;

  final String? denom;

  final String? ibcDenom;

  final String? stakerAddress;

  final String? validatorAddress;

  final String? amount;

  final cosmos_base_v1beta1_coin.Coin? stToken;

  final LSMTokenDepositStatus? status;

  const LSMTokenDeposit({
    this.depositId,
    this.chainId,
    this.denom,
    this.ibcDenom,
    this.stakerAddress,
    this.validatorAddress,
    this.amount,
    this.stToken,
    this.status,
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
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.string(6),
        ProtoFieldConfig.string(7, options: const []),
        ProtoFieldConfig.message(8, options: const []),
        ProtoFieldConfig.enumType(9),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    depositId,
    chainId,
    denom,
    ibcDenom,
    stakerAddress,
    validatorAddress,
    amount,
    stToken,
    status,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'deposit_id': depositId,
      'chain_id': chainId,
      'denom': denom,
      'ibc_denom': ibcDenom,
      'staker_address': stakerAddress,
      'validator_address': validatorAddress,
      'amount': amount,
      'st_token': stToken?.toJson(),
      'status': status?.protoName,
    };
  }

  factory LSMTokenDeposit.fromJson(Map<String, dynamic> json) {
    return LSMTokenDeposit(
      depositId: json.valueAsString<String?>(
        'deposit_id',
        acceptCamelCase: true,
      ),
      chainId: json.valueAsString<String?>('chain_id', acceptCamelCase: true),
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      ibcDenom: json.valueAsString<String?>('ibc_denom', acceptCamelCase: true),
      stakerAddress: json.valueAsString<String?>(
        'staker_address',
        acceptCamelCase: true,
      ),
      validatorAddress: json.valueAsString<String?>(
        'validator_address',
        acceptCamelCase: true,
      ),
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
      stToken: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'st_token',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
      status: json.valueTo<LSMTokenDepositStatus?, Object?>(
        key: 'status',
        parse: (v) => LSMTokenDepositStatus.from(v),
      ),
    );
  }

  factory LSMTokenDeposit.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return LSMTokenDeposit(
      depositId: decode.getString<String?>(1),
      chainId: decode.getString<String?>(2),
      denom: decode.getString<String?>(3),
      ibcDenom: decode.getString<String?>(4),
      stakerAddress: decode.getString<String?>(5),
      validatorAddress: decode.getString<String?>(6),
      amount: decode.getString<String?>(7),
      stToken: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        8,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      status: decode.getEnum<LSMTokenDepositStatus?>(
        9,
        LSMTokenDepositStatus.values,
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideRecordsLSMTokenDeposit;
}
