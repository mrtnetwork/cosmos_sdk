import 'package:cosmos_sdk/src/models/ibc/ibc_applications_fee_v1/messages/packet_fee.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// PacketFees contains a list of type PacketFee
class PacketFees extends CosmosMessage {
  /// list of packet fees
  final List<IbcFeePacketFee> packetFees;
  PacketFees(List<IbcFeePacketFee> packetFees)
      : packetFees = packetFees.immutable;
  factory PacketFees.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return PacketFees(decode
        .getFields<List<int>>(1)
        .map((e) => IbcFeePacketFee.deserialize(e))
        .toList());
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"packetFees": packetFees.map((e) => e.toJson()).toList()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.packetFees;

  @override
  List get values => [packetFees];
}
