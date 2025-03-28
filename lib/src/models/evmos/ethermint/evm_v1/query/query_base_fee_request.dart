import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_base_fee_response.dart';

/// QueryAccountRequest is the request type for the Query/Account RPC method.
class EvmosEthermintEVMV1QueryBaseFeeRequest extends CosmosMessage
    with QueryMessage<EvmosEthermintEVMV1QueryBaseFeeResponse> {
  const EvmosEthermintEVMV1QueryBaseFeeRequest();
  factory EvmosEthermintEVMV1QueryBaseFeeRequest.deserialize(List<int> bytes) {
    return EvmosEthermintEVMV1QueryBaseFeeRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.feeRequest;

  @override
  List get values => [];

  @override
  EvmosEthermintEVMV1QueryBaseFeeResponse onResponse(List<int> bytes) {
    return EvmosEthermintEVMV1QueryBaseFeeResponse.deserialize(bytes);
  }

  @override
  EvmosEthermintEVMV1QueryBaseFeeResponse onJsonResponse(
      Map<String, dynamic> json) {
    return EvmosEthermintEVMV1QueryBaseFeeResponse.fromJson(json);
  }
}
