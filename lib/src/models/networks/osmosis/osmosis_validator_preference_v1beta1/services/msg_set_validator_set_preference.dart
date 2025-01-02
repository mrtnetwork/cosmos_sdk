import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_validator_preference_v1beta1/messages/validator_preference.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_validator_preference_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// MsgCreateValidatorSetPreference is a list that holds validator-set.
class OsmosisValidatorPreferenceMsgSetValidatorSetPreference
    extends CosmosMessage with ServiceMessage<EmptyServiceRequestResponse> {
  /// delegator is the user who is trying to create a validator-set.
  final String? delegator;

  /// list of {valAddr, weight} to delegate to
  final List<OsmosisValidatorPreferenceValidatorPreference> preferences;

  OsmosisValidatorPreferenceMsgSetValidatorSetPreference(
      {this.delegator,
      required List<OsmosisValidatorPreferenceValidatorPreference> preferences})
      : preferences = preferences.immutable;
  factory OsmosisValidatorPreferenceMsgSetValidatorSetPreference.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisValidatorPreferenceMsgSetValidatorSetPreference(
        delegator: decode.getField(1),
        preferences: decode
            .getFields<List<int>>(2)
            .map((e) =>
                OsmosisValidatorPreferenceValidatorPreference.deserialize(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "delegator": delegator,
      "preferences": preferences.map((e) => e.toJson()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisValidatorPreferenceV1beta1Types.msgSetValidatorSetPreference;

  @override
  List get values => [delegator, preferences];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(OsmosisValidatorPreferenceV1beta1Types
        .msgSetValidatorSetPreferenceResponse);
  }

  @override
  TypeUrl get service =>
      OsmosisValidatorPreferenceV1beta1Types.setValidatorSetPreference;

  @override
  List<String?> get signers => [delegator];
}
