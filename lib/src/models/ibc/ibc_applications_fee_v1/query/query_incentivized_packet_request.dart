import 'package:cosmos_sdk/src/models/ibc/ibc_applications_fee_v1/query/query_incentivized_packet_response.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/packet_id.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryIncentivizedPacketRequest defines the request type for the IncentivizedPacket rpc
class QueryIncentivizedPacketRequest extends CosmosMessage
    with QueryMessage<QueryIncentivizedPacketResponse> {
  /// unique packet identifier comprised of channel ID, port ID and sequence
  final IbcChannelPacketId packetId;

  /// block height at which to query
  final BigInt? queryHeight;
  QueryIncentivizedPacketRequest({required this.packetId, this.queryHeight});
  factory QueryIncentivizedPacketRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryIncentivizedPacketRequest(
        packetId: IbcChannelPacketId.deserialize(decode.getField(1)),
        queryHeight: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  String get queryPath => IbcTypes.incentivizedPacket.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "packet_id": packetId.toJson(),
      "query_height": queryHeight?.toString()
    };
  }

  @override
  String get typeUrl => IbcTypes.queryIncentivizedPacketRequest.typeUrl;

  @override
  List get values => [packetId, queryHeight];
  @override
  QueryIncentivizedPacketResponse onResponse(List<int> bytes) {
    return QueryIncentivizedPacketResponse.deserialize(bytes);
  }
}
