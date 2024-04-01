import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'msg_prune_acknowledgements_response.dart';

/// MsgPruneAcknowledgements defines the request type for the PruneAcknowledgements rpc.
class MsgPruneAcknowledgements extends CosmosMessage
    with ServiceMessage<MsgPruneAcknowledgementsResponse> {
  final String? portId;
  final String? channelId;
  final BigInt? limit;
  final String? signer;
  const MsgPruneAcknowledgements(
      {this.portId, this.channelId, this.limit, this.signer});
  factory MsgPruneAcknowledgements.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgPruneAcknowledgements(
        portId: decode.getField(1),
        channelId: decode.getField(2),
        limit: decode.getField(3),
        signer: decode.getField(4));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  String get service => IbcTypes.pruneAcknowledgements.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "port_id": portId,
      "channel_id": channelId,
      "limit": limit?.toString(),
      "signer": signer
    };
  }

  @override
  String get typeUrl => IbcTypes.msgPruneAcknowledgements.typeUrl;

  @override
  List get values => [portId, channelId, limit, signer];

  @override
  List<String?> get signers => [signer];
  @override
  MsgPruneAcknowledgementsResponse onResponse(List<int> bytes) {
    return MsgPruneAcknowledgementsResponse.deserialize(bytes);
  }
}
