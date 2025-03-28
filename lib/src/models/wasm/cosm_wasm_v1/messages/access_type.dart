import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// AccessType permission types
class CosmWasmV1AccessType implements CosmosEnum {
  @override
  final int value;
  @override
  final String name;
  const CosmWasmV1AccessType._(this.value, this.name);

  /// AccessTypeUnspecified placeholder for empty value
  static const CosmWasmV1AccessType unspecified =
      CosmWasmV1AccessType._(0, "ACCESS_TYPE_UNSPECIFIED");

  /// AccessTypeNobody forbidden
  static const CosmWasmV1AccessType noBody =
      CosmWasmV1AccessType._(1, "ACCESS_TYPE_NOBODY");

  /// AccessTypeEverybody unrestricted
  static const CosmWasmV1AccessType everyBody =
      CosmWasmV1AccessType._(3, "ACCESS_TYPE_EVERYBODY");

  /// AccessTypeAnyOfAddresses allow any of the addresses
  static const CosmWasmV1AccessType anyOfAddress =
      CosmWasmV1AccessType._(4, "ACCESS_TYPE_ANY_OF_ADDRESSES");
  static const List<CosmWasmV1AccessType> values = [
    unspecified,
    noBody,
    everyBody,
    anyOfAddress
  ];
  static CosmWasmV1AccessType fromValue(int? value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw DartCosmosSdkPluginException(
          "No AccessType element found for the given value.",
          details: {"value": value}),
    );
  }

  static CosmWasmV1AccessType fromName(String? name) {
    return values.firstWhere(
      (e) => e.name == name,
      orElse: () => throw DartCosmosSdkPluginException(
          "No AccessType element found for the given name.",
          details: {"name": name}),
    );
  }
}
