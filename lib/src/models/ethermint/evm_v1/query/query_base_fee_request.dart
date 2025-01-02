import 'package:cosmos_sdk/src/models/ethermint/evm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_base_fee_response.dart';

/// QueryAccountRequest is the request type for the Query/Account RPC method.
class EVMV1QueryBaseFeeRequest extends CosmosMessage
    with QueryMessage<EVMV1QueryBaseFeeResponse> {
  const EVMV1QueryBaseFeeRequest();
  factory EVMV1QueryBaseFeeRequest.deserialize(List<int> bytes) {
    return EVMV1QueryBaseFeeRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => EvmV1Types.feeRequest;

  @override
  List get values => [];

  @override
  EVMV1QueryBaseFeeResponse onResponse(List<int> bytes) {
    return EVMV1QueryBaseFeeResponse.deserialize(bytes);
  }

  @override
  EVMV1QueryBaseFeeResponse onJsonResponse(Map<String, dynamic> json) {
    return EVMV1QueryBaseFeeResponse.fromRpc(json);
  }
}
