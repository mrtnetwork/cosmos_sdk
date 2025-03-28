import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// MsgStoreAndMigrateContractResponse defines the response structure for executing a MsgStoreAndMigrateContract message.
class CosmWasmV1MsgStoreAndMigrateContractResponse extends CosmosMessage {
  /// CodeID is the reference to the stored WASM code
  final BigInt? codeId;

  /// Checksum is the sha256 hash of the stored code
  final List<int>? checksum;

  /// Data contains bytes to returned from the contract
  final List<int>? data;
  CosmWasmV1MsgStoreAndMigrateContractResponse({
    required this.codeId,
    required List<int>? checksum,
    required List<int>? data,
  })  : data = data?.asImmutableBytes,
        checksum = checksum?.asImmutableBytes;
  factory CosmWasmV1MsgStoreAndMigrateContractResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1MsgStoreAndMigrateContractResponse(
        codeId: decode.getField(1),
        checksum: decode.getField(2),
        data: decode.getField(3));
  }
  factory CosmWasmV1MsgStoreAndMigrateContractResponse.fromJson(
      Map<String, dynamic> json) {
    return CosmWasmV1MsgStoreAndMigrateContractResponse(
      data: json.asBytes("data"),
      codeId: json.asBigInt("code_id"),
      checksum: json.asBytes("checksum"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "data": CosmosUtils.tryToBase64(data),
      "checksum": CosmosUtils.tryToBase64(checksum),
      "code_id": codeId?.toString(),
    };
  }

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.msgStoreAndMigrateContractResponse;

  @override
  List get values => [codeId, checksum, data];
}
