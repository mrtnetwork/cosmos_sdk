import 'package:cosmos_sdk/src/models/global_messages/unknown_message.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/types.dart';

/// QueryModuleAccountsResponse is the response type for the Query/ModuleAccounts RPC method.
/// Since: cosmos-sdk 0.46
class QueryModuleAccountsResponse extends CosmosMessage {
  final List<AnyMessage> accounts;
  const QueryModuleAccountsResponse(this.accounts);
  factory QueryModuleAccountsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryModuleAccountsResponse(decode
        .getFields<List<int>>(1)
        .map((e) => AnyMessage.deserialize(e))
        .toList());
  }

  factory QueryModuleAccountsResponse.fromRpc(Map<String, dynamic> json) {
    return QueryModuleAccountsResponse(
        (json["accounts"] as List).map((e) => AnyMessage.fromRpc(e)).toList());
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
  TypeUrl get typeUrl => AuthV1beta1Types.moduleAccountsResponse;
}
