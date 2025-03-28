import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/messages/access_config.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// QueryCodeInfoResponse is the response type for the Query/CodeInfo RPC method
class CosmWasmV1QueryCodeInfoResponse extends CosmosMessage {
  final BigInt? codeId;
  final String? creator;
  final List<int>? checksum;
  final CosmWasmV1AccessConfig? instantiatePermission;

  CosmWasmV1QueryCodeInfoResponse(
      {required List<int>? checksum,
      required this.codeId,
      required this.creator,
      required this.instantiatePermission})
      : checksum = checksum?.asImmutableBytes;
  factory CosmWasmV1QueryCodeInfoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1QueryCodeInfoResponse(
        codeId: decode.getField(1),
        creator: decode.getField(2),
        checksum: decode.getField(3),
        instantiatePermission: decode
            .getResult(4)
            ?.to<CosmWasmV1AccessConfig, List<int>>(
                CosmWasmV1AccessConfig.deserialize));
  }
  factory CosmWasmV1QueryCodeInfoResponse.fromJson(Map<String, dynamic> json) {
    return CosmWasmV1QueryCodeInfoResponse(
        codeId: json.asBigInt("code_id"),
        creator: json.as("creator"),
        checksum: json.asBytes("checksum"),
        instantiatePermission:
            json.maybeAs<CosmWasmV1AccessConfig, Map<String, dynamic>>(
                key: "instantiate_permission",
                onValue: CosmWasmV1AccessConfig.fromJson));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "instantiate_permission": instantiatePermission?.toJson(),
      "checksum": CosmosUtils.tryToBase64(checksum),
      "creator": creator,
      "code_id": codeId?.toString()
    };
  }

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.queryCodeInfoResponse;

  @override
  List get values => [codeId, creator, checksum, instantiatePermission];
}
