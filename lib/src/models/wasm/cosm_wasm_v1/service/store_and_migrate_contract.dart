import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/core/service.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/messages/access_config.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/service/store_and_migrate_contract_response.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgStoreAndMigrateContract is the MsgStoreAndMigrateContract request type.
class CosmWasmV1StoreAndMigrateContract extends CosmWasm1Beta1Service<
    CosmWasmV1MsgStoreAndMigrateContractResponse> {
  /// Authority is the address of the governance account.
  final String? authority;

  /// WASMByteCode can be raw or gzip compressed
  final List<int>? wasmByteCode;

  /// InstantiatePermission to apply on contract creation, optional
  final CosmWasmV1AccessConfig? instantiatePermission;

  /// Contract is the address of the smart contract
  final String? contract;

  /// Msg json encoded message to be passed to the contract on migration
  final List<int>? msg;

  CosmWasmV1StoreAndMigrateContract({
    this.authority,
    List<int>? wasmByteCode,
    this.instantiatePermission,
    this.contract,
    List<int>? msg,
  })  : wasmByteCode = wasmByteCode?.immutable,
        msg = msg?.asImmutableBytes;
  factory CosmWasmV1StoreAndMigrateContract.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1StoreAndMigrateContract(
        authority: decode.getField(1),
        wasmByteCode: decode.getField(2),
        instantiatePermission: decode
            .getResult(3)
            ?.to<CosmWasmV1AccessConfig, List<int>>(
                (e) => CosmWasmV1AccessConfig.deserialize(e)),
        contract: decode.getField(4),
        msg: decode.getField(5));
  }
  factory CosmWasmV1StoreAndMigrateContract.fromJson(
      Map<String, dynamic> json) {
    return CosmWasmV1StoreAndMigrateContract(
        authority: json.as("authority"),
        wasmByteCode: json.asBytes("wasm_byte_code"),
        instantiatePermission:
            json.maybeAs<CosmWasmV1AccessConfig, Map<String, dynamic>>(
                key: "instantiate_permission",
                onValue: (e) => CosmWasmV1AccessConfig.fromJson(e)),
        contract: json.as("contract"),
        msg: json.asBytes("msg"));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "authority": authority,
      "wasm_byte_code": CosmosUtils.tryToBase64(wasmByteCode),
      "instantiate_permission": instantiatePermission?.toJson(),
      "contract": contract,
      "msg": CosmosUtils.tryToBase64(msg)
    };
  }

  @override
  List get values =>
      [authority, wasmByteCode, instantiatePermission, contract, msg];

  @override
  CosmWasmV1Types get typeUrl => CosmWasmV1Types.msgStoreAndMigrateContract;

  @override
  List<String?> get signers => [authority];

  @override
  CosmWasmV1MsgStoreAndMigrateContractResponse onResponse(List<int> bytes) {
    return CosmWasmV1MsgStoreAndMigrateContractResponse.deserialize(bytes);
  }
}
