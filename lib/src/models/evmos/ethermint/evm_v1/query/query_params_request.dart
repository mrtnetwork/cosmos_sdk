import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_params_response.dart';

/// QueryAccountRequest is the request type for the Query/Account RPC method.
class EvmosEthermintEVMV1QueryParamsRequest extends CosmosMessage
    with QueryMessage<EvmosEthermintEVMV1QueryParamsResponse> {
  const EvmosEthermintEVMV1QueryParamsRequest();
  factory EvmosEthermintEVMV1QueryParamsRequest.deserialize(List<int> bytes) {
    return EvmosEthermintEVMV1QueryParamsRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.paramsRequest;

  @override
  List get values => [];

  @override
  EvmosEthermintEVMV1QueryParamsResponse onResponse(List<int> bytes) {
    return EvmosEthermintEVMV1QueryParamsResponse.deserialize(bytes);
  }

  @override
  EvmosEthermintEVMV1QueryParamsResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return EvmosEthermintEVMV1QueryParamsResponse.fromJson(json);
  }

  @override
  Map<String, String?> get queryParameters => {};
}
