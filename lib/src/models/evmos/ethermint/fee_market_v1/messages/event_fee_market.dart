import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// EventFeeMarket is the event type for the fee market module
class EvmosEthermintFeeMarketV1EventFeeMarket extends CosmosMessage {
  /// base_fee for EIP-1559 blocks
  final String baseFee;
  const EvmosEthermintFeeMarketV1EventFeeMarket(this.baseFee);
  factory EvmosEthermintFeeMarketV1EventFeeMarket.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintFeeMarketV1EventFeeMarket(decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"base_fee": baseFee};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.eventFeeMarket;

  @override
  List get values => [baseFee];
}
