import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/messages/code_info_response.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// QueryCodeResponse is the response type for the Query/Code RPC method
class CosmWasmV1QueryCodeResponse extends CosmosMessage {
  final CosmWasmV1CodeInfoResponse? codeInfo;
  final List<int>? data;
  CosmWasmV1QueryCodeResponse({required List<int>? data, this.codeInfo})
    : data = data?.asImmutableBytes;
  factory CosmWasmV1QueryCodeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1QueryCodeResponse(
      data: decode.getField(2),
      codeInfo: decode
          .getResult(2)
          ?.to<CosmWasmV1CodeInfoResponse, List<int>>(
            CosmWasmV1CodeInfoResponse.deserialize,
          ),
    );
  }
  factory CosmWasmV1QueryCodeResponse.fromJson(Map<String, dynamic> json) {
    return CosmWasmV1QueryCodeResponse(
      data: json.asBytes("data"),
      codeInfo: json.maybeAs<CosmWasmV1CodeInfoResponse, Map<String, dynamic>>(
        key: "code_info",
        onValue: CosmWasmV1CodeInfoResponse.fromJson,
      ),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "code_info": codeInfo?.toJson(),
      "data": CosmosUtils.tryToBase64(data),
    };
  }

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.queryCodeResponse;

  @override
  List get values => [codeInfo, data];
}
