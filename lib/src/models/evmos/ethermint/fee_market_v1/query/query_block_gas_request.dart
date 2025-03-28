import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_block_gas_response.dart';

/// QueryTraceTxRequest defines TraceTx request
class EvmosEthermintFeeMarketV1QueryBlockGasRequest extends CosmosMessage
    with QueryMessage<EvmosEthermintFeeMarketV1QueryBlockGasResponse> {
  const EvmosEthermintFeeMarketV1QueryBlockGasRequest();
  factory EvmosEthermintFeeMarketV1QueryBlockGasRequest.deserialize(
      List<int> bytes) {
    return EvmosEthermintFeeMarketV1QueryBlockGasRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.blockGasRequest;

  @override
  List get values => [];

  @override
  EvmosEthermintFeeMarketV1QueryBlockGasResponse onResponse(List<int> bytes) {
    return EvmosEthermintFeeMarketV1QueryBlockGasResponse.deserialize(bytes);
  }

  @override
  EvmosEthermintFeeMarketV1QueryBlockGasResponse onJsonResponse(
      Map<String, dynamic> json) {
    return EvmosEthermintFeeMarketV1QueryBlockGasResponse.fromJson(json);
  }
}
