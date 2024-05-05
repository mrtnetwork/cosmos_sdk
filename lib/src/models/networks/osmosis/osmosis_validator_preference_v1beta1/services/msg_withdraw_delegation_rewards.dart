import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_validator_preference_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// WithdrawDelegationRewards allows users to claim rewards from the validator-set.
class OsmosisValidatorPreferenceMsgWithdrawDelegationRewards
    extends CosmosMessage with ServiceMessage<EmptyServiceRequestResponse> {
  /// delegator is the user who is trying to claim staking rewards.
  final String? delegator;

  const OsmosisValidatorPreferenceMsgWithdrawDelegationRewards(
      {this.delegator});
  factory OsmosisValidatorPreferenceMsgWithdrawDelegationRewards.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisValidatorPreferenceMsgWithdrawDelegationRewards(
        delegator: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"delegator": delegator};
  }

  @override
  String get typeUrl => OsmosisValidatorPreferenceV1beta1Types
      .msgWithdrawDelegationRewards.typeUrl;

  @override
  List get values => [delegator];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(OsmosisValidatorPreferenceV1beta1Types
        .msgWithdrawDelegationRewardsResponse.typeUrl);
  }

  @override
  String get service =>
      OsmosisValidatorPreferenceV1beta1Types.withdrawDelegationRewards.typeUrl;

  @override
  List<String?> get signers => [delegator];
}
