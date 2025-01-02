import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Fee defines the ICS29 receive, acknowledgement and timeout fees
class IbcFeeFee extends CosmosMessage {
  /// the packet receive fee
  final Coin recvFee;

  /// the packet acknowledgement fee
  final Coin ackFee;

  /// the packet timeout fee
  final Coin timeoutFee;
  factory IbcFeeFee.fromRpc(Map<String, dynamic> json) {
    return IbcFeeFee(
        ackFee: Coin.fromRpc(json["ack_fee"]),
        recvFee: Coin.fromRpc(json["recv_fee"]),
        timeoutFee: Coin.fromRpc(json["timeout_fee"]));
  }
  const IbcFeeFee(
      {required this.recvFee, required this.ackFee, required this.timeoutFee});
  factory IbcFeeFee.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcFeeFee(
        recvFee: Coin.deserialize(decode.getField(1)),
        ackFee: Coin.deserialize(decode.getField(2)),
        timeoutFee: Coin.deserialize(decode.getField(3)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "recv_fee": recvFee.toJson(),
      "ack_fee": ackFee.toJson(),
      "timeout_fee": timeoutFee.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.fee;

  @override
  List get values => [recvFee, ackFee, timeoutFee];
}
