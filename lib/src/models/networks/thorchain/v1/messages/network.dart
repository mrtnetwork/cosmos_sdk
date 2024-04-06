import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainNetwork extends CosmosMessage {
  final BigInt bondRewardRune;
  final BigInt totalBondUnits;
  final BigInt burnedBep2Rune;
  final BigInt burnedErc20Rune;
  final BigInt? lpIncomeSplit;
  final BigInt? nodeIncomeSplit;
  final BigInt? outboundGasSpentRune;
  final BigInt? outboundGasWithheldRune;
  ThorchainNetwork(
      {required this.bondRewardRune,
      required this.totalBondUnits,
      required this.burnedBep2Rune,
      required this.burnedErc20Rune,
      this.lpIncomeSplit,
      this.nodeIncomeSplit,
      this.outboundGasSpentRune,
      this.outboundGasWithheldRune});
  factory ThorchainNetwork.deserialized(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainNetwork(
        bondRewardRune: BigInt.parse(decode.getField(1)),
        totalBondUnits: BigInt.parse(decode.getField(2)),
        burnedBep2Rune: BigInt.parse(decode.getField(3)),
        burnedErc20Rune: BigInt.parse(decode.getField(4)),
        lpIncomeSplit: decode.getField(5),
        nodeIncomeSplit: decode.getField(6),
        outboundGasSpentRune: decode.getField(7),
        outboundGasWithheldRune: decode.getField(8));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8];

  @override
  Map<String, dynamic> toJson() {
    return {
      "bond_reward_rune": bondRewardRune.toString(),
      "total_bond_units": totalBondUnits.toString(),
      "burned_bep2_rune": burnedBep2Rune.toString(),
      "burned_erc20_rune": burnedErc20Rune.toString(),
      "LPIncomeSplit": lpIncomeSplit?.toString(),
      "NodeIncomeSplit": nodeIncomeSplit?.toString(),
      "outbound_gas_spent_rune": outboundGasSpentRune?.toString(),
      "outbound_gas_withheld_rune": outboundGasWithheldRune?.toString()
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.network.typeUrl;

  @override
  List get values => [
        bondRewardRune.toString(),
        totalBondUnits.toString(),
        burnedBep2Rune.toString(),
        burnedErc20Rune.toString(),
        lpIncomeSplit,
        nodeIncomeSplit,
        outboundGasSpentRune,
        outboundGasWithheldRune
      ];
}
