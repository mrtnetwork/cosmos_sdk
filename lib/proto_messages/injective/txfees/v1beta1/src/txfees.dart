import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class Params extends CosmosProtoMessage {
  final BigInt? maxGasWantedPerTx;

  final BigInt? highGasTxThreshold;

  final String? minGasPriceForHighGasTx;

  final bool? mempool1559Enabled;

  final String? minGasPrice;

  final String? defaultBaseFeeMultiplier;

  final String? maxBaseFeeMultiplier;

  final BigInt? resetInterval;

  final String? maxBlockChangeRate;

  final String? targetBlockSpacePercentRate;

  final String? recheckFeeLowBaseFee;

  final String? recheckFeeHighBaseFee;

  final String? recheckFeeBaseFeeThresholdMultiplier;

  const Params({
    this.maxGasWantedPerTx,
    this.highGasTxThreshold,
    this.minGasPriceForHighGasTx,
    this.mempool1559Enabled,
    this.minGasPrice,
    this.defaultBaseFeeMultiplier,
    this.maxBaseFeeMultiplier,
    this.resetInterval,
    this.maxBlockChangeRate,
    this.targetBlockSpacePercentRate,
    this.recheckFeeLowBaseFee,
    this.recheckFeeHighBaseFee,
    this.recheckFeeBaseFeeThresholdMultiplier,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [ProtoOptionString(name: "amino.name", value: "txfees/Params")],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.bool(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(7, options: const []),
        ProtoFieldConfig.int64(8, options: const []),
        ProtoFieldConfig.string(9, options: const []),
        ProtoFieldConfig.string(10, options: const []),
        ProtoFieldConfig.string(11, options: const []),
        ProtoFieldConfig.string(12, options: const []),
        ProtoFieldConfig.string(13, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    maxGasWantedPerTx,
    highGasTxThreshold,
    minGasPriceForHighGasTx,
    mempool1559Enabled,
    minGasPrice,
    defaultBaseFeeMultiplier,
    maxBaseFeeMultiplier,
    resetInterval,
    maxBlockChangeRate,
    targetBlockSpacePercentRate,
    recheckFeeLowBaseFee,
    recheckFeeHighBaseFee,
    recheckFeeBaseFeeThresholdMultiplier,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'max_gas_wanted_per_tx': config.encodeBigint(maxGasWantedPerTx),
      'high_gas_tx_threshold': config.encodeBigint(highGasTxThreshold),
      'min_gas_price_for_high_gas_tx': minGasPriceForHighGasTx,
      'mempool1559_enabled': mempool1559Enabled,
      'min_gas_price': minGasPrice,
      'default_base_fee_multiplier': defaultBaseFeeMultiplier,
      'max_base_fee_multiplier': maxBaseFeeMultiplier,
      'reset_interval': config.encodeBigint(resetInterval),
      'max_block_change_rate': maxBlockChangeRate,
      'target_block_space_percent_rate': targetBlockSpacePercentRate,
      'recheck_fee_low_base_fee': recheckFeeLowBaseFee,
      'recheck_fee_high_base_fee': recheckFeeHighBaseFee,
      'recheck_fee_base_fee_threshold_multiplier':
          recheckFeeBaseFeeThresholdMultiplier,
    };
  }

  factory Params.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Params(
      maxGasWantedPerTx: json.valueAsBigInt<BigInt?>(
        'max_gas_wanted_per_tx',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      highGasTxThreshold: json.valueAsBigInt<BigInt?>(
        'high_gas_tx_threshold',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      minGasPriceForHighGasTx: json.valueAsString<String?>(
        'min_gas_price_for_high_gas_tx',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      mempool1559Enabled: json.valueAsBool<bool?>(
        'mempool1559_enabled',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      minGasPrice: json.valueAsString<String?>(
        'min_gas_price',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      defaultBaseFeeMultiplier: json.valueAsString<String?>(
        'default_base_fee_multiplier',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      maxBaseFeeMultiplier: json.valueAsString<String?>(
        'max_base_fee_multiplier',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      resetInterval: json.valueAsBigInt<BigInt?>(
        'reset_interval',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      maxBlockChangeRate: json.valueAsString<String?>(
        'max_block_change_rate',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      targetBlockSpacePercentRate: json.valueAsString<String?>(
        'target_block_space_percent_rate',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      recheckFeeLowBaseFee: json.valueAsString<String?>(
        'recheck_fee_low_base_fee',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      recheckFeeHighBaseFee: json.valueAsString<String?>(
        'recheck_fee_high_base_fee',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      recheckFeeBaseFeeThresholdMultiplier: json.valueAsString<String?>(
        'recheck_fee_base_fee_threshold_multiplier',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      maxGasWantedPerTx: decode.getBigInt<BigInt?>(1),
      highGasTxThreshold: decode.getBigInt<BigInt?>(2),
      minGasPriceForHighGasTx: decode.getString<String?>(3),
      mempool1559Enabled: decode.getBool<bool?>(4),
      minGasPrice: decode.getString<String?>(5),
      defaultBaseFeeMultiplier: decode.getString<String?>(6),
      maxBaseFeeMultiplier: decode.getString<String?>(7),
      resetInterval: decode.getBigInt<BigInt?>(8),
      maxBlockChangeRate: decode.getString<String?>(9),
      targetBlockSpacePercentRate: decode.getString<String?>(10),
      recheckFeeLowBaseFee: decode.getString<String?>(11),
      recheckFeeHighBaseFee: decode.getString<String?>(12),
      recheckFeeBaseFeeThresholdMultiplier: decode.getString<String?>(13),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveTxfeesV1beta1Params;
}
