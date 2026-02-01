import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryCodeResponse is the response type for the Query/Code RPC
/// method.
class EvmosEthermintEVMV1QueryCodeResponse extends CosmosMessage {
  /// code represents the code bytes from an ethereum address.
  final String code;
  const EvmosEthermintEVMV1QueryCodeResponse(this.code);
  factory EvmosEthermintEVMV1QueryCodeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintEVMV1QueryCodeResponse(decode.getField(1));
  }
  factory EvmosEthermintEVMV1QueryCodeResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return EvmosEthermintEVMV1QueryCodeResponse(json["base_fee"]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"code": code};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.codeResponse;

  @override
  List get values => [code];
}
