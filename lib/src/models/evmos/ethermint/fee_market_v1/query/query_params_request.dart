import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_params_response.dart';

/// QueryParamsRequest defines the request type for querying x/evm parameters.
class EvmosEthermintFeeMarketV1QueryParamsRequest extends CosmosMessage
    with QueryMessage<EvmosEthermintFeeMarketV1QueryParamsResponse> {
  const EvmosEthermintFeeMarketV1QueryParamsRequest();
  factory EvmosEthermintFeeMarketV1QueryParamsRequest.deserialize(
    List<int> bytes,
  ) {
    return EvmosEthermintFeeMarketV1QueryParamsRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.feeMarketParamsRequest;

  @override
  List get values => [];

  @override
  EvmosEthermintFeeMarketV1QueryParamsResponse onResponse(List<int> bytes) {
    return EvmosEthermintFeeMarketV1QueryParamsResponse.deserialize(bytes);
  }

  @override
  EvmosEthermintFeeMarketV1QueryParamsResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    throw UnimplementedError();
  }

  @override
  Map<String, String?> get queryParameters => {};
}
