import 'package:blockchain_utils/utils/numbers/numbers.dart';
import 'package:cosmos_sdk/src/models/ethermint/fee_market_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// EventFeeMarket is the event type for the fee market module
class FeeMarketV1Params extends CosmosMessage {
  /// no_base_fee forces the EIP-1559 base fee to 0 (needed for 0 price calls)
  final bool noBaseFee;

  /// base_fee_change_denominator bounds the amount the base fee can change
  /// between blocks.
  final int baseFeeChangeDenominator;

  /// elasticity_multiplier bounds the maximum gas limit an EIP-1559 block may
  /// have.
  final int elasticityMultiplier;

  /// enable_height defines at which block height the base fee calculation is enabled.
  final BigInt enableHeight;

  /// base_fee for EIP-1559 blocks.
  final String baseFee;

  /// min_gas_price defines the minimum gas price value for cosmos and eth transactions
  final String minGasPrice;

  /// min_gas_multiplier bounds the minimum gas used to be charged
  /// to senders based on gas limit
  final String minGasMultiplier;

  factory FeeMarketV1Params.fromRpc(Map<String, dynamic> json) {
    return FeeMarketV1Params(
        baseFee: json["base_fee"],
        baseFeeChangeDenominator:
            IntUtils.parse(json["base_fee_change_denominator"]),
        elasticityMultiplier: IntUtils.parse(json["elasticity_multiplier"]),
        enableHeight: BigintUtils.parse(json["enable_height"]),
        minGasMultiplier: json["min_gas_multiplier"],
        minGasPrice: json["min_gas_price"],
        noBaseFee: json["no_base_fee"]);
  }

  FeeMarketV1Params(
      {required this.noBaseFee,
      required this.baseFeeChangeDenominator,
      required this.elasticityMultiplier,
      required this.enableHeight,
      required this.baseFee,
      required this.minGasPrice,
      required this.minGasMultiplier});
  factory FeeMarketV1Params.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return FeeMarketV1Params(
        noBaseFee: decode.getField(1, setDefault: true),
        baseFeeChangeDenominator: decode.getField(2),
        elasticityMultiplier: decode.getField(3),
        enableHeight: decode.getField(5, setDefault: true),
        baseFee: decode.getField(6),
        minGasPrice: decode.getField(7),
        minGasMultiplier: decode.getField(8));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 5, 6, 7, 8];

  @override
  Map<String, dynamic> toJson() {
    return {
      "no_base_fee": noBaseFee,
      "base_fee_change_denominator": baseFeeChangeDenominator,
      "elasticity_multiplier": elasticityMultiplier,
      "enable_height": enableHeight.toString(),
      "base_fee": baseFee,
      "min_gas_price": minGasPrice,
      "min_gas_multiplier": minGasMultiplier
    };
  }

  @override
  TypeUrl get typeUrl => FeeMarketTypes.eventFeeMarket;

  @override
  List get values => [
        noBaseFee,
        baseFeeChangeDenominator,
        elasticityMultiplier,
        enableHeight,
        baseFee,
        minGasPrice,
        minGasMultiplier
      ];
}
