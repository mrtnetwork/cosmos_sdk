import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// EventBlockGas defines an Ethereum block gas event
class EvmosEthermintFeeMarketV1EventBlockGas extends CosmosMessage {
  // module which emits the event
  final String height;
  // sender of the message
  final String amount;
  const EvmosEthermintFeeMarketV1EventBlockGas(
      {required this.height, required this.amount});
  factory EvmosEthermintFeeMarketV1EventBlockGas.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintFeeMarketV1EventBlockGas(
        height: decode.getField(1), amount: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"height": height, "amount": amount};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.eventBlockGas;

  @override
  List get values => [height, amount];
}
