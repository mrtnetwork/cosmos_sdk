import 'package:cosmos_sdk/src/models/global_messages/unknown_message.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryModuleAccountByNameResponse is the response type for the Query/ModuleAccountByName RPC method.
class QueryModuleAccountByNameResponse extends CosmosMessage {
  final AnyMessage account;
  QueryModuleAccountByNameResponse(this.account);
  factory QueryModuleAccountByNameResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryModuleAccountByNameResponse(
        AnyMessage.deserialize(decode.getField(1)));
  }

  factory QueryModuleAccountByNameResponse.fromRpc(Map<String, dynamic> json) {
    return QueryModuleAccountByNameResponse(
        AnyMessage.fromRpc(json["account"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"account": account.toJson()};
  }

  @override
  List get values => [account];

  @override
  TypeUrl get typeUrl => AuthV1beta1Types.moduleAccountByNameResponse;
}
