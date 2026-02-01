import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_validator_preference_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_validator_preference_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgDelegateToValidatorSet allows users to delegate to an existing validator-set
class OsmosisValidatorPreferenceMsgDelegateToValidatorSet
    extends OsmosisValidatorPreferenceV1Beta1<EmptyServiceRequestResponse> {
  /// delegator is the user who is trying to delegate.
  final String? delegator;

  /// the amount of tokens the user is trying to delegate.
  /// For ex: delegate 10osmo with validator-set {ValA -> 0.5, ValB -> 0.3, ValC
  /// -> 0.2} our staking logic would attempt to delegate 5osmo to A , 3osmo to
  /// B, 2osmo to C.
  final Coin coin;

  const OsmosisValidatorPreferenceMsgDelegateToValidatorSet({
    this.delegator,
    required this.coin,
  });
  factory OsmosisValidatorPreferenceMsgDelegateToValidatorSet.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisValidatorPreferenceMsgDelegateToValidatorSet(
      delegator: decode.getField(1),
      coin: Coin.deserialize(decode.getField(2)),
    );
  }
  factory OsmosisValidatorPreferenceMsgDelegateToValidatorSet.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisValidatorPreferenceMsgDelegateToValidatorSet(
      delegator: json.as("delegator"),
      coin: Coin.fromJson(json.asMap("coin")),
    );
  }
  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"delegator": delegator, "coin": coin.toJson()};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisValidatorPreferenceV1beta1Types.msgDelegateToValidatorSet;

  @override
  List get values => [delegator, coin];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
      OsmosisValidatorPreferenceV1beta1Types.msgDelegateToValidatorSetResponse,
    );
  }

  @override
  List<String?> get signers => [delegator];
}
