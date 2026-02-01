import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/query/query_connection_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryConnectionRequest is the request type for the Query/Connection RPC method
class IbcConnectionQueryConnectionRequest extends CosmosMessage
    with QueryMessage<IbcConnectionQueryConnectionResponse> {
  /// connection unique identifier
  final String connectionId;
  const IbcConnectionQueryConnectionRequest({required this.connectionId});
  factory IbcConnectionQueryConnectionRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcConnectionQueryConnectionRequest(
      connectionId: decode.getField(1),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"connection_id": connectionId};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.ibcConnectionQueryConnectionRequest;

  @override
  List get values => [connectionId];

  @override
  IbcConnectionQueryConnectionResponse onResponse(List<int> bytes) {
    return IbcConnectionQueryConnectionResponse.deserialize(bytes);
  }

  @override
  IbcConnectionQueryConnectionResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return IbcConnectionQueryConnectionResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [connectionId];
}
