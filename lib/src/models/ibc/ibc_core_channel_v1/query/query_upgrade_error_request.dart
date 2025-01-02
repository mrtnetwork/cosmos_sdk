import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/query/query_upgrade_error_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryUpgradeErrorRequest is the request type for the Query/QueryUpgradeError RPC method
class QueryUpgradeErrorRequest extends CosmosMessage
    with QueryMessage<QueryUpgradeErrorResponse> {
  /// port unique identifier
  final String portId;

  /// channel unique identifier
  final String channelId;
  const QueryUpgradeErrorRequest(
      {required this.portId, required this.channelId});
  factory QueryUpgradeErrorRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryUpgradeErrorRequest(
        portId: decode.getField(1), channelId: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"port_id": portId, "channel_id": channelId};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryUpgradeErrorRequest;

  @override
  List get values => [portId, channelId];

  @override
  QueryUpgradeErrorResponse onResponse(List<int> bytes) {
    return QueryUpgradeErrorResponse.deserialize(bytes);
  }

  @override
  QueryUpgradeErrorResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryUpgradeErrorResponse.fromRpc(json);
  }

  @override
  List<String> get pathParameters => [channelId, portId];
}
