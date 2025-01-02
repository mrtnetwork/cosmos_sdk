import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_valsetpref_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

import '../messages/validator_preference.dart';

/// Response type the QueryUserValidatorPreferences query request
class OsmosisValSetprefUserValidatorPreferencesResponse extends CosmosMessage {
  final List<OsmosisValSetprefValidatorPreference> preferences;
  OsmosisValSetprefUserValidatorPreferencesResponse(
      List<OsmosisValSetprefValidatorPreference> preferences)
      : preferences = preferences.immutable;
  factory OsmosisValSetprefUserValidatorPreferencesResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisValSetprefUserValidatorPreferencesResponse(decode
        .getFields(1)
        .map((e) => OsmosisValSetprefValidatorPreference.deserialize(e))
        .toList());
  }
  factory OsmosisValSetprefUserValidatorPreferencesResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisValSetprefUserValidatorPreferencesResponse(
        (json["preferences"] as List?)
                ?.map((e) => OsmosisValSetprefValidatorPreference.fromRpc(e))
                .toList() ??
            <OsmosisValSetprefValidatorPreference>[]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"preferences": preferences.map((e) => e.toJson()).toList()};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisValSetprefV1beta1Types.userValidatorPreferencesResponse;

  @override
  List get values => [preferences];
}
