import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_validator_preference_v1beta1/services/msg_delegate_to_validator_set.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_validator_preference_v1beta1/services/msg_set_validator_set_preference.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_validator_preference_v1beta1/services/msg_undelegate_from_validator_set.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_validator_preference_v1beta1/services/msg_withdraw_delegation_rewards.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_validator_preference_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/service/service.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

abstract class OsmosisValidatorPreferenceV1Beta1<T extends CosmosMessage>
    extends OsmosisService<T> {
  const OsmosisValidatorPreferenceV1Beta1();

  static T? fromJson<T extends OsmosisValidatorPreferenceV1Beta1>({
    required String typeUrl,
    required Map<String, dynamic> json,
  }) {
    final type = OsmosisValidatorPreferenceV1beta1Types.findService(typeUrl);
    final OsmosisValidatorPreferenceV1Beta1? service =
        switch (type) {
              OsmosisValidatorPreferenceV1beta1Types
                  .msgDelegateToValidatorSet =>
                OsmosisValidatorPreferenceMsgDelegateToValidatorSet.fromJson(
                  json,
                ),
              OsmosisValidatorPreferenceV1beta1Types
                  .msgSetValidatorSetPreference =>
                OsmosisValidatorPreferenceMsgSetValidatorSetPreference.fromJson(
                  json,
                ),
              OsmosisValidatorPreferenceV1beta1Types
                  .msgUndelegateFromValidatorSet =>
                OsmosisValidatorPreferenceMsgUndelegateFromValidatorSet.fromJson(
                  json,
                ),
              OsmosisValidatorPreferenceV1beta1Types
                  .msgWithdrawDelegationRewards =>
                OsmosisValidatorPreferenceMsgWithdrawDelegationRewards.fromJson(
                  json,
                ),
              _ => null,
            }
            as OsmosisValidatorPreferenceV1Beta1?;

    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid ValidatorPreferenceV1Beta1 Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }

  static T? deserialize<T extends OsmosisValidatorPreferenceV1Beta1>({
    required String typeUrl,
    required List<int> bytes,
  }) {
    final type = OsmosisValidatorPreferenceV1beta1Types.findService(typeUrl);
    final OsmosisValidatorPreferenceV1Beta1? service =
        switch (type) {
              OsmosisValidatorPreferenceV1beta1Types
                  .msgDelegateToValidatorSet =>
                OsmosisValidatorPreferenceMsgDelegateToValidatorSet.deserialize(
                  bytes,
                ),
              OsmosisValidatorPreferenceV1beta1Types
                  .msgSetValidatorSetPreference =>
                OsmosisValidatorPreferenceMsgSetValidatorSetPreference.deserialize(
                  bytes,
                ),
              OsmosisValidatorPreferenceV1beta1Types
                  .msgUndelegateFromValidatorSet =>
                OsmosisValidatorPreferenceMsgUndelegateFromValidatorSet.deserialize(
                  bytes,
                ),
              OsmosisValidatorPreferenceV1beta1Types
                  .msgWithdrawDelegationRewards =>
                OsmosisValidatorPreferenceMsgWithdrawDelegationRewards.deserialize(
                  bytes,
                ),
              _ => null,
            }
            as OsmosisValidatorPreferenceV1Beta1?;

    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid ValidatorPreferenceV1Beta1 Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }
}
