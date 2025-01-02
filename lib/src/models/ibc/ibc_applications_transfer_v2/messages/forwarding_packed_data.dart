import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_applications_transfer_v1/messages/hop.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

// ForwardingPacketData defines a list of port ID, channel ID pairs determining the path
// through which a packet must be forwarded, and the destination memo string to be used in the
// final destination of the tokens.
class ForwardingPacketData extends CosmosMessage {
  /// optional intermediate path through which packet will be forwarded.
  final String? destinationMemo;

  /// the token denomination to be transferred
  final List<IbcTransferV1Hop>? hops;

  ForwardingPacketData({this.destinationMemo, List<IbcTransferV1Hop>? hops})
      : hops = hops?.immutable;
  factory ForwardingPacketData.fromRpc(Map<String, dynamic> json) {
    return ForwardingPacketData(
        destinationMemo: json["destination_memo"],
        hops: (json["hops"] as List?)
            ?.map((e) => IbcTransferV1Hop.fromRpc(e))
            .toList());
  }
  factory ForwardingPacketData.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ForwardingPacketData(
        destinationMemo: decode.getField(1),
        hops: decode
            .getFields<List<int>>(2)
            .map((e) => IbcTransferV1Hop.deserialize(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "destination_memo": destinationMemo,
      "hops": hops?.map((e) => e.toJson()).toList()
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.forwardingPacketData;

  @override
  List get values => [destinationMemo, hops];
}
