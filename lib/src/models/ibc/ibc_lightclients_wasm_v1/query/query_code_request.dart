import 'package:cosmos_sdk/src/models/ibc/ibc_lightclients_wasm_v1/query/query_code_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryCodeRequest is the request type for the Query/Code RPC method.
class IbcLightClientsWasmQueryCodeRequest extends CosmosMessage
    with QueryMessage<IbcLightClientsWasmQueryCodeResponse> {
  /// checksum is a hex encoded string of the code stored.
  final String checksum;
  const IbcLightClientsWasmQueryCodeRequest({required this.checksum});
  factory IbcLightClientsWasmQueryCodeRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcLightClientsWasmQueryCodeRequest(checksum: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"checksum": checksum};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.ibcLightClientsWasmQueryCodeRequest;

  @override
  List get values => [checksum];

  @override
  IbcLightClientsWasmQueryCodeResponse onResponse(List<int> bytes) {
    return IbcLightClientsWasmQueryCodeResponse.deserialize(bytes);
  }

  @override
  IbcLightClientsWasmQueryCodeResponse onJsonResponse(
      Map<String, dynamic> json) {
    return IbcLightClientsWasmQueryCodeResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [checksum];
}
