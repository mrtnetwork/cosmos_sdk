import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// ContractGrant a granted permission for a single contract Since: wasmd 0.30
class CosmWasmV1ContractGrant extends CosmosMessage {
  /// Contract is the bech32 address of the smart contract
  final String? contract;

  /// Limit defines execution limits that are enforced and updated when the grant
  /// is applied. When the limit lapsed the grant is removed.
  final Any? limit;

  /// Filter define more fine-grained control on the message payload passed
  /// to the contract in the operation. When no filter applies on execution, the
  /// operation is prohibited.
  final Any? filter;
  const CosmWasmV1ContractGrant(
      {required this.contract, required this.limit, required this.filter});

  factory CosmWasmV1ContractGrant.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1ContractGrant(
        contract: decode.getField(1),
        limit:
            decode.getResult(2)?.to<Any, List<int>>((e) => Any.deserialize(e)),
        filter:
            decode.getResult(3)?.to<Any, List<int>>((e) => Any.deserialize(e)));
  }
  factory CosmWasmV1ContractGrant.fromJson(Map<String, dynamic> json) {
    return CosmWasmV1ContractGrant(
      contract: json.as("contract"),
      filter: json.maybeAs<Any, Map<String, dynamic>>(
          key: "filter", onValue: (e) => Any.fromJson(e)),
      limit: json.maybeAs<Any, Map<String, dynamic>>(
          key: "limit", onValue: (e) => Any.fromJson(e)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "contract": contract,
      "filter": filter?.toJson(),
      "limit": limit?.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.contractGrant;

  @override
  List get values => [contract, limit, filter];
}
