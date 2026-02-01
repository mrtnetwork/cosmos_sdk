import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// Model is a struct that holds a KV pair
class CosmWasmV1Model extends CosmosMessage {
  /// hex-encode key to read it better (this is often ascii)
  final List<int>? key;

  /// base64-encode raw value
  final List<int>? value;
  CosmWasmV1Model({required List<int>? key, required List<int>? value})
    : key = key?.asImmutableBytes,
      value = value?.asImmutableBytes;

  factory CosmWasmV1Model.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1Model(key: decode.getField(1), value: decode.getField(2));
  }
  factory CosmWasmV1Model.fromJson(Map<String, dynamic> json) {
    return CosmWasmV1Model(
      key: json.asBytes("key"),
      value: json.asBytes("value"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "key": CosmosUtils.tryToBase64(key),
      "value": CosmosUtils.tryToBase64(value),
    };
  }

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.model;

  @override
  List get values => [key, value];
}
