import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Timeout defines an execution deadline structure for 04-channel handlers.
/// This includes packet lifecycle handlers as well as the upgrade handshake
/// handlers. A valid Timeout contains either one or both of a timestamp and block height (sequence).
class IbcChannelTimeout extends CosmosMessage {
  /// block height after which the packet or upgrade times out
  final IbcClientHeight height;

  /// block timestamp (in nanoseconds) after which the packet or upgrade times out
  final BigInt? timestamp;
  const IbcChannelTimeout({required this.height, this.timestamp});
  factory IbcChannelTimeout.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcChannelTimeout(
        height: IbcClientHeight.deserialize(decode.getField(1)),
        timestamp: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"height": height.toJson(), "timestamp": timestamp?.toString()};
  }

  @override
  String get typeUrl => IbcTypes.timeout.typeUrl;

  @override
  List get values => [height, timestamp];
}
