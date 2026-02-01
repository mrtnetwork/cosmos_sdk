import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_validator_preference_v1beta1/messages/validator_preference.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_validator_preference_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisValidatorPreferenceQueryUserValidatorPreferenceResponse
    extends CosmosMessage {
  final List<OsmosisValidatorPreferenceValidatorPreference> preferences;

  OsmosisValidatorPreferenceQueryUserValidatorPreferenceResponse(
    List<OsmosisValidatorPreferenceValidatorPreference> preferences,
  ) : preferences = preferences.immutable;
  factory OsmosisValidatorPreferenceQueryUserValidatorPreferenceResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisValidatorPreferenceQueryUserValidatorPreferenceResponse(
      decode
          .getFields<List<int>>(1)
          .map(
            (e) => OsmosisValidatorPreferenceValidatorPreference.deserialize(e),
          )
          .toList(),
    );
  }
  factory OsmosisValidatorPreferenceQueryUserValidatorPreferenceResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisValidatorPreferenceQueryUserValidatorPreferenceResponse(
      (json["preferences"] as List?)
              ?.map(
                (e) =>
                    OsmosisValidatorPreferenceValidatorPreference.fromJson(e),
              )
              .toList() ??
          <OsmosisValidatorPreferenceValidatorPreference>[],
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"preferences": preferences.map((e) => e.toJson()).toList()};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisValidatorPreferenceV1beta1Types
          .queryUserValidatorPreferenceResponse;

  @override
  List get values => [preferences];
}
