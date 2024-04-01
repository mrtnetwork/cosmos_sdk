import 'package:cosmos_sdk/src/address/address.dart';

import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/auth_v1beta1_types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'query_account_response.dart';

/// QueryAccountResponse is the response type for the Query/Account RPC method.
class QueryAccountRequest extends CosmosMessage
    with QueryMessage<QueryAccountResponse> {
  /// account defines the account of the corresponding address.
  final BaseAddress address;
  const QueryAccountRequest(this.address);
  factory QueryAccountRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryAccountRequest(BaseAddress(decode.getField(1)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  String get queryPath => AuthV1beta1Types.account.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"address": address.address};
  }

  @override
  List get values => [address.address];

  @override
  String get typeUrl => AuthV1beta1Types.queryAccountRequest.typeUrl;

  @override
  QueryAccountResponse onResponse(List<int> bytes) {
    return QueryAccountResponse.deserialize(bytes);
  }
}
