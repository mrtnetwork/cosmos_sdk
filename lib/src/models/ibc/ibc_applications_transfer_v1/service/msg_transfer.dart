import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'msg_transfer_response.dart';

/// MsgTransfer defines a msg to transfer fungible tokens (i.e Coins) between ICS20 enabled chains.
/// See ICS Spec here: https://github.com/cosmos/ibc/tree/master/spec/app/ics-020-fungible-token-transfer#data-structures
class MsgTransfer extends CosmosMessage
    with ServiceMessage<MsgTransferResponse> {
  /// the port on which the packet will be sent
  final String? sourcePort;

  /// the channel by which the packet will be sent
  final String? sourceChannel;

  /// the tokens to be transferred
  final Coin token;

  /// the sender address
  final String? sender;

  /// the recipient address on the destination chain
  final String? receiver;

  /// Timeout height relative to the current block height.
  /// The timeout is disabled when set to 0.
  final IbcClientHeight timeoutHeight;

  /// Timeout timestamp in absolute nanoseconds since unix epoch.
  /// The timeout is disabled when set to 0.
  final BigInt? timeoutTimestamp;

  /// optional memo
  final String? memo;
  const MsgTransfer(
      {this.sourcePort,
      this.sourceChannel,
      required this.token,
      this.sender,
      this.receiver,
      required this.timeoutHeight,
      this.timeoutTimestamp,
      this.memo});
  factory MsgTransfer.fromByte(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgTransfer(
        sourcePort: decode.getField(1),
        sourceChannel: decode.getField(2),
        token: Coin.deserialize(decode.getField(3)),
        sender: decode.getField(4),
        receiver: decode.getField(5),
        timeoutHeight: IbcClientHeight.deserialize(decode.getField(6)),
        timeoutTimestamp: decode.getField(7),
        memo: decode.getField(8));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8];

  @override
  String get service => IbcTypes.transfer.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "source_port": sourcePort,
      "source_channel": sourceChannel,
      "token": token.toJson(),
      "sender": sender,
      "receiver": receiver,
      "timeout_height": timeoutHeight.toJson(),
      "timeout_timestamp": timeoutTimestamp?.toString(),
      "memo": memo
    };
  }

  @override
  String get typeUrl => IbcTypes.msgTransfer.typeUrl;

  @override
  List get values => [
        sourcePort,
        sourceChannel,
        token,
        sender,
        receiver,
        timeoutHeight,
        timeoutTimestamp,
        memo
      ];

  @override
  List<String?> get signers => [sender];

  @override
  MsgTransferResponse onResponse(List<int> bytes) {
    return MsgTransferResponse.deserialize(bytes);
  }
}
