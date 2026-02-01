import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/messages/access_config.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// CodeInfoResponse contains code meta data from CodeInfo
class CosmWasmV1CodeInfoResponse extends CosmosMessage {
  final BigInt? codeId;
  final String? creator;
  final List<int>? dataHash;
  final CosmWasmV1AccessConfig? instantiatePermission;
  CosmWasmV1CodeInfoResponse({
    required this.codeId,
    required this.creator,
    required List<int>? dataHash,
    required this.instantiatePermission,
  }) : dataHash = dataHash?.asImmutableBytes;
  factory CosmWasmV1CodeInfoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1CodeInfoResponse(
      codeId: decode.getField(1),
      creator: decode.getField(2),
      dataHash: decode.getField(3),
      instantiatePermission: decode
          .getResult(6)
          ?.to<CosmWasmV1AccessConfig, List<int>>(
            (e) => CosmWasmV1AccessConfig.deserialize(e),
          ),
    );
  }
  factory CosmWasmV1CodeInfoResponse.fromJson(Map<String, dynamic> json) {
    return CosmWasmV1CodeInfoResponse(
      codeId: json.asBigInt("code_id"),
      creator: json.as("creator"),
      dataHash: json.asBytes("data_hash"),
      instantiatePermission: json
          .maybeAs<CosmWasmV1AccessConfig, Map<String, dynamic>>(
            key: "instantiate_permission",
            onValue: CosmWasmV1AccessConfig.fromJson,
          ),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 6];

  @override
  Map<String, dynamic> toJson() {
    return {
      "code_id": codeId.toString(),
      "creator": creator,
      "data_hash": CosmosUtils.tryToBase64(dataHash),
      "instantiate_permission": instantiatePermission?.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.codeInfoResponse;

  @override
  List get values => [creator, creator, dataHash, instantiatePermission];
}
