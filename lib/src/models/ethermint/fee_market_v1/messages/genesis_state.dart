import 'package:cosmos_sdk/src/models/ethermint/fee_market_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'params.dart';

/// GenesisState defines the feemarket module's genesis state
class FeeMarketGenesisState extends CosmosMessage {
  /// params defines all the parameters of the feemarket module.
  final FeeMarketV1Params params;

  /// block_gas is the amount of gas wanted on the last block before the upgrade.
  /// Zero by default.
  final BigInt blockGas;

  FeeMarketGenesisState({required this.params, required this.blockGas});
  factory FeeMarketGenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return FeeMarketGenesisState(
      params: FeeMarketV1Params.deserialize(decode.getField(1)),
      blockGas: decode.getField(3),
    );
  }

  @override
  List<int> get fieldIds => [1, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "params": params.toJson(),
      "block_gas": blockGas.toString(),
    };
  }

  @override
  TypeUrl get typeUrl => FeeMarketTypes.params;

  @override
  List get values => [params, blockGas];
}
