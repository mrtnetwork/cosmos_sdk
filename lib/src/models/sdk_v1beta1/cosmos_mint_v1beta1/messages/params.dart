// Params defines the parameters for the x/mint module.
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_mint_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class MintParams extends CosmosMessage {
  /// type of coin to mint
  final String? mintDenom;

  /// maximum annual change in inflation rate
  final String inflationRateChange;

  /// maximum inflation rate
  final String inflationMax;

  /// minimum inflation rate
  final String inflationMin;

  /// goal of percent bonded atoms
  final String goalBonded;

  /// expected blocks per year
  final BigInt? blocksPerYear;

  const MintParams({
    this.mintDenom,
    required this.inflationRateChange,
    required this.inflationMax,
    required this.inflationMin,
    required this.goalBonded,
    this.blocksPerYear,
  });
  factory MintParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MintParams(
        mintDenom: decode.getField(1),
        inflationRateChange: decode.getField(2),
        inflationMax: decode.getField(3),
        inflationMin: decode.getField(4),
        goalBonded: decode.getField(5),
        blocksPerYear: decode.getField(6));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'mint_denom': mintDenom,
      'inflation_rate_change': inflationRateChange,
      'inflation_max': inflationMax,
      'inflation_min': inflationMin,
      'goal_bonded': goalBonded,
      'blocks_per_year': blocksPerYear?.toString(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  String get typeUrl => MintV1beta1Types.mintParams.typeUrl;

  @override
  List get values => [
        mintDenom,
        inflationRateChange,
        inflationMax,
        inflationMin,
        goalBonded,
        blocksPerYear
      ];
}
