import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_code_response.dart';

/// QueryCodeRequest is the request type for the Query/Code RPC method.
class EvmosEthermintEVMV1QueryCodeRequest extends CosmosMessage
    with QueryMessage<EvmosEthermintEVMV1QueryCodeResponse> {
  // address is the ethereum hex address to query the code for
  final String address;
  const EvmosEthermintEVMV1QueryCodeRequest(this.address);
  factory EvmosEthermintEVMV1QueryCodeRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintEVMV1QueryCodeRequest(decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"address": address};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.codeRequest;

  @override
  List get values => [address];

  @override
  EvmosEthermintEVMV1QueryCodeResponse onResponse(List<int> bytes) {
    return EvmosEthermintEVMV1QueryCodeResponse.deserialize(bytes);
  }

  @override
  EvmosEthermintEVMV1QueryCodeResponse onJsonResponse(
      Map<String, dynamic> json) {
    return EvmosEthermintEVMV1QueryCodeResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [address];
}
