import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Fraction defines the protobuf message type for tmmath.Fraction that only supports positive values.
class IbcTendermintFraction extends CosmosMessage {
  final BigInt? numerator;
  final BigInt? denominator;
  const IbcTendermintFraction({this.numerator, this.denominator});
  factory IbcTendermintFraction.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcTendermintFraction(
      numerator: decode.getField(1),
      denominator: decode.getField(2),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "numerator": numerator?.toString(),
      "denominator": denominator?.toString(),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.ibcTendermintV1Fraction;

  @override
  List get values => [numerator, denominator];
}
