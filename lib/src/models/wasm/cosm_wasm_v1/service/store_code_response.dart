import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// MsgStoreCodeResponse returns store result data.
class CosmWasmV1MsgStoreCodeResponse extends CosmosMessage {
  /// CodeID is the reference to the stored WASM code
  final BigInt? codeId;

  /// Checksum is the sha256 hash of the stored code
  final List<int>? checksum;
  CosmWasmV1MsgStoreCodeResponse({
    required this.codeId,
    required List<int>? checksum,
  }) : checksum = checksum?.asImmutableBytes;
  factory CosmWasmV1MsgStoreCodeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1MsgStoreCodeResponse(
      codeId: decode.getField(1),
      checksum: decode.getField(2),
    );
  }
  factory CosmWasmV1MsgStoreCodeResponse.fromJson(Map<String, dynamic> json) {
    return CosmWasmV1MsgStoreCodeResponse(
      checksum: json.asBytes("checksum"),
      codeId: json.asBigInt("code_id"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "checksum": CosmosUtils.tryToBase64(checksum),
      "code_id": codeId?.toString(),
    };
  }

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.msgStoreCodeResponse;

  @override
  List get values => [codeId, checksum];
}
