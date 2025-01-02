import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// State defines if a connection is in one of the following states: INIT, TRYOPEN, OPEN or UNINITIALIZED.
class IbcConnectionState implements CosmosEnum {
  @override
  final int value;
  @override
  final String name;
  const IbcConnectionState._(this.value, this.name);

  /// Default State
  static const IbcConnectionState uninitializedUnspecified =
      IbcConnectionState._(0, "STATE_UNINITIALIZED_UNSPECIFIED");

  /// A connection end has just started the opening handshake.
  static const IbcConnectionState init = IbcConnectionState._(1, "STATE_INIT");

  /// A connection end has acknowledged the handshake step on the counterparty
  /// chain.
  static const IbcConnectionState tryOpen =
      IbcConnectionState._(2, "STATE_TRYOPEN");

  /// A connection end has completed the handshake.
  static const IbcConnectionState open = IbcConnectionState._(3, "STATE_OPEN");
  static const List<IbcConnectionState> values = [
    uninitializedUnspecified,
    init,
    tryOpen,
    open
  ];

  static IbcConnectionState fromValue(Object? value) {
    return values.firstWhere(
      (e) => e.value == value || e.name == value,
      orElse: () => throw DartCosmosSdkPluginException(
          "No IbcConnectionState element found for the given value.",
          details: {"value": value}),
    );
  }
}
