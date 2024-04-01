import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgChannelOpenAck defines a msg sent by a Relayer to Chain A to
/// acknowledge the change of channel state to TRYOPEN on Chain B.
/// WARNING: a channel upgrade MUST NOT initialize an upgrade for
/// this channel in the same block as executing this message otherwise
/// the counterparty will be incapable of opening.
class MsgChannelOpenAck extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  final String? portId;
  final String? channelId;
  final String? counterpartyChannelId;
  final String? counterpartyVersion;
  final List<int>? proofTry;
  final IbcClientHeight proofHeight;
  final String? signer;
  MsgChannelOpenAck(
      {this.portId,
      this.channelId,
      this.counterpartyChannelId,
      this.counterpartyVersion,
      List<int>? proofTry,
      required this.proofHeight,
      this.signer})
      : proofTry = BytesUtils.tryToBytes(proofTry, unmodifiable: true);

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7];

  @override
  String get service => IbcTypes.channelOpenAck.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "port_id": portId,
      "channel_id": channelId,
      "counterparty_channel_id": counterpartyChannelId,
      "counterparty_version": counterpartyVersion,
      "proof_try": BytesUtils.tryToHexString(proofTry),
      "proof_height": proofHeight.toJson(),
      "signer": signer
    };
  }

  @override
  String get typeUrl => IbcTypes.msgChannelOpenAck.typeUrl;

  @override
  List get values => [
        portId,
        channelId,
        counterpartyChannelId,
        counterpartyVersion,
        proofTry,
        proofHeight,
        signer
      ];

  @override
  List<String?> get signers => [signer];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        IbcTypes.msgChannelOpenAckResponse.typeUrl);
  }
}
