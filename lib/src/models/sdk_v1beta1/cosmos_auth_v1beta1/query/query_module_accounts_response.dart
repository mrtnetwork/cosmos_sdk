import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/auth_v1beta1_types.dart';

/// QueryModuleAccountsResponse is the response type for the Query/ModuleAccounts RPC method.
/// Since: cosmos-sdk 0.46
class QueryModuleAccountsResponse extends CosmosMessage {
  final List<Any> accounts;
  const QueryModuleAccountsResponse(this.accounts);
  factory QueryModuleAccountsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryModuleAccountsResponse(
        decode.getFileds<List<int>>(1).map((e) => Any.deserialize(e)).toList());
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"accounts": accounts.map((e) => e.toJson()).toList()};
  }

  @override
  List get values => [accounts];

  @override
  String get typeUrl => AuthV1beta1Types.moduleAccountsResponse.typeUrl;
}
