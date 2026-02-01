import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'params.dart';

/// GenesisState defines the feemarket module's genesis state
class EvmosEthermintFeeMarketV1GenesisState extends CosmosMessage {
  /// params defines all the parameters of the feemarket module.
  final EvmosEthermintFeeMarketV1Params params;

  /// block_gas is the amount of gas wanted on the last block before the upgrade.
  /// Zero by default.
  final BigInt blockGas;

  EvmosEthermintFeeMarketV1GenesisState({
    required this.params,
    required this.blockGas,
  });
  factory EvmosEthermintFeeMarketV1GenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintFeeMarketV1GenesisState(
      params: EvmosEthermintFeeMarketV1Params.deserialize(decode.getField(1)),
      blockGas: decode.getField(3),
    );
  }

  @override
  List<int> get fieldIds => [1, 3];

  @override
  Map<String, dynamic> toJson() {
    return {"params": params.toJson(), "block_gas": blockGas.toString()};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.feeMarketparams;

  @override
  List get values => [params, blockGas];
}
