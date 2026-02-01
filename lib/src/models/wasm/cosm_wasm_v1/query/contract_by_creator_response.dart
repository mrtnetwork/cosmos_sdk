import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/cosmos_base_query_v1beta1.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// QueryContractsByCreatorResponse is the response type for the
/// Query/ContractsByCreator RPC method.
class CosmWasmV1QueryContractsByCreatorResponse extends CosmosMessage {
  /// ContractAddresses result set
  final List<String>? contractAddresses;

  /// pagination defines the pagination in the response.
  final PageResponse? pagination;
  CosmWasmV1QueryContractsByCreatorResponse({
    required List<String>? contractAddresses,
    this.pagination,
  }) : contractAddresses = contractAddresses?.immutable;
  factory CosmWasmV1QueryContractsByCreatorResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1QueryContractsByCreatorResponse(
      contractAddresses: decode.getFields<String>(1),
      pagination: decode
          .getResult(2)
          ?.to<PageResponse, List<int>>(PageResponse.deserialize),
    );
  }
  factory CosmWasmV1QueryContractsByCreatorResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return CosmWasmV1QueryContractsByCreatorResponse(
      contractAddresses: json.asListOfString(
        "contract_addresses",
        throwOnNull: false,
      ),
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
      "contract_addresses": contractAddresses,
      "pagination": pagination?.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.queryContractsByCreatorResponse;

  @override
  List get values => [contractAddresses, pagination];
}
