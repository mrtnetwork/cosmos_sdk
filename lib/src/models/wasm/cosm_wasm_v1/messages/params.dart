import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/messages/access_config.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/messages/access_type.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

// Params defines the set of wasm parameters.
class CosmWasmV1Params extends CosmosMessage {
  final CosmWasmV1AccessConfig? codeUploadAccess;
  final CosmWasmV1AccessType? instantiateDefaultPermission;
  const CosmWasmV1Params(
      {required this.codeUploadAccess,
      required this.instantiateDefaultPermission});
  factory CosmWasmV1Params.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1Params(
        codeUploadAccess: decode
            .getResult(1)
            ?.to<CosmWasmV1AccessConfig, List<int>>(
                (e) => CosmWasmV1AccessConfig.deserialize(e)),
        instantiateDefaultPermission: decode
            .getResult(2)
            ?.to<CosmWasmV1AccessType, int>(
                (e) => CosmWasmV1AccessType.fromValue(e)));
  }
  factory CosmWasmV1Params.fromJson(Map<String, dynamic> json) {
    return CosmWasmV1Params(
        codeUploadAccess: json.maybeAs<CosmWasmV1AccessConfig, String>(
            key: "code_upload_access",
            onValue: (e) => CosmWasmV1AccessConfig.fromJson(json.as(e))),
        instantiateDefaultPermission:
            json.maybeAs<CosmWasmV1AccessType, String>(
                key: "instantiate_default_permission",
                onValue: (e) => CosmWasmV1AccessType.fromName(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "code_upload_access": codeUploadAccess?.toJson(),
      "instantiate_default_permission": instantiateDefaultPermission?.name
    };
  }

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.params;

  @override
  List get values => [codeUploadAccess, instantiateDefaultPermission];
}
