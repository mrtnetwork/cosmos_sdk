import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/messages/access_type.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class CosmWasmV1AccessTypeParam extends CosmosMessage {
  final CosmWasmV1AccessType value;
  const CosmWasmV1AccessTypeParam(this.value);
  factory CosmWasmV1AccessTypeParam.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1AccessTypeParam(
        CosmWasmV1AccessType.fromValue(decode.getField(1)));
  }
  factory CosmWasmV1AccessTypeParam.fromJson(Map<String, dynamic> json) {
    return CosmWasmV1AccessTypeParam(
        CosmWasmV1AccessType.fromName(json.as("value")));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"value": value.name};
  }

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.accessTypeParam;

  @override
  List get values => [value];
}
