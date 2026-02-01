import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// EventMessage
class EvmosEthermintEVMV1EventMessage extends CosmosMessage {
  // module which emits the event
  final String module;
  // sender of the message
  final String sender;
  // tx_type is the type of the message
  final String txType;
  const EvmosEthermintEVMV1EventMessage({
    required this.module,
    required this.sender,
    required this.txType,
  });
  factory EvmosEthermintEVMV1EventMessage.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintEVMV1EventMessage(
      module: decode.getField(1),
      sender: decode.getField(2),
      txType: decode.getField(3),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {"module": module, "sender": sender, "tx_type": txType};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.eventMessage;

  @override
  List get values => [module, sender, txType];
}
