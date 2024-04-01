import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/auth_v1beta1_types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryAccountResponse is the response type for the Query/Account RPC method.
class QueryAccountResponse extends CosmosMessage {
  const QueryAccountResponse(this.account);
  factory QueryAccountResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    final any = Any.deserialize(decode.getField(1));
    return QueryAccountResponse(any);
  }

  /// account defines the account of the corresponding address.
  final Any account;

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"account": account.toJson()};
  }

  @override
  List get values => [account];

  @override
  String get typeUrl => AuthV1beta1Types.queryAccountResponse.typeUrl;
}
