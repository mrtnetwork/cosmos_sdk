import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/messages/unbonding_delegation.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// QueryDelegationResponse is response type for the Query/UnbondingDelegation RPC method.
class QueryUnbondingDelegationResponse extends CosmosMessage {
  /// unbond defines the unbonding information of a delegation.
  final UnbondingDelegation unbond;
  const QueryUnbondingDelegationResponse(this.unbond);
  factory QueryUnbondingDelegationResponse.fromJson(Map<String, dynamic> json) {
    return QueryUnbondingDelegationResponse(
        UnbondingDelegation.fromJson(json["unbond"]));
  }
  factory QueryUnbondingDelegationResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryUnbondingDelegationResponse(
        UnbondingDelegation.deserialize(decode.getField(1)));
  }
  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"unbond": unbond.toJson()};
  }

  @override
  TypeUrl get typeUrl => StakingV1beta1Types.queryUnbondingDelegationResponse;

  @override
  List get values => [unbond];
}
