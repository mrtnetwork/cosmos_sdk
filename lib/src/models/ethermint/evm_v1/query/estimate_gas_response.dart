import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ethermint/evm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// DynamicFeeTx is the data of EIP-1559 dinamic fee transactions.
class EVMV1EstimateGasResponse extends CosmosMessage {
  final BigInt gas;
  const EVMV1EstimateGasResponse(this.gas);
  factory EVMV1EstimateGasResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EVMV1EstimateGasResponse(decode.getField(1));
  }
  factory EVMV1EstimateGasResponse.fromRpc(Map<String, dynamic> json) {
    return EVMV1EstimateGasResponse(BigintUtils.parse(json["gas"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"gas": gas.toString()};
  }

  @override
  TypeUrl get typeUrl => EvmV1Types.estimateGasResponse;

  @override
  List get values => [gas];
}
