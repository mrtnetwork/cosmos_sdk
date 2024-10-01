import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_valsetpref_v1beta1/messages/validator_preference.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_valsetpref_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// MsgCreateValidatorSetPreference is a list that holds validator-set.
class OsmosisValSetprefMsgSetValidatorSetPreference extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  /// delegator is the user who is trying to create a validator-set.
  final String? delegator;

  /// list of {valAddr, weight} to delegate to
  final List<OsmosisValSetprefValidatorPreference> preferences;

  OsmosisValSetprefMsgSetValidatorSetPreference(
      {this.delegator,
      required List<OsmosisValSetprefValidatorPreference> preferences})
      : preferences = preferences.immutable;
  factory OsmosisValSetprefMsgSetValidatorSetPreference.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisValSetprefMsgSetValidatorSetPreference(
      delegator: decode.getField(1),
      preferences: decode
          .getFields(2)
          .map((e) => OsmosisValSetprefValidatorPreference.deserialize(e))
          .toList(),
    );
  }
  factory OsmosisValSetprefMsgSetValidatorSetPreference.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisValSetprefMsgSetValidatorSetPreference(
      delegator: json["delegator"],
      preferences: (json["preferences"] as List?)
              ?.map((e) => OsmosisValSetprefValidatorPreference.fromRpc(e))
              .toList() ??
          <OsmosisValSetprefValidatorPreference>[],
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "delegator": delegator,
      "preferences": preferences.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl =>
      OsmosisValSetprefV1beta1Types.msgSetValidatorSetPreference.typeUrl;

  @override
  List get values => [delegator, preferences];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(OsmosisValSetprefV1beta1Types
        .msgSetValidatorSetPreferenceResponse.typeUrl);
  }

  @override
  String get service =>
      OsmosisValSetprefV1beta1Types.setValidatorSetPreference.typeUrl;

  @override
  List<String?> get signers => [delegator];
}
