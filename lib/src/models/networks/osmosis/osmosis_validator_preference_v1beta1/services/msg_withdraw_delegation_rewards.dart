import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_validator_preference_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_validator_preference_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// WithdrawDelegationRewards allows users to claim rewards from the validator-set.
class OsmosisValidatorPreferenceMsgWithdrawDelegationRewards
    extends OsmosisValidatorPreferenceV1Beta1<EmptyServiceRequestResponse> {
  /// delegator is the user who is trying to claim staking rewards.
  final String? delegator;

  const OsmosisValidatorPreferenceMsgWithdrawDelegationRewards({
    this.delegator,
  });
  factory OsmosisValidatorPreferenceMsgWithdrawDelegationRewards.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisValidatorPreferenceMsgWithdrawDelegationRewards(
      delegator: decode.getField(1),
    );
  }
  factory OsmosisValidatorPreferenceMsgWithdrawDelegationRewards.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisValidatorPreferenceMsgWithdrawDelegationRewards(
      delegator: json.as("delegator"),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"delegator": delegator};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisValidatorPreferenceV1beta1Types.msgWithdrawDelegationRewards;

  @override
  List get values => [delegator];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
      OsmosisValidatorPreferenceV1beta1Types
          .msgWithdrawDelegationRewardsResponse,
    );
  }

  @override
  List<String?> get signers => [delegator];
}
