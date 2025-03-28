import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/codec/decoder.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

import 'exponential_calculation.dart';
import 'inflation_distribution.dart';

class EvmosInflationV1Params extends CosmosMessage {
  /// mint_denom specifies the type of coin to mint
  final String? mintDenom;

  /// exponential_calculation takes in the variables to calculate exponential inflation
  final EvmosInflationV1ExponentialCalculation? exponentialCalculation;

  /// inflation_distribution of the minted denom
  final EvmosInflationV1InflationDistribution? inflationDistribution;

  /// enable_inflation is the parameter that enables inflation and halts increasing the skipped_epochs
  final bool? enableInflation;
  EvmosInflationV1Params(
      {this.mintDenom,
      this.exponentialCalculation,
      this.inflationDistribution,
      this.enableInflation});
  factory EvmosInflationV1Params.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosInflationV1Params(
        mintDenom: decode.getField(1),
        exponentialCalculation: decode
            .getResult(2)
            ?.to<EvmosInflationV1ExponentialCalculation, List<int>>(
                EvmosInflationV1ExponentialCalculation.deserialize),
        inflationDistribution: decode
            .getResult(3)
            ?.to<EvmosInflationV1InflationDistribution, List<int>>(
                EvmosInflationV1InflationDistribution.deserialize),
        enableInflation: decode.getField(4));
  }
  factory EvmosInflationV1Params.fromJson(Map<String, dynamic> json) {
    return EvmosInflationV1Params(
        mintDenom: json.as("mint_denom"),
        enableInflation: json.as("enable_inflation"),
        exponentialCalculation: json.maybeAs(
            key: "exponential_calculation",
            onValue: EvmosInflationV1ExponentialCalculation.fromJson),
        inflationDistribution: json.maybeAs(
            key: "inflation_distribution",
            onValue: EvmosInflationV1InflationDistribution.fromJson));
  }
  @override
  List get values => [
        mintDenom,
        exponentialCalculation,
        inflationDistribution,
        enableInflation
      ];

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.inflationParams;
  @override
  Map<String, dynamic> toJson() {
    return {
      "mint_denom": mintDenom,
      "exponential_calculation": exponentialCalculation?.toJson(),
      "inflation_distribution": inflationDistribution?.toJson(),
      "enable_inflation": enableInflation
    };
  }
}
