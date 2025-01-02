import 'package:cosmos_sdk/src/models/ethermint/fee_market_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'query_base_fee_response.dart';

/// QueryTraceTxRequest defines TraceTx request
class FeeMarketV1QueryBaseFeeRequest extends CosmosMessage
    with QueryMessage<FeeMarketV1QueryBaseFeeResponse> {
  const FeeMarketV1QueryBaseFeeRequest();
  factory FeeMarketV1QueryBaseFeeRequest.deserialize(List<int> bytes) {
    return FeeMarketV1QueryBaseFeeRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => FeeMarketTypes.baseFeeRequest;

  @override
  List get values => [];

  @override
  FeeMarketV1QueryBaseFeeResponse onResponse(List<int> bytes) {
    return FeeMarketV1QueryBaseFeeResponse.deserialize(bytes);
  }

  @override
  FeeMarketV1QueryBaseFeeResponse onJsonResponse(Map<String, dynamic> json) {
    return FeeMarketV1QueryBaseFeeResponse.fromRpc(json);
  }
}
