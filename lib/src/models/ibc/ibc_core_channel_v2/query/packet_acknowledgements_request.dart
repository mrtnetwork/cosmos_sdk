import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/cosmos_base_query_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'packet_acknowledgements_response.dart';

/// QueryPacketAcknowledgementsRequest is the request type for the
/// Query/QueryPacketCommitments RPC method
class IbcChannelV2QueryPacketAcknowledgements extends CosmosMessage
    with QueryMessage<IbcChannelV2QueryPacketAcknowledgementsResponse> {
  /// client unique identifier
  final String clientId;

  /// pagination request
  final PageRequest? pagination;

  /// list of packet sequences
  final List<BigInt>? packetCommitmentSequences;

  IbcChannelV2QueryPacketAcknowledgements({
    required this.clientId,
    this.pagination,
    List<BigInt>? packetCommitmentSequences,
  }) : packetCommitmentSequences = packetCommitmentSequences?.immutable;

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "client_id": clientId,
      "pagination": pagination?.toJson(),
      "packet_commitment_sequences":
          packetCommitmentSequences?.map((e) => e.toString()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.channelV2QueryPacketAcknowledgements;

  @override
  List get values => [clientId, pagination, packetCommitmentSequences];

  @override
  IbcChannelV2QueryPacketAcknowledgementsResponse onResponse(List<int> bytes) {
    return IbcChannelV2QueryPacketAcknowledgementsResponse.deserialize(bytes);
  }

  @override
  IbcChannelV2QueryPacketAcknowledgementsResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return IbcChannelV2QueryPacketAcknowledgementsResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [clientId];

  @override
  Map<String, String?> get queryParameters => {
    ...pagination?.queryParameters ?? {},
    "packet_commitment_sequences": packetCommitmentSequences?.join(","),
  };
}
