import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'unreceived_packets_response.dart';

/// QueryUnreceivedPacketsRequest is the request type for the Query/UnreceivedPackets RPC method
class IbcChannelV2QueryUnreceivedPacketsRequest extends CosmosMessage
    with QueryMessage<IbcChannelV2QueryUnreceivedPacketsResponse> {
  /// client unique identifier
  final String clientId;

  /// list of packet sequences
  final List<BigInt> sequences;

  IbcChannelV2QueryUnreceivedPacketsRequest({
    required this.clientId,
    required List<BigInt> sequences,
  }) : sequences = sequences.immutable;

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "client_id": clientId,
      "sequences": sequences.map((e) => e.toString()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.channelV2QueryUnreceivedPacketsRequest;

  @override
  List get values => [clientId, sequences];

  @override
  IbcChannelV2QueryUnreceivedPacketsResponse onResponse(List<int> bytes) {
    return IbcChannelV2QueryUnreceivedPacketsResponse.deserialize(bytes);
  }

  @override
  IbcChannelV2QueryUnreceivedPacketsResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return IbcChannelV2QueryUnreceivedPacketsResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [clientId, sequences.join(",")];
}
