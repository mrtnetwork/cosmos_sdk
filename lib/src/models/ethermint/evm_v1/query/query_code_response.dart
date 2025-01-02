import 'package:cosmos_sdk/src/models/ethermint/evm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryCodeResponse is the response type for the Query/Code RPC
/// method.
class EVMV1QueryCodeResponse extends CosmosMessage {
  /// code represents the code bytes from an ethereum address.
  final String code;
  const EVMV1QueryCodeResponse(this.code);
  factory EVMV1QueryCodeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EVMV1QueryCodeResponse(decode.getField(1));
  }
  factory EVMV1QueryCodeResponse.fromRpc(Map<String, dynamic> json) {
    return EVMV1QueryCodeResponse(json["base_fee"]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"code": code};
  }

  @override
  TypeUrl get typeUrl => EvmV1Types.codeResponse;

  @override
  List get values => [code];
}
