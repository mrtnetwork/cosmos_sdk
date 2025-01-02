import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ethermint/fee_market_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryBaseFeeResponse returns the EIP1559 base fee.
class FeeMarketV1QueryBaseFeeResponse extends CosmosMessage {
  // base_fee is the EIP1559 base fee
  final BigInt baseFee;

  const FeeMarketV1QueryBaseFeeResponse(this.baseFee);
  factory FeeMarketV1QueryBaseFeeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return FeeMarketV1QueryBaseFeeResponse(decode.getField(1));
  }
  factory FeeMarketV1QueryBaseFeeResponse.fromRpc(Map<String, dynamic> json) {
    return FeeMarketV1QueryBaseFeeResponse(BigintUtils.parse(json["base_fee"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"base_fee": baseFee.toString()};
  }

  @override
  TypeUrl get typeUrl => FeeMarketTypes.baseFeeResponse;

  @override
  List get values => [baseFee.toString()];
}
