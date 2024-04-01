import 'package:cosmos_sdk/src/models/ibc/ibc_lightclients_wasm_v1/query/query_code_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryCodeRequest is the request type for the Query/Code RPC method.
class IbcLightClientsWasmQueryCodeRequest extends CosmosMessage
    with QueryMessage<IbcLightClientsWasmQueryCodeResponse> {
  /// checksum is a hex encoded string of the code stored.
  final String? checksum;
  const IbcLightClientsWasmQueryCodeRequest({this.checksum});
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
  String get typeUrl => IbcTypes.ibcLightClientsWasmQueryCodeRequest.typeUrl;

  @override
  List get values => [checksum];

  @override
  String get queryPath => IbcTypes.ibcLightClientsWasmCode.typeUrl;

  @override
  IbcLightClientsWasmQueryCodeResponse onResponse(List<int> bytes) {
    return IbcLightClientsWasmQueryCodeResponse.deserialize(bytes);
  }
}
