import 'package:cosmos_sdk/src/models/ethermint/evm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// EventMessage
class EVMV1EventMessage extends CosmosMessage {
  // module which emits the event
  final String module;
  // sender of the message
  final String sender;
  // tx_type is the type of the message
  final String txType;
  const EVMV1EventMessage({
    required this.module,
    required this.sender,
    required this.txType,
  });
  factory EVMV1EventMessage.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EVMV1EventMessage(
        module: decode.getField(1),
        sender: decode.getField(2),
        txType: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "module": module,
      "sender": sender,
      "tx_type": txType,
    };
  }

  @override
  TypeUrl get typeUrl => EvmV1Types.eventMessage;

  @override
  List get values => [module, sender, txType];
}
