import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// MsgSudoContractResponse defines the response structure for executing a MsgSudoContract message
class CosmWasmV1MsgSudoContractResponse extends CosmosMessage {
  /// Data contains bytes to returned from the contract
  final List<int>? data;
  CosmWasmV1MsgSudoContractResponse({
    required List<int>? data,
  }) : data = data?.asImmutableBytes;
  factory CosmWasmV1MsgSudoContractResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1MsgSudoContractResponse(data: decode.getField(1));
  }
  factory CosmWasmV1MsgSudoContractResponse.fromJson(
      Map<String, dynamic> json) {
    return CosmWasmV1MsgSudoContractResponse(data: json.asBytes("data"));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"data": CosmosUtils.tryToBase64(data)};
  }

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.msgSudoContractResponse;

  @override
  List get values => [data];
}
