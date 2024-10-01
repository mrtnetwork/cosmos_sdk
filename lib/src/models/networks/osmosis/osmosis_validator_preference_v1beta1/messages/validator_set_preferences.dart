import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_validator_preference_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'validator_preference.dart';

/// ValidatorSetPreferences defines a delegator's validator set preference.
/// It contains a list of (validator, percent_allocation) pairs. The percent
/// allocation are arranged in decimal notation from 0 to 1 and must add up to 1.
class OsmosisValidatorPreferenceValidatorSetPreferences extends CosmosMessage {
  /// preference holds {valAddr, weight} for the user who created it.
  final List<OsmosisValidatorPreferenceValidatorPreference> preferences;

  OsmosisValidatorPreferenceValidatorSetPreferences(
      List<OsmosisValidatorPreferenceValidatorPreference> preferences)
      : preferences = preferences.immutable;
  factory OsmosisValidatorPreferenceValidatorSetPreferences.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisValidatorPreferenceValidatorSetPreferences(decode
        .getFields<List<int>>(1)
        .map(
            (e) => OsmosisValidatorPreferenceValidatorPreference.deserialize(e))
        .toList());
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {
      "preferences": preferences.map((e) => e.toJson()).toList(),
    };
  }

  @override
  String get typeUrl =>
      OsmosisValidatorPreferenceV1beta1Types.validatorSetPreferences.typeUrl;

  @override
  List get values => [preferences];
}
