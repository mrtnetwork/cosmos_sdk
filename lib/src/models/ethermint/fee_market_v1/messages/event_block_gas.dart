import 'package:cosmos_sdk/src/models/ethermint/fee_market_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// EventBlockGas defines an Ethereum block gas event
class FeeMarketV1EventBlockGas extends CosmosMessage {
  // module which emits the event
  final String height;
  // sender of the message
  final String amount;
  const FeeMarketV1EventBlockGas({required this.height, required this.amount});
  factory FeeMarketV1EventBlockGas.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return FeeMarketV1EventBlockGas(
        height: decode.getField(1), amount: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"height": height, "amount": amount};
  }

  @override
  TypeUrl get typeUrl => FeeMarketTypes.eventBlockGas;

  @override
  List get values => [height, amount];
}
