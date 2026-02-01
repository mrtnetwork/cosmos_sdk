import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/codec/decoder.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class EvmosInflationV1ExponentialCalculation extends CosmosMessage {
  /// a defines the initial value
  final String? a;

  /// r defines the reduction factor
  final String? r;

  /// c defines the parameter for long term inflation
  final String? c;
  final String? bondingTarget;
  final String? maxVariance;
  EvmosInflationV1ExponentialCalculation({
    this.a,
    this.r,
    this.c,
    this.bondingTarget,
    this.maxVariance,
  });
  factory EvmosInflationV1ExponentialCalculation.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosInflationV1ExponentialCalculation(
      a: decode.getField(1),
      r: decode.getField(2),
      c: decode.getField(3),
      bondingTarget: decode.getField(4),
      maxVariance: decode.getField(5),
    );
  }
  factory EvmosInflationV1ExponentialCalculation.fromJson(
    Map<String, dynamic> json,
  ) {
    return EvmosInflationV1ExponentialCalculation(
      a: json.as("a"),
      r: json.as("r"),
      c: json.as("c"),
      bondingTarget: json.as("bonding_target"),
      maxVariance: json.as("max_variance"),
    );
  }
  @override
  List get values => [a, r, c, bondingTarget, maxVariance];

  @override
  List<int> get fieldIds => [1, 3, 3, 4, 5];

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.exponentialCalculation;
  @override
  Map<String, dynamic> toJson() {
    return {
      "a": a,
      "r": r,
      "c": c,
      "bonding_target": bondingTarget,
      "max_variance": maxVariance,
    };
  }
}
