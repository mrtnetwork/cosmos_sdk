import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_ibchooks/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_ibchooks/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

import 'msg_emit_ibc_ack_response.dart';

class OsmosisIbchooksMsgEmitIBCAck
    extends OsmosisIbchooks<OsmosisIbchooksMsgEmitIBCAckResponse> {
  final String? sender;
  final BigInt? packetSequence;
  final String? channel;
  const OsmosisIbchooksMsgEmitIBCAck(
      {this.sender, this.packetSequence, this.channel});
  factory OsmosisIbchooksMsgEmitIBCAck.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisIbchooksMsgEmitIBCAck(
        sender: decode.getField(1),
        packetSequence: decode.getField(2),
        channel: decode.getField(3));
  }
  factory OsmosisIbchooksMsgEmitIBCAck.fromJson(Map<String, dynamic> json) {
    return OsmosisIbchooksMsgEmitIBCAck(
        sender: json.as("sender"),
        packetSequence: json.asBigInt("packet_sequence"),
        channel: json.as("channel"));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  OsmosisIbchooksMsgEmitIBCAckResponse onResponse(List<int> bytes) {
    return OsmosisIbchooksMsgEmitIBCAckResponse.deserialize(bytes);
  }

  @override
  List<String?> get signers => [sender];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "packet_sequence": packetSequence?.toString(),
      "channel": channel
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisIbchooksTypes.msgEmitIBCAck;

  @override
  List get values => [sender, packetSequence, channel];
}
