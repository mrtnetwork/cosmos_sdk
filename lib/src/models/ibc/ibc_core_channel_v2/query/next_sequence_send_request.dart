import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'next_sequence_send_response.dart';

/// QueryNextSequenceSendRequest is the request type for the Query/QueryNextSequenceSend RPC method
class IbcChannelV2QueryNextSequenceSend extends CosmosMessage
    with QueryMessage<IbcChannelV2QueryNextSequenceSendResponse> {
  /// client unique identifier
  final String clientId;

  const IbcChannelV2QueryNextSequenceSend({required this.clientId});

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"client_id": clientId};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.channelV2QueryNextSequenceSend;

  @override
  List get values => [clientId];

  @override
  IbcChannelV2QueryNextSequenceSendResponse onResponse(List<int> bytes) {
    return IbcChannelV2QueryNextSequenceSendResponse.deserialize(bytes);
  }

  @override
  IbcChannelV2QueryNextSequenceSendResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return IbcChannelV2QueryNextSequenceSendResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [clientId];
}
