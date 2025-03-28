import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'contract_by_creator_response.dart';

/// QueryContractsByCreatorRequest is the request type for the
/// Query/ContractsByCreator RPC method.
class CosmWasmV1QueryContractsByCreatorRequest extends CosmosMessage
    with QueryMessage<CosmWasmV1QueryContractsByCreatorResponse> {
  /// CreatorAddress is the address of contract creator
  final String creatorAddress;

  /// Pagination defines an optional pagination for the request.
  final PageRequest? pagination;
  const CosmWasmV1QueryContractsByCreatorRequest(
      {required this.creatorAddress, this.pagination});
  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "creator_address": creatorAddress,
      "pagination": pagination?.toJson()
    };
  }

  @override
  List get values => [creatorAddress, pagination];

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.queryContractsByCreator;

  @override
  CosmWasmV1QueryContractsByCreatorResponse onResponse(List<int> bytes) {
    return CosmWasmV1QueryContractsByCreatorResponse.deserialize(bytes);
  }

  @override
  CosmWasmV1QueryContractsByCreatorResponse onJsonResponse(
      Map<String, dynamic> json) {
    return CosmWasmV1QueryContractsByCreatorResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [creatorAddress];

  @override
  Map<String, String?> get queryParameters =>
      {...pagination?.queryParameters ?? {}};
}
