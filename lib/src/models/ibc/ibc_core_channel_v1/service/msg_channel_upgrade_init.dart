import 'package:cosmos_sdk/src/models/ibc/core/service.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/upgrade_fields.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

import 'msg_channel_upgrade_init_response.dart';

/// MsgChannelUpgradeInit defines the request type for the ChannelUpgradeInit rpc WARNING: Initializing a channel upgrade in the
/// same block as opening the channel may result in the counterparty being incapable of opening.
class MsgChannelUpgradeInit extends IbcService<MsgChannelUpgradeInitResponse> {
  final String? portId;
  final String? channelId;
  final UpgradeFields fields;
  final String? signer;
  const MsgChannelUpgradeInit(
      {this.portId, this.channelId, required this.fields, this.signer});
  factory MsgChannelUpgradeInit.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgChannelUpgradeInit(
        portId: decode.getField(1),
        channelId: decode.getField(2),
        fields: UpgradeFields.deserialize(decode.getField(3)),
        signer: decode.getField(4));
  }
  factory MsgChannelUpgradeInit.fromJson(Map<String, dynamic> json) {
    return MsgChannelUpgradeInit(
        portId: json.as("port_id"),
        channelId: json.as("channel_id"),
        fields: UpgradeFields.fromJson(json.asMap("fields")),
        signer: json.as("signer"));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "port_id": portId,
      "channel_id": channelId,
      "fields": fields.toJson(),
      "signer": signer,
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.msgChannelUpgradeInit;

  @override
  List get values => [portId, channelId, fields, signer];
  @override
  List<String?> get signers => [signer];
  @override
  MsgChannelUpgradeInitResponse onResponse(List<int> bytes) {
    return MsgChannelUpgradeInitResponse.deserialize(bytes);
  }
}
