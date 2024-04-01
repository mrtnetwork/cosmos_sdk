import 'package:blockchain_utils/exception/exception.dart';
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
      IbcConnectionState._(0, "UNINITIALIZED_UNSPECIFIED");

  /// A connection end has just started the opening handshake.
  static const IbcConnectionState init = IbcConnectionState._(1, "INIT");

  /// A connection end has acknowledged the handshake step on the counterparty
  /// chain.
  static const IbcConnectionState tryOpen = IbcConnectionState._(2, "TRYOPEN");

  /// A connection end has completed the handshake.
  static const IbcConnectionState open = IbcConnectionState._(3, "OPEN");
  static const List<IbcConnectionState> values = [
    uninitializedUnspecified,
    init,
    tryOpen,
    open
  ];

  static IbcConnectionState fromValue(int? value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw MessageException(
          "No IbcConnectionState element found for the given value.",
          details: {"value": value}),
    );
  }
}
