import 'package:cosmos_sdk/src/address/address.dart';

import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'query_account_response.dart';

/// QueryAccountResponse is the response type for the Query/Account RPC method.
class QueryAccountRequest extends CosmosMessage
    with QueryMessage<QueryAccountResponse> {
  /// account defines the account of the corresponding address.
  final CosmosBaseAddress address;
  const QueryAccountRequest(this.address);
  factory QueryAccountRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryAccountRequest(CosmosBaseAddress(decode.getField(1)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"address": address.address};
  }

  @override
  List get values => [address.address];

  @override
  TypeUrl get typeUrl => AuthV1beta1Types.queryAccountRequest;

  @override
  QueryAccountResponse onResponse(List<int> bytes) {
    return QueryAccountResponse.deserialize(bytes);
  }

  @override
  QueryAccountResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryAccountResponse.fromJson(json);
  }

  @override
  Map<String, String> get queryParameters => {};

  @override
  List<String> get pathParameters => [address.address];
}
