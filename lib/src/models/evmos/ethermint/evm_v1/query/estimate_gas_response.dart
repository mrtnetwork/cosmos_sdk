import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// DynamicFeeTx is the data of EIP-1559 dinamic fee transactions.
class EvmosEthermintEVMV1EstimateGasResponse extends CosmosMessage {
  final BigInt gas;
  const EvmosEthermintEVMV1EstimateGasResponse(this.gas);
  factory EvmosEthermintEVMV1EstimateGasResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintEVMV1EstimateGasResponse(decode.getField(1));
  }
  factory EvmosEthermintEVMV1EstimateGasResponse.fromJson(
      Map<String, dynamic> json) {
    return EvmosEthermintEVMV1EstimateGasResponse(
        BigintUtils.parse(json["gas"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"gas": gas.toString()};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.estimateGasResponse;

  @override
  List get values => [gas];
}
