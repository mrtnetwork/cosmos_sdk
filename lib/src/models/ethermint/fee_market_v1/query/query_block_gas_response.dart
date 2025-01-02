import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ethermint/fee_market_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryBlockGasResponse returns block gas used for a given height.
class FeeMarketV1QueryBlockGasResponse extends CosmosMessage {
  // gas is the returned block gas
  final BigInt gas;

  const FeeMarketV1QueryBlockGasResponse(this.gas);
  factory FeeMarketV1QueryBlockGasResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return FeeMarketV1QueryBlockGasResponse(decode.getField(1));
  }
  factory FeeMarketV1QueryBlockGasResponse.fromRpc(Map<String, dynamic> json) {
    return FeeMarketV1QueryBlockGasResponse(BigintUtils.parse(json["gas"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"gas": gas.toString()};
  }

  @override
  TypeUrl get typeUrl => FeeMarketTypes.blockGasResponse;

  @override
  List get values => [gas];
}
