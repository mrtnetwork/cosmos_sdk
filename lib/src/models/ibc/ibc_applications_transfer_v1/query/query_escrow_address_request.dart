import 'package:cosmos_sdk/src/models/ibc/ibc_applications_transfer_v1/query/query_escrow_address_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryEscrowAddressRequest is the request type for the EscrowAddress RPC method.
class QueryEscrowAddressRequest extends CosmosMessage
    with QueryMessage<QueryEscrowAddressResponse> {
  /// unique port identifier
  final String portId;

  /// unique channel identifier
  final String channelId;
  const QueryEscrowAddressRequest({
    required this.portId,
    required this.channelId,
  });
  factory QueryEscrowAddressRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryEscrowAddressRequest(
      portId: decode.getField(1),
      channelId: decode.getField(2),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"port_id": portId, "channel_id": channelId};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryEscrowAddressRequest;

  @override
  List get values => [portId, channelId];

  @override
  QueryEscrowAddressResponse onResponse(List<int> bytes) {
    return QueryEscrowAddressResponse.deserialize(bytes);
  }

  @override
  QueryEscrowAddressResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryEscrowAddressResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [channelId, portId];
}
