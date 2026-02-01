import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/core/service.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/messages/access_config.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

import 'store_code_response.dart';

class CosmWasmV1StoreCode
    extends CosmWasm1Beta1Service<CosmWasmV1MsgStoreCodeResponse> {
  final String? sender;
  final List<int>? wasmByteCode;
  final CosmWasmV1AccessConfig? instantiatePermission;

  CosmWasmV1StoreCode({
    required this.sender,
    required List<int>? wasmByteCode,
    required this.instantiatePermission,
  }) : wasmByteCode = wasmByteCode?.asImmutableBytes;
  factory CosmWasmV1StoreCode.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1StoreCode(
      instantiatePermission: decode
          .getResult(5)
          ?.to<CosmWasmV1AccessConfig, List<int>>(
            (e) => CosmWasmV1AccessConfig.deserialize(e),
          ),
      sender: decode.getField(1),
      wasmByteCode: decode.getField(2),
    );
  }
  factory CosmWasmV1StoreCode.fromJson(Map<String, dynamic> json) {
    return CosmWasmV1StoreCode(
      sender: json.as("sender"),
      wasmByteCode: json.maybeAs<List<int>, String>(
        key: "wasm_byte_code",
        onValue: (e) => CosmosUtils.toBytes(e),
      ),
      instantiatePermission: json
          .maybeAs<CosmWasmV1AccessConfig, Map<String, dynamic>>(
            key: "instantiate_permission",
            onValue: (e) => CosmWasmV1AccessConfig.fromJson(e),
          ),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "wasm_byte_code": CosmosUtils.tryToBase64(wasmByteCode),
      "instantiate_permission": instantiatePermission?.toJson(),
    };
  }

  @override
  List get values => [sender, wasmByteCode, instantiatePermission];

  @override
  CosmWasmV1Types get typeUrl => CosmWasmV1Types.msgStoreCode;

  @override
  List<String?> get signers => [sender];

  @override
  CosmWasmV1MsgStoreCodeResponse onResponse(List<int> bytes) {
    return CosmWasmV1MsgStoreCodeResponse.deserialize(bytes);
  }
}
