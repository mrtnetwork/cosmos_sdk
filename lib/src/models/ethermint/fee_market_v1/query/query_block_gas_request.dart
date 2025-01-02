import 'package:cosmos_sdk/src/models/ethermint/fee_market_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_block_gas_response.dart';

/// QueryTraceTxRequest defines TraceTx request
class FeeMarketV1QueryBlockGasRequest extends CosmosMessage
    with QueryMessage<FeeMarketV1QueryBlockGasResponse> {
  const FeeMarketV1QueryBlockGasRequest();
  factory FeeMarketV1QueryBlockGasRequest.deserialize(List<int> bytes) {
    return FeeMarketV1QueryBlockGasRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => FeeMarketTypes.blockGasRequest;

  @override
  List get values => [];

  @override
  FeeMarketV1QueryBlockGasResponse onResponse(List<int> bytes) {
    return FeeMarketV1QueryBlockGasResponse.deserialize(bytes);
  }

  @override
  FeeMarketV1QueryBlockGasResponse onJsonResponse(Map<String, dynamic> json) {
    return FeeMarketV1QueryBlockGasResponse.fromRpc(json);
  }
}
