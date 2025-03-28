import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'query_counterpartynfo_response.dart';

/// QueryCounterpartyInfoRequest is the request type for the Query/CounterpartyInfo RPC
/// method
class IbcClientV2QueryCounterpartyInfoRequest extends CosmosMessage
    with QueryMessage<IbcClientV2QueryCounterpartyInfoResponse> {
  /// client state unique identifier
  final String clientId;
  IbcClientV2QueryCounterpartyInfoRequest({required this.clientId});
  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"client_id": clientId};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.clientV2QueryCounterpartyInfoRequest;

  @override
  List get values => [clientId];

  @override
  IbcClientV2QueryCounterpartyInfoResponse onResponse(List<int> bytes) {
    return IbcClientV2QueryCounterpartyInfoResponse.deserialize(bytes);
  }

  @override
  IbcClientV2QueryCounterpartyInfoResponse onJsonResponse(
      Map<String, dynamic> json) {
    return IbcClientV2QueryCounterpartyInfoResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [clientId];
}
