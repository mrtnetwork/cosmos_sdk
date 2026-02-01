import 'package:cosmos_sdk/src/models/ibc/ibc_applications_fee_v1/messages/packet_fee.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/packet_id.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// IdentifiedPacketFees contains a list of type PacketFee and associated PacketId
class IbcFeeIdentifiedPacketFees extends CosmosMessage {
  /// unique packet identifier comprised of the channel ID, port ID and sequence
  final IbcChannelPacketId packetId;

  /// list of packet fees
  final List<IbcFeePacketFee> packetFees;

  factory IbcFeeIdentifiedPacketFees.fromJson(Map<String, dynamic> json) {
    return IbcFeeIdentifiedPacketFees(
      packetId: IbcChannelPacketId.fromJson(json["packet_id"]),
      packetFees:
          (json["packet_fees"] as List?)
              ?.map((e) => IbcFeePacketFee.fromJson(e))
              .toList() ??
          [],
    );
  }
  IbcFeeIdentifiedPacketFees({
    required this.packetId,
    required List<IbcFeePacketFee> packetFees,
  }) : packetFees = packetFees.immutable;
  factory IbcFeeIdentifiedPacketFees.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcFeeIdentifiedPacketFees(
      packetId: IbcChannelPacketId.deserialize(decode.getField(1)),
      packetFees:
          decode
              .getFields<List<int>>(2)
              .map((e) => IbcFeePacketFee.deserialize(e))
              .toList(),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "packet_id": packetId.toJson(),
      "packet_fees": packetFees.map((e) => e.toJson()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.identifiedPacketFees;

  @override
  List get values => [packetId, packetFees];
}
