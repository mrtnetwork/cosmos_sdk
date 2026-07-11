import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Params defines the EVM module parameters
class Params extends CosmosProtoMessage {
  /// no_base_fee forces the EIP-1559 base fee to 0 (needed for 0 price calls)
  final bool? noBaseFee;

  /// base_fee_change_denominator bounds the amount the base fee can change
  /// between blocks.
  final int? baseFeeChangeDenominator;

  /// elasticity_multiplier bounds the maximum gas limit an EIP-1559 block may
  /// have.
  final int? elasticityMultiplier;

  /// DEPRECATED: initial base fee for EIP-1559 blocks.
  /// enable_height defines at which block height the base fee calculation is
  /// enabled.
  final BigInt? enableHeight;

  /// base_fee for EIP-1559 blocks.
  final String? baseFee;

  /// min_gas_price defines the minimum gas price value for cosmos and eth
  /// transactions
  final String? minGasPrice;

  /// min_gas_multiplier bounds the minimum gas used to be charged
  /// to senders based on gas limit
  final String? minGasMultiplier;

  const Params({
    this.noBaseFee,
    this.baseFeeChangeDenominator,
    this.elasticityMultiplier,
    this.enableHeight,
    this.baseFee,
    this.minGasPrice,
    this.minGasMultiplier,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos/evm/x/feemarket/Params",
        ),
      ],
      fields: [
        ProtoFieldConfig.bool(1),
        ProtoFieldConfig.uint32(2),
        ProtoFieldConfig.uint32(3),
        ProtoFieldConfig.int64(5),
        ProtoFieldConfig.string(
          6,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(
          7,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(
          8,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    noBaseFee,
    baseFeeChangeDenominator,
    elasticityMultiplier,
    enableHeight,
    baseFee,
    minGasPrice,
    minGasMultiplier,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'no_base_fee': noBaseFee,
      'base_fee_change_denominator': baseFeeChangeDenominator,
      'elasticity_multiplier': elasticityMultiplier,
      'enable_height': enableHeight?.toString(),
      'base_fee': baseFee,
      'min_gas_price': minGasPrice,
      'min_gas_multiplier': minGasMultiplier,
    };
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      noBaseFee: json.valueAsBool<bool?>('no_base_fee', acceptCamelCase: true),
      baseFeeChangeDenominator: json.valueAsInt<int?>(
        'base_fee_change_denominator',
        acceptCamelCase: true,
      ),
      elasticityMultiplier: json.valueAsInt<int?>(
        'elasticity_multiplier',
        acceptCamelCase: true,
      ),
      enableHeight: json.valueAsBigInt<BigInt?>(
        'enable_height',
        acceptCamelCase: true,
      ),
      baseFee: json.valueAsString<String?>('base_fee', acceptCamelCase: true),
      minGasPrice: json.valueAsString<String?>(
        'min_gas_price',
        acceptCamelCase: true,
      ),
      minGasMultiplier: json.valueAsString<String?>(
        'min_gas_multiplier',
        acceptCamelCase: true,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      noBaseFee: decode.getBool<bool?>(1),
      baseFeeChangeDenominator: decode.getInt<int?>(2),
      elasticityMultiplier: decode.getInt<int?>(3),
      enableHeight: decode.getBigInt<BigInt?>(5),
      baseFee: decode.getString<String?>(6),
      minGasPrice: decode.getString<String?>(7),
      minGasMultiplier: decode.getString<String?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosEvmFeemarketV1Params;
}
