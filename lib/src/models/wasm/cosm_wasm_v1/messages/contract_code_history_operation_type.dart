import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// AccessType permission types
class CosmWasmV1ContractCodeHistoryOperationType implements CosmosEnum {
  @override
  final int value;
  @override
  final String name;
  const CosmWasmV1ContractCodeHistoryOperationType._(this.value, this.name);

  /// ContractCodeHistoryOperationTypeUnspecified placeholder for empty value
  static const CosmWasmV1ContractCodeHistoryOperationType unspecified =
      CosmWasmV1ContractCodeHistoryOperationType._(
          0, "CONTRACT_CODE_HISTORY_OPERATION_TYPE_UNSPECIFIED");

  /// ContractCodeHistoryOperationTypeInit on chain contract instantiation
  static const CosmWasmV1ContractCodeHistoryOperationType init =
      CosmWasmV1ContractCodeHistoryOperationType._(
          1, "CONTRACT_CODE_HISTORY_OPERATION_TYPE_INIT");

  /// ContractCodeHistoryOperationTypeMigrate code migration
  static const CosmWasmV1ContractCodeHistoryOperationType migrate =
      CosmWasmV1ContractCodeHistoryOperationType._(
          2, "CONTRACT_CODE_HISTORY_OPERATION_TYPE_MIGRATE");

  /// ContractCodeHistoryOperationTypeGenesis based on genesis data
  static const CosmWasmV1ContractCodeHistoryOperationType genesis =
      CosmWasmV1ContractCodeHistoryOperationType._(
          3, "CONTRACT_CODE_HISTORY_OPERATION_TYPE_GENESIS");
  static const List<CosmWasmV1ContractCodeHistoryOperationType> values = [
    unspecified,
    init,
    migrate,
    genesis
  ];
  static CosmWasmV1ContractCodeHistoryOperationType fromValue(int? value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw DartCosmosSdkPluginException(
          "No ContractCodeHistoryOperationType element found for the given value.",
          details: {"value": value}),
    );
  }

  static CosmWasmV1ContractCodeHistoryOperationType fromName(String? name) {
    return values.firstWhere(
      (e) => e.name == name,
      orElse: () => throw DartCosmosSdkPluginException(
          "No ContractCodeHistoryOperationType element found for the given name.",
          details: {"name": name}),
    );
  }
}
