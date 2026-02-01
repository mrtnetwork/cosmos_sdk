import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ExtensionOptionDynamicFeeTx is an extension option that specifies the maxPrioPrice for cosmos tx
class EvmosEthermintTypesV1ExtensionOptionDynamicFeeTx extends CosmosMessage {
  /// max_priority_price is the same as `max_priority_fee_per_gas` in eip-1559 spec
  final String maxPriorityPrice;
  const EvmosEthermintTypesV1ExtensionOptionDynamicFeeTx(this.maxPriorityPrice);
  factory EvmosEthermintTypesV1ExtensionOptionDynamicFeeTx.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintTypesV1ExtensionOptionDynamicFeeTx(decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"max_priority_price": maxPriorityPrice};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.extensionOptionDynamicFeeTx;

  @override
  List get values => [maxPriorityPrice];
}
