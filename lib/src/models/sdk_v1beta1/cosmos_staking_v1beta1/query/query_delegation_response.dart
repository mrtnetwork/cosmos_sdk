import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/messages/delegation_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// QueryDelegationResponse is response type for the Query/Delegation RPC method.
class QueryDelegationResponse extends CosmosMessage {
  /// delegation_responses defines the delegation info of a delegation.
  final DelegationResponse? delegationResponse;
  const QueryDelegationResponse({this.delegationResponse});
  factory QueryDelegationResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryDelegationResponse(
        delegationResponse: decode
            .getResult(1)
            ?.to<DelegationResponse, List<int>>(
                (e) => DelegationResponse.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"delegation_response": delegationResponse?.toJson()};
  }

  @override
  String get typeUrl => StakingV1beta1Types.queryDelegationResponse.typeUrl;

  @override
  List get values => [delegationResponse];
}
