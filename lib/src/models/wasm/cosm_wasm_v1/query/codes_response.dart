import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/cosmos_base_query_v1beta1.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/messages/code_info_response.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// QueryCodeResponse is the response type for the Query/Code RPC method
class CosmWasmV1QueryCodesResponse extends CosmosMessage {
  final List<CosmWasmV1CodeInfoResponse>? codeInfos;

  /// pagination defines the pagination in the response.
  final PageResponse? pagination;
  CosmWasmV1QueryCodesResponse({
    required List<CosmWasmV1CodeInfoResponse>? codeInfos,
    this.pagination,
  }) : codeInfos = codeInfos?.immutable;
  factory CosmWasmV1QueryCodesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1QueryCodesResponse(
      codeInfos:
          decode
              .getFields<List<int>>(1)
              .map((e) => CosmWasmV1CodeInfoResponse.deserialize(e))
              .toList(),
      pagination: decode
          .getResult(2)
          ?.to<PageResponse, List<int>>(PageResponse.deserialize),
    );
  }
  factory CosmWasmV1QueryCodesResponse.fromJson(Map<String, dynamic> json) {
    return CosmWasmV1QueryCodesResponse(
      pagination: json.maybeAs<PageResponse, Map<String, dynamic>>(
        key: "pagination",
        onValue: (e) => PageResponse.fromJson(e),
      ),
      codeInfos:
          json
              .asListOfMap("code_infos")
              ?.map((e) => CosmWasmV1CodeInfoResponse.fromJson(e))
              .toList(),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "code_infos": codeInfos?.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.queryCodesResponse;

  @override
  List get values => [codeInfos, pagination];
}
