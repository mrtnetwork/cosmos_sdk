import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/query/query_upgrade_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryUpgradeRequest is the request type for the QueryUpgradeRequest RPC method
class QueryUpgradeRequest extends CosmosMessage
    with QueryMessage<QueryUpgradeResponse> {
  /// port unique identifier
  final String portId;

  /// channel unique identifier
  final String channelId;
  const QueryUpgradeRequest({required this.portId, required this.channelId});
  factory QueryUpgradeRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryUpgradeRequest(
        portId: decode.getField(1), channelId: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"port_id": portId, "channel_id": channelId};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryUpgradeRequest;

  @override
  List get values => [portId, channelId];

  @override
  QueryUpgradeResponse onResponse(List<int> bytes) {
    return QueryUpgradeResponse.deserialize(bytes);
  }

  @override
  QueryUpgradeResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryUpgradeResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [channelId, portId];
}
