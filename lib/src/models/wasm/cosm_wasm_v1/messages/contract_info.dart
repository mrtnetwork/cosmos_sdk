import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/messages/absolute_tx_position.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// ContractInfo stores a WASM contract instance.
class CosmWasmV1ContractInfo extends CosmosMessage {
  /// CodeID is the reference to the stored Wasm code
  final BigInt? codeId;

  /// Creator address who initially instantiated the contract
  final String? creator;

  /// Admin is an optional address that can execute migrations
  final String? admin;

  /// Label is optional metadata to be stored with a contract instance.
  final String? label;

  /// Created Tx position when the contract was instantiated.
  final CosmWasmV1AbsoluteTxPosition? created;
  final String? ibcPortId;

  /// Extension is an extension point to store custom metadata within the
  /// persistence model.
  final Any? extension;

  CosmWasmV1ContractInfo({
    required this.codeId,
    required this.creator,
    required this.admin,
    required this.label,
    required this.created,
    required this.ibcPortId,
    required this.extension,
  });
  factory CosmWasmV1ContractInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1ContractInfo(
      codeId: decode.getField(1),
      creator: decode.getField(2),
      admin: decode.getField(3),
      label: decode.getField(4),
      created: decode
          .getResult(5)
          ?.to<CosmWasmV1AbsoluteTxPosition, List<int>>(
            (e) => CosmWasmV1AbsoluteTxPosition.deserialize(e),
          ),
      ibcPortId: decode.getField(6),
      extension: decode
          .getResult(7)
          ?.to<Any, List<int>>((e) => Any.deserialize(e)),
    );
  }
  factory CosmWasmV1ContractInfo.fromJson(Map<String, dynamic> json) {
    return CosmWasmV1ContractInfo(
      codeId: json.asBigInt("code_id"),
      creator: json.as("creator"),
      admin: json.as("admin"),
      label: json.as("label"),
      created: json.maybeAs<CosmWasmV1AbsoluteTxPosition, Map<String, dynamic>>(
        key: "created",
        onValue: (e) => CosmWasmV1AbsoluteTxPosition.fromJson(e),
      ),
      ibcPortId: json.as("ibc_port_id"),
      extension: json.maybeAs<Any, Map<String, dynamic>>(
        key: "extension",
        onValue: (e) => Any.fromJson(e),
      ),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7];

  @override
  Map<String, dynamic> toJson() {
    return {
      "code_id": codeId?.toString(),
      "creator": creator,
      "admin": admin,
      "label": label,
      "created": created?.toJson(),
      "ibc_port_id": ibcPortId,
      "extension": extension?.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.contractInfo;

  @override
  List get values => [
    codeId,
    creator,
    admin,
    label,
    created,
    ibcPortId,
    extension,
  ];
}
