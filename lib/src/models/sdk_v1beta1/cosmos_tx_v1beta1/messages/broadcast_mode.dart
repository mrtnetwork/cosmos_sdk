import 'package:blockchain_utils/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/types/cosmos_enum.dart';

/// BroadcastMode specifies the broadcast mode for the TxService.Broadcast RPC method.
class BroadcastMode implements CosmosEnum {
  /// zero-value for mode ordering
  static const BroadcastMode unspecified = BroadcastMode._(0, "unspecified");

  /// Deprecated: use BROADCAST_MODE_SYNC instead,
  /// BROADCAST_MODE_BLOCK is not supported by the SDK from v0.47.x onwards.
  static const BroadcastMode block = BroadcastMode._(1, "block");

  /// BROADCAST_MODE_SYNC defines a tx broadcasting mode where the client waits
  /// for a CheckTx execution response only.
  static const BroadcastMode sync = BroadcastMode._(2, "sync");

  /// BROADCAST_MODE_ASYNC defines a tx broadcasting mode where the client
  /// returns immediately.
  static const BroadcastMode async = BroadcastMode._(3, "async");

  @override
  final int value;
  @override
  final String name;

  const BroadcastMode._(this.value, this.name);
  static const List<BroadcastMode> values = [unspecified, block, sync, async];

  static BroadcastMode fromValue(int? value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw MessageException(
          "No BroadcastMode element found for the given value.",
          details: {"value": value}),
    );
  }
}
