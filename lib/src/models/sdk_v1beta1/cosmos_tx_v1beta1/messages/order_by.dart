import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/types/cosmos_enum.dart';

/// OrderBy defines the sorting order.
class OrderBy implements CosmosEnum {
  /// ORDER_BY_UNSPECIFIED specifies an unknown sorting order. OrderBy defaults
  /// to ASC in this case.
  static const OrderBy unspecified = OrderBy._(0, "unspecified");

  /// ORDER_BY_ASC defines ascending order
  static const OrderBy asc = OrderBy._(1, "asc");

  /// ORDER_BY_DESC defines descending order
  static const OrderBy desc = OrderBy._(2, "desc");

  @override
  final int value;
  @override
  final String name;

  const OrderBy._(this.value, this.name);
  static const List<OrderBy> values = [unspecified, asc, desc];

  static OrderBy fromValue(int? value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw DartCosmosSdkPluginException(
          "No OrderBy element found for the given value.",
          details: {"value": value}),
    );
  }
}
