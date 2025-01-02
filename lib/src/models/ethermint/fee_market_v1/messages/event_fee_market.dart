import 'package:cosmos_sdk/src/models/ethermint/fee_market_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// EventFeeMarket is the event type for the fee market module
class FeeMarketV1EventFeeMarket extends CosmosMessage {
  /// base_fee for EIP-1559 blocks
  final String baseFee;
  const FeeMarketV1EventFeeMarket(this.baseFee);
  factory FeeMarketV1EventFeeMarket.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return FeeMarketV1EventFeeMarket(decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"base_fee": baseFee};
  }

  @override
  TypeUrl get typeUrl => FeeMarketTypes.eventFeeMarket;

  @override
  List get values => [baseFee];
}
