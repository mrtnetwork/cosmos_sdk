import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// QueryRawContractStateResponse is the response type for the Query/RawContractState RPC method
class CosmWasmV1QueryRawContractStateResponse extends CosmosMessage {
  final List<int>? data;
  CosmWasmV1QueryRawContractStateResponse({required List<int>? data})
    : data = data?.asImmutableBytes;
  factory CosmWasmV1QueryRawContractStateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1QueryRawContractStateResponse(data: decode.getField(1));
  }
  factory CosmWasmV1QueryRawContractStateResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return CosmWasmV1QueryRawContractStateResponse(data: json.asBytes("data"));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"data": CosmosUtils.tryToBase64(data)};
  }

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.queryRawContractStateResponse;

  @override
  List get values => [data];
}
