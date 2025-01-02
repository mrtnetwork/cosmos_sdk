import 'package:cosmos_sdk/src/models/ethermint/types_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ExtensionOptionDynamicFeeTx is an extension option that specifies the maxPrioPrice for cosmos tx
class EthermintTypesV1ExtensionOptionDynamicFeeTx extends CosmosMessage {
  /// max_priority_price is the same as `max_priority_fee_per_gas` in eip-1559 spec
  final String maxPriorityPrice;
  const EthermintTypesV1ExtensionOptionDynamicFeeTx(this.maxPriorityPrice);
  factory EthermintTypesV1ExtensionOptionDynamicFeeTx.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EthermintTypesV1ExtensionOptionDynamicFeeTx(decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"max_priority_price": maxPriorityPrice};
  }

  @override
  TypeUrl get typeUrl => EthermintTypesV1Types.extensionOptionDynamicFeeTx;

  @override
  List get values => [maxPriorityPrice];
}
