import 'package:cosmos_sdk/src/models/ibc/ibc_applications_interchain_accounts_controller_v1/messages/params.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryParamsResponse is the response type for the Query/Params RPC method.
class InterchainAccountsControllerQueryParamsResponse extends CosmosMessage {
  /// params defines the parameters of the module.
  final InterchainAccountsControllerParams? params;

  /// This message has no fields.
  const InterchainAccountsControllerQueryParamsResponse({this.params});
  factory InterchainAccountsControllerQueryParamsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return InterchainAccountsControllerQueryParamsResponse(
      params: InterchainAccountsControllerParams.fromJson(json["params"]),
    );
  }
  factory InterchainAccountsControllerQueryParamsResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return InterchainAccountsControllerQueryParamsResponse(
      params: decode
          .getResult(1)
          ?.to<InterchainAccountsControllerParams, List<int>>(
            (e) => InterchainAccountsControllerParams.deserialize(e),
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
  TypeUrl get typeUrl =>
      IbcTypes.interchainAccoutsControllerQueryParamsResponse;

  @override
  List get values => [params];
}
