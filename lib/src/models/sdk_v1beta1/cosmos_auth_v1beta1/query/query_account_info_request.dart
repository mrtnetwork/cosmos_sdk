import 'package:cosmos_sdk/src/address/address.dart';

import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'query_account_info_response.dart';

/// QueryAccountInfoRequest is the Query/AccountInfo request type.
/// Since: cosmos-sdk 0.47
class QueryAccountInfoRequest extends CosmosMessage
    with QueryMessage<QueryAccountInfoResponse> {
  /// address is the account address.
  final CosmosBaseAddress address;
  const QueryAccountInfoRequest(this.address);
  factory QueryAccountInfoRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryAccountInfoRequest(CosmosBaseAddress(decode.getField(1)));
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
  TypeUrl get typeUrl => AuthV1beta1Types.accountInfoRequest;

  @override
  QueryAccountInfoResponse onResponse(List<int> bytes) {
    return QueryAccountInfoResponse.deserialize(bytes);
  }

  @override
  QueryAccountInfoResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryAccountInfoResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [address.address];
}
