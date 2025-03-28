import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ResponseResultType defines the possible outcomes of the execution of a message
class IbcChannelV2ResponseResultType implements CosmosEnum {
  @override
  final int value;
  @override
  final String name;
  const IbcChannelV2ResponseResultType._(this.value, this.name);

  /// Default zero value enumeration
  static const IbcChannelV2ResponseResultType unspecified =
      IbcChannelV2ResponseResultType._(0, "RESPONSE_RESULT_TYPE_UNSPECIFIED");

  /// The message did not call the IBC application callbacks (because, for example, the packet had already been relayed)
  static const IbcChannelV2ResponseResultType noop =
      IbcChannelV2ResponseResultType._(1, "RESPONSE_RESULT_TYPE_NOOP");

  /// The message was executed successfully
  static const IbcChannelV2ResponseResultType sucess =
      IbcChannelV2ResponseResultType._(2, "RESPONSE_RESULT_TYPE_SUCCESS");

  /// The message was executed unsuccessfully
  static const IbcChannelV2ResponseResultType failure =
      IbcChannelV2ResponseResultType._(4, "RESPONSE_RESULT_TYPE_FAILURE");
  static const List<IbcChannelV2ResponseResultType> values = [
    unspecified,
    noop,
    sucess,
    failure
  ];
  static IbcChannelV2ResponseResultType fromValue(Object? value) {
    return values.firstWhere(
      (e) => e.value == value || e.name == value,
      orElse: () => throw DartCosmosSdkPluginException(
          "No ResponseResultType element found for the given value.",
          details: {"value": value}),
    );
  }
}
