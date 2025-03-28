import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_validator_preference_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ValidatorPreference defines the message structure for CreateValidatorSetPreference.
/// It allows a user to set {val_addr, weight} in state. If a user does not have a validator
/// set preference list set, and has staked, make their preference list default to their current staking distribution.
class OsmosisValidatorPreferenceValidatorPreference extends CosmosMessage {
  /// val_oper_address holds the validator address the user wants to delegate
  /// funds to.
  final String? valOperAddress;

  /// weight is decimal between 0 and 1, and they all sum to 1.
  final String weight;

  const OsmosisValidatorPreferenceValidatorPreference(
      {this.valOperAddress, required this.weight});
  factory OsmosisValidatorPreferenceValidatorPreference.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisValidatorPreferenceValidatorPreference(
        weight: decode.getField(2), valOperAddress: decode.getField(1));
  }
  factory OsmosisValidatorPreferenceValidatorPreference.fromJson(
      Map<String, dynamic> json) {
    return OsmosisValidatorPreferenceValidatorPreference(
        weight: json["weight"], valOperAddress: json["val_oper_address"]);
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"val_oper_address": valOperAddress, "weight": weight};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisValidatorPreferenceV1beta1Types.validatorPreference;

  @override
  List get values => [valOperAddress, weight];
}
