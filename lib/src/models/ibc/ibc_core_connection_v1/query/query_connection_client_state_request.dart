import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/query/query_connection_client_state_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryConnectionClientStateRequest is the request type for the Query/ConnectionClientState RPC method
class IbcConnectionQueryConnectionClientStateRequest extends CosmosMessage
    with QueryMessage<IbcConnectionQueryConnectionClientStateResponse> {
  /// connection unique identifier
  final String connectionId;
  const IbcConnectionQueryConnectionClientStateRequest(
      {required this.connectionId});
  factory IbcConnectionQueryConnectionClientStateRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcConnectionQueryConnectionClientStateRequest(
        connectionId: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"connection_id": connectionId};
  }

  @override
  TypeUrl get typeUrl =>
      IbcTypes.ibcConnectionQueryConnectionClientStateRequest;

  @override
  List get values => [connectionId];
  @override
  IbcConnectionQueryConnectionClientStateResponse onResponse(List<int> bytes) {
    return IbcConnectionQueryConnectionClientStateResponse.deserialize(bytes);
  }

  @override
  IbcConnectionQueryConnectionClientStateResponse onJsonResponse(
      Map<String, dynamic> json) {
    return IbcConnectionQueryConnectionClientStateResponse.fromRpc(json);
  }

  @override
  List<String> get pathParameters => [connectionId];
}
