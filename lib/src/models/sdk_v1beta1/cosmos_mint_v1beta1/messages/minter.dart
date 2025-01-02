import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_mint_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Minter represents the minting state.
class Minter extends CosmosMessage {
  /// current annual inflation rate
  final String inflation;

  /// current annual expected provisions
  final String annualProvisions;

  const Minter({
    required this.inflation,
    required this.annualProvisions,
  });

  factory Minter.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Minter(
        inflation: decode.getField(1), annualProvisions: decode.getField(2));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'inflation': inflation,
      'annual_provisions': annualProvisions,
    };
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  TypeUrl get typeUrl => MintV1beta1Types.minter;

  @override
  List get values => [inflation, annualProvisions];
}
