import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_validator_preference_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_validator_preference_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class OsmosisValidatorPreferenceMsgUndelegateFromValidatorSet
    extends OsmosisValidatorPreferenceV1Beta1<EmptyServiceRequestResponse> {
  /// delegator is the user who is trying to undelegate.
  final String? delegator;

  /// the amount the user wants to undelegate
  /// For ex: Undelegate 10osmo with validator-set {ValA -> 0.5, ValB -> 0.3,
  /// ValC
  /// -> 0.2} our undelegate logic would attempt to undelegate 5osmo from A ,
  /// 3osmo from B, 2osmo from C
  final Coin coin;

  const OsmosisValidatorPreferenceMsgUndelegateFromValidatorSet(
      {this.delegator, required this.coin});
  factory OsmosisValidatorPreferenceMsgUndelegateFromValidatorSet.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisValidatorPreferenceMsgUndelegateFromValidatorSet(
        delegator: decode.getField(1),
        coin: Coin.deserialize(decode.getField(3)));
  }
  factory OsmosisValidatorPreferenceMsgUndelegateFromValidatorSet.fromJson(
      Map<String, dynamic> json) {
    return OsmosisValidatorPreferenceMsgUndelegateFromValidatorSet(
        delegator: json.asMap("delegator"),
        coin: Coin.fromJson(json.asMap("coin")));
  }
  @override
  List<int> get fieldIds => [1, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "delegator": delegator,
      "coin": coin.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisValidatorPreferenceV1beta1Types.msgUndelegateFromValidatorSet;

  @override
  List get values => [delegator, coin];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(OsmosisValidatorPreferenceV1beta1Types
        .msgUndelegateFromValidatorSetResponse);
  }

  @override
  List<String?> get signers => [delegator];
}
