import 'package:cosmos_sdk/src/models/ethermint/evm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryBaseFeeResponse returns the EIP1559 base fee.
class EVMV1QueryBaseFeeResponse extends CosmosMessage {
  /// base_fee is the EIP1559 base fee
  final String baseFee;
  const EVMV1QueryBaseFeeResponse(this.baseFee);
  factory EVMV1QueryBaseFeeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EVMV1QueryBaseFeeResponse(decode.getField(1));
  }
  factory EVMV1QueryBaseFeeResponse.fromRpc(Map<String, dynamic> json) {
    return EVMV1QueryBaseFeeResponse(json["base_fee"]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"base_fee": baseFee};
  }

  @override
  TypeUrl get typeUrl => EvmV1Types.feeResponse;

  @override
  List get values => [baseFee];
}
