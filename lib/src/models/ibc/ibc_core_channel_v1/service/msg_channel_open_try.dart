import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/core/service.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/channel.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

import 'msg_channel_open_try_response.dart';

/// MsgChannelOpenInit defines a msg sent by a Relayer to try to open a channel on Chain B.
/// The version field within the Channel field has been deprecated. Its value will be ignored by core IBC.
class MsgChannelOpenTry extends IbcService<MsgChannelOpenTryResponse> {
  final String? portId;

  /// Deprecated: this field is unused. Crossing hello's are no longer supported in core IBC.
  final String? previousChannelId;

  /// NOTE: the version field within the channel has been deprecated. Its value will be ignored by core IBC.
  final IbcChannelChannel channel;
  final String? counterpartyVersion;
  final List<int>? proofInit;
  final IbcClientHeight height;
  final String? signer;
  MsgChannelOpenTry(
      {this.portId,
      this.previousChannelId,
      required this.channel,
      this.counterpartyVersion,
      List<int>? proofInit,
      required this.height,
      this.signer})
      : proofInit = BytesUtils.tryToBytes(proofInit, unmodifiable: true);
  factory MsgChannelOpenTry.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgChannelOpenTry(
      portId: decode.getField(1),
      previousChannelId: decode.getField(2),
      channel: IbcChannelChannel.deserialize(decode.getField(3)),
      counterpartyVersion: decode.getField(4),
      proofInit: decode.getField(5),
      height: IbcClientHeight.deserialize(decode.getField(6)),
      signer: decode.getField(7),
    );
  }
  factory MsgChannelOpenTry.fromJson(Map<String, dynamic> json) {
    return MsgChannelOpenTry(
      portId: json.as("port_id"),
      previousChannelId: json.as("previous_channel_id"),
      channel: IbcChannelChannel.fromJson(json.asMap("channel")),
      counterpartyVersion: json.as("counterparty_version"),
      proofInit: json.asBytes("proof_init"),
      height: IbcClientHeight.fromJson(json.asMap("proof_height")),
      signer: json.as("signer"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7];

  @override
  Map<String, dynamic> toJson() {
    return {
      "port_id": portId,
      "previous_channel_id": previousChannelId,
      "channel": channel.toJson(),
      "counterparty_version": counterpartyVersion,
      "proof_init": BytesUtils.tryToHexString(proofInit),
      "proof_height": height.toJson(),
      "signer": signer,
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.msgChannelOpenTry;

  @override
  List get values => [
        portId,
        previousChannelId,
        channel,
        counterpartyVersion,
        proofInit,
        height,
        signer
      ];

  @override
  List<String?> get signers => [signer];

  @override
  MsgChannelOpenTryResponse onResponse(List<int> bytes) {
    return MsgChannelOpenTryResponse.deserialize(bytes);
  }
}
