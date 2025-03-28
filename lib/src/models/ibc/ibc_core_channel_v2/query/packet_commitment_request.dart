import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'packet_commitment_response.dart';

/// QueryPacketCommitmentRequest is the request type for the Query/PacketCommitment RPC method.
class IbcChannelV2QueryPacketCommitment extends CosmosMessage
    with QueryMessage<IbcChannelV2QueryPacketCommitmentResponse> {
  /// client unique identifier
  final String clientId;

  /// packet sequence
  final BigInt sequence;

  const IbcChannelV2QueryPacketCommitment(
      {required this.clientId, required this.sequence});

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"client_id": clientId, "sequence": sequence.toString()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.channelV2QueryPacketCommitment;

  @override
  List get values => [clientId, sequence];

  @override
  IbcChannelV2QueryPacketCommitmentResponse onResponse(List<int> bytes) {
    return IbcChannelV2QueryPacketCommitmentResponse.deserialize(bytes);
  }

  @override
  IbcChannelV2QueryPacketCommitmentResponse onJsonResponse(
      Map<String, dynamic> json) {
    return IbcChannelV2QueryPacketCommitmentResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [clientId, sequence.toString()];
}
