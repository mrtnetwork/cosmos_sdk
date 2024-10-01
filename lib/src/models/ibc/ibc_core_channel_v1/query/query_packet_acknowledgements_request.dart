import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/query/query_packet_acknowledgements_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// QueryPacketAcknowledgementsRequest is the request type for the Query/QueryPacketCommitments RPC method
class QueryPacketAcknowledgementsRequest extends CosmosMessage
    with QueryMessage<QueryPacketAcknowledgementsResponse> {
  /// port unique identifier
  final String? portId;

  /// channel unique identifier
  final String? channelId;

  /// pagination request
  final PageRequest? pagination;

  /// list of packet sequences
  final List<BigInt>? packetCommitmentSequences;
  QueryPacketAcknowledgementsRequest({
    this.portId,
    this.channelId,
    this.pagination,
    List<BigInt>? packetCommitmentSequences,
  }) : packetCommitmentSequences =
            packetCommitmentSequences?.emptyAsNull?.immutable;
  factory QueryPacketAcknowledgementsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryPacketAcknowledgementsRequest(
        portId: decode.getField(1),
        channelId: decode.getField(2),
        pagination: decode
            .getResult(3)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)),
        packetCommitmentSequences: decode
                .getResult<ProtocolBufferDecoderResult?>(4)
                ?.to<List<BigInt>, List<int>>(
                    (e) => e.map((e) => BigintUtils.parse(e)).toList()) ??
            <BigInt>[]);
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  String get queryPath => IbcTypes.packetAcknowledgements.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "port_id": portId,
      "channel_id": channelId,
      "pagination": pagination?.toJson(),
      "packet_commitment_sequences":
          packetCommitmentSequences?.map((e) => e.toString()).toList(),
    };
  }

  @override
  String get typeUrl => IbcTypes.queryPacketAcknowledgementsRequest.typeUrl;

  @override
  List get values => [portId, channelId, pagination, packetCommitmentSequences];

  @override
  QueryPacketAcknowledgementsResponse onResponse(List<int> bytes) {
    return QueryPacketAcknowledgementsResponse.deserialize(bytes);
  }
}
