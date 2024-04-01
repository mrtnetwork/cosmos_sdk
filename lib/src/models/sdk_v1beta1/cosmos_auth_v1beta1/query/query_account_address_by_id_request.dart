import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/query/query_account_address_by_id_response.dart';

import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/auth_v1beta1_types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryAccountAddressByIDRequest is the request type for AccountAddressByID rpc method
/// Since: cosmos-sdk 0.46.2
class QueryAccountAddressByIDRequest extends CosmosMessage
    with QueryMessage<QueryAccountAddressByIDResponse> {
  /// Deprecated, use account_id instead
  ///
  /// id is the account number of the address to be queried. This field
  /// should have been an uint64 (like all account numbers), and will be
  /// updated to uint64 in a future version of the auth query.
  final BigInt? id;

  /// account_id is the account number of the address to be queried.
  ///
  /// Since: cosmos-sdk 0.47
  final BigInt accountId;
  const QueryAccountAddressByIDRequest({this.id, required this.accountId});
  factory QueryAccountAddressByIDRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryAccountAddressByIDRequest(
        accountId: decode.getField(2), id: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  String get queryPath => AuthV1beta1Types.accountAddressByID.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"id": id, "account_id": accountId};
  }

  @override
  List get values => [id, accountId];

  @override
  String get typeUrl => AuthV1beta1Types.accountAddressByIDRequest.typeUrl;

  @override
  QueryAccountAddressByIDResponse onResponse(List<int> bytes) {
    return QueryAccountAddressByIDResponse.deserialize(bytes);
  }
}
