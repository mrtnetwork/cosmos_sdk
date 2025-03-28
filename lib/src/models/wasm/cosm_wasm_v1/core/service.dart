import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/service/add_code_upload_params_addresses.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/service/clear_admin.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/service/execute_contract.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/service/instantiate_contract.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/service/instantiate_contract2.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/service/migrate_contract.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/service/pin_codes.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/service/remove_code_upload_params_addresses.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/service/store_and_instantiate_contract.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/service/store_and_migrate_contract.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/service/store_code.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/service/sudo_contract.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/service/unpin_codes.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/service/update_admin.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/service/update_contract_label.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/service/update_instantiate_config.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/service/update_params.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

abstract class CosmWasm1Beta1Service<T extends CosmosMessage>
    extends ServiceMessage<T> {
  const CosmWasm1Beta1Service();
  static const String root = "/cosmwasm";

  static T? fromJson<T extends CosmWasm1Beta1Service>(
      {required String typeUrl, required Map<String, dynamic> json}) {
    final type = CosmWasmV1Types.findService(typeUrl);
    final CosmWasm1Beta1Service? service = switch (type) {
      CosmWasmV1Types.msgAddCodeUploadParamsAddresses =>
        CosmWasmV1AddCodeUploadParamsAddresses.fromJson(json),
      CosmWasmV1Types.msgClearAdmin => CosmWasmV1ClearAdmin.fromJson(json),
      CosmWasmV1Types.msgExecuteContract =>
        CosmWasmV1ExecuteContract.fromJson(json),
      CosmWasmV1Types.msgInstantiateContract =>
        CosmWasmV1InstantiateContract.fromJson(json),
      CosmWasmV1Types.msgInstantiateContract2 =>
        CosmWasmV1InstantiateContract2.fromJson(json),
      CosmWasmV1Types.msgMigrateContract =>
        CosmWasmV1MigrateContract.fromJson(json),
      CosmWasmV1Types.msgPinCodes => CosmWasmV1PinCodes.fromJson(json),
      CosmWasmV1Types.msgRemoveCodeUploadParamsAddresses =>
        CosmWasmV1RemoveCodeUploadParamsAddresses.fromJson(json),
      CosmWasmV1Types.msgStoreAndInstantiateContract =>
        CosmWasmV1StoreAndInstantiateContract.fromJson(json),
      CosmWasmV1Types.msgStoreAndMigrateContract =>
        CosmWasmV1StoreAndMigrateContract.fromJson(json),
      CosmWasmV1Types.msgStoreCode => CosmWasmV1StoreCode.fromJson(json),
      CosmWasmV1Types.msgSudoContract => CosmWasmV1SudoContract.fromJson(json),
      CosmWasmV1Types.msgUnpinCodes => CosmWasmV1UnPinCodes.fromJson(json),
      CosmWasmV1Types.msgUpdateAdmin => CosmWasmV1UpdateAdmin.fromJson(json),
      CosmWasmV1Types.msgUpdateContractLabel =>
        CosmWasmV1UpdateContractLabel.fromJson(json),
      CosmWasmV1Types.msgUpdateInstantiateConfig =>
        CosmWasmV1UpdateInstantiateConfig.fromJson(json),
      CosmWasmV1Types.msgUpdateParams => CosmWasmV1UpdateParams.fromJson(json),
      _ => null
    } as CosmWasm1Beta1Service?;

    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException("Invalid CosmWasm Service.", details: {
        "excepted": "$T",
        "service": service.runtimeType.toString()
      });
    }
    return service;
  }

  static T? deserialize<T extends ServiceMessage>(
      {required String typeUrl, required List<int> bytes}) {
    final type = CosmWasmV1Types.findService(typeUrl);
    final ServiceMessage? service = switch (type) {
      CosmWasmV1Types.msgAddCodeUploadParamsAddresses =>
        CosmWasmV1AddCodeUploadParamsAddresses.deserialize(bytes),
      CosmWasmV1Types.msgClearAdmin => CosmWasmV1ClearAdmin.deserialize(bytes),
      CosmWasmV1Types.msgExecuteContract =>
        CosmWasmV1ExecuteContract.deserialize(bytes),
      CosmWasmV1Types.msgInstantiateContract =>
        CosmWasmV1InstantiateContract.deserialize(bytes),
      CosmWasmV1Types.msgInstantiateContract2 =>
        CosmWasmV1InstantiateContract2.deserialize(bytes),
      CosmWasmV1Types.msgMigrateContract =>
        CosmWasmV1MigrateContract.deserialize(bytes),
      CosmWasmV1Types.msgPinCodes => CosmWasmV1PinCodes.deserialize(bytes),
      CosmWasmV1Types.msgRemoveCodeUploadParamsAddresses =>
        CosmWasmV1RemoveCodeUploadParamsAddresses.deserialize(bytes),
      CosmWasmV1Types.msgStoreAndInstantiateContract =>
        CosmWasmV1StoreAndInstantiateContract.deserialize(bytes),
      CosmWasmV1Types.msgStoreAndMigrateContract =>
        CosmWasmV1StoreAndMigrateContract.deserialize(bytes),
      CosmWasmV1Types.msgStoreCode => CosmWasmV1StoreCode.deserialize(bytes),
      CosmWasmV1Types.msgSudoContract =>
        CosmWasmV1SudoContract.deserialize(bytes),
      CosmWasmV1Types.msgUnpinCodes => CosmWasmV1UnPinCodes.deserialize(bytes),
      CosmWasmV1Types.msgUpdateAdmin =>
        CosmWasmV1UpdateAdmin.deserialize(bytes),
      CosmWasmV1Types.msgUpdateContractLabel =>
        CosmWasmV1UpdateContractLabel.deserialize(bytes),
      CosmWasmV1Types.msgUpdateInstantiateConfig =>
        CosmWasmV1UpdateInstantiateConfig.deserialize(bytes),
      CosmWasmV1Types.msgUpdateParams =>
        CosmWasmV1UpdateParams.deserialize(bytes),
      _ => null
    } as CosmWasm1Beta1Service?;

    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException("Invalid CosmWasm Service.", details: {
        "excepted": "$T",
        "service": service.runtimeType.toString()
      });
    }
    return service;
  }
}
