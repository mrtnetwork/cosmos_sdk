import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/cosmos_base_query_v1beta1.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/messages/model.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// QueryAllContractStateResponse is the response type for the
/// Query/AllContractState RPC method
class CosmWasmV1QueryAllContractStateResponse extends CosmosMessage {
  /// contracts are a set of contract addresses
  final List<CosmWasmV1Model>? models;

  /// pagination defines the pagination in the response.
  final PageResponse? pagination;
  CosmWasmV1QueryAllContractStateResponse({
    required List<CosmWasmV1Model>? models,
    this.pagination,
  }) : models = models?.immutable;
  factory CosmWasmV1QueryAllContractStateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1QueryAllContractStateResponse(
      models:
          decode
              .getFields<List<int>>(1)
              .map((e) => CosmWasmV1Model.deserialize(e))
              .toList(),
      pagination: decode
          .getResult(2)
          ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)),
    );
  }
  factory CosmWasmV1QueryAllContractStateResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return CosmWasmV1QueryAllContractStateResponse(
      models:
          json
              .asListOfMap("models")
              ?.map((e) => CosmWasmV1Model.fromJson(e))
              .toList(),
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
      "models": models?.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.queryAllContractStateResponse;

  @override
  List get values => [models, pagination];
}
