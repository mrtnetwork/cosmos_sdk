import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'query_base_fee_response.dart';

/// QueryTraceTxRequest defines TraceTx request
class EvmosEthermintFeeMarketV1QueryBaseFeeRequest extends CosmosMessage
    with QueryMessage<EvmosEthermintFeeMarketV1QueryBaseFeeResponse> {
  const EvmosEthermintFeeMarketV1QueryBaseFeeRequest();
  factory EvmosEthermintFeeMarketV1QueryBaseFeeRequest.deserialize(
      List<int> bytes) {
    return EvmosEthermintFeeMarketV1QueryBaseFeeRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.baseFeeRequest;

  @override
  List get values => [];

  @override
  EvmosEthermintFeeMarketV1QueryBaseFeeResponse onResponse(List<int> bytes) {
    return EvmosEthermintFeeMarketV1QueryBaseFeeResponse.deserialize(bytes);
  }

  @override
  EvmosEthermintFeeMarketV1QueryBaseFeeResponse onJsonResponse(
      Map<String, dynamic> json) {
    return EvmosEthermintFeeMarketV1QueryBaseFeeResponse.fromJson(json);
  }
}
