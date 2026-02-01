import 'package:cosmos_sdk/src/models/ibc/core/service.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_applications_fee_v1/messages/packet_fee.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/packet_id.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgPayPacketFeeAsync defines the request type for the PayPacketFeeAsync
/// rpc This Msg can be used to pay for a packet at a specified sequence (instead of the next sequence send)
class MsgPayPacketFeeAsync extends IbcService<EmptyServiceRequestResponse> {
  /// unique packet identifier comprised of the channel ID, port ID and sequence
  final IbcChannelPacketId packetId;

  /// the packet fee associated with a particular IBC packet
  final IbcFeePacketFee packetFee;
  const MsgPayPacketFeeAsync({required this.packetId, required this.packetFee});

  factory MsgPayPacketFeeAsync.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgPayPacketFeeAsync(
      packetId: IbcChannelPacketId.deserialize(decode.getField(1)),
      packetFee: IbcFeePacketFee.deserialize(decode.getField(2)),
    );
  }
  factory MsgPayPacketFeeAsync.fromJson(Map<String, dynamic> json) {
    return MsgPayPacketFeeAsync(
      packetId: IbcChannelPacketId.fromJson(json.asMap("packet_id")),
      packetFee: IbcFeePacketFee.fromJson(json.asMap("packet_fee")),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"packet_id": packetId.toJson(), "packet_fee": packetFee.toJson()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.msgPayPacketFeeAsync;

  @override
  List get values => [packetId, packetFee];
  @override
  List<String?> get signers => [packetFee.refundAddress];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(IbcTypes.msgPayPacketFeeAsyncResponse);
  }
}
