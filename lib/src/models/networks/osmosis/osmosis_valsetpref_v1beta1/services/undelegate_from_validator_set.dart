import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_valsetpref_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// UndelegateFromValidatorSet gets the owner and coins and undelegates from validator-set.
/// The unbonding logic will follow the Undelegate logic from the sdk.
class OsmosisValSetprefMsgUndelegateFromValidatorSet extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  /// delegator is the user who is trying to delegate.
  final String? delegator;

  /// the amount the user wants to undelegate
  /// For ex: Undelegate 10osmo with validator-set {ValA -> 0.5, ValB -> 0.3,
  /// ValC
  /// -> 0.2} our undelegate logic would attempt to undelegate 5osmo from A ,
  /// 3osmo from B, 2osmo from C
  final Coin coin;

  OsmosisValSetprefMsgUndelegateFromValidatorSet(
      {this.delegator, required this.coin});
  factory OsmosisValSetprefMsgUndelegateFromValidatorSet.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisValSetprefMsgUndelegateFromValidatorSet(
      delegator: decode.getField(1),
      coin: Coin.deserialize(decode.getField(3)),
    );
  }
  factory OsmosisValSetprefMsgUndelegateFromValidatorSet.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisValSetprefMsgUndelegateFromValidatorSet(
        delegator: json["delegator"], coin: Coin.fromRpc(json["coin"]));
  }

  @override
  List<int> get fieldIds => [1, 3];

  @override
  Map<String, dynamic> toJson() {
    return {"delegator": delegator, "coin": coin.toJson()};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisValSetprefV1beta1Types.msgUndelegateFromValidatorSet;

  @override
  List get values => [delegator, coin];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        OsmosisValSetprefV1beta1Types.msgUndelegateFromValidatorSetResponse);
  }

  @override
  TypeUrl get service =>
      OsmosisValSetprefV1beta1Types.undelegateFromValidatorSet;

  @override
  List<String?> get signers => [delegator];
}
