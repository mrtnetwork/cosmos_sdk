import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_valsetpref_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';
import 'validator_preference.dart';

/// ValidatorSetPreferences defines a delegator's validator set preference. It contains a
/// list of (validator, percent_allocation) pairs. The percent allocation are arranged in
/// decimal notation from 0 to 1 and must add up to 1.
class OsmosisValSetprefValidatorSetPreferences extends CosmosMessage {
  /// preference holds {valAddr, weight} for the user who created it.
  final List<OsmosisValSetprefValidatorPreference> preferences;
  OsmosisValSetprefValidatorSetPreferences(
      List<OsmosisValSetprefValidatorPreference> preferences)
      : preferences = preferences.immutable;
  factory OsmosisValSetprefValidatorSetPreferences.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisValSetprefValidatorSetPreferences(decode
        .getFields(1)
        .map((e) => OsmosisValSetprefValidatorPreference.deserialize(e))
        .toList());
  }

  @override
  List<int> get fieldIds => [2];

  @override
  Map<String, dynamic> toJson() {
    return {"preferences": preferences.map((e) => e.toJson()).toList()};
  }

  @override
  String get typeUrl =>
      OsmosisValSetprefV1beta1Types.validatorSetPreferences.typeUrl;

  @override
  List get values => [preferences];
}
