import 'package:cosmos_sdk/src/models/ethermint/evm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_code_response.dart';

/// QueryCodeRequest is the request type for the Query/Code RPC method.
class EVMV1QueryCodeRequest extends CosmosMessage
    with QueryMessage<EVMV1QueryCodeResponse> {
  // address is the ethereum hex address to query the code for
  final String address;
  const EVMV1QueryCodeRequest(this.address);
  factory EVMV1QueryCodeRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EVMV1QueryCodeRequest(decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"address": address};
  }

  @override
  TypeUrl get typeUrl => EvmV1Types.codeRequest;

  @override
  List get values => [address];

  @override
  EVMV1QueryCodeResponse onResponse(List<int> bytes) {
    return EVMV1QueryCodeResponse.deserialize(bytes);
  }

  @override
  EVMV1QueryCodeResponse onJsonResponse(Map<String, dynamic> json) {
    return EVMV1QueryCodeResponse.fromRpc(json);
  }

  @override
  List<String> get pathParameters => [address];
}
