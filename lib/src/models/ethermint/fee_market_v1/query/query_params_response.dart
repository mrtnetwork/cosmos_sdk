import 'package:cosmos_sdk/src/models/ethermint/fee_market_v1/messages/params.dart';
import 'package:cosmos_sdk/src/models/ethermint/fee_market_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryParamsResponse defines the response type for querying x/evm parameters.
class FeeMarketV1QueryParamsResponse extends CosmosMessage {
  // params define the evm module parameters.
  final FeeMarketV1Params params;

  const FeeMarketV1QueryParamsResponse(this.params);
  factory FeeMarketV1QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return FeeMarketV1QueryParamsResponse(
        FeeMarketV1Params.deserialize(decode.getField(1)));
  }
  factory FeeMarketV1QueryParamsResponse.fromRpc(Map<String, dynamic> json) {
    return FeeMarketV1QueryParamsResponse(
        FeeMarketV1Params.fromRpc(json["params"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"params": params.toJson()};
  }

  @override
  TypeUrl get typeUrl => FeeMarketTypes.paramsResponse;

  @override
  List get values => [params];
}
