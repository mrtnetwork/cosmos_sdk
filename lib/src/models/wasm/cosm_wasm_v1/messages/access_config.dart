import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/messages/access_type.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// AccessConfig access control type.
class CosmWasmV1AccessConfig extends CosmosMessage {
  final CosmWasmV1AccessType permission;
  final List<String> addresses;
  CosmWasmV1AccessConfig({
    required this.permission,
    required List<String> addresses,
  }) : addresses = addresses.immutable;
  factory CosmWasmV1AccessConfig.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1AccessConfig(
      permission: CosmWasmV1AccessType.fromValue(decode.getField(1)),
      addresses: decode.getFields<String>(3),
    );
  }
  factory CosmWasmV1AccessConfig.fromJson(Map<String, dynamic> json) {
    return CosmWasmV1AccessConfig(
      addresses: json.asListOfString("addresses")!,
      permission: CosmWasmV1AccessType.fromName(json.as("permission")),
    );
  }

  @override
  List<int> get fieldIds => [1, 3];

  @override
  Map<String, dynamic> toJson() {
    return {"permission": permission.name, "addresses": addresses};
  }

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.accessConfig;

  @override
  List get values => [permission, addresses];
}
