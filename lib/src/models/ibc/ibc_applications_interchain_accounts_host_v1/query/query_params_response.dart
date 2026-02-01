import 'package:cosmos_sdk/src/models/ibc/ibc_applications_interchain_accounts_host_v1/messages/params.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryParamsResponse is the response type for the Query/Params RPC method.
class InterchainAccountsHostQueryParamsResponse extends CosmosMessage {
  /// params defines the parameters of the module.
  final InterchainAccountsHostParams? params;

  const InterchainAccountsHostQueryParamsResponse({this.params});
  factory InterchainAccountsHostQueryParamsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return InterchainAccountsHostQueryParamsResponse(
      params:
          json["params"] == null
              ? null
              : InterchainAccountsHostParams.fromJson(json["params"]),
    );
  }
  factory InterchainAccountsHostQueryParamsResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return InterchainAccountsHostQueryParamsResponse(
      params: decode
          .getResult(1)
          ?.to<InterchainAccountsHostParams, List<int>>(
            (e) => InterchainAccountsHostParams.deserialize(e),
          ),
    );
  }
  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"params": params?.toJson()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.interchainAccountsHostQueryParamsResponse;

  @override
  List get values => [params];
}
