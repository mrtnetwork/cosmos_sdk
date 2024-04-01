import 'package:blockchain_utils/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/types/cosmos_enum.dart';

/// ResponseResultType defines the possible outcomes of the execution of a message
class IbcChannelResponseResultType implements CosmosEnum {
  @override
  final String name;
  @override
  final int value;
  const IbcChannelResponseResultType._(this.name, this.value);
  static const IbcChannelResponseResultType unspecified =
      IbcChannelResponseResultType._("Unspecified", 0);
  static const IbcChannelResponseResultType noop =
      IbcChannelResponseResultType._("Noop", 1);
  static const IbcChannelResponseResultType success =
      IbcChannelResponseResultType._("Success", 2);
  static const IbcChannelResponseResultType failure =
      IbcChannelResponseResultType._("Failure", 3);
  static const List<IbcChannelResponseResultType> values = [
    unspecified,
    noop,
    success,
    failure
  ];

  static IbcChannelResponseResultType fromValue(int? value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw MessageException(
          "No IbcChannelResponseResultType element found for the given value.",
          details: {"value": value}),
    );
  }
}
