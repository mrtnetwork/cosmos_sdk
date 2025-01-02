import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/types/cosmos_enum.dart';

/// BondStatus is the status of a validator.
class BondStatus implements CosmosEnum {
  // unspecified defines an invalid validator status.
  static const BondStatus unspecified = BondStatus._(0, "unspecified");

  // unbonded defines a validator that is not bonded.
  static const BondStatus unbonded = BondStatus._(1, "unbonded");

  // unbonding defines a validator that is unbonding.
  static const BondStatus unbonding = BondStatus._(2, "unbonding");

  // bonded defines a validator that is bonded.
  static const BondStatus bonded = BondStatus._(3, "bonded");

  @override
  final int value;
  @override
  final String name;

  const BondStatus._(this.value, this.name);
  static const List<BondStatus> values = [
    unspecified,
    unbonded,
    unbonding,
    bonded
  ];

  static BondStatus fromValue(int? value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw DartCosmosSdkPluginException(
          "No BondStatus element found for the given value.",
          details: {"value": value}),
    );
  }

  static BondStatus fromName(String? name) {
    return values.firstWhere(
      (e) => e.name == name,
      orElse: () => throw DartCosmosSdkPluginException(
          "No BondStatus element found for the given name.",
          details: {"name": name}),
    );
  }
}
