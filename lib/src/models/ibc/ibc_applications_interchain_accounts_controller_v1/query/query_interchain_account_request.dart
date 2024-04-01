import 'package:cosmos_sdk/src/models/ibc/ibc_applications_interchain_accounts_controller_v1/query/query_interchain_account_response.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryInterchainAccountRequest is the request type for the Query/InterchainAccount RPC method.
class QueryInterchainAccountRequest extends CosmosMessage
    with QueryMessage<QueryInterchainAccountResponse> {
  final String? owner;
  final String? connectionId;
  const QueryInterchainAccountRequest({this.owner, this.connectionId});
  factory QueryInterchainAccountRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryInterchainAccountRequest(
        owner: decode.getField(1), connectionId: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"owner": owner, "connection_id": connectionId};
  }

  @override
  String get typeUrl => IbcTypes.queryInterchainAccountRequest.typeUrl;

  @override
  List get values => [owner, connectionId];

  @override
  String get queryPath => IbcTypes.queryInterchainAccount.typeUrl;

  @override
  QueryInterchainAccountResponse onResponse(List<int> bytes) {
    return QueryInterchainAccountResponse.deserialize(bytes);
  }
}
