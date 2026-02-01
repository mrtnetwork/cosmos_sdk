import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'unreceived_acks_response.dart';

/// QueryUnreceivedAcks is the request type for the
/// Query/UnreceivedAcks RPC method
class IbcChannelV2QueryUnreceivedAcksRequest extends CosmosMessage
    with QueryMessage<IbcChannelV2QueryUnreceivedAcksResponse> {
  /// client unique identifier
  final String clientId;

  /// list of acknowledgement sequences
  final List<BigInt> packetAckSequences;

  IbcChannelV2QueryUnreceivedAcksRequest({
    required this.clientId,
    required List<BigInt> packetAckSequences,
  }) : packetAckSequences = packetAckSequences.immutable;

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "client_id": clientId,
      "packet_ack_sequences":
          packetAckSequences.map((e) => e.toString()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.channelV2QueryUnreceivedAcksRequest;

  @override
  List get values => [clientId, packetAckSequences];

  @override
  IbcChannelV2QueryUnreceivedAcksResponse onResponse(List<int> bytes) {
    return IbcChannelV2QueryUnreceivedAcksResponse.deserialize(bytes);
  }

  @override
  IbcChannelV2QueryUnreceivedAcksResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return IbcChannelV2QueryUnreceivedAcksResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [clientId, packetAckSequences.join(",")];
}
