import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/types/cosmos_enum.dart';

/// Order defines if a channel is ORDERED or UNORDERED
class IbcChannelOrder implements CosmosEnum {
  @override
  final String name;
  @override
  final int value;
  const IbcChannelOrder(this.name, this.value);

  /// zero-value for channel ordering
  static const IbcChannelOrder noneUnspecified =
      IbcChannelOrder("ORDER_NONE_UNSPECIFIED", 0);

  /// packets can be delivered in any order, which may differ from the order in
  /// which they were sent.
  static const IbcChannelOrder unordered =
      IbcChannelOrder("ORDER_UNORDERED", 1);

  /// packets are delivered exactly in the order which they were sent
  static const IbcChannelOrder ordered = IbcChannelOrder("ORDER_ORDERED", 2);
  static const List<IbcChannelOrder> values = [
    noneUnspecified,
    unordered,
    ordered
  ];
  static IbcChannelOrder fromValue(Object? value) {
    return values.firstWhere(
      (element) => element.value == value || element.name == value,
      orElse: () => throw DartCosmosSdkPluginException(
          "No matching element found for the given value.",
          details: {"value": value}),
    );
  }
}
