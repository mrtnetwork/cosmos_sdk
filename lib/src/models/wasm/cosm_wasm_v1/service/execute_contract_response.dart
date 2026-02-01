import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// MsgExecuteContractResponse returns execution result data
class CosmWasmV1MsgExecuteContractResponse extends CosmosMessage {
  /// Data contains bytes to returned from the contract
  final List<int>? data;
  CosmWasmV1MsgExecuteContractResponse({required List<int>? data})
    : data = data?.asImmutableBytes;
  factory CosmWasmV1MsgExecuteContractResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1MsgExecuteContractResponse(data: decode.getField(1));
  }
  factory CosmWasmV1MsgExecuteContractResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return CosmWasmV1MsgExecuteContractResponse(data: json.asBytes("data"));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"data": CosmosUtils.tryToBase64(data)};
  }

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.msgInstantiateContractResponse;

  @override
  List get values => [data];
}
