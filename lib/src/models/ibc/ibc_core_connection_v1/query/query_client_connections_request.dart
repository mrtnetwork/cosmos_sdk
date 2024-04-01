import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/query/query_client_connections_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryConnectionRequest is the request type for the Query/Connection RPC method
class IbcConnectionQueryClientConnectionsRequest extends CosmosMessage
    with QueryMessage<IbcConnectionQueryClientConnectionsResponse> {
  /// client identifier associated with a connection
  final String? clientId;
  const IbcConnectionQueryClientConnectionsRequest({this.clientId});
  factory IbcConnectionQueryClientConnectionsRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcConnectionQueryClientConnectionsRequest(
        clientId: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  String get queryPath => IbcTypes.ibcConnectionClientConnections.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"client_id": clientId};
  }

  @override
  String get typeUrl =>
      IbcTypes.ibcConnectionQueryClientConnectionsRequest.typeUrl;

  @override
  List get values => [clientId];

  @override
  IbcConnectionQueryClientConnectionsResponse onResponse(List<int> bytes) {
    return IbcConnectionQueryClientConnectionsResponse.deserialize(bytes);
  }
}
