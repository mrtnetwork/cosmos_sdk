import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/types/cosmos_enum.dart';

/// ResponseResultType defines the possible outcomes of the execution of a message
class IbcChannelResponseResultType implements CosmosEnum {
  @override
  final String name;
  @override
  final int value;
  const IbcChannelResponseResultType._(this.name, this.value);
  static const IbcChannelResponseResultType unspecified =
      IbcChannelResponseResultType._("RESPONSE_RESULT_TYPE_UNSPECIFIED", 0);
  static const IbcChannelResponseResultType noop =
      IbcChannelResponseResultType._("RESPONSE_RESULT_TYPE_NOOP", 1);
  static const IbcChannelResponseResultType success =
      IbcChannelResponseResultType._("RESPONSE_RESULT_TYPE_SUCCESS", 2);
  static const IbcChannelResponseResultType failure =
      IbcChannelResponseResultType._("RESPONSE_RESULT_TYPE_FAILURE", 3);
  static const List<IbcChannelResponseResultType> values = [
    unspecified,
    noop,
    success,
    failure
  ];

  static IbcChannelResponseResultType fromValue(int? value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw DartCosmosSdkPluginException(
          "No IbcChannelResponseResultType element found for the given value.",
          details: {"value": value}),
    );
  }
}
