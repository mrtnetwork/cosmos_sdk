import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// QuerySmartContractStateResponse is the response type for the
/// Query/SmartContractState RPC method
class CosmWasmV1QuerySmartContractStateResponse extends CosmosMessage {
  /// Data contains the json data returned from the smart contract
  final List<int>? data;
  CosmWasmV1QuerySmartContractStateResponse({required List<int>? data})
    : data = data?.asImmutableBytes;
  factory CosmWasmV1QuerySmartContractStateResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1QuerySmartContractStateResponse(data: decode.getField(1));
  }
  factory CosmWasmV1QuerySmartContractStateResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return CosmWasmV1QuerySmartContractStateResponse(
      data: json.asBytes("data"),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"data": CosmosUtils.tryToBase64(data)};
  }

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.querySmartContractStateResponse;

  @override
  List get values => [data];
}
