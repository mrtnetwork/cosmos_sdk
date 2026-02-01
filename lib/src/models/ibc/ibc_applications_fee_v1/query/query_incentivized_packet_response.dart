import 'package:cosmos_sdk/src/models/ibc/ibc_applications_fee_v1/messages/identified_packet_fees.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryIncentivizedPacketsResponse defines the response type for the IncentivizedPacket rpc
class QueryIncentivizedPacketResponse extends CosmosMessage {
  /// the identified fees for the incentivized packet
  final IbcFeeIdentifiedPacketFees incentivizedPacket;
  const QueryIncentivizedPacketResponse({required this.incentivizedPacket});

  factory QueryIncentivizedPacketResponse.fromJson(Map<String, dynamic> json) {
    return QueryIncentivizedPacketResponse(
      incentivizedPacket: IbcFeeIdentifiedPacketFees.fromJson(
        json["incentivized_packet"],
      ),
    );
  }
  factory QueryIncentivizedPacketResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryIncentivizedPacketResponse(
      incentivizedPacket: IbcFeeIdentifiedPacketFees.deserialize(
        decode.getField(1),
      ),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"incentivized_packet": incentivizedPacket.toJson()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryIncentivizedPacketResponse;

  @override
  List get values => [incentivizedPacket];
}
