import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'packet_receipt_response.dart';

/// QueryPacketReceiptRequest is the request type for the Query/PacketReceipt RPC method.
class IbcChannelV2QueryPacketReceiptRequest extends CosmosMessage
    with QueryMessage<IbcChannelV2QueryPacketReceiptResponse> {
  /// client unique identifier
  final String clientId;

  /// packet sequence
  final BigInt sequence;

  const IbcChannelV2QueryPacketReceiptRequest(
      {required this.clientId, required this.sequence});

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"client_id": clientId, "sequence": sequence.toString()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.channelV2QueryPacketReceipt;

  @override
  List get values => [clientId, sequence];

  @override
  IbcChannelV2QueryPacketReceiptResponse onResponse(List<int> bytes) {
    return IbcChannelV2QueryPacketReceiptResponse.deserialize(bytes);
  }

  @override
  IbcChannelV2QueryPacketReceiptResponse onJsonResponse(
      Map<String, dynamic> json) {
    return IbcChannelV2QueryPacketReceiptResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [clientId, sequence.toString()];
}
