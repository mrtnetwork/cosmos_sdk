import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/query/query_connection_client_state_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryConnectionClientStateRequest is the request type for the Query/ConnectionClientState RPC method
class IbcConnectionQueryConnectionClientStateRequest extends CosmosMessage
    with QueryMessage<IbcConnectionQueryConnectionClientStateResponse> {
  /// connection unique identifier
  final String? connectionId;
  const IbcConnectionQueryConnectionClientStateRequest({this.connectionId});
  factory IbcConnectionQueryConnectionClientStateRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcConnectionQueryConnectionClientStateRequest(
        connectionId: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  String get queryPath => IbcTypes.ibcConnectionConnectionClientState.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"connection_id": connectionId};
  }

  @override
  String get typeUrl =>
      IbcTypes.ibcConnectionQueryConnectionClientStateRequest.typeUrl;

  @override
  List get values => [connectionId];
  @override
  IbcConnectionQueryConnectionClientStateResponse onResponse(List<int> bytes) {
    return IbcConnectionQueryConnectionClientStateResponse.deserialize(bytes);
  }
}
