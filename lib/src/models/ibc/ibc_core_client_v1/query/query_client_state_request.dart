import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/query/query_client_state_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryClientStateRequest is the request type for the Query/ClientState RPC method
class IbcClientQueryClientStateRequest extends CosmosMessage
    with QueryMessage<IbcClientQueryClientStateResponse> {
  /// client state unique identifier
  final String? clientId;
  const IbcClientQueryClientStateRequest({this.clientId});
  factory IbcClientQueryClientStateRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcClientQueryClientStateRequest(clientId: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  String get queryPath => IbcTypes.clientState.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"client_id": clientId};
  }

  @override
  String get typeUrl => IbcTypes.queryClientStateRequest.typeUrl;

  @override
  List get values => [clientId];

  @override
  IbcClientQueryClientStateResponse onResponse(List<int> bytes) {
    return IbcClientQueryClientStateResponse.deserialize(bytes);
  }
}
