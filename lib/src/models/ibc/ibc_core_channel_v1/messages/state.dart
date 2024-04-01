import 'package:blockchain_utils/exception/exceptions.dart';
import 'package:cosmos_sdk/src/protobuf/types/cosmos_enum.dart';

/// State defines if a channel is in one of the following states:
/// CLOSED, INIT, TRYOPEN, OPEN, FLUSHING, FLUSHCOMPLETE or UNINITIALIZED.
class IbcChannelState implements CosmosEnum {
  @override
  final String name;
  @override
  final int value;
  const IbcChannelState(this.name, this.value);

  /// Default State
  static const IbcChannelState uninitializedUnspecified =
      IbcChannelState("uninitializedUnspecified", 0);

  /// A channel has just started the opening handshake.
  static const IbcChannelState init = IbcChannelState("init", 1);

  /// A channel has acknowledged the handshake step on the counterparty chain.
  static const IbcChannelState tryOpen = IbcChannelState("tryOpen", 2);

  /// A channel has completed the handshake. Open channels are
  /// ready to send and receive packets.
  static const IbcChannelState open = IbcChannelState("open", 3);

  /// A channel has been closed and can no longer be used to send or receive
  /// packets.
  static const IbcChannelState closed = IbcChannelState("closed", 4);

  /// A channel has just accepted the upgrade handshake attempt and is flushing in-flight packets.
  static const IbcChannelState flushing = IbcChannelState("flushing", 5);

  /// A channel has just completed flushing any in-flight packets.
  static const IbcChannelState flushComplete =
      IbcChannelState("flushComplete", 6);
  static const List<IbcChannelState> values = [
    uninitializedUnspecified,
    init,
    tryOpen,
    open,
    closed,
    flushComplete,
    flushComplete
  ];
  static IbcChannelState fromValue(int? value) {
    return values.firstWhere(
      (element) => element.value == value,
      orElse: () => throw MessageException(
          "No matching element found for the given value.",
          details: {"value": value}),
    );
  }
}
