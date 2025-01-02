import 'package:cosmos_sdk/src/models/ibc/ibc_applications_interchain_accounts_host_v1/query/query_params_response.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryParamsRequest is the request type for the Query/Params RPC method.
class InterchainAccountsHostQueryParamsRequest extends CosmosMessage
    with QueryMessage<InterchainAccountsHostQueryParamsResponse> {
  ///  This message has no fields.
  const InterchainAccountsHostQueryParamsRequest();
  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.interchainAccountsHostQueryParamsRequest;

  @override
  List get values => [];

  @override
  InterchainAccountsHostQueryParamsResponse onResponse(List<int> bytes) {
    return InterchainAccountsHostQueryParamsResponse.deserialize(bytes);
  }

  @override
  InterchainAccountsHostQueryParamsResponse onJsonResponse(
      Map<String, dynamic> json) {
    return InterchainAccountsHostQueryParamsResponse.fromRpc(json);
  }
}
