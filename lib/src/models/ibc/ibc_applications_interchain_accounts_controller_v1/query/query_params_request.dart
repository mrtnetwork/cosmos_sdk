import 'package:cosmos_sdk/src/models/ibc/ibc_applications_interchain_accounts_controller_v1/query/query_params_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryParamsRequest is the request type for the Query/Params RPC method.
class InterchainAccountsControllerQueryParamsRequest extends CosmosMessage
    with QueryMessage<InterchainAccountsControllerQueryParamsResponse> {
  /// This message has no fields.
  const InterchainAccountsControllerQueryParamsRequest();

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.interchainAccoutsControllerQueryParamsRequest;

  @override
  List get values => [];

  @override
  InterchainAccountsControllerQueryParamsResponse onResponse(List<int> bytes) {
    return InterchainAccountsControllerQueryParamsResponse.deserialize(bytes);
  }

  @override
  InterchainAccountsControllerQueryParamsResponse onJsonResponse(
      Map<String, dynamic> json) {
    return InterchainAccountsControllerQueryParamsResponse.fromRpc(json);
  }
}
