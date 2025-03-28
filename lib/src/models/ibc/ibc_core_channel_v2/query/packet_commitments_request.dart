import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/cosmos_base_query_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'packet_commitments_response.dart';

/// QueryPacketCommitmentsRequest is the request type for the Query/PacketCommitments RPC method.
class IbcChannelV2QueryPacketCommitments extends CosmosMessage
    with QueryMessage<IbcChannelV2QueryPacketCommitmentsResponse> {
  /// client unique identifier
  final String clientId;

  /// pagination request
  final PageRequest? pagination;

  const IbcChannelV2QueryPacketCommitments(
      {required this.clientId, this.pagination});

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"client_id": clientId, "pagination": pagination?.toJson()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.channelV2QueryPacketCommitments;

  @override
  List get values => [clientId, pagination];

  @override
  IbcChannelV2QueryPacketCommitmentsResponse onResponse(List<int> bytes) {
    return IbcChannelV2QueryPacketCommitmentsResponse.deserialize(bytes);
  }

  @override
  IbcChannelV2QueryPacketCommitmentsResponse onJsonResponse(
      Map<String, dynamic> json) {
    return IbcChannelV2QueryPacketCommitmentsResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [clientId];

  @override
  Map<String, String?> get queryParameters =>
      {...pagination?.queryParameters ?? {}};
}
