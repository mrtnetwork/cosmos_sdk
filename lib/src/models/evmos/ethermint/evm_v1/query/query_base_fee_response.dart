import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryBaseFeeResponse returns the EIP1559 base fee.
class EvmosEthermintEVMV1QueryBaseFeeResponse extends CosmosMessage {
  /// base_fee is the EIP1559 base fee
  final String baseFee;
  const EvmosEthermintEVMV1QueryBaseFeeResponse(this.baseFee);
  factory EvmosEthermintEVMV1QueryBaseFeeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintEVMV1QueryBaseFeeResponse(decode.getField(1));
  }
  factory EvmosEthermintEVMV1QueryBaseFeeResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return EvmosEthermintEVMV1QueryBaseFeeResponse(json["base_fee"]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"base_fee": baseFee};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.feeResponse;

  @override
  List get values => [baseFee];
}
