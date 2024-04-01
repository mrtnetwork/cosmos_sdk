import 'package:blockchain_utils/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Infraction indicates the infraction a validator committed.
class Infraction implements CosmosEnum {
  // UNSPECIFIED defines an empty infraction.
  static const Infraction unspecified = Infraction._(0, "unspecified");

  // DOUBLE_SIGN defines a validator that double-signs a block.
  static const Infraction doubleSign = Infraction._(1, "doubleSign");

  // DOWNTIME defines a validator that missed signing too many blocks.
  static const Infraction downTime = Infraction._(2, "downTime");

  @override
  final int value;
  @override
  final String name;

  const Infraction._(this.value, this.name);
  static const List<Infraction> values = [unspecified, doubleSign, downTime];

  static Infraction fromValue(int? value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw MessageException(
          "No Infraction element found for the given value.",
          details: {"value": value}),
    );
  }
}
