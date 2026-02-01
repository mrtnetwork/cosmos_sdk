import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/core/service.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

import 'msg_store_code_response.dart';

/// MsgStoreCode defines the request type for the StoreCode rpc
class IbcLightClientsWasmMsgStoreCode
    extends IbcService<IbcLightClientsWasmMsgStoreCodeResponse> {
  /// signer address
  final String? signer;

  /// wasm byte code of light client contract. It can be raw or gzip compressed
  final List<int>? wasmByteCode;
  IbcLightClientsWasmMsgStoreCode({this.signer, List<int>? wasmByteCode})
    : wasmByteCode = BytesUtils.tryToBytes(wasmByteCode, unmodifiable: true);
  factory IbcLightClientsWasmMsgStoreCode.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcLightClientsWasmMsgStoreCode(
      signer: decode.getField(1),
      wasmByteCode: decode.getField(2),
    );
  }
  factory IbcLightClientsWasmMsgStoreCode.fromJson(Map<String, dynamic> json) {
    return IbcLightClientsWasmMsgStoreCode(
      signer: json.as("signer"),
      wasmByteCode: json.asBytes("wasm_byte_code"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "signer": signer,
      "wasm_byte_code": BytesUtils.tryToHexString(wasmByteCode),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.ibcLightClientsWasmMsgStoreCode;

  @override
  List get values => [signer, wasmByteCode];

  @override
  List<String?> get signers => [signer];

  @override
  IbcLightClientsWasmMsgStoreCodeResponse onResponse(List<int> bytes) {
    return IbcLightClientsWasmMsgStoreCodeResponse.deserialize(bytes);
  }
}
