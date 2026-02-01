import 'package:cosmos_sdk/src/models/ibc/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

import 'msg_transfer_response.dart';

/// MsgTransfer defines a msg to transfer fungible tokens (i.e Coins) between ICS20 enabled chains.
/// See ICS Spec here: https://github.com/cosmos/ibc/tree/master/spec/app/ics-020-fungible-token-transfer#data-structures
class MsgTransfer extends IbcService<MsgTransferResponse>
    with AminoMessage<MsgTransferResponse> {
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
  final IbcClientHeight? timeoutHeight;

  /// Timeout timestamp in absolute nanoseconds since unix epoch.
  /// The timeout is disabled when set to 0.
  final BigInt? timeoutTimestamp;

  /// optional memo
  final String? memo;
  const MsgTransfer({
    this.sourcePort,
    this.sourceChannel,
    required this.token,
    this.sender,
    this.receiver,
    this.timeoutHeight,
    this.timeoutTimestamp,
    this.memo,
  });
  factory MsgTransfer.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgTransfer(
      sourcePort: decode.getField(1),
      sourceChannel: decode.getField(2),
      token: Coin.deserialize(decode.getField(3)),
      sender: decode.getField(4),
      receiver: decode.getField(5),
      timeoutHeight: decode
          .getResult(6)
          ?.to<IbcClientHeight, List<int>>(IbcClientHeight.deserialize),
      timeoutTimestamp: decode.getField(7),
      memo: decode.getField(8),
    );
  }
  factory MsgTransfer.fromJson(Map<String, dynamic> json) {
    return MsgTransfer(
      sourcePort: json.as("source_port"),
      sourceChannel: json.as("source_channel"),
      token: Coin.fromJson(json.asMap("token")),
      sender: json.as("sender"),
      receiver: json.as("receiver"),
      timeoutHeight: json.maybeAs<IbcClientHeight, Map<String, dynamic>>(
        key: "timeout_height",
        onValue: IbcClientHeight.fromJson,
      ),
      timeoutTimestamp: json.asBigInt("timeout_timestamp"),
      memo: json.as("memo"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8];

  @override
  Map<String, dynamic> toJson({bool amino = false}) {
    return {
      "source_port": sourcePort,
      "source_channel": sourceChannel,
      "token": token.toJson(),
      "sender": sender,
      "receiver": receiver,
      "timeout_height":
          amino ? (timeoutHeight?.toJson() ?? {}) : timeoutHeight?.toJson(),
      "timeout_timestamp": timeoutTimestamp?.toString(),
      if (!amino) "memo": memo,
    };
  }

  @override
  Map<String, dynamic> toAminoJson() {
    return {
      "type": typeUrl.aminoType!,
      "value": toJson(amino: true)..removeWhere((k, v) => v == null),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.msgTransfer;

  @override
  List get values => [
    sourcePort,
    sourceChannel,
    token,
    sender,
    receiver,
    timeoutHeight,
    timeoutTimestamp,
    memo,
  ];

  @override
  List<String?> get signers => [sender];

  @override
  MsgTransferResponse onResponse(List<int> bytes) {
    return MsgTransferResponse.deserialize(bytes);
  }
}
