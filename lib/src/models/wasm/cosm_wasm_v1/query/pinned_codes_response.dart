import 'package:blockchain_utils/helper/helper.dart';
import 'package:blockchain_utils/utils/numbers/utils/bigint_utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/cosmos_base_query_v1beta1.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// QueryPinnedCodesResponse is the response type for the
/// Query/PinnedCodes RPC method
class CosmWasmV1QueryPinnedCodesResponse extends CosmosMessage {
  final List<BigInt>? codeIds;

  /// pagination defines the pagination in the response.
  final PageResponse? pagination;
  CosmWasmV1QueryPinnedCodesResponse({
    required List<BigInt>? codeIds,
    this.pagination,
  }) : codeIds = codeIds?.immutable;
  factory CosmWasmV1QueryPinnedCodesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1QueryPinnedCodesResponse(
      codeIds: decode.getFields<BigInt>(1),
      pagination: decode
          .getResult(2)
          ?.to<PageResponse, List<int>>(PageResponse.deserialize),
    );
  }
  factory CosmWasmV1QueryPinnedCodesResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return CosmWasmV1QueryPinnedCodesResponse(
      codeIds:
          json.as<List?>("code_ids")?.map((e) => BigintUtils.parse(e)).toList(),
      pagination: json.maybeAs<PageResponse, Map<String, dynamic>>(
        key: "pagination",
        onValue: (e) => PageResponse.fromJson(e),
      ),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "code_ids": codeIds?.map((e) => e.toString()).toList(),
      "pagination": pagination?.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.queryPinnedCodesResponse;

  @override
  List get values => [codeIds, pagination];
}
