import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'packet_acknowledgement_response.dart';

/// QueryPacketAcknowledgementRequest is the request type for the Query/PacketAcknowledgement RPC method.
class IbcChannelV2QueryPacketAcknowledgement extends CosmosMessage
    with QueryMessage<IbcChannelV2QueryPacketAcknowledgementResponse> {
  /// client unique identifier
  final String clientId;

  /// packet sequence
  final BigInt sequence;

  const IbcChannelV2QueryPacketAcknowledgement(
      {required this.clientId, required this.sequence});

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"client_id": clientId, "sequence": sequence.toString()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.channelV2QueryPacketAcknowledgementRequest;

  @override
  List get values => [clientId, sequence];

  @override
  IbcChannelV2QueryPacketAcknowledgementResponse onResponse(List<int> bytes) {
    return IbcChannelV2QueryPacketAcknowledgementResponse.deserialize(bytes);
  }

  @override
  IbcChannelV2QueryPacketAcknowledgementResponse onJsonResponse(
      Map<String, dynamic> json) {
    return IbcChannelV2QueryPacketAcknowledgementResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [clientId, sequence.toString()];
}
