import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Params defines the parameters for the module.
/// next id: 20
class Params extends CosmosProtoMessage {
  /// define epoch lengths, in stride_epochs
  final BigInt? rewardsInterval;

  final BigInt? delegateInterval;

  final BigInt? depositInterval;

  final BigInt? redemptionRateInterval;

  final BigInt? strideCommission;

  final BigInt? reinvestInterval;

  final BigInt? icaTimeoutNanos;

  final BigInt? bufferSize;

  final BigInt? ibcTimeoutBlocks;

  final BigInt? feeTransferTimeoutNanos;

  final BigInt? maxStakeIcaCallsPerEpoch;

  final BigInt? defaultMinRedemptionRateThreshold;

  final BigInt? defaultMaxRedemptionRateThreshold;

  final BigInt? ibcTransferTimeoutNanos;

  final BigInt? validatorSlashQueryThreshold;

  final BigInt? validatorWeightCap;

  const Params({
    this.rewardsInterval,
    this.delegateInterval,
    this.depositInterval,
    this.redemptionRateInterval,
    this.strideCommission,
    this.reinvestInterval,
    this.icaTimeoutNanos,
    this.bufferSize,
    this.ibcTimeoutBlocks,
    this.feeTransferTimeoutNanos,
    this.maxStakeIcaCallsPerEpoch,
    this.defaultMinRedemptionRateThreshold,
    this.defaultMaxRedemptionRateThreshold,
    this.ibcTransferTimeoutNanos,
    this.validatorSlashQueryThreshold,
    this.validatorWeightCap,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.uint64(6),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.uint64(4),
        ProtoFieldConfig.uint64(7),
        ProtoFieldConfig.uint64(9),
        ProtoFieldConfig.uint64(10),
        ProtoFieldConfig.uint64(11),
        ProtoFieldConfig.uint64(12),
        ProtoFieldConfig.uint64(13),
        ProtoFieldConfig.uint64(14),
        ProtoFieldConfig.uint64(15),
        ProtoFieldConfig.uint64(16),
        ProtoFieldConfig.uint64(19),
        ProtoFieldConfig.uint64(20),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    rewardsInterval,
    delegateInterval,
    depositInterval,
    redemptionRateInterval,
    strideCommission,
    reinvestInterval,
    icaTimeoutNanos,
    bufferSize,
    ibcTimeoutBlocks,
    feeTransferTimeoutNanos,
    maxStakeIcaCallsPerEpoch,
    defaultMinRedemptionRateThreshold,
    defaultMaxRedemptionRateThreshold,
    ibcTransferTimeoutNanos,
    validatorSlashQueryThreshold,
    validatorWeightCap,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'rewards_interval': config.encodeBigint(rewardsInterval),
      'delegate_interval': config.encodeBigint(delegateInterval),
      'deposit_interval': config.encodeBigint(depositInterval),
      'redemption_rate_interval': config.encodeBigint(redemptionRateInterval),
      'stride_commission': config.encodeBigint(strideCommission),
      'reinvest_interval': config.encodeBigint(reinvestInterval),
      'ica_timeout_nanos': config.encodeBigint(icaTimeoutNanos),
      'buffer_size': config.encodeBigint(bufferSize),
      'ibc_timeout_blocks': config.encodeBigint(ibcTimeoutBlocks),
      'fee_transfer_timeout_nanos': config.encodeBigint(
        feeTransferTimeoutNanos,
      ),
      'max_stake_ica_calls_per_epoch': config.encodeBigint(
        maxStakeIcaCallsPerEpoch,
      ),
      'default_min_redemption_rate_threshold': config.encodeBigint(
        defaultMinRedemptionRateThreshold,
      ),
      'default_max_redemption_rate_threshold': config.encodeBigint(
        defaultMaxRedemptionRateThreshold,
      ),
      'ibc_transfer_timeout_nanos': config.encodeBigint(
        ibcTransferTimeoutNanos,
      ),
      'validator_slash_query_threshold': config.encodeBigint(
        validatorSlashQueryThreshold,
      ),
      'validator_weight_cap': config.encodeBigint(validatorWeightCap),
    };
  }

  factory Params.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Params(
      rewardsInterval: json.valueAsBigInt<BigInt?>(
        'rewards_interval',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      delegateInterval: json.valueAsBigInt<BigInt?>(
        'delegate_interval',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      depositInterval: json.valueAsBigInt<BigInt?>(
        'deposit_interval',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      redemptionRateInterval: json.valueAsBigInt<BigInt?>(
        'redemption_rate_interval',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      strideCommission: json.valueAsBigInt<BigInt?>(
        'stride_commission',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      reinvestInterval: json.valueAsBigInt<BigInt?>(
        'reinvest_interval',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      icaTimeoutNanos: json.valueAsBigInt<BigInt?>(
        'ica_timeout_nanos',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      bufferSize: json.valueAsBigInt<BigInt?>(
        'buffer_size',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      ibcTimeoutBlocks: json.valueAsBigInt<BigInt?>(
        'ibc_timeout_blocks',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      feeTransferTimeoutNanos: json.valueAsBigInt<BigInt?>(
        'fee_transfer_timeout_nanos',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      maxStakeIcaCallsPerEpoch: json.valueAsBigInt<BigInt?>(
        'max_stake_ica_calls_per_epoch',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      defaultMinRedemptionRateThreshold: json.valueAsBigInt<BigInt?>(
        'default_min_redemption_rate_threshold',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      defaultMaxRedemptionRateThreshold: json.valueAsBigInt<BigInt?>(
        'default_max_redemption_rate_threshold',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      ibcTransferTimeoutNanos: json.valueAsBigInt<BigInt?>(
        'ibc_transfer_timeout_nanos',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      validatorSlashQueryThreshold: json.valueAsBigInt<BigInt?>(
        'validator_slash_query_threshold',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      validatorWeightCap: json.valueAsBigInt<BigInt?>(
        'validator_weight_cap',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      rewardsInterval: decode.getBigInt<BigInt?>(1),
      delegateInterval: decode.getBigInt<BigInt?>(6),
      depositInterval: decode.getBigInt<BigInt?>(2),
      redemptionRateInterval: decode.getBigInt<BigInt?>(3),
      strideCommission: decode.getBigInt<BigInt?>(4),
      reinvestInterval: decode.getBigInt<BigInt?>(7),
      icaTimeoutNanos: decode.getBigInt<BigInt?>(9),
      bufferSize: decode.getBigInt<BigInt?>(10),
      ibcTimeoutBlocks: decode.getBigInt<BigInt?>(11),
      feeTransferTimeoutNanos: decode.getBigInt<BigInt?>(12),
      maxStakeIcaCallsPerEpoch: decode.getBigInt<BigInt?>(13),
      defaultMinRedemptionRateThreshold: decode.getBigInt<BigInt?>(14),
      defaultMaxRedemptionRateThreshold: decode.getBigInt<BigInt?>(15),
      ibcTransferTimeoutNanos: decode.getBigInt<BigInt?>(16),
      validatorSlashQueryThreshold: decode.getBigInt<BigInt?>(19),
      validatorWeightCap: decode.getBigInt<BigInt?>(20),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcParams;
}
