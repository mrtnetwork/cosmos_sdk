import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/core/service.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgUnpinCodes is the MsgUnpinCodes request type.
class CosmWasmV1UnPinCodes
    extends CosmWasm1Beta1Service<EmptyServiceRequestResponse> {
  /// Authority is the address of the governance account.
  final String? authority;

  /// CodeIDs references the WASM codes
  final List<BigInt>? codeIds;

  CosmWasmV1UnPinCodes({
    required this.authority,
    required List<BigInt>? codeIds,
  }) : codeIds = codeIds?.immutable;
  factory CosmWasmV1UnPinCodes.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1UnPinCodes(
        authority: decode.getField(1), codeIds: decode.getFields<BigInt>(2));
  }
  factory CosmWasmV1UnPinCodes.fromJson(Map<String, dynamic> json) {
    return CosmWasmV1UnPinCodes(
        authority: json.as("authority"),
        codeIds: json
            .as<List?>("code_ids")
            ?.map((e) => BigintUtils.parse(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "authority": authority,
      "code_ids": codeIds?.map((e) => e.toString()).toList()
    };
  }

  @override
  List get values => [authority, codeIds];

  @override
  CosmWasmV1Types get typeUrl => CosmWasmV1Types.msgUnpinCodes;

  @override
  List<String?> get signers => [authority];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(CosmWasmV1Types.msgUnpinCodesResponse);
  }
}
